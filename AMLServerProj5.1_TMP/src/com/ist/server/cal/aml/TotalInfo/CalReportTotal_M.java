package com.ist.server.cal.aml.TotalInfo;

import java.sql.Connection;


import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.TotalInfo.bo.TotalReportBO;
import com.ist.server.dto.T18_task_fact;




public class CalReportTotal_M extends BaseCalTask {

	/** 程序运行日志 */
	private static Logger logger = LogUtils.getLogger(CalReportTotal_M.class.getName());
	TotalReportBO reportBo=new TotalReportBO();
	

	public CalReportTotal_M(T18_task_fact _t18_task_fact) {
		super(_t18_task_fact);
	}

	@Override
	public void init() {
		
	}
	public boolean delTask(Connection conn) throws Exception {
		  boolean isSucc=true;
			try {
				String statisticdate=this.t18_task_fact.getStatisticdate();
				int count=reportBo.del_t07_inrep_by_acct(conn, statisticdate);
				   count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_REPORT_STATISTIC_MID");
				 count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_IDENTITY_M");
				count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_REIDENTITY_M");
				count=reportBo.del_T07_Table_MID1(conn, statisticdate,"T10_PARTY_CRETAL");
			} catch (Exception e) {
				logger.error(e.getMessage());
				e.printStackTrace();
				isSucc= false;
				throw e;
			}

			return isSucc;
	}
	@Override
	public boolean isCanExec(Connection _conn) throws Exception {
		boolean isSucc = true;

		
		return isSucc;
	}
	@Override
	public boolean preTask(Connection _conn)
			throws Exception {
		boolean isSucc = true;
		 

		return isSucc;
	}


	

	public boolean calTask(Connection conn) throws Exception {
		boolean rs = true;
		try {
			String statisticdate=this.t18_task_fact.getStatisticdate();
			String granularity=this.t18_task_fact.getGranularity();
			 //按账户统计
			int count=reportBo.del_t07_inrep_by_acct_mid(conn);
			count=reportBo.insert_t07_inrep_by_acct_mid(conn, statisticdate, "1",granularity);//本外币大额
			count=reportBo.insert_t07_inrep_by_acct_mid(conn, statisticdate, "2",granularity);//外外币可疑
			count=reportBo.insert_t07_inrep_by_acct(conn);//将中间表的数据插入结果表	
			
		   //金融机构可疑交易报告统计
			count=reportBo.insert_T07_REPORT_STATISTIC_MID(conn, statisticdate,granularity);
			 //新开客户识别统计表
				count=reportBo.insert_T07_USER_IDENTITY_M(conn, statisticdate,granularity);
				
			 //重新客户识别统计表
			   count=reportBo.insert_T07_USER_REIDENTITY_M(conn, statisticdate,granularity);
			 
		     //机构信用代码应用统计表
			   count=reportBo.insert_T10_PARTY_CRETAL(conn, statisticdate,granularity);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			rs=false;
			throw e;
		}
		return rs;

	}

	@Override
	public boolean finalTask(Connection _conn)
			throws Exception {
		boolean isSucc = true;

		return isSucc;
	}
	
	

	@Override
	public boolean finalSubTask(Connection arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
     
      
    

	public static void main(String[] args) {

	}
	

}
