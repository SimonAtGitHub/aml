package com.ist.server.cal.aml.TotalInfo.bo;

import java.sql.Connection;


import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.util.DateUtils;



public class TotalReportBO {

	private static Logger logger = LogUtils.getLogger(TotalReportBO.class.getName());

	
	private DBfunc func = DBfuncFactory.getDBInstance();
	DateUtils du=new DateUtils();
	public TotalReportBO() {
		// TODO Auto-generated constructor stub
	}

	 public int getP90_PJ_STAT_ANALYSIS(Connection conn,String statisticdate)throws Exception{
	   	  String sql=" DELETE FROM T09_PJ_STAT_ANALY T WHERE T.STATISTICDATE = "+func.vch2dt(statisticdate, "yyyy-mm-dd");
	   	  int count = SQLExecute.exeSql(conn, sql);
	   	  
	   	  sql=" INSERT INTO T09_PJ_STAT_ANALY SELECT T1.ORGANKEY,T2.ORGANNAME,T1.PARTY_CLASS_CD,T1.EMENDATIONLEVEL, CUST_NUM,"+func.vch2dt(statisticdate, "yyyy-mm-dd")
	            +" FROM   (SELECT T.ORGANKEY,T.PARTY_CLASS_CD,T.EMENDATIONLEVEL,COUNT(T.PARTY_ID) AS CUST_NUM"
	            +"  FROM   T08_PARTY_RESULT T GROUP  BY T.ORGANKEY, T.PARTY_CLASS_CD, T.EMENDATIONLEVEL) T1,"
	            +" T00_ORGAN T2 WHERE  T1.ORGANKEY = T2.ORGANKEY";
	   	  count = SQLExecute.exeSql(conn, sql);
	   	  
	   	  return count;
		}
	     public int del_t07_inrep_by_acct(Connection conn,String statisticdate)throws Exception{
	   	  String sql=" DELETE FROM T07_INREP_BY_ACCT T WHERE T.report_dt = "+func.vch2dt(statisticdate, "yyyy-mm-dd");
	   	  int count = SQLExecute.exeSql(conn, sql); 
	   	  return count;
		}
	     
	     public int del_t07_inrep_by_acct_mid(Connection conn)throws Exception{
	   	  String sql=func.deleteTable("t07_inrep_by_acct_mid");
	   	  int count = SQLExecute.exeSql(conn, sql); 
	   	  return count;
		}
	     
