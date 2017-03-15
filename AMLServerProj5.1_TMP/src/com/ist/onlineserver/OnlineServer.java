package com.ist.onlineserver;

/**
 * <p>Title: 即时计算引擎</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: 银丰新融科技开发有限公司</p>
 * @author 胡佰庆
 * @version 1.0
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.ist.common.LogUtils;
import com.ist.common.context.ContextLoader;
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.common.DbException;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.onlineserver.cal.BaseCalTask;
import com.ist.onlineserver.cal.CalTaskBO;
import com.ist.onlineserver.dao.T18_onlineserverDao;
import com.ist.onlineserver.dto.T18_online_task_fact;
import com.ist.onlineserver.dto.T18_online_task_para;
import com.ist.onlineserver.dto.T18_online_task_type;
import com.ist.onlineserver.thread.ThreadPool;

public class OnlineServer {

	public static final String MAIN_SERVER_LOG_FILE = "log4j.properties";
	static {
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()
				+ File.separator + MAIN_SERVER_LOG_FILE);
	}
	/** 程序运行日志 */
	private static Logger logger = LogUtils.getLogger(OnlineServer.class
			.getName());

	/** 线程池 */
	public ThreadPool threadPool;

	/** 计时器 */
	private final Timer timer = new Timer();

	/** 通过配置文件读取 单位为分钟（X * 60 * 1000） */
	private int scan_timespace = 1 * 60 * 1000;

	/** 当前SERVER的编号 用于持久记录当前SERVERKEY */
	private String serverkey = "";

	/**
	 * 构造函数
	 */
	public OnlineServer() {
	}

	/**
	 * 启动AuditServer，每隔一定时间进行一次扫描 看系统是否有任务需要执行
	 * 
	 * 如果任务执行时间比较长，超过扫描的时间间隔，Timer程序会在 任务执行完毕后立即执行下一次扫描，同一个Server内各个任务只可能是串行
	 */
	public void startServer() {
		logger.info("系统启动成功！");
		logger.info("");
		threadPool = new ThreadPool();// 初始化线程池
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
	 * 启动BMserver，每隔一定时间进行一次监控 命令格式：
	 * 
	 */
	public void executeTasks() {

		CalTaskBO calTaskBO = new CalTaskBO();
		
		int freeThreadCount = 0;// 空闲线程数
		int maxPools = 0;// 线程总数
		try {

			maxPools = Integer.parseInt(SysConfig
					.getProperty("onlineserver.threadpool.maxpools"));
			int poolsnum = Integer.parseInt(SysConfig
					.getProperty("onlineserver.threadpool.poolsnum"));// 最大线程的倍数，放入线程池的数量

			// 1.获取当前可执行的任务列表
			ArrayList taskList = calTaskBO.getWillExecuteTask(maxPools
					* poolsnum);
			logger.debug("当前批次执行任务数：" + taskList.size());

			// 2.修改放入线程池的任务为等待计算状态
			this.modiTaskWaieStatus(taskList);

			while (true) {
				if (taskList != null && taskList.size() > 0)
				{
					// 3.遍历需要执行的任务,放入线程池
					Iterator iter = taskList.iterator();
					while (iter.hasNext()) {
						BaseCalTask baseCalTask = null;
						T18_online_task_fact t18_online_task_fact = (T18_online_task_fact) iter
								.next();
						if (t18_online_task_fact == null
								|| t18_online_task_fact.getTaskkey().equals("")) {
							continue;
						}
						// 3.初始化任务基本信息
						t18_online_task_fact = this.initTaskFact(
								t18_online_task_fact, calTaskBO);
						// 4.启动任务
						freeThreadCount = threadPool.run(t18_online_task_fact);
					}

					if (freeThreadCount > 0) {
						taskList = calTaskBO.getWillExecuteTask(maxPools
								* poolsnum);
					} else
						break;
				} else {
					break;
				}
			}

		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		}

	}

	public T18_online_task_fact initTaskFact(
			T18_online_task_fact t18_online_task_fact, CalTaskBO calTaskBO) {
		CatchManager cm = new CatchManager();

		try {
			// 初始化任务LIST
			HashMap t18_task_typeMap = cm
					.getMapFromCache("T18_TASK_ONLINETYPEMAP");
			String businesskey = t18_online_task_fact.getBusinesskey();
			t18_online_task_fact.setServerkey(this.getServerkey());
			if (t18_task_typeMap.containsKey(businesskey)) {
				t18_online_task_fact
						.setT18_online_task_type((T18_online_task_type) t18_task_typeMap
								.get(businesskey));

			}

			// 初始化任务参数T18_ONLINE_TASK_PARA
			HashMap paraHash = new HashMap();
			HashMap subparaHash = new HashMap();
			ArrayList paraList = calTaskBO.getTaskPara(t18_online_task_fact
					.getTaskkey());
			T18_online_task_para t18_online_task_para = new T18_online_task_para();
			// 2.遍历需要执行的任务
			Iterator iter = paraList.iterator();
			while (iter.hasNext()) {
				t18_online_task_para = (T18_online_task_para) iter.next();
				if (t18_online_task_para.getSubnum() != null
						&& !"".equals(t18_online_task_para.getSubnum())) {
					if (paraHash.containsKey(t18_online_task_para
							.getPara_code())) {
						subparaHash = (HashMap) paraHash
								.get(t18_online_task_para.getPara_code());
						subparaHash.put(t18_online_task_para.getSubnum(),
								t18_online_task_para.getPara_val());
					} else {
						subparaHash = new HashMap();
						subparaHash.put(t18_online_task_para.getSubnum(),
								t18_online_task_para.getPara_val());
						paraHash.put(t18_online_task_para.getPara_code(),
								subparaHash);
					}
				} else {
					paraHash.put(t18_online_task_para.getPara_code(),
							t18_online_task_para.getPara_val());

				}

				t18_online_task_fact.setParamap(paraHash);
			}

		} catch (Exception ex) {

		}
		return t18_online_task_fact;
	}

	/**
	 * 初始化AuditServer系统
	 * 
	 * @param serverkey
	 *            计算引擎编码
	 * @throws Exception
	 */
	private void init(String serverkey) throws Exception {
		// 初始化系统扫描时间
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;
		this.setServerkey(serverkey);
		try {
			int resetNum = this.resetTaskFactStatus(serverkey);
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

	public int resetTaskFactStatus(String serverkey) throws Exception {
		int isSucc = 0;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_onlineserverDao t18_onlineserverDao = new T18_onlineserverDao();
			isSucc = t18_onlineserverDao.resetStatus(conn, serverkey);
		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
				logger.error("数据库关闭错误！" + ec);
			}
		}
		return isSucc;
	}

	public boolean modiTaskWaieStatus(ArrayList taskList) throws Exception {
		boolean isSucc = false;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_onlineserverDao t18_onlineserverDao = new T18_onlineserverDao();
			isSucc = t18_onlineserverDao.modiT18_online_task_factStatusWait(
					conn, taskList);
		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
				logger.error("数据库关闭错误！" + ec);
			}
		}
		return isSucc;
	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}

	public static void main(String[] args) {
		OnlineServer onlineServer1 = new OnlineServer();

		try {
			// 检查运行参数
			String serverkey = "S1001";
			if (args.length > 0) {
				serverkey = args[0];
			}

			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      银丰新融系统定时计算引擎 IST ONLINE SERVER             **********");
			logger
					.info("********************************************************************************");
			logger.info("系统初始化..............................");
			// 初始化onlineserver系统
			onlineServer1.init(serverkey);
			logger.info("系统正在启动............................");
			ContextLoader.loadContext();
			// 执行
			onlineServer1.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}

	}

}