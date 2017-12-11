package com.ist.server.cal.aml.mfa;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.Case.bo.CaseBeforeBO;
import com.ist.server.dto.T18_task_fact;

public class CalMfaNew extends BaseCalTask {

	private static Logger logger = LogUtils.getLogger(CalMfaNew.class.getName());
	private String statisticdate = "";
	private MfaDaoNew mfaDaoNew = new MfaDaoNew();

	public CalMfaNew(T18_task_fact t18TaskFact) {
		super(t18TaskFact);
	}

	@Override
	public boolean preTask(Connection conn) throws Exception {
		boolean isSucc = true;
		
		statisticdate = this.t18_task_fact.getStatisticdate();

		return isSucc;
	}

	@Override
	public boolean calTask(Connection conn) throws Exception {
		boolean isSucc = true;

		try {
			isSucc = createFundNetwork(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSucc = false;
			throw e;
		}

		return isSucc;
	}

	/**
	 * 创建资金网络
	 *
	 * 2015-07-29 优化资金网络算法
	 */
	private boolean createFundNetwork(Connection conn) throws Exception {
		boolean isSucc = false;

		logger.info("开始创建资金网络 ");

		// 获取数据库配置：是否合并之前保留的网络
		String alertDay = "0";
		CaseBeforeBO beforeBo = new CaseBeforeBO();
		HashMap paraMap = beforeBo.getNetPara(conn);
		if (paraMap.get("1003") != null) {
			alertDay = (String) paraMap.get("1003");
		}

		logger.info("插入中间表当天的交易 ");
		mfaDaoNew.insertT47_transaction_mfa_d(conn, statisticdate);
		conn.commit();

		// 数据去重:
		// 1.将 A->B 且 B->A 保留一条记录
		// 2.将多笔 A->B 保留一条记录
		logger.info("当日转账交易数据去重 ");
		mfaDaoNew.insertM47_transaction_d_acct(conn);
		conn.commit();

		// 构建初始网络:
		// 1.主体方出现多次
		// 2.对手方出现多次
		// 3.上述两种情况之外
		logger.info("构建初始网络 ");
		mfaDaoNew.insertTmp_net_acct_muti(conn);
		conn.commit();

		// 生成网络对象关系
		logger.info("生成网络对象关系 ");
		mfaDaoNew.insertTmp_net_acct(conn);
		conn.commit();

		// 合并之前保留的网络
		if (!"0".equals(alertDay)) {
			logger.info("写入之前保留的网络对象关系 ");
			mfaDaoNew.insertTmp_net_acctKeep(conn);
			conn.commit();
		}

		// 合并网络
		logger.info("合并网络 ");
		mfaDaoNew.mergeNet(conn, statisticdate);
		conn.commit();

		logger.info("插入当天合并的网络 ");
		mfaDaoNew.insertM13_net_acct_day(conn, statisticdate);
		conn.commit();

		logger.info("插入当天网络中的交易 ");
		mfaDaoNew.insertM13_net_trans_day(conn);
		conn.commit();

		logger.info("------------------资金网络计算结束------------------");

		// 插入所有预警客户
		mfaDaoNew.insertT27_alert_party_temp_new(conn, statisticdate); // --------增加预警的日期筛选
		conn.commit();

		isSucc = true;

		return isSucc;
	}

	@Override
	public boolean delTask(Connection conn) throws Exception {
		boolean isSucc = true;
		try {
			mfaDaoNew.reCal(conn, this.t18_task_fact.getStatisticdate());

		}
		catch (SQLException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSucc = false;
			throw e;
		}
		return isSucc;
	}

	@Override
	public boolean finalTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean finalSubTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean isCanExec(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public void init() {

	}

}
