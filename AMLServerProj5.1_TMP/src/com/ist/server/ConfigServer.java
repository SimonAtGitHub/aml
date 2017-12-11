package com.ist.server;

/**
 * <p>Title: 定时设置任务Server</p>
 * <p>
 * 任务设置包括三类：
 * 1-外部数据源准备完毕，设置抽取任务（如果不需要抽取，则设置加载任务）
 * 2-数据抽取完毕，设置加载任务
 * 3-设置系统计算任务(ODS->DM、DM计算)
 * </p>
 * <p>Copyright: Copyright (c) 2008.03</p>
 * <p>Company: IST</p>
 * @author hubq
 * @version 1.0
 */

import java.io.File;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.ist.common.Constants;
import com.ist.common.LogUtils;
import com.ist.common.database.ConnectionManager;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.server.cfg.BaseConfigTask;
import com.ist.server.cfg.ConfigTaskFactory;
import com.ist.server.dao.T18_task_cfg_logDAO;
import com.ist.server.dao.T18_task_factDAO;
import com.ist.server.dao.T18_tasklistDAO;
import com.ist.server.dto.T18_task_type;

public class ConfigServer {

	public static final String CONFIG_SERVER_LOG_FILE = "log4j-config.properties";
	static {
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()
				+ File.separator + CONFIG_SERVER_LOG_FILE);
	}
	/** 程序运行日志 */
	private static Logger logger = LogUtils.getLogger(ConfigServer.class
			.getName());

	/** 计时器 */
	private final Timer timer = new Timer();

	/** 通过配置文件读取 单位为分钟（X * 60 * 1000） */
	private int scan_timespace = 0 * 60 * 1000;

	/** 每天监听的开始时间 */
	private String beginTimeStr = "";
	/** 每天监听的结束时间 */
	private String endTimeStr = "";

	private String serverkey = "";

	/** 构造函数 */
	public ConfigServer() {
	}

	/**
	 * 启动Server，每隔一定时间进行一次扫描 看系统是否由任务需要执行
	 * 
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
			}
			// 当前时间开始，每隔 scan_timespace 分钟时间间隔执行一次 TimerTask
		}, 0, scan_timespace); // 执行一次
	}

	/**
	 * @return 是否成功
	 */

	private boolean executeTasks() {
		boolean isSucc = true;
		// 先判断执行时间是否在监听时间范围内，否则跳出
		Timestamp beginTime = Timestamp.valueOf(DateUtils.getCurrDate() + " "
				+ beginTimeStr + ".000000000");
		Timestamp endTime = Timestamp.valueOf(DateUtils.getCurrDate() + " "
				+ endTimeStr + ".000000000");
		Timestamp nowTime = new Timestamp(System.currentTimeMillis());
		if (nowTime.before(beginTime) || nowTime.after(endTime)) {
			logger.debug("不在可工作时间，稍后会再次执行....");
			return isSucc;
		}

		CatchManager cm = new CatchManager();

		ConfigTaskFactory configTaskFactory = new ConfigTaskFactory();
		T18_task_cfg_logDAO t18_task_cfg_logDAO = new T18_task_cfg_logDAO();
		T18_task_factDAO t18_task_factDAO = new T18_task_factDAO();
		Connection conn = null;
		try {

			conn = ConnectionManager.getConnection();
			conn.setAutoCommit(false);

			DateUtils du = new DateUtils();
			// modified by lingjiang.zhou 2012-09-11
			String currdate = DateUtils.getCurrDate();

			// 获取目前已经开始任务设置，但还没有完全设置完毕的数据日期列表
			// 目的：继续探测，是否可以继续设置其他未完成任务
			ArrayList statisticdateList = t18_task_cfg_logDAO
					.getT18_task_cfg_logListForNoFinished(conn);

			// 取得任务日志表的最大日期（含已经完成的和未完成的）
			// 正在扫描：最大
			String maxStatisticdate = t18_task_cfg_logDAO
					.getT18_task_cfg_logMaxDT(conn);

			// 取得当前已经完成的数据准备情况探测任务（101任务）的最大日期；
			// 实际完成：最大
			String nowDOmaxStatisticdate = t18_task_factDAO
					.getT18_task_factNowDOMaxDT(conn);

			// 是否有日粒度任务，无日粒度任务需要特殊处理
			HashMap t18_task_ListMap = cm
					.getMapFromCache("T18_TASKLISTMAP");
			Iterator iterTask = t18_task_ListMap.keySet().iterator();
			String granularityType = "4";
			while (iterTask.hasNext()) {
				String taskKey = (String) iterTask.next();
				if (taskKey.endsWith("1")){
					granularityType = "1";
				    break;	
				}
			}
			/**
			 * 判断： 连续N天都没有任何数据源到来，哪么系统将不再继续执行后续的加载，等待补数 N：可配置；没有到来的判断，通过101任务的执行
			 * 
			 * 说明： 全部计算任务的起始任务是：是否探测数据源准备完毕
			 */
			if (!maxStatisticdate.equals("")
					&& !nowDOmaxStatisticdate.equals("")
					&& DateUtils.diffTwoDateDay(DateUtils
							.stringToDateShort(maxStatisticdate), DateUtils
							.stringToDateShort(nowDOmaxStatisticdate)) < Constants.DATA_SETSTATUS_DATESPACE) {
				// 有日粒度任务时的处理方式
				if ("1".equals(granularityType)) {
					if (DateUtils.diffTwoDateDay(DateUtils
							.stringToDateShort(maxStatisticdate), DateUtils
							.stringToDateShort(currdate)) <= 0) {

						// 最多设置连续三天的探测任务
						String nexDt = du.getDateChangeALL(maxStatisticdate,
								"d", 1);
						statisticdateList.add(nexDt);
					}
				}
				// 无日粒度任务的处理方式
				if ("4".equals(granularityType)) {
					DateUtils dt =new DateUtils();
					Date date = dt.stringToDateShort(currdate);
					if (DateUtils.diffTwoDateDay(dt.getMonthEnd(date), DateUtils
							.stringToDateShort(currdate)) == 0) {
                        //设置月粒度任务
						statisticdateList.add(currdate);
					}
				}

			} else if (maxStatisticdate.equals("")
					|| nowDOmaxStatisticdate.equals("")) {// 新系统，没批出里过

				logger
						.error("新的系统，还没有完成第一次批处理，请先在T18_TASK_CFG_LOG表中增加一天的完成记录；在T18_TASK_FACT表中增加对应天数101任务的完成记录，再重新启动系统即可进行计算；");

			} else {

				logger.error("系统已经连续" + Constants.DATA_SETSTATUS_DATESPACE
						+ "日没有数据提供过来，数据到来后，系统会自动启动计算!");

			}
			logger.info("任务设置：待探测数据日期列表(共" + statisticdateList.size() + "天)="
					+ statisticdateList);
			Iterator dtIter = statisticdateList.iterator();
			while (dtIter.hasNext()) {
				String statisticdate = (String) dtIter.next();
				ArrayList granularityList = this
						.getGranularityList(statisticdate);

				logger.info("开始设置日期=" + statisticdate + "的计算任务!粒度范围(共"
						+ granularityList.size() + "个):" + granularityList);

				for (int i = 0; i < granularityList.size(); i++) {
					String granularity = (String) granularityList.get(i);

					ArrayList t18_task_typeList = cm
							.getListFromCache("T18_TASK_TYPELIST");
					Iterator iter = t18_task_typeList.iterator();
					while (iter.hasNext()) {
						T18_task_type _t18_task_type = (T18_task_type) iter
								.next();
						logger.info("设置任务=" + _t18_task_type.getTasktype()
								+ "-" + _t18_task_type.getTypename() + ":"
								+ _t18_task_type.getCfgclass() + ":粒度="
								+ granularity);
						// 用于比较连续性和是否需要判断依赖关系
						_t18_task_type.setMaxStatisticdate(maxStatisticdate);
						_t18_task_type.setStatisticdateList(statisticdateList);

						try {
							BaseConfigTask configTask = configTaskFactory
									.getCfgtaskInstance(_t18_task_type);
							configTask.run(conn, statisticdate, granularity);
						} catch (Exception e) {
							logger.error("任务类别=" + _t18_task_type.getTasktype()
									+ "-" + _t18_task_type.getTypename() + ":"
									+ e.getMessage());
							e.printStackTrace();
						}
					}
				}
			}

		} catch (Exception e) {
			isSucc = false;
			logger.error("任务执行失败：" + e.getMessage());
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception ec) {
				logger.error("数据回滚错误！" + ec);
			}
		} finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (Exception ec) {
				logger.error("数据库关闭错误！" + ec);
			}
		}

		return isSucc;
	}

	private ArrayList getGranularityList(String statisticdate) {
		ArrayList list = new ArrayList();
		DateUtils dutils = new DateUtils();
		Date date = DateUtils.stringToDateShort(statisticdate);

		String[] str = StringUtils.split(Constants.CANCAL_GRANULARITYS, ";");

		//
		for (int i = 0; i < str.length; i++) {
			String granularity = str[i];
			// 日粒度
			if (granularity.equals("1")) {
				list.add(granularity);
			}
			// 周未粒度
			if (dutils.getWeekEnd(date).equals(date)&&granularity.equals("2")) {
				list.add(granularity);
			}
			// 旬粒度
			if (dutils.getPeriodEnd(date).equals(date)&&granularity.equals("3")) {
				list.add(granularity);
			}
			// 月粒度
			if (dutils.getMonthEnd(date).compareTo(date) == 0
					&& granularity.equals("4")) {
				list.add(granularity);
			}
			// 季粒度
			if (dutils.getSeasonEnd(date).equals(date)
					&& granularity.equals("5")) {
				list.add(granularity);
			}
			// 半年粒度
			if (dutils.getHalfYearEnd(date).equals(date)
					&& granularity.equals("6")) {
				list.add(granularity);
			}
			// 年粒度
			if (dutils.getYearEnd(date).equals(date) && granularity.equals("7"))
				list.add(granularity);
		}
		return list;
	}

	/**
	 * 初始化Server
	 * 
	 * @throws Exception
	 */
	private void init(String _serverkey) throws Exception {

		serverkey = _serverkey;

		// 初始化系统扫描时间间隔
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;
		// 开始扫描时间
		beginTimeStr = SysConfig.getProperty("server.server_" + serverkey
				+ ".cal_time_begin");
		// 结束扫描时间
		endTimeStr = SysConfig.getProperty("server.server_" + serverkey
				+ ".cal_time_end");

		CatchManager cm = CatchManager.getInstance();
		try {
			ArrayList t18_task_typeList = cm
					.getListFromCache("T18_TASK_TYPELIST");
			ArrayList t18_datasourceList = cm
					.getListFromCache("T18_DATASOURCELIST");
			HashMap t18_time_depandonMap = cm
					.getMapFromCache("T18_TIME_DEPANDONMAP");

			logger.info("加载任务类别：" + t18_task_typeList.size() + "个！");
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "系统初始化失败！";
			logger.error(errMsg);
			throw new Exception(errMsg + "--" + e.getMessage());
		}

		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_tasklistDAO t18_tasklistDAO = new T18_tasklistDAO();
			t18_tasklistDAO.initDepandonType(conn);

		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "提取SERVER信息出错！";
			logger.error(errMsg);
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
			}
		}

	}

	/**
	 * 执行主程序
	 * 
	 * @param args
	 *            运行参数 args[0]=serverkey 本次任务设置目标SERVER， 即：最后负责计算的SERVER 运行参数
	 */
	public static void main(String[] args) {
		ConfigServer mainServer = new ConfigServer();
		try {
			String serverkey = "";

			if (args.length > 0) {
				serverkey = args[0];
			} else {
				serverkey = "S1002";
				// throw new Exception("缺少运行参数，请输入运行的SERVERKEY！");
			}

			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      银丰新融系统定时计算引擎 IST AUDIT SERVER V4.0            **********");
			logger
					.info("**********      任务设定服务器                                               **********");
			logger
					.info("**********      开发：稽核项目组  时间：2003-12月～2011-12月               **********");
			logger
					.info("********************************************************************************");
			logger.info("系统初始化..............................");
			// 初始化AuditServer系统
			mainServer.init(serverkey);
			logger.info("系统正在启动............................");
			// 执行
			mainServer.startServer();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
}