	     public int insert_t07_inrep_by_acct_mid(Connection conn,String statisticdate,String case_type,String granularity)throws Exception{
	    	String begindate=du.getBeginDate(granularity, statisticdate);
	   	  String  sql ="";
	    	int   count =0;
	   	 if(case_type.equals("1")){
	   		 //���뱾�Ҵ��
	   	  sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'1',"+
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.CRAT ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.CRAT ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG T1, T07_REPORT T2, T07_NBH_TSDT T3 " +
				"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  "
				+" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
				+" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A')  AND  T3.CURR_CD='1' " +
				" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	  	   count = SQLExecute.exeSql(conn, sql);
	  	   
	  	 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
			"total_val,alert_num,success_num,alertnvl,handout_num) " +
			" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'1',"+
			"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
			"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.CRAT ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
			"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
			"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
			"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.CRAT ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
			"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
			" FROM   T07_MSG_UH T1, T07_REPORT_UH T2, T07_NBH_TSDT_UH T3 " +
			"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  "
			+" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
			+" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
			+" AND    T1.MSG_TYPE_CD IN ('N', 'A')  AND  T3.CURR_CD='1' " +
			" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	    count = SQLExecute.exeSql(conn, sql);
	  	   
	  	   //������Ҵ��
	  	 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
			"total_val,alert_num,success_num,alertnvl,handout_num) " +		
		" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'1',"+
		"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
		"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN ((T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT) ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
		"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
		"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
		"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN ((T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT) ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
		"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
		" FROM   T07_MSG T1, T07_REPORT T2, T07_NBH_TSDT T3,T87_EXCHANGE_RATE T4 " +
		"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  AND T3.CRTP=T4.CURRENCY_CD  "
		+" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
		+" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
		+" AND    T1.MSG_TYPE_CD IN ('N', 'A')  AND  T3.CURR_CD='2'   " +
		" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	  	 
	  	  count = SQLExecute.exeSql(conn, sql);
	  	  
	  	 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
			"total_val,alert_num,success_num,alertnvl,handout_num) " +		
		" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'1',"+
		"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
		"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN ((T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT) ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
		"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
		"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
		"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN ((T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT) ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
		"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
		" FROM   T07_MSG_UH T1, T07_REPORT_UH T2, T07_NBH_TSDT_UH T3,T87_EXCHANGE_RATE T4 " +
		"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  AND T3.CRTP=T4.CURRENCY_CD  "
		+" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
		+" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
		+" AND    T1.MSG_TYPE_CD IN ('N', 'A')  AND  T3.CURR_CD='2'  " +
		" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	  	 
	  	  count = SQLExecute.exeSql(conn, sql);
	  	  
//	  	 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
//			"total_val,alert_num,success_num,alertnvl,handout_num) " +	
//			"SELECT T2.CREATE_ORG,T2.CURR_CD,"+
//			"COUNT(DISTINCT(CASE WHEN T2.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
//			"0 AS TOTAL_VAL, " + 	// �漰�ܽ��
//			"0 AS ALERT_NUM, " + 	// �漰���ױ���
//			"COUNT(DISTINCT(CASE WHEN T2.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
//			"0 AS ALERTNVL, " + 	// �漰�ܽ��
//			"0 AS HANDOUT_NUM " + 	// �漰���ױ���
//			" FROM   T07_MSG T1, T07_REPORT T2 left join T07_NBH_TSDT T3  on t2.reportkey=t3.reportkey" +
//			" WHERE T1.REPORTKEY = T2.REPORTKEY  "
//			+" AND    T1.SENDDATE_DT>=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
//			+" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
//			+" AND    T1.MSG_TYPE_CD IN ('N', 'A')  AND T2.INTERFACEKEY='BH' and T3.ticd is null  " +
//		
//			" GROUP  BY T2.CREATE_ORG,  T2.CURR_CD ) A  GROUP BY A.CREATE_ORG,A.CURR_CD";
//	  	 
//	  	 count = SQLExecute.exeSql(conn, sql);
	  	 
	   	 }else{
	   		 //���ҿ���
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.CRAT ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.CRAT ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG T1, T07_REPORT T2, T07_NBS_RPDI T3 " +
				"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  "
			    +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
			    +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') AND  T3.CURR_CD='1'  " +
			
				" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.CRAT ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.CRAT ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG_UH T1, T07_REPORT_UH T2, T07_NBS_RPDI_UH T3 " +
				"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  "
			    +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
			    +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') AND  T3.CURR_CD='1'  " +
			
				" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 //��ҿ���
	   		 
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN (T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN (T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG T1, T07_REPORT T2, T07_NBS_RPDI T3 ,T87_EXCHANGE_RATE T4 " +
				"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  AND T3.CRTP=T4.CURRENCY_CD   "
				 +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
				 +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') AND  T3.CURR_CD='2' " +
			
				" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T3.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN (T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  ELSE 0 END) AS TOTAL_VAL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'C' THEN T3.TICD ELSE NULL END) AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"SUM(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN (T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  ELSE 0 END) AS ALERTNVL, " + 	// �漰�ܽ��
				"COUNT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T3.TICD ELSE NULL END) AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG_UH T1, T07_REPORT_UH T2, T07_NBS_RPDI_UH T3 ,T87_EXCHANGE_RATE T4 " +
				"WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  AND T3.CRTP=T4.CURRENCY_CD   "
				 +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
				 +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') AND  T3.CURR_CD='2'  " +
			
				" GROUP  BY T2.CREATE_ORG,  T3.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 
	   		 
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T2.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T2.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"0 AS TOTAL_VAL, " + 	// �漰�ܽ��
				"0 AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"0 AS ALERTNVL, " + 	// �漰�ܽ��
				"0 AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG T1, T07_REPORT T2 left join  T07_NBS_RPDI T3 on   T2.REPORTKEY = T3.REPORTKEY " +
				" WHERE T1.REPORTKEY = T2.REPORTKEY AND T2.INTERFACEKEY='BS'  "
				 +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
				 +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') and T3.ticd is null " +
			
				" GROUP  BY T2.CREATE_ORG,  T2.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 sql="insert into t07_inrep_by_acct_mid(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
				" SELECT T2.CREATE_ORG,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T2.CURR_CD,'2',"+
				"COUNT(DISTINCT(CASE WHEN T2.PARTY_CLASS_CD = 'C' THEN T2.REPORTKEY ELSE NULL END)) AS TOTAL_NUM, " + 	// �Թ��˻�������ɽ��ױ������
				"0 AS TOTAL_VAL, " + 	// �漰�ܽ��
				"0 AS ALERT_NUM, " + 	// �漰���ױ���
				"COUNT(DISTINCT(CASE WHEN T3.PARTY_CLASS_CD = 'I' THEN T2.REPORTKEY ELSE NULL END)) AS SUCCESS_NUM, " + 	// �����˻�������ɽ��ױ������
				"0 AS ALERTNVL, " + 	// �漰�ܽ��
				"0 AS HANDOUT_NUM " + 	// �漰���ױ���
				" FROM   T07_MSG_UH T1, T07_REPORT_UH T2 left join  T07_NBS_RPDI_UH T3 on   T2.REPORTKEY = T3.REPORTKEY " +
				" WHERE T1.REPORTKEY = T2.REPORTKEY AND T2.INTERFACEKEY='BS'  "
				 +" AND    T1.SENDDATE_DT>=" +func.vch2dt(begindate, "yyyy-mm-dd")
				 +" AND    T1.SENDDATE_DT<=" +func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" AND    T1.MSG_TYPE_CD IN ('N', 'A') and T3.ticd is null " +
			
				" GROUP  BY T2.CREATE_ORG,  T2.CURR_CD";
	   		 count = SQLExecute.exeSql(conn, sql);
	   		 
	   		 
	   		 
	   	 }
	 
	   	
   	  
	   	  return count;
		}
	    
	     public int insert_t07_inrep_by_acct(Connection conn)throws Exception{
	   	  String  sql="insert into t07_inrep_by_acct(organkey,report_dt,currency_cd,cast_type,total_num," +
				"total_val,alert_num,success_num,alertnvl,handout_num) " +
		   		" select organkey,report_dt,currency_cd,cast_type,sum(total_num)," +
				" sum(total_val),sum(alert_num),sum(success_num),sum(alertnvl),sum(handout_num) from t07_inrep_by_acct_mid "
		   		+" GROUP  BY organkey,report_dt ,currency_cd, cast_type";
	   	  int count = SQLExecute.exeSql(conn, sql); 
	   	  return count;
		}
	     
	     public int insert_T10_CHECKPARTY_NEW(Connection conn,String statisticdate)throws Exception{
	    	 //ɾ��һ������ǰ������
	    	 String befredate=DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -1);
	    	String delsql=" delete from T10_CHECKPARTY_NEW where CREATE_DT="+func.vch2dt(befredate, "yyyy-mm-dd");
	    	int   count1 = SQLExecute.exeSql(conn, delsql);
	    	 
	    	 //���뵱������� 
	      	  String  sql="insert into T10_CHECKPARTY_NEW(PARTY_ID,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
	   			"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD,CHECK_STATUS) " +
	   	   		" select PARTY_ID,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
	   			"CARD_NO,ORGANKEY,create_dt,PARTY_STATUS_CD,AML1_TYPE_CD,'0'"
	   			+"  from t47_party where LY!='1' AND CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	      	  int count = SQLExecute.exeSql(conn, sql); 
	      	insert_T10_T10_CHECKPARTY_RELT1(conn, statisticdate);
	      	  return count;
	   	}
	     public int insert_T10_T10_CHECKPARTY_RELT1(Connection conn, String statisticdate) throws Exception {
	 		String sql = "insert into T10_CHECKPARTY_RELT (CHECK_NO,PARTY_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE,CHECKER,CHECK_DT,"
	 				+ " CARD_NO,ORGANKEY,AML1_TYPE_CD,check_explain,VALID_DT,check_result) "
	 				+ "select  SEQ_T10_CHECKPARTY_RELT.Nextval,A.PARTY_ID,A.PARTY_CLASS_CD, A.PARTY_CHN_NAME,  A.CARD_TYPE, 'yaohl',A.CREATE_DT,  A.CARD_NO, "
	 				+ "A.ORGANKEY,  A.AML1_TYPE_CD, '该客户为我行新网联合贷贷款客户,已完成反洗钱黑名单及涉恐名单排查,我行会持续关注',  to_date('2018-01-22','yyyy-mm-dd'), '1' "
	 				+ " from t47_party A"
	 				+ " WHERE A.LY='1' AND A.CREATE_DT = " + func.vch2dt(statisticdate, "yyyy-mm-dd");
	 		int count3 = SQLExecute.exeSql(conn, sql);
	 		return count3;

	 	}
	     public  int insert_T10_CHECKPARTY_RE1(Connection conn,String statisticdate)throws Exception{
	     	  String  sql="insert into T10_CHECKPARTY_RE(PARTY_ID,RECHECK_TYPE,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
	  			"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD) " +
	  	   		" select b.PARTY_ID,'1',b.HOST_CUST_ID,b.PARTY_CLASS_CD,b.PARTY_CHN_NAME,b.CARD_TYPE," +
	  			"b.CARD_NO,b.ORGANKEY,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",b.PARTY_STATUS_CD,b.AML1_TYPE_CD"
	  			+"  from t07_blacklist a,t47_party b left join T10_CHECKPARTY_RE c on c.party_id=b.party_id  "
	  			+" where  a.party_id=b.party_id and c.party_id is null and  a.create_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	  			+"  and a.isuse='0' and a.ischeck='1'";
	     	  int count = SQLExecute.exeSql(conn, sql); 
	     	  return count;
	  	}
	     
	     public int insert_T10_CHECKPARTY_RE2(Connection conn,String statisticdate)throws Exception{
	    	  String  sql="insert into T10_CHECKPARTY_RE(PARTY_ID,RECHECK_TYPE,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
	 			"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD) " +
	 	   		" select b.PARTY_ID,'2',b.HOST_CUST_ID,b.PARTY_CLASS_CD,b.PARTY_CHN_NAME,b.CARD_TYPE," +
	 			"b.CARD_NO,b.ORGANKEY,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",b.PARTY_STATUS_CD,b.AML1_TYPE_CD"
	 			+"  from t47_individual a, t47_party b left join T10_CHECKPARTY_RE c on c.party_id=b.party_id  "
	 			+" where  a.party_id=b.party_id and c.party_id is null and   a.CARD_END_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	 			
	    	  int count = SQLExecute.exeSql(conn, sql); 
	    	  return count;
	 	}
	     public int insert_T10_CHECKPARTY_RE3(Connection conn,String statisticdate)throws Exception{
	   	  String  sql="insert into T10_CHECKPARTY_RE(PARTY_ID,RECHECK_TYPE,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
				"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD) " +
		   		" select b.PARTY_ID,'2',b.HOST_CUST_ID,b.PARTY_CLASS_CD,b.PARTY_CHN_NAME,b.CARD_TYPE," +
				"b.CARD_NO,b.ORGANKEY,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",b.PARTY_STATUS_CD,b.AML1_TYPE_CD"
				+"  from t47_corporation a, t47_party b left join T10_CHECKPARTY_RE c on c.party_id=b.party_id  "
				+" where  a.party_id=b.party_id  and c.party_id is null and  a.LICENCE_END_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");
				
	   	  int count = SQLExecute.exeSql(conn, sql); 
	   	  return count;
		}
	     
	     public int insert_T10_CHECKPARTY_RE4(Connection conn,String statisticdate)throws Exception{
	    	 String sql=func.deleteTable("T10_RISK_PARTY_MID");
	    	 int count = SQLExecute.exeSql(conn, sql); 
	      	    sql="insert into T10_RISK_PARTY_MID(PARTY_ID) " +
	   	   		" select a.party_id from t08_party_result a where a.emendationlevel<'1022' and a.appradate="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	          	  count = SQLExecute.exeSql(conn, sql); 
	          	  
	   		 sql=" delete from T10_RISK_PARTY_MID a where exists(select 'X' from T10_CHECKPARTY_RE b where b.party_id=a.party_id)";
	   		 count = SQLExecute.exeSql(conn, sql); 
	   		 
	   		 sql=" delete from T10_RISK_PARTY_MID a where exists(select 'X' from T10_CHECKPARTY_RE_UH b where b.party_id=a.party_id and b.VALID_DT>"+func.vch2dt(statisticdate, "yyyy-mm-dd")+")";
	   		 count = SQLExecute.exeSql(conn, sql); 
	   		 
	   		 sql="insert into T10_CHECKPARTY_RE(PARTY_ID,RECHECK_TYPE,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
				"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD) " 
	   		+" select b.PARTY_ID,'3',b.HOST_CUST_ID,b.PARTY_CLASS_CD,b.PARTY_CHN_NAME,b.CARD_TYPE," +
			"b.CARD_NO,b.ORGANKEY,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",b.PARTY_STATUS_CD,b.AML1_TYPE_CD"
			+"  from T10_RISK_PARTY_MID a, t47_party b where  a.party_id=b.party_id ";
	   		 count = SQLExecute.exeSql(conn, sql); 		 
	      	  return count;
	   	}
	     
	     public int insert_T10_CHECKPARTY_RE5(Connection conn,String statisticdate)throws Exception{
	    	 String sql=func.deleteTable("T10_REPORT_PARTY_MID");
	    	 int count = SQLExecute.exeSql(conn, sql); 
	      	    sql="insert into T10_REPORT_PARTY_MID(PARTY_ID) " +
	   	   		" select d.csnm from t07_nbh_ctif d,t07_msg e where d.reportkey=e.reportkey and e.msg_type_cd in('N','A') "
	            +" and e.senddate_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	            +" union select d.csnm from t07_nbs_ctif d,t07_msg e where d.reportkey=e.reportkey "
	            +" and e.msg_type_cd in('N','A')  and e.senddate_dt=" +func.vch2dt(statisticdate, "yyyy-mm-dd");
	   			  count = SQLExecute.exeSql(conn, sql); 
	   		 sql=" delete from T10_REPORT_PARTY_MID a where exists(select 'X' from T10_CHECKPARTY_RE b where b.party_id=a.party_id)";
	   		 count = SQLExecute.exeSql(conn, sql); 
	   		 
	   		 sql=" delete from T10_REPORT_PARTY_MID a where exists(select 'X' from T10_CHECKPARTY_RE_UH b where b.party_id=a.party_id and b.VALID_DT>"+func.vch2dt(statisticdate, "yyyy-mm-dd")+")";
	   		 count = SQLExecute.exeSql(conn, sql); 
	   		 
	   		 sql="insert into T10_CHECKPARTY_RE(PARTY_ID,RECHECK_TYPE,HOST_CUST_ID,PARTY_CLASS_CD,PARTY_CHN_NAME,CARD_TYPE," +
				"CARD_NO,ORGANKEY,CREATE_DT,PARTY_STATUS_CD,AML1_TYPE_CD) " 
	   		+" select b.PARTY_ID,'4',b.HOST_CUST_ID,b.PARTY_CLASS_CD,b.PARTY_CHN_NAME,b.CARD_TYPE," +
			"b.CARD_NO,b.ORGANKEY,"+func.vch2dt(statisticdate, "yyyy-mm-dd")+",b.PARTY_STATUS_CD,b.AML1_TYPE_CD"
			+"  from T10_REPORT_PARTY_MID a, t47_party b where  a.party_id=b.party_id ";
	   		 count = SQLExecute.exeSql(conn, sql); 		 
	      	  return count;
	   	}
	     
	     public int insert_T07_REPORT_STATISTIC_MID(Connection conn,String statisticdate,String granularity)throws Exception{
	    	 int   count=0;
	      	  String  sql ="";
	      	String befredate=du.getEndDate(granularity,DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -3));
	      //	String befredate=du.getBeginDate(granularity, statisticdate);
	    	String month=statisticdate.substring(5, 7);
	    	 System.out.println("month:::"+month);
	     if(month.equals("03")||month.equals("06")||month.equals("09")||month.equals("12")){
	      		
	      		     sql=" INSERT INTO T07_REPORT_STATISTIC_MID(STATISTICDATE,ORGANKEY,CURRFLAG,CPT_REPORTNUM,CPT_REPORTAMT,IDT_REPORTNUM,IDT_REPORTAMT,"
	      		        +" CPA_REPORTNUM,CPA_REPORTAMT,IDA_REPORTNUM,IDA_REPORTAMT,CPR_REPORTNUM,CPR_REPORTAMT,IDR_REPORTNUM,IDR_REPORTAMT)             "
	      		      +" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",                                                                                                                                               "
	      		      +"    T.FICD,T.CURR_CD,                                                                                                                                                                                  "
	      			    +"  	  COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'C' THEN T.REPORTKEY ELSE NULL END)) AS CPTOTAL_NUM, 	                                                                                               "
	      			    +"  	  SUM(CASE WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='1' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='2' THEN T.USD_AMT ELSE 0 END) AS CPTOTAL_VAL,                                      "        
	      		      +"         COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'I' THEN T.REPORTKEY ELSE NULL END)) AS IDTOTAL_NUM,                                                                                              "
	      		      +"         SUM(CASE WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='1' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='2' THEN T.USD_AMT ELSE 0 END) AS IDTOTAL_NUM,                                   "          
	      		      +"         COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'C' AND T.STCR='04' THEN T.REPORTKEY ELSE NULL END)) AS CPTOTAL_NUM1,                                                                             "
	      		      +"         SUM(CASE WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='1' AND T.STCR='04' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='1' AND T.STCR='04' THEN T.USD_AMT ELSE 0 END) AS CPTOTAL_NUM1,  "                         
	      		      +"         COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'I' AND T.STCR='04' THEN T.REPORTKEY ELSE NULL END)) AS IDTOTAL_NUM1,                                                                             "
	      		      +"         SUM(CASE WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='1' AND T.STCR='04' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='1' AND T.STCR='04' THEN T.USD_AMT ELSE 0 END) AS IDTOTAL_NUM1,  "                         
	      		      +"         COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'C' AND T.STCR='03' THEN T.REPORTKEY ELSE NULL END)) AS CPTOTAL_NUM2,                                                                             "
	      		      +"         SUM(CASE WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='1' AND T.STCR='03' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'C' AND T.CURR_CD='1' AND T.STCR='03' THEN T.USD_AMT ELSE 0 END) AS CPTOTAL_NUM2,  "                          
	      		      +"         COUNT(DISTINCT(CASE WHEN T.PARTY_CLASS_CD = 'I' AND T.STCR='03' THEN T.REPORTKEY ELSE NULL END)) AS IDTOTAL_NUM2,                                                                             "
	      		      +"         SUM(CASE WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='1' AND T.STCR='03' THEN T.CRAT WHEN T.PARTY_CLASS_CD = 'I' AND T.CURR_CD='1' AND T.STCR='03' THEN T.USD_AMT ELSE 0 END) AS IDTOTAL_NUM2   "                         
	      		      +"    FROM(                                                                                                                                                                                              "
	      		      +"     select   T1.REPORTKEY, T2.FICD,T3.PARTY_CLASS_CD,T3.CURR_CD,T2.SSDG AS STCR,T3.CRAT,(T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  AS USD_AMT                                                                 "
	      		      +"          FROM   T07_MSG T1, T07_NBS_RBIF T2, T07_NBS_RPDI T3,T87_EXCHANGE_RATE T4                                                                                                                     "
	      		      +"         WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY  AND T3.CRTP=T4.CURRENCY_CD                                                                                                "
	      		      +"         AND    T1.MSG_TYPE_CD IN ('N', 'A')                                                                                                                                                           "
	      		      +"          AND    T1.SENDDATE_DT>"+func.vch2dt(befredate, "yyyy-mm-dd")  
	      		      +"          AND    T1.SENDDATE_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd") 
	      		      +"          UNION ALL                                                                                                                                                                                    "
	      		      +"           select  T1.REPORTKEY, T2.FICD,T3.PARTY_CLASS_CD,T3.CURR_CD,T2.SSDG AS STCR,T3.CRAT,(T4.USD_FX_RATE*T3.CRAT)/T4.CURRENCY_UNIT  AS USD_AMT                                                            "
	      		      +"          FROM   T07_MSG_UH T1, T07_NBS_RBIF_UH T2, T07_NBS_RPDI_UH T3,T87_EXCHANGE_RATE T4                                                                                                            "
	      		      +"         WHERE T1.REPORTKEY = T2.REPORTKEY  AND T2.REPORTKEY = T3.REPORTKEY   AND T3.CRTP=T4.CURRENCY_CD                                                                                               "
	      		      +"         AND    T1.MSG_TYPE_CD IN ('N', 'A')  "
	      		       +"          AND    T1.SENDDATE_DT>"+func.vch2dt(befredate, "yyyy-mm-dd")  
	      		      +"          AND    T1.SENDDATE_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd") 
	      		    +"         )T   "
	      		      +"            GROUP  BY T.FICD,T.CURR_CD                                                                ";
	      		   			
	   
	      	   count = SQLExecute.exeSql(conn, sql);
	      	
	     }
	      	  
	      	
	      	  
