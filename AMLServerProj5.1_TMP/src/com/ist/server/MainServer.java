package com.ist.server;

/**
 * <p>Title: 银丰DM定时计算SERVER</p>
 * <p>
 * SERVER启动后每隔一定的时间间隔，检查是否有任务需要执行，然后顺序执行。
 * 系统的运行依赖于配置文件和系统标志表的配置正确。
 *
 * 配置文件:classes/system_config.xml 系统主配置文件
 *         classes/system_init.properties 标识配置文件的主目录
 * </p>
 * <p>Copyright: Copyright (c) 2005.10</p>
 * <p>Company: 银丰新融</p>
 * @author 胡佰庆
 * @version 1.0
 */

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.ist.common.Constants;
import com.ist.common.LogUtils;
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.Out_ConnectionManager;
import com.ist.common.database.common.BaseDbUtils;
import com.ist.common.database.common.DbException;
import com.ist.common.database.common.DbUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.CalTaskBO;
import com.ist.server.cal.CalTaskFactory;
import com.ist.server.dao.T18_task_cal_logDAO;
import com.ist.server.dao.T18_task_factDAO;
import com.ist.server.dto.T18_datasource;
import com.ist.server.dto.T18_ods2dmetl;
import com.ist.server.dto.T18_ods_dblink;
import com.ist.server.dto.T18_ods_fetch;
import com.ist.server.dto.T18_ods_load;
import com.ist.server.dto.T18_task_cal_log;
import com.ist.server.dto.T18_task_fact;
import com.ist.server.dto.T18_task_type;
import com.ist.server.dto.T18_tasklist;
public class MainServer {

