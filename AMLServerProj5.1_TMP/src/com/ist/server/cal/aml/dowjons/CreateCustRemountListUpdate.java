package com.ist.server.cal.aml.dowjons;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.dowjons.bo.RunCustRemount;
import com.ist.server.cal.aml.dowjons.dao.T52_B_DefTempDAO;
import com.ist.server.cal.aml.dowjons.dto.T52_b_midDTO;
import com.ist.server.dto.T18_task_fact;

/**
 * 道琼斯名单回溯
 * @author liuzp
 *
 */
public class CreateCustRemountListUpdate extends BaseCalTask
{
	private static Logger logger = LogUtils.getLogger(CalT52_B_DJ_Sql.class.getName());		// 记录日志
	
	private ExecutorService threadPool;														// 多线程线程池
	private static final int validate_thread_number	= 50;									// 每个线程处理的数据量
	public T18_task_fact t18_task_fact = new T18_task_fact();
	
	
	public CreateCustRemountListUpdate(T18_task_fact t18_task_fact)
	{
		super(t18_task_fact);
		this.t18_task_fact = t18_task_fact;
	}

	@Override
	public void init()
	{
		
		
	}

	@Override
	public boolean isCanExec(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean delTask(Connection conn) throws Exception
	{
		T52_B_DefTempDAO t52_b_defTempDAO = new T52_B_DefTempDAO();
		t52_b_defTempDAO.deleteT52_b_remount(conn);
		return false;
	}

	@Override
	public boolean preTask(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean calTask(Connection conn) throws Exception
	{
		//  查询客户回溯线程池大小, 从t00_system_param表中获取
		String size = "20";
		
		/* 1. 创建多线程 */ 
		threadPool = Executors.newFixedThreadPool(Integer.parseInt(size));
		
		String statisticdate = this.t18_task_fact.getStatisticdate();
		String granularity = this.t18_task_fact.getGranularity();
		
		int pageSize = 2000;
		int intPage = 1;
		T52_B_DefTempDAO t52_b_deftempdao = new T52_B_DefTempDAO();
		
		// 开始时间
//		String beginDate = DateUtils.getBeginDate(granularity, statisticdate);
		
		List<T52_b_midDTO> list = new ArrayList<T52_b_midDTO>();
		HashMap<String, String> matchConditionMap = new HashMap<String, String>();
		matchConditionMap = t52_b_deftempdao.getT52_b_def_tempMatchCondition(conn);
		Date startDate = new Date();
		/* 2. 循环开始回溯 */
		while(true)
		{
			logger.info("查询回溯数据");
			
			
			// 2.1 查询所用t52_b_mid 表信息
			list = t52_b_deftempdao.getT52_b_midList(conn, pageSize, intPage);
			
			
			if (list.size()==0)							// 当查询完所用信息回溯完成
			{
				Date endDate = new Date();
				threadPool.shutdown();
				long num = DateUtils.diffTwoDate(endDate, startDate);
				logger.info("执行任务所需时间"+num);
				break;
				
			} else
			{
				custThread(conn, list, statisticdate, matchConditionMap);
				list.clear();
				intPage++;
			}
		}
		
		
		return true;
	}

	private boolean custThread(Connection conn, List<T52_b_midDTO> detailList,
			String endDate, HashMap<String, String> matchConditionMap) throws Exception
	{
		boolean rs = false;
		
		// 设置每次处理条数
		int validate_batch_sum = (int)(Math.ceil(detailList.size() / validate_thread_number));
		
		if (validate_batch_sum == 0)
		{
			validate_batch_sum = 1;
		}
		
		RunCustRemount[] runCustRemount = new RunCustRemount[validate_batch_sum];		// 开启多线程
		for (int i = 0; i < validate_batch_sum; i++)
		{
			List<T52_b_midDTO> subDetailList = new ArrayList<T52_b_midDTO>();
			if (i == validate_batch_sum - 1)
			{
				subDetailList = detailList.subList(i * validate_thread_number, detailList.size());
			} else
			{
				subDetailList = detailList.subList(
						(int) (i * validate_thread_number), (i + 1) * validate_thread_number);
			}
			if (subDetailList.size() > 0)
			{
				runCustRemount[i] = new RunCustRemount(detailList, matchConditionMap);
				threadPool.execute(runCustRemount[i]);
			}
		}
		boolean allfinishflag = false;
		boolean flag = false;
		while (!allfinishflag)
		{
			Thread.sleep(5000);
//			logger.info("正在等待各个线程完成校验...");
			int n = 0;
			for (int i = 0; i < runCustRemount.length; i++)
			{
				flag = runCustRemount[i].isEnd_flag();
//				logger.info("runCustRemount[" + i + "]" + flag);
				if (flag)
				{
					n++;
				}
			}
			if (flag && (n == validate_batch_sum))
			{
				allfinishflag = true;
				rs = true;
			}
		}
		Date threadStartDate = new Date();
		for (int i = 0; i < validate_batch_sum; i++)
		{
			T52_B_DefTempDAO t52_b_defTempDAO = new T52_B_DefTempDAO();
			t52_b_defTempDAO.saveT52_b_remount(conn, runCustRemount[i].getDataMap());
		}
		Date threadEndDate = new Date();
		long num = DateUtils.diffTwoDate(threadEndDate, threadStartDate);
		logger.info("保存数据库所需时间"+num);
		conn.commit();
		return rs;
		
	}

	@Override
	public boolean finalTask(Connection conn) throws Exception
	{
		
		return true;
	}

	@Override
	public boolean preSubTask(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean finalSubTask(Connection conn) throws Exception
	{
		
		return false;
	}

}