	      	  return count;
	   	}
	     public int del_T07_Table_MID(Connection conn,String statisticdate,String tablename)throws Exception{
	      	  String sql=" DELETE FROM "+tablename+" T WHERE T.STATISTICDATE = "+func.vch2dt(statisticdate, "yyyy-mm-dd");
	      	  int count = SQLExecute.exeSql(conn, sql); 
	      	  return count;
	   	}
	     public int del_T07_Table_MID1(Connection conn,String statisticdate,String tablename)throws Exception{
	     	  String sql=" DELETE FROM "+tablename+" T WHERE T.STATISTIC_DT = "+func.vch2dt(statisticdate, "yyyy-mm-dd");
	     	  int count = SQLExecute.exeSql(conn, sql); 
	     	  return count;
	  	}
	     public int T10_CHECKPARTY_NEW(Connection conn,String statisticdate,String tablename)throws Exception{
	    	  String sql=" DELETE FROM "+tablename+" T WHERE T.CREATE_DT = "+func.vch2dt(statisticdate, "yyyy-mm-dd");
	    	  int count = SQLExecute.exeSql(conn, sql); 
	    	  return count;
	 	}
	     public int insert_T07_USER_IDENTITY_D(Connection conn,String statisticdate)throws Exception{
	     	 //ɾ��6������ǰ������
	    	 String befredate=DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -6);
	    	 System.out.println("befredate:::"+befredate);
	    	String delsql=" delete from T07_USER_IDENTITY_D where STATISTICDATE<="+func.vch2dt(befredate, "yyyy-mm-dd");
	    	int   count = SQLExecute.exeSql(conn, delsql);
	    	
	    	delsql=func.deleteTable("t07_user_identity_mid");
	    	count = SQLExecute.exeSql(conn, delsql);
	    	
	    	//������ʶ���������
	    	String sql=" insert into t07_user_identity_mid(statisticdate,organkey,identityflag,cpm_total,cpm_proxy,cpm_thparty,cpm_disembark,cpm_benefit,cpm_questotal,   "    
	 			  +" cpm_anonymous,cpm_falsecard,cpm_failurecard,cpm_suspects,cpm_othercase,idm_total,idm_proxy,idm_thparty,idm_residents,idm_resiproxy,idm_nonresidents,  "  
	 			  +" idm_nonresiproxy,idm_questotal,idm_anonymous,idm_falsecard,idm_failurecard,idm_otherscard,idm_suspects,idm_othercase,ciall_total)                    "  
	              +" select "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",organkey,identitytype,cp_total,cp_proxy,cp_thparty,cp_disembark,cp_benefit,            "  
	 			  +" cp_anonymous+cp_falsecard+cp_failurecard+cp_otherescard+cp_suspects+cp_othercase as cp_questotal,cp_anonymous,cp_falsecard,cp_failurecard, "  
	 			  +" cp_suspects,cp_othercase,id_total,id_proxy,id_thparty,id_residents,id_resiproxy,id_nonresidents,id_nonresiproxy,                           "  
	 			  +" id_anonymous+id_falsecard+id_failurecard+id_otherscard+id_suspects+id_othercase as id_questotal,                                           "  
	 			  +" id_anonymous,id_falsecard,id_failurecard,id_otherscard,id_suspects,id_othercase,cp_total+id_total as all_total                             "  
	 			  +" from (                                                                                                                                     "  
	 			  +"   select a.CHECKER_ORG as organkey,a.check_type as identitytype,sum(case  when a.party_class_cd='C' then 1 else 0 end) as cp_total,        "  
	 			  +"        sum(case when  a.party_class_cd='C' and a.CHECK_METHOD='1' then 1 else 0 end) as cp_proxy,                                          "  
	 			  +"        sum(case when  a.party_class_cd='C' and a.CHECK_METHOD='2' then 1 else 0 end) as cp_thparty,                                        "  
	 			  +"        sum(case when  a.party_class_cd='C' and  a.lian_flag='1' then 1 else 0 end ) as cp_disembark,                                       "  
	 			  +"        sum(case when  a.party_class_cd='C' then a.leader_num else 0 end ) as cp_benefit,                                                   "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and  b.risk_type='F02' then b.party_id else null end) as cp_anonymous,               "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and  b.risk_type='F03' then b.party_id else null end) as cp_falsecard,               "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and b.risk_type='F04' then b.party_id else null end) as cp_failurecard,              "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and b.risk_type='F05' then b.party_id else null end) as cp_otherescard,              "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and b.risk_type='F06' then b.party_id else null end) as cp_suspects,                 "  
	 			  +"        count(distinct case when  a.party_class_cd='C' and b.risk_type='F10' then b.party_id else null end) as cp_othercase,                "  
	 			  +"        sum(case when a.party_class_cd='I' then 1 else 0 end) as id_total,                                                                  "  
	 			  +"        sum(case when  a.party_class_cd='I' and a.CHECK_METHOD='1' then 1 else 0 end) as id_proxy,                                          "  
	 			  +"        sum(case when  a.party_class_cd='I' and a.CHECK_METHOD='2' then 1 else 0 end) as id_thparty,                                        "  
	 			  +"        sum(case when  a.party_class_cd='I'  and a.aml1_type_cd='01'  then 1 else 0 end )  as id_residents,                                 "  
	 			  +"        sum(case when  a.party_class_cd='I'  and a.aml1_type_cd='01' and  a.daeli_flag='1' then 1 else 0 end ) as id_resiproxy,             "  
	 			  +"        sum(case when  a.party_class_cd='I'  and a.aml1_type_cd='02' then 1 else 0 end ) as   id_nonresidents,                              "  
	 			  +"        sum(case when  a.party_class_cd='I'  and a.aml1_type_cd='02' and a.daeli_flag='1' then 1 else 0 end ) as   id_nonresiproxy,         "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and  b.risk_type='F02' then b.party_id else null end) as id_anonymous,               "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and  b.risk_type='F03' then b.party_id else null end) as id_falsecard,               "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and b.risk_type='F04' then b.party_id else null end) as id_failurecard,              "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and b.risk_type='F05' then b.party_id else null end) as id_otherscard,               "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and b.risk_type='F06' then b.party_id else null end) as id_suspects,                 "  
	 			  +"        count(distinct case when  a.party_class_cd='I' and b.risk_type='F11' then b.party_id else null end) as id_othercase                 "  
	 			  +" 			from T10_CHECKPARTY_RELT a left join T10_PARTY_RISK b on  (a.party_id=b.party_id and a.check_dt=b.create_dt)                                                "  
	 			  +" 			where a.check_type in('1','3','4','6')                                                                                          "  
	 			 // +"      and a.check_type='1'                                                                                                                  "  
	 			  +"    group by a.checker_org,a.check_type                                                                                                     "  
	 			  +"   )c                                                                                                                                       " ;
	     	   count = SQLExecute.exeSql(conn, sql);
	     	   
	     	sql=  " insert into t07_user_identity_D(statisticdate,organkey,IDENTITYFLAG,cpm_total,cpm_proxy,cpm_thparty,cpm_disembark,cpm_benefit,cpm_questotal,        "
	     		 +" cpm_anonymous,cpm_falsecard,cpm_failurecard,cpm_suspects,cpm_othercase,idm_total,idm_proxy,idm_thparty,idm_residents,idm_resiproxy,idm_nonresidents,"  
	     		 +" idm_nonresiproxy,idm_questotal,idm_anonymous,idm_falsecard,idm_failurecard,idm_otherscard,idm_suspects,idm_othercase,ciall_total)                   "              
	     		 +" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",B.ORGANKEY,B.IDENTITYFLAG,B.CPM_TOTAL,C.CPM_PROXY,C.cpm_thparty,C.cpm_disembark,C.cpm_benefit,C.cpm_questotal,            "
	     		 +"   C.cpm_anonymous,C.cpm_falsecard,C.cpm_failurecard,C.cpm_suspects,C.cpm_othercase,B.idm_total,C.idm_proxy,C.idm_thparty,                           "
	     		 +"   B.idm_residents,B.idm_resiproxy,B.idm_nonresidents,B.idm_nonresiproxy,C.idm_questotal,C.idm_anonymous,C.idm_falsecard,                            "
	     		 +"   C.idm_failurecard,C.idm_otherscard,C.idm_suspects,C.idm_othercase,B.ciall_total                                                                   "
	     		 +" FROM(                                                                                                                                               "
	     		 +" SELECT A.ORGANKEY,'1' AS IDENTITYFLAG,                                                                                                              "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='C' THEN 1 ELSE 0 END) AS CPM_TOTAL,                                                                                 "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='I' THEN 1 ELSE 0  END) as idm_total,                                                                                "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='I' AND A.AML1_TYPE_CD='01' THEN 1 ELSE 0  END) as idM_residents,                                                    "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='I' AND A.AML1_TYPE_CD='01' AND A.IS_AGENT='1' THEN 1 ELSE 0 END) as idM_resiproxy,                                  "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='I' AND A.AML1_TYPE_CD='02' THEN 1 ELSE 0 END) as idM_nonresidents,                                                  "
	     		 +" SUM(CASE WHEN A.PARTY_CLASS_CD='I' AND A.AML1_TYPE_CD='02' AND A.IS_AGENT='1' THEN 1 ELSE 0 END) as idM_nonresiproxy,                               "
	     		 +" COUNT(A.PARTY_ID) AS ciall_total                                                                                                                    "
	     		 +" FROM  T47_PARTY A                                                                                                                                   "
	     		 +" WHERE A.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     		 +" GROUP BY A.ORGANKEY) B LEFT JOIN t07_user_identity_mid C ON B.ORGANKEY=C.ORGANKEY AND B.IDENTITYFLAG=C.IDENTITYFLAG                                 ";
	     	count = SQLExecute.exeSql(conn, sql);
	     	 
	     sql=" insert into t07_user_identity_D(statisticdate,organkey,IDENTITYFLAG,cpm_total,cpm_proxy,cpm_thparty,cpm_disembark,cpm_benefit,cpm_questotal,           "    
	     	+" cpm_anonymous,cpm_falsecard,cpm_failurecard,cpm_suspects,cpm_othercase,idm_total,idm_proxy,idm_thparty,idm_residents,idm_resiproxy,idm_nonresidents,   "
	     	+" idm_nonresiproxy,idm_questotal,idm_anonymous,idm_falsecard,idm_failurecard,idm_otherscard,idm_suspects,idm_othercase,ciall_total)                      "           
	     	+" SELECT statisticdate,organkey,IDENTITYFLAG,cpm_total,cpm_proxy,cpm_thparty,cpm_disembark,cpm_benefit,cpm_questotal,                                    "
	     	+" cpm_anonymous,cpm_falsecard,cpm_failurecard,cpm_suspects,cpm_othercase,idm_total,idm_proxy,idm_thparty,idm_residents,idm_resiproxy,idm_nonresidents,   "
	     	+" idm_nonresiproxy,idm_questotal,idm_anonymous,idm_falsecard,idm_failurecard,idm_otherscard,idm_suspects,idm_othercase,ciall_total                       "
	     	+" FROM t07_user_identity_mid C                                                                                                                           "
	     	+" WHERE C.IDENTITYFLAG IN('3','4','6')                                                                                                                   ";
	     count = SQLExecute.exeSql(conn, sql);
	     	  return count;
	  	}
	     
	     public int insert_T07_USER_IDENTITY_M(Connection conn,String statisticdate,String granularity)throws Exception{
	    
	    	 String befredate=du.getBeginDate(granularity, statisticdate);	
	     	 
	     String sql=" insert into t07_user_identity_m(statisticdate,organkey,IDENTITYFLAG,cpm_total,cpm_proxy,cpm_thparty,cpm_disembark,cpm_benefit,cpm_questotal,           "    
	     	+" cpm_anonymous,cpm_falsecard,cpm_failurecard,cpm_suspects,cpm_othercase,idm_total,idm_proxy,idm_thparty,idm_residents,idm_resiproxy,idm_nonresidents,   "
	     	+" idm_nonresiproxy,idm_questotal,idm_anonymous,idm_falsecard,idm_failurecard,idm_otherscard,idm_suspects,idm_othercase,ciall_total)                      "           
	     	+" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",organkey,IDENTITYFLAG,sum(cpm_total),sum(cpm_proxy),sum(cpm_thparty),sum(cpm_disembark),sum(cpm_benefit),sum(cpm_questotal),                                    "
	     	+" sum(cpm_anonymous),sum(cpm_falsecard),sum(cpm_failurecard),sum(cpm_suspects),sum(cpm_othercase),sum(idm_total),sum(idm_proxy),sum(idm_thparty),sum(idm_residents),sum(idm_resiproxy),sum(idm_nonresidents),   "
	     	+" sum(idm_nonresiproxy),sum(idm_questotal),sum(idm_anonymous),sum(idm_falsecard),sum(idm_failurecard),sum(idm_otherscard),sum(idm_suspects),sum(idm_othercase),sum(ciall_total)                      "
	     	+" FROM t07_user_identity_d C                                                                                                                           "
	     	+" WHERE C.statisticdate>="+func.vch2dt(befredate, "yyyy-mm-dd")+" and C.statisticdate<="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     	+" GROUP BY ORGANKEY,IDENTITYFLAG ";
	    int count = SQLExecute.exeSql(conn, sql);
	     	  return count;
	  	}
	     public int insert_T10_PARTY_CRETAL_D(Connection conn,String statisticdate)throws Exception{
	     	 //ɾ��3������ǰ������
	    	 String befredate=DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -3);
	    	 System.out.println("befredate:::"+befredate);
	    	String delsql=" delete from T10_PARTY_CRETAL_D where STATISTIC_DT<="+func.vch2dt(befredate, "yyyy-mm-dd");
	    	int   count = SQLExecute.exeSql(conn, delsql);
	    
	     String  sql= " INSERT INTO T10_PARTY_CRETAL_D(STATISTIC_DT,ORGANKEY,CHECK_TYPE,PARTY_ID,QUERY_COUNT,KY_COUNT)"
	     +" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+", A.CHECKER_ORG,A.CHECK_TYPE,A.PARTY_ID,                             "
	     +" SUM(CASE WHEN A.CREDIT_FLAG='1' THEN 1 ELSE 0 END) AS QUERY_COUNT,                            "
	     +" COUNT(B.PARTYRISK_NO) AS KY_COUNT                                                    "
	     +" FROM  T10_CHECKPARTY_RELT A LEFT JOIN  T10_PARTY_RISK B                                       "
	     +" ON (A.PARTY_ID=B.PARTY_ID AND B.CREATE_DT=A.CHECK_DT)                                         "
	     +" WHERE A.CHECK_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     +" GROUP BY A.CHECKER_ORG,A.CHECK_TYPE,A.PARTY_ID                                                ";
	     
	     count = SQLExecute.exeSql(conn, sql);
	     
	     	  return count;
	  	}
	     
	     
	     public int insert_T10_PARTY_CRETAL(Connection conn,String statisticdate,String granularity)throws Exception{
	     	
	    	// String befredate=DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -1);
	    	 String befredate=du.getBeginDate(granularity, statisticdate);	
	    	 System.out.println("befredate:::"+befredate);
	    
	     String  sql= " INSERT INTO T10_PARTY_CRETAL(STATISTIC_DT,ORGANKEY,QUERYCOUNT_N,PARTYCOUNT_N,ACCTCOUNT_N,KYCOUNT_N,QUERYCOUNT_R,PARTYCOUNT_R,ACCTCOUNT_R,KYCOUNT_R,STATUS_CD)"
	    	  +" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",T1.ORGANKEY,T1.QUERYCOUNT_N,T1.PARTYCOUNT_N,T2.ACCTCOUNT_N,T1.KYCOUNT_N,T1.QUERYCOUNT_R,T1.PARTYCOUNT_R,T2.ACCTCOUNT_R,T1.KYCOUNT_R,'1'"
	    	  +" FROM(SELECT A.ORGANKEY,                                                                                                                "
	    	  +" SUM(CASE WHEN A.CHECK_TYPE='1' THEN A.QUERY_COUNT ELSE 0 END) AS QUERYCOUNT_N,                                                                                     "
	    	  +" COUNT(DISTINCT CASE WHEN A.CHECK_TYPE='1' THEN A.PARTY_ID ELSE NULL END) AS PARTYCOUNT_N,                                                                          "                                                                      
	    	  +" SUM(CASE WHEN A.CHECK_TYPE='1' THEN A.KY_COUNT ELSE 0 END) AS KYCOUNT_N,                                                                                        "
	    	  +" SUM(CASE WHEN A.CHECK_TYPE IN('2','5') THEN A.QUERY_COUNT ELSE 0 END) AS QUERYCOUNT_R,                                                                             "
	    	  +" COUNT(DISTINCT CASE WHEN A.CHECK_TYPE  IN('2','5') THEN A.PARTY_ID ELSE NULL END) AS PARTYCOUNT_R,                                                                 "
	    	  +" SUM(CASE WHEN A.CHECK_TYPE  IN('2','5') THEN A.KY_COUNT ELSE 0 END)  AS KYCOUNT_R                                                                               "
	    	  +" FROM T10_PARTY_CRETAL_D A  WHERE  A.STATISTIC_DT>= "+func.vch2dt(befredate, "yyyy-mm-dd")+" and A.STATISTIC_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd")                                                                                                                               
	    	  +" GROUP BY A.ORGANKEY )T1  ,(select c.organkey, count(DISTINCT CASE WHEN C.CHECK_TYPE='1' THEN D.ACCT_NUM ELSE NULL END) as ACCTCOUNT_N," +
	    	  		"      count(DISTINCT CASE WHEN C.CHECK_TYPE IN('2','5') THEN D.ACCT_NUM ELSE NULL END) as ACCTCOUNT_R   from T47_CP_DEPOSIT d , T10_PARTY_CRETAL_D c                                                                                                      "
	    	                                 +" where c.PARTY_ID=d.PARTY_ID  and   c.STATISTIC_DT>= "+func.vch2dt(befredate, "yyyy-mm-dd")+" and c.STATISTIC_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd")                                                                                                                  
	    	  +"  GROUP BY c.organkey ) T2  WHERE T1.ORGANKEY=T2.ORGANKEY                                                                                                                             ";
	     
	     int count = SQLExecute.exeSql(conn, sql);
	     
	     	  return count;
	  	}
	     
	     public int insert_T07_USER_REIDENTITY_D(Connection conn,String statisticdate)throws Exception{
	     	 //ɾ��6������ǰ������
	    	
	    	 String befredate=DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -6);
	    	 System.out.println("befredate:::"+befredate);
	    	String delsql=" delete from T07_USER_REIDENTITY_D where STATISTICDATE<="+func.vch2dt(befredate, "yyyy-mm-dd");
	    	int   count = SQLExecute.exeSql(conn, delsql);
	    	
	    	delsql=func.deleteTable("T07_USER_REIDENTITY_MID");
	    	count = SQLExecute.exeSql(conn, delsql);
	    	
	    	//������ʶ����ĶԹ���˽����
	    	String sql= "  INSERT INTO T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                     " 
	 	   +"   SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED)                           "                                                             
		   +"   SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+", a.CREATE_ORG,CASE WHEN A.PARTY_CLASS_CD='C' THEN '1' ELSE '3' END AS REIDENTITYFLAG,                   "
		   +"    COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F07' THEN a.PARTY_ID ELSE NULL END)) AS  CHANGEINFO,                                      "
		   +"    COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F08' THEN a.PARTY_ID ELSE NULL END)) AS  BEHAVIOR,                                        "
		   +"    COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F06' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPECTS,                                        "
		   +"    COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F09' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPICIOUS,                                      "
		   +"    COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F10' THEN a.PARTY_ID ELSE NULL END)) AS  OTHERCASE,                                       "
		   +"    COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F07' THEN B.PARTY_ID ELSE NULL END)) AS  INFO_VERIFIED,                                   "
		   +"    COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F08' THEN B.PARTY_ID ELSE NULL END)) AS  BEHA_VERIFIED,                                   "
		   +"    COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F06' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPE_VERIFIED,                                  "
		   +"    COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F09' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPI_VERIFIED,                                  "
		   +"    COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F10' THEN B.PARTY_ID ELSE NULL END)) AS  OTHER_VERIFIED                                   "
		   +"   FROM T10_CHECK_PARTY_REASON a LEFT JOIN T10_PARTY_RISK B   ON (a.PARTY_ID=B.PARTY_ID and a.create_dt=b.create_dt)"                                                                             
		   +"   WHERE a.CHECK_TYPE IN('2','5') AND a.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
		   +"   GROUP BY a.CREATE_ORG,PARTY_CLASS_CD                                                                                              ";
	    	count = SQLExecute.exeSql(conn, sql);
	     	  //��˽����Ǿ�����
	     	sql= "   INSERT INTO T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                  " 
	    	+"      SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED)                      "                                                                
	     	+"	 SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+", a.CREATE_ORG,CASE WHEN A.AML1_TYPE_CD='01' THEN '4' ELSE '5' END AS REIDENTITYFLAG,                  "
	     	+"	  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F07' THEN a.PARTY_ID ELSE NULL END)) AS  CHANGEINFO,                                    "
	     	+"	  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F08' THEN a.PARTY_ID ELSE NULL END)) AS  BEHAVIOR,                                      "
	     	+"	  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F06' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPECTS,                                      "
	     	+"	  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F09' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPICIOUS,                                    "
	     	+"	  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F10' THEN a.PARTY_ID ELSE NULL END)) AS  OTHERCASE ,                                    "
	     	+"	  COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F07' THEN B.PARTY_ID ELSE NULL END)) AS  INFO_VERIFIED,                                 "
	    	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F08' THEN B.PARTY_ID ELSE NULL END)) AS  BEHA_VERIFIED,                              "
	    	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F06' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPE_VERIFIED,                             "
	    	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F09' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPI_VERIFIED,                             "
	    	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F10' THEN B.PARTY_ID ELSE NULL END)) AS  OTHER_VERIFIED                              "
	     	+"	                                                                                                                                 "
	     	+"	 FROM T10_CHECK_PARTY_REASON a LEFT JOIN T10_PARTY_RISK B   ON (a.PARTY_ID=B.PARTY_ID and a.create_dt=b.create_dt)    "                                                                                                              
	     	+"	 WHERE a.CHECK_TYPE IN('2','5') AND a.PARTY_CLASS_CD='I' AND a.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     	+"	  GROUP BY a.CREATE_ORG,A.AML1_TYPE_CD                                                                                           ";
	     	count = SQLExecute.exeSql(conn, sql);
	     	
	     	//�Թ��漰��������
	     sql= "   INSERT INTO T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                  " 
	         +"      SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED)                      "                                                                
	         +"  SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",a.CREATE_ORG,'2' AS REIDENTITYFLAG,                                                        "
	    	 +"  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F07' THEN a.PARTY_ID ELSE NULL END)) AS  CHANGEINFO,                          "
	    	 +"  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F08' THEN a.PARTY_ID ELSE NULL END)) AS  BEHAVIOR,                            "
	    	 +"  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F06' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPECTS,                            "
	    	 +"  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F09' THEN a.PARTY_ID ELSE NULL END)) AS  SUSPICIOUS,                          "
	    	 +"  COUNT(DISTINCT (CASE WHEN a.RISK_TYPE='F10' THEN a.PARTY_ID ELSE NULL END)) AS  OTHERCASE,                           "
	    	 +"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F07' THEN B.PARTY_ID ELSE NULL END)) AS  INFO_VERIFIED,                              "
	    	 +"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F08' THEN B.PARTY_ID ELSE NULL END)) AS  BEHA_VERIFIED,                              "
	     	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F06' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPE_VERIFIED,                             "
	     	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F09' THEN B.PARTY_ID ELSE NULL END)) AS  SUSPI_VERIFIED,                             "
	     	+"       COUNT(DISTINCT (CASE WHEN B.RISK_TYPE='F10' THEN B.PARTY_ID ELSE NULL END)) AS  OTHER_VERIFIED                              "
	      	+"	                                                                                                                                 "
	      	+"	 FROM T10_CHECK_PARTY_REASON a LEFT JOIN T10_PARTY_RISK B   ON (a.PARTY_ID=B.PARTY_ID and a.create_dt=b.create_dt)    "                                                                                                              
	     
	    	 +" WHERE a.CHECK_TYPE IN('2','5') AND a.PARTY_CLASS_CD='C' AND A.IS_RELALEDER='1'                                        "
	    	 +"  AND a.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    	 +" GROUP BY a.CREATE_ORG                                                                                                 ";
	     	  
	     count = SQLExecute.exeSql(conn, sql);
	     
	     sql="insert  into T07_USER_REIDENTITY_MID(STATISTICDATE,organkey,REIDENTITYFLAG)select "+func.vch2dt(statisticdate, "yyyy-mm-dd")
	      +",organkey,'1' from t00_organ a where not exists(select 'x' from "
	    	 +" T07_USER_REIDENTITY_MID b where b.organkey=a.organkey and b.REIDENTITYFLAG='1')";
	     count = SQLExecute.exeSql(conn, sql);
	     
	     sql="insert  into T07_USER_REIDENTITY_MID(STATISTICDATE,organkey,REIDENTITYFLAG)select "+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     +",organkey,'3' from t00_organ a where not exists(select 'x' from "
	   	 +" T07_USER_REIDENTITY_MID b where b.organkey=a.organkey and b.REIDENTITYFLAG='3')";
	     
	    count = SQLExecute.exeSql(conn, sql);
	    sql="insert  into T07_USER_REIDENTITY_MID(STATISTICDATE,organkey,REIDENTITYFLAG)select "+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    +",organkey,'4' from t00_organ a where not exists(select 'x' from "
	  	 +" T07_USER_REIDENTITY_MID b where b.organkey=a.organkey and b.REIDENTITYFLAG='4')";
	   count = SQLExecute.exeSql(conn, sql);
	   sql="insert  into T07_USER_REIDENTITY_MID(STATISTICDATE,organkey,REIDENTITYFLAG)select "+func.vch2dt(statisticdate, "yyyy-mm-dd")
	   +",organkey,'5' from t00_organ a where not exists(select 'x' from "
	 	 +" T07_USER_REIDENTITY_MID b where b.organkey=a.organkey and b.REIDENTITYFLAG='5')";
	  count = SQLExecute.exeSql(conn, sql);
	   
	      //�޸ĶԹ���˽����֤��ʧЧ 
	     sql= " UPDATE T07_USER_REIDENTITY_MID D SET FAILURECARD=(SELECT  C.FAILURECARD FROM(                                            "
	     +" SELECT B.ORGANKEY,CASE WHEN B.PARTY_CLASS_CD='C' THEN '1' ELSE '3' END AS REIDENTITYFLAG,COUNT(B.PARTY_ID) AS FAILURECARD    "
	     +" FROM T10_CHECKPARTY_RE B                                                                                                     "
	     +" WHERE B.RECHECK_TYPE='2' AND B.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	     +" GROUP BY B.ORGANKEY,B.PARTY_CLASS_CD) C WHERE C.ORGANKEY=D.ORGANKEY                                                          "
	     +" AND C.REIDENTITYFLAG=D.REIDENTITYFLAG) WHERE D.REIDENTITYFLAG IN('1','3')"  ;
	     count = SQLExecute.exeSql(conn, sql);
	     
	     //�޸�˽����Ǿ�������֤��ʧЧ
	     sql="  UPDATE T07_USER_REIDENTITY_MID D SET FAILURECARD=(SELECT  C.FAILURECARD FROM(                                               "
	    	 +" SELECT B.ORGANKEY,CASE WHEN B.AML1_TYPE_CD='01' THEN '4' ELSE '5' END AS REIDENTITYFLAG,COUNT(B.PARTY_ID) AS FAILURECARD     "
	    	 +" FROM T10_CHECKPARTY_RE B                                                                                                     "
	    	 +" WHERE B.RECHECK_TYPE='2' AND B.PARTY_CLASS_CD='I' AND B.CREATE_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    	 +" GROUP BY B.ORGANKEY,B.AML1_TYPE_CD) C WHERE C.ORGANKEY=D.ORGANKEY                                                            "
	    	 +" AND C.REIDENTITYFLAG=D.REIDENTITYFLAG)                                                                                   "
	    	 +" WHERE D.REIDENTITYFLAG IN('4','5')"  ;
	     
	     count = SQLExecute.exeSql(conn, sql);
	     
	     sql=" INSERT INTO T07_USER_REIDENTITY_D(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                  " 
	         +"      SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED,FAILURECARD)     "
			 +" SELECT STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                  " 
	         +"  SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED,FAILURECARD " 
	         + " FROM   T07_USER_REIDENTITY_MID                                           ";
	     
	     count = SQLExecute.exeSql(conn, sql);
	     
	     	  return count;
	  	}
	     
	     public int insert_T07_USER_REIDENTITY_M(Connection conn,String statisticdate,String granularity)throws Exception{
	  
	    	 String befredate=du.getEndDate(granularity,DateUtils.getDateChangeTime2(statisticdate+" 00:00:00", "m", -3));
	    	 int count =0;	
	    	String month=statisticdate.substring(5, 7);
	    	 System.out.println("month:::"+month);
	     if(month.equals("03")||month.equals("06")||month.equals("09")||month.equals("12")){
	    String sql=" INSERT INTO T07_USER_REIDENTITY_M(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,CHANGEINFO,BEHAVIOR,                                  " 
	             +"      SUSPECTS,SUSPICIOUS,OTHERCASE,INFO_VERIFIED,BEHA_VERIFIED,SUSPE_VERIFIED,SUSPI_VERIFIED,OTHER_VERIFIED,FAILURECARD,TOTAL,TOTAL_VERIFIED)     "
	    		 +" SELECT "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",ORGANKEY,REIDENTITYFLAG,SUM(CHANGEINFO),SUM(BEHAVIOR),                                  " 
	             +"  SUM(SUSPECTS),SUM(SUSPICIOUS),SUM(OTHERCASE),SUM(INFO_VERIFIED),SUM(BEHA_VERIFIED),SUM(SUSPE_VERIFIED),SUM(SUSPI_VERIFIED),"
	             +" SUM(OTHER_VERIFIED),SUM(FAILURECARD),SUM(CHANGEINFO+BEHAVIOR+SUSPECTS+SUSPICIOUS+OTHERCASE),SUM(INFO_VERIFIED+BEHA_VERIFIED+SUSPE_VERIFIED+SUSPI_VERIFIED+OTHER_VERIFIED)" 
	             + " FROM   T07_USER_REIDENTITY_D  c                                         "  
			 +" WHERE C.statisticdate> "+func.vch2dt(befredate, "yyyy-mm-dd")+" and C.statisticdate<="+func.vch2dt(statisticdate, "yyyy-mm-dd")
			 +" GROUP BY ORGANKEY,REIDENTITYFLAG ";
	      count = SQLExecute.exeSql(conn, sql);
	      
	      sql=func.deleteTable("T07_USER_REIDENTITY_MID");
	      count = SQLExecute.exeSql(conn, sql);
	      
	      sql="insert into T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,UPDATECARD)"
	    	  +"select "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",B.ORGANKEY,CASE WHEN B.AML1_TYPE_CD='01' THEN '4' ELSE '5' END AS FLAG,                       "
	    	  +"  count(0) AS UPDATENUM FROM t47_individual a,T47_PARTY b WHERE a.PARTY_ID=b.PARTY_ID                 "
	    	  +"  AND b.PARTY_CLASS_CD='I' AND  a.CARD_END_DT> "+func.vch2dt(befredate, "yyyy-mm-dd")
	    	  +"  AND a.CARD_END_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    	  +"  GROUP BY b.organkey,B.AML1_TYPE_CD";
	      
	      count = SQLExecute.exeSql(conn, sql);
	      
	      //��˽����Ǿ���֤��ʧЧ�Ѹ�����
	      sql=" UPDATE T07_USER_REIDENTITY_M D SET UPDATECARD=( SELECT D.UPDATECARD-C.UPDATECARD FROM                      "  
	    	  +" T07_USER_REIDENTITY_MID C WHERE C.ORGANKEY=D.ORGANKEY AND C.REIDENTITYFLAG=D.REIDENTITYFLAG)       "
	    	  +"  WHERE D.REIDENTITYFLAG IN('4','5') AND D.STATISTICDATE="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	      count = SQLExecute.exeSql(conn, sql);
	      
	      
	      sql=func.deleteTable("T07_USER_REIDENTITY_MID");
	      count = SQLExecute.exeSql(conn, sql);
	      
	      sql="insert into T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,UPDATECARD)"
	    	  +"select "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",B.ORGANKEY, '3'  AS FLAG,                       "
	    	  +"  count(0) AS UPDATENUM FROM t47_individual a,T47_PARTY b WHERE a.PARTY_ID=b.PARTY_ID                 "
	    	  +"  AND b.PARTY_CLASS_CD='I' AND  a.CARD_END_DT> "+func.vch2dt(befredate, "yyyy-mm-dd")
	    	  +"  AND a.CARD_END_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    	  +"  GROUP BY b.organkey";
	      
	      count = SQLExecute.exeSql(conn, sql);
	      
	      //��˽֤��ʧЧ�Ѹ�����
	      sql=" UPDATE T07_USER_REIDENTITY_M D SET UPDATECARD=( SELECT D.UPDATECARD-C.UPDATECARD FROM                             "  
	    	  +" T07_USER_REIDENTITY_MID C WHERE C.ORGANKEY=D.ORGANKEY AND C.REIDENTITYFLAG=D.REIDENTITYFLAG)       "
	    	  +"  WHERE D.REIDENTITYFLAG IN('3') AND D.STATISTICDATE="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	      count = SQLExecute.exeSql(conn, sql);
	      
	      
	      sql=func.deleteTable("T07_USER_REIDENTITY_MID");
	      count = SQLExecute.exeSql(conn, sql);
	      
	      sql="insert into T07_USER_REIDENTITY_MID(STATISTICDATE,ORGANKEY,REIDENTITYFLAG,UPDATECARD)"
	    	  +"select "+func.vch2dt(statisticdate, "yyyy-mm-dd")+",B.ORGANKEY, '1'  AS FLAG,                       "
	    	  +"  count(0) AS UPDATENUM FROM T47_CORPORATION a,T47_PARTY b WHERE a.PARTY_ID=b.PARTY_ID                 "
	    	  +"  AND b.PARTY_CLASS_CD='C' and b.organkey is not null AND  a.LICENCE_END_DT> "+func.vch2dt(befredate, "yyyy-mm-dd")
	    	  +"  AND a.LICENCE_END_DT<="+func.vch2dt(statisticdate, "yyyy-mm-dd")
	    	  +"  GROUP BY b.organkey";
	      
	      count = SQLExecute.exeSql(conn, sql);
	      
	      
	      //�Թ�֤��ʧЧ�Ѹ�����
	      sql=" UPDATE T07_USER_REIDENTITY_M D SET UPDATECARD=( SELECT D.UPDATECARD-C.UPDATECARD FROM                            "  
	    	  +"  T07_USER_REIDENTITY_MID C WHERE C.ORGANKEY=D.ORGANKEY AND C.REIDENTITYFLAG=D.REIDENTITYFLAG)       "
	    	  +"  WHERE D.REIDENTITYFLAG IN('1') AND D.STATISTICDATE="+func.vch2dt(statisticdate, "yyyy-mm-dd");
	      count = SQLExecute.exeSql(conn, sql);
	        
	     }
	     	  return count;
	  	}
     	   
       
}