	public	static	final	String	MAIN_SERVER_LOG_FILE="log4j-audit.properties";
    static{
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()+File.separator+MAIN_SERVER_LOG_FILE);
    }
	/** 程序运行日志 */
	private static Logger logger = LogUtils.getLogger(MainServer.class
			.getName());

	/** 计时器 */
	private final Timer timer = new Timer();

	/** 通过配置文件读取 单位为分钟（X * 60 * 1000） */
	private int scan_timespace = 5 * 60 * 1000;

	/** 当前SERVER的编号 用于持久记录当前SERVERKEY */
	private String serverkey = "";
	/**执行任务的server*/
	private String exec_server = "";

	private BaseDbUtils bdu = new BaseDbUtils();

	/** 构造函数 */
	public MainServer() {
	}

	/**
	 * 启动AuditServer，每隔一定时间进行一次扫描 看系统是否有任务需要执行
	 * 
	 * 如果任务执行时间比较长，超过扫描的时间间隔，Timer程序会在 任务执行完毕后立即执行下一次扫描，同一个Server内各个任务只可能是串行
	 */
	public void startServer() {
		logger.info("系统启动成功！");
		logger.info("");

		timer.schedule(new TimerTask() {
			@Override
			public void run() {

				try {
					executeTasks();
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 停止计时，但不会影响正在执行的任务，系统会将现有任务执行完毕
				// timer.cancel();
			}
			// 当前时间开始，每隔 scan_timespace 分钟时间间隔执行一次 TimerTask
		}, new Date(), scan_timespace); // 执行一次
	}

	/**
	 * 任务执行类 任务共分为两类，彼此之间没有直接关系，可以单独执行 1－对ODS导入情况进行监控 2－对DM计算任务进行监控
	 * 
	 * @return 是否成功
	 */
	private void executeTasks() {
		CalTaskBO calTaskBO = new CalTaskBO();
		try {
			// 1.获取当前可执行的任务列表
			ArrayList taskList = calTaskBO.getWillExecuteTask(this.exec_server);
		    logger.debug("需要执行任务数："+taskList.size());
		    
			// 2.遍历需要执行的任务
			Iterator iter = taskList.iterator();
			while (iter.hasNext()) {
				   BaseCalTask baseCalTask = null;
					T18_task_fact t18_task_fact = (T18_task_fact) iter.next();
					if (t18_task_fact == null
							|| t18_task_fact.getTaskkey().equals("")) {
						continue;
					}
					// 3.初始化任务基本信息
					t18_task_fact = this.initTaskFact(t18_task_fact);
					// 4.启动任务
					CalTaskFactory calTaskFactory = new CalTaskFactory();
					baseCalTask = calTaskFactory.getCaltaskInstance(t18_task_fact);
					baseCalTask.run();	
			}
		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		}
	}

	public T18_task_fact initTaskFact(T18_task_fact t18_task_fact) {
		CatchManager cm = new CatchManager();
		 
		HashMap t18_ods_fetchMap = cm.getMapFromCache("T18_ODS_FETCHMAP");
		HashMap t18_task_typeMap = cm.getMapFromCache("T18_TASK_TYPEMAP");
		HashMap t18_datasourceMap = cm.getMapFromCache("T18_DATASOURCEMAP");
		HashMap t18_ods_loadMap = cm.getMapFromCache("T18_ODS_LOADMAP");
		HashMap t18_ods2dmetlMap = cm.getMapFromCache("T18_ODS2DMETLMAP");
		HashMap t18_tasklistMap = cm.getMapFromCache("T18_TASKLISTMAP");

		// 添加dblink数据 add by lingjiang.zhou 2012-08-27
		HashMap t18_ods_dblinkMap = cm.getMapFromCache("T18_ODS_DBLINKMAP");

		String task_type = t18_task_fact.getTasktype();
		String dskey = t18_task_fact.getDskey();
		String tableename = t18_task_fact.getBusinesskey();
		t18_task_fact.setServerkey(this.getServerkey());
		if (t18_task_typeMap.containsKey(task_type)) {
			t18_task_fact.setT18_task_type((T18_task_type) t18_task_typeMap
					.get(task_type));
			
		}
		if (t18_datasourceMap.containsKey(dskey)) {
			t18_task_fact.setT18_datasource((T18_datasource) t18_datasourceMap
					.get(dskey));
		}

		if (t18_ods_fetchMap.containsKey(dskey + "-" + tableename)) {
			t18_task_fact.setT18_ods_fetch((T18_ods_fetch) t18_ods_fetchMap
					.get(dskey + "-" + tableename));
		}
		if (t18_ods_loadMap.containsKey(dskey + "-" + tableename)) {
			t18_task_fact.setT18_ods_load((T18_ods_load) t18_ods_loadMap
					.get(dskey + "-" + tableename));
		}
		if (t18_ods2dmetlMap.containsKey(tableename)) {
			t18_task_fact.setT18_ods2dmetl((T18_ods2dmetl) t18_ods2dmetlMap
					.get(tableename));
		}
		// 添加dblink抽取需要的初始化（t18_task_fact对象）操作 add by lingjiang.zhou 2012-08-27
		if (t18_ods_dblinkMap.containsKey(tableename)) {
			t18_task_fact.setT18_ods_dblink((T18_ods_dblink) t18_ods_dblinkMap
					.get(tableename));
		}
		
		if (t18_tasklistMap.containsKey(t18_task_fact.getO_businesskey()+"-"+t18_task_fact.getTasktype()+"-"+t18_task_fact.getGranularity())) {			
			T18_tasklist list=(T18_tasklist)t18_tasklistMap.get(t18_task_fact.getO_businesskey()+"-"+t18_task_fact.getTasktype()+"-"+t18_task_fact.getGranularity());
			t18_task_fact.setTasknum(list.getSubtasknum());
			
		}
		return t18_task_fact;
	}

	/**
	 * 初始化AuditServer系统
	 * 
	 * @param serverkey
	 *            计算引擎编码
	 * @throws Exception
	 */
	private void init(String serverkey,String exec_server) throws Exception {
		// 初始化系统扫描时间
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;

		CatchManager cm = CatchManager.getInstance();
		this.setServerkey(serverkey);
		this.setExec_server(exec_server);
		try {
			cm.putCatch("test", "aaa");
			String aa=(String)cm.getObjFromCache("test");
			
			cm.getMapFromCache("T18_DATASOURCEMAP");
			cm.getMapFromCache("T18_TASK_TYPELIST");
			cm.getMapFromCache("T18_DATASOURCELIST");
			cm.getMapFromCache("T18_TASK_TYPEMAP");
			cm.getMapFromCache("T18_ODS_FETCHMAP");
			cm.getMapFromCache("T18_ODS_LOADMAP");
			cm.getMapFromCache("T18_ODS2DMETLMAP");
			
			//任务状态复位
			
			int resetNum = this.resetTaskFactStatus(serverkey,exec_server);
			if (resetNum > 0) {
				logger.info("发现" + resetNum
						+ "个任务处于正在执行的状态，已经进行态复位！请确保没有其它Server正在运行！");
			}

		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "系统初始化失败！";
			logger.error(errMsg);
			throw new Exception(errMsg + "--" + e.getMessage());
		}
	}
	public int resetTaskFactStatus(String serverkey,String exec_server) throws Exception {
		int isSucc = 0;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_task_factDAO t18_task_factDAO = new T18_task_factDAO();
			isSucc=t18_task_factDAO.resetStatus(conn, serverkey,exec_server);
		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
		} finally {
			DbUtils.close(conn);
		}
		return isSucc;
	}
	/**
	 * 执行主程序
	 * 
	 * @param args
	 *            运行参数 args[0]=serverkey
	 */
	public static void main(String[] args) {
		MainServer mainServer = new MainServer();
		try {
			// 检查运行参数
			String serverkey = "S1001";
			String exec_server="";
			if (args.length > 0) {
				serverkey = args[0];
				logger.debug("serverkey:"+serverkey);
			}
			if (args.length > 1) {
				exec_server=args[1];
				logger.debug("exec_server:"+exec_server);
			}
			
			// else{
			// throw new Exception("缺少运行参数，请输入运行的SERVERKEY！");
			// }
			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      银丰新融系统定时计算引擎  **********");
			logger
					.info("********************************************************************************");
			logger.info("系统初始化..............................");
			// 初始化AuditServer系统
			mainServer.init(serverkey,exec_server);
			logger.info("系统正在启动............................");
			// 执行
			mainServer.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}
	public String getExec_server() {
		return exec_server;
	}

	public void setExec_server(String execServer) {
		exec_server = execServer;
	}
	public void task_final_exe(Connection conn, T18_task_fact t18_task_fact) {
		String dbdriver = "oracle.jdbc.driver.OracleDriver";// 远程数据库(10.227.1.137)驱动程序
		String dburl = "jdbc:oracle:thin:@10.6.50.246:1521:istora";// 远程数据库url,根据现场需要，做适当更改
		String dbuser = "awp4";// 远程数据库用户名,根据现场需要，做适当更改
		String dbpwd = "awp4";// 远程数据库用户密码,根据现场需要，做适当更改
		Connection conn_out = null;
		T18_task_factDAO t18_task_factDao = null;
		boolean isDone = false;
		try {
			t18_task_factDao = new T18_task_factDAO();
			isDone = t18_task_factDao.t18_task_factIsHavenDone(conn,
					t18_task_fact.getStatisticdate());
			T18_task_cal_log t18_task_cal_log = new T18_task_cal_log();

			// 连接远程数据库
			conn_out = Out_ConnectionManager.getConnection(dbdriver, dburl,
					dbuser, dbpwd);
			t18_task_cal_log.setStatisticdate(t18_task_fact.getStatisticdate());
			t18_task_cal_log.setBegintime(t18_task_factDao.getTask_begin_Time(
					conn, t18_task_fact.getStatisticdate()));
			// 当天任务计算完毕
			if (isDone) {
				t18_task_cal_log.setEndtime(t18_task_factDao
						.getTask_MaxendTime(conn, t18_task_fact
								.getStatisticdate()));
				t18_task_cal_log.setCalstatus("1");
				t18_task_cal_logCommonExe(conn_out, t18_task_fact
						.getStatisticdate(), t18_task_cal_log);
			} else {// 当天任务没有计算完毕

				t18_task_cal_log.setEndtime(DateUtils.getCurrTime());
				t18_task_cal_log.setCalstatus("0");
				t18_task_cal_logCommonExe(conn_out, t18_task_fact
						.getStatisticdate(), t18_task_cal_log);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn_out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void t18_task_cal_logCommonExe(Connection conn_out,
			String statisticdate, T18_task_cal_log t18_task_cal_log)
			throws Exception {
		T18_task_cal_logDAO t18_task_cal_logDAO = new T18_task_cal_logDAO();
		if (!t18_task_cal_logDAO.haveT18_task_cal_log(conn_out, statisticdate)) {
			t18_task_cal_logDAO.insertT18_task_cal_log(conn_out,
					t18_task_cal_log);
		} else {
			t18_task_cal_logDAO.updateT18_task_cal_log(conn_out,
					t18_task_cal_log);
		}
	}
}
