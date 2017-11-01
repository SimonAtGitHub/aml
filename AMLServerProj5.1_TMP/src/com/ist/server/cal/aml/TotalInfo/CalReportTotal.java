package com.ist.server.cal.aml.TotalInfo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.properties.SysConfig;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.TotalInfo.bo.TotalReportBO;
import com.ist.server.dto.T18_task_fact;



public class CalReportTotal extends BaseCalTask {

	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(CalReportTotal.class.getName());
	TotalReportBO reportBo=new TotalReportBO();
	

	public CalReportTotal(T18_task_fact _t18_task_fact) {
		super(_t18_task_fact);
	}

	@Override
	public void init() {
		
	}

	public boolean delTask(Connection conn) throws Exception {
        boolean isSucc=true;
		try {
			String statisticdate=this.t18_task_fact.getStatisticdate();
			
			 int  count=reportBo.T10_CHECKPARTY_NEW(conn, statisticdate,"T10_CHECKPARTY_NEW");
			   count=reportBo.T10_CHECKPARTY_RELT(conn, statisticdate,"T10_CHECKPARTY_RELT");
			   count=reportBo.T10_CHECKPARTY_NEW(conn, statisticdate,"T10_CHECKPARTY_RE");
			   count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_IDENTITY_D");
			   count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_REIDENTITY_D");
			   count=reportBo.del_T07_Table_MID1(conn, statisticdate,"T10_PARTY_CRETAL_D");
			
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
        
			
		 //���¿��ͻ����뵽�¿��ͻ���
			int count=reportBo.insert_T10_CHECKPARTY_NEW(conn, statisticdate);
			
		 //���¿ͻ�ʶ���
			count=reportBo.insert_T10_CHECKPARTY_RE1(conn, statisticdate); //�������ͻ�
			count=reportBo.insert_T10_CHECKPARTY_RE2(conn, statisticdate);//��˽֤�����ڿͻ�
			count=reportBo.insert_T10_CHECKPARTY_RE3(conn, statisticdate);//�Թ�֤�����ڿͻ�
		//	count=reportBo.insert_T10_CHECKPARTY_RE4(conn, statisticdate);//�߷������Ͽͻ�
		//	count=reportBo.insert_T10_CHECKPARTY_RE5(conn, statisticdate);//�����ϱ��ͻ�
			
		 //�¿��ͻ�ʶ��ͳ�Ʊ�
			count=reportBo.insert_T07_USER_IDENTITY_D(conn, statisticdate);
			
		 //���¿ͻ�ʶ��ͳ�Ʊ�
		   count=reportBo.insert_T07_USER_REIDENTITY_D(conn, statisticdate);
		 
	     //�������ô���Ӧ��ͳ�Ʊ�
		 //  count=reportBo.insert_T10_PARTY_CRETAL_D(conn, statisticdate);
		   
		  //ͳ�Ʊ���洢����
		   this.insertTotalData(conn, statisticdate);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			rs=false;
			throw e;
		}
		return rs;

	}
	
	public boolean insertTotalData(Connection conn,String statisticdate) throws Exception {
		boolean isSucc = false;
		

		CallableStatement calstmt = null;
		try {
			String dbtype = SysConfig.getProperty("database.dbtype");
			String packagecal = "call PKG_AML_REPORT.PROC_AML_REPORT_MAIN(?) ";
			 if (null != dbtype && dbtype.toLowerCase().equals("db2")) {
				 packagecal = "call  PROC_AML_REPORT_MAIN(?) ";
			 }		
			calstmt = conn.prepareCall(packagecal);
			calstmt.setString(1, statisticdate);//����ʱ��
			//calstmt.setString(2, this.getT18_task_fac().getTaskkey());
			logger.debug("sql:" + packagecal);
			//ִ��
			calstmt.executeUpdate();
			conn.commit();
			
		
			isSucc = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			throw e;
		} finally {
			try {
				calstmt.close();
			} catch (Exception e) {
			}
			;
		}

		return isSucc;
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
