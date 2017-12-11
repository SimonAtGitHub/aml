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
import java.lang.reflect.Field;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.common.DbException;
import com.ist.common.database.common.DbUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.onlineserver.cal.BaseCalTask;
import com.ist.onlineserver.cal.CalTaskBO;
import com.ist.onlineserver.dao.T18_onlineserverDao;
import com.ist.onlineserver.dto.T18_online_task_fact;
import com.ist.onlineserver.dto.T18_online_task_para;
import com.ist.onlineserver.dto.T18_online_task_type;
import com.ist.onlineserver.thread.ThreadPool;

public class ConfigOnlineServer {

	public static final String MAIN_SERVER_LOG_FILE = "log4j-online.properties";
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
	private int scan_timespace = 5 * 60 * 1000;

	/** 当前SERVER的编号 用于持久记录当前SERVERKEY */
	private String serverkey = "";

	/**
	 * 构造函数
	 */
	public ConfigOnlineServer() {
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
	 * 启动BMserver，每隔一定时间进行一次监控 命令格式：
	 * 
	 */
	public void executeTasks() {
		Connection conn=null;
		try {
			CalTaskBO calTaskBO = new CalTaskBO();
		    conn = ConnectionManager.getConnection();
			// 1、获取需要自动设置的任务信息
			ArrayList list = calTaskBO.getIsSetTaskListExecute();
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				T18_online_task_fact t18_online_task = (T18_online_task_fact) iter
						.next();
				t18_online_task.setStatisticdate(DateUtils.getCurrShortDateStr());
				//2、组织需要设置任务的时间
				String settime = t18_online_task.getSettasktime();
				String[] settimeStr=null;
				if (settime.indexOf(",") > -1) {
					 settimeStr = StringUtils.split(settime, ",");
				} else {
					settimeStr=new String[1];
					settimeStr[0]=settime;
				}
				//3、遍历所有时间进行任务设置
				for (int i = 0; i < settimeStr.length; i++) {
					int time = Integer.valueOf(settimeStr[i]);
					// 4、判断是否已经到需要设置任务的时间
					int currtime = Integer.valueOf(DateUtils
							.getHour(DateUtils.getCurrDateTime()));
					if (currtime >= time) {
						// 5、检查任务是否设置过
						if (!calTaskBO.taskIsSet(conn, t18_online_task,
								String.valueOf(time))) {
							// 6、未设置过进行任务设置
							boolean isuss = calTaskBO.insertOnlineTask(
									conn, t18_online_task, String
											.valueOf(time));
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		} finally {
			DbUtils.close(conn);
			logger.debug("计算任务关闭任务中元数据连接成功......");

		}

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

	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}

	public static void main(String[] args) {
		ConfigOnlineServer onlineServer1 = new ConfigOnlineServer();

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

			logger.info("系统正在启动............................");
			// 执行
			onlineServer1.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}

	}

}