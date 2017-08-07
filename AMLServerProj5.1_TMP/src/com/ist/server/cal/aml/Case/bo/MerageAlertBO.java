package com.ist.server.cal.aml.Case.bo;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;


import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;

import com.ist.server.cal.aml.common.Constants;

public class MerageAlertBO {
	private static Logger logger = LogUtils.getLogger(MerageAlertBO.class.getName());
	private DBfunc func = DBfuncFactory.getDBInstance();
	public MerageAlertBO() {
	
	}
	
	public boolean deleteT07_case_transaction_temp(Connection conn,String alert_type) throws Exception {

		boolean isSucc = true;

		try {
			String sql=func.deleteTable("t07_case_transaction_"+alert_type+"_temp");
			//String sql="delete from t07_case_transaction_"+alert_type+"_temp";
			int count = SQLExecute.exeSql(conn, sql);
		} catch (Exception e) {
			isSucc = false;
			logger.error("删除t07_case_transaction_"+alert_type+"_temp表失败!");
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
//	public boolean deleteT07_case_transaction_temp1(Connection conn,String tablename,String statisticdate,String deltablename) throws Exception {
//
//		boolean isSucc = true;
//
//		try {
//			String sql="delete from "+deltablename+" b where exists( "
//			+"select 'x' from "+tablename+" a where a.alertkey=b.alertkey and a.alert_dt<="+func.vch2dt(statisticdate, "yyyy-mm-dd")+" and  a.ALERT_STATUS_CD='";
//			if(tablename.equals("t07_alert")){
//			 sql=sql+"0";	
//			}else{
//				sql=sql+"2";		
//			}
//			sql=sql+"')" ;
//			int count = SQLExecute.exeSql(conn, sql);
//		} catch (Exception e) {
//			isSucc = false;
//			e.printStackTrace();
//			throw e;
//		}
//		return isSucc;
//	}
	public boolean insertT07_case_transaction_temp(Connection conn,String alert_type,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			String currcd=",''";
			if(!curr_cd.equals("")){
				currcd=",a.curr_cd";
			}
			String sql="insert into t07_case_transaction_"+alert_type+"_temp(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,transactionkey,stcr,alert_dt,status_cd,trans_amt)"
			+" select  distinct a.alertkey,'1',a.objkey"+currcd+",a.objkey,a.alert_dt,'',a.objkey,b.transactionkey,a.pbckey,a.alert_dt,'0',0"
			+" from  t07_alert_trans_"+alert_type+" b,t07_alert_"+alert_type+" a"
			+" where a.alertkey=b.alertkey";
		
			sql=sql+" and a.APPLICATION_NUM='N' and a.objkey is not null"
			+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
			+" and not exists(select 'x' from T07_CASE_NET_ALERT c where c.alertkey=a.alertkey"
		    +"  and c.DATATYPE='1')";
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT27_case_transaction_temp(Connection conn,String alert_type,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			
			this.insertT27_MID_CASE_ALERT(conn, statisticdate, curr_cd, "1");	
			
			//isSucc=this.deleteMidTable(conn, "t07_case_transaction_"+alert_type+"_temp", "T27_MID_CASE_ALERT");
	         
			String sql="insert into t07_case_transaction_"+alert_type+"_temp(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,status_cd,trans_amt)"
			+" select  alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,alert_dt,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,'0',trans_amt"
			+" from T27_MID_CASE_ALERT  ";
			
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	
//	public boolean deleteMidTable(Connection conn,String tablename,String comtablename) throws Exception {
//
//		boolean isSucc = true;
//
//		try {
//			
//			
//	         String delsql="delete from "+tablename+" a where exists(select 'x' from "+comtablename+" b where a.alertkey=b.alertkey";
//				int count = SQLExecute.exeSql(conn, delsql);
//		
//		} catch (Exception e) {
//			
//			isSucc = false;
//			e.printStackTrace();
//			throw e;
//		}
//		return isSucc;
//	}
	
	public boolean insertT07_MALERTTRAN_KY_TEMP(Connection conn,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
		
			this.insertT27_MID_CASE_ALERT(conn, statisticdate, curr_cd, "2");	
			
		
		String sql="insert into T07_MALERTTRAN_KY_TEMP(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,status_cd,trans_amt)"
			+" select alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,alert_dt,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,'0',trans_amt "
			+" from T27_MID_CASE_ALERT  ";
			
		int  count = SQLExecute.exeSql(conn, sql); 
				
		  //插入客户账户表
		 
//			    sql="insert into T07_MALERTACCT_KY_TEMP(alertkey,PARTY_ID,ACCT_NUM,STATISTIC_DT,STATUS_CD)"
//						+" select  distinct  a.alertkey,a.party_id,a.acct_num,a.alert_dt,'0'"
//						+" from  T27_MID_CASE_ALERT a  ";
//					
//			  count = SQLExecute.exeSql(conn, sql); 
//				 
				 
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean insertT27_MID_CASE_ALERT(Connection conn,String statisticdate,String curr_cd,String type) throws Exception {

		boolean isSucc = true;

		try {
			String delsql=func.deleteTable("T27_MID_CASE_ALERT");
			int   count = SQLExecute.exeSql(conn, delsql);
			String currcd=",''";
			if(!curr_cd.equals("")){
				currcd=",a.curr_cd";
			}
			String sql="insert into T27_MID_CASE_ALERT(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,trans_amt)"
			+" select   a.alertkey,'2',a.objkey"+currcd+",a.party_id,'',b.party_id,b.acct_num,b.transactionkey,a.pbckey,a.alert_dt,b.trans_amt"
			+" from  t27_alert_trans  b,t27_alert a"
			+" where a.alertkey=b.alertkey"
			+" and a.ALERTTYPE='2' and a.ALERT_STATUS_CD='2' ";
			if(type.equals("1")){
				sql=sql+" and a.PBCKEYTYPE  in("+Constants.pbckeytype+")";
			}else{
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d where c.MODULE_NO=d.MODULE_NO"
			         +" and d.MODULE_GREY='1' and c.STCR_TYPE='1')";
			}
			sql=sql+"  and a.party_id is not null"
			+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" and  not exists(select 'x' from T07_CASE_NET_ALERT c where c.alertkey=a.alertkey"
		    +"  and c.DATATYPE='"+type+"')";
			
			count = SQLExecute.exeSql(conn, sql);
			 
			
			 sql="insert into T27_MID_CASE_ALERT(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,organkey,party_id,acct_num,stcr,alert_dt,trans_amt)"
				+" select   a.alertkey,'2',a.objkey"+currcd+",a.party_id,'N',b.party_id,b.acct_num,a.pbckey,a.alert_dt,0"
				+" from  t27_alert_acct  b,t27_alert a"
				+" where a.alertkey=b.alertkey"
				+" and a.ALERTTYPE='2' and a.ALERT_STATUS_CD='2'  ";
			if(type.equals("1")){
				sql=sql+" and a.PBCKEYTYPE  in("+Constants.pbckeytype+")";
			}else{
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d where c.MODULE_NO=d.MODULE_NO"
			         +" and d.MODULE_GREY='1' and c.STCR_TYPE='1')";
			}
			
				sql=sql+"  and a.party_id is not null"
				 +"  AND  NOT exists(SELECT 'X' FROM T27_MID_CASE_ALERT F WHERE F.alertkey=b.alertkey and  F.ACCT_NUM=B.ACCT_NUM)"
				+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
				+" and not exists(select 'x' from T07_CASE_NET_ALERT c where c.alertkey=a.alertkey"
		    +"  and c.DATATYPE='"+type+"')";
				 count = SQLExecute.exeSql(conn, sql);
			
				 sql="insert into T27_MID_CASE_ALERT(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,organkey,party_id,stcr,alert_dt,trans_amt)"
						+" select   a.alertkey,'2',a.objkey"+currcd+",a.party_id,'N',b.party_id,a.pbckey,a.alert_dt,0"
						+" from  t27_alert_party  b,t27_alert a"
						+" where a.alertkey=b.alertkey"
						+" and a.ALERTTYPE='2' and a.ALERT_STATUS_CD='2' ";
			if(type.equals("1")){
				sql=sql+" and a.PBCKEYTYPE  in("+Constants.pbckeytype+")";
			}else{
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d where c.MODULE_NO=d.MODULE_NO"
			         +" and d.MODULE_GREY='1' and c.STCR_TYPE='1')";
			}
				
						sql=sql+"  and a.party_id is not null"
						 +"  AND  NOT exists(SELECT 'X' FROM T27_MID_CASE_ALERT F WHERE   F.alertkey=b.alertkey and F.party_id=B.party_id)"
						+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
					+" and not exists(select 'x' from T07_CASE_NET_ALERT c where c.alertkey=a.alertkey"
		            +"  and c.DATATYPE='"+type+"')";
						 count = SQLExecute.exeSql(conn, sql);
				
			
		
				 
				 
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_case_transaction_temp1(Connection conn,String alert_type,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into t07_case_transaction_"+alert_type+"_temp(alertkey,STATISTIC_DT,organkey,party_id,transactionkey,stcr,alert_dt,curr_cd,status_cd)"
			+" select distinct a.alertkey,a.alert_dt, a.organkey,a.objkey,b.transactionkey,c.stcr,c.alert_dt,a.curr_cd,'0'"
			+" from  t07_alert_trans_"+alert_type+" b,t07_alert_"+alert_type+" a,t07_mid_case_trans_"+alert_type+"_temp c"
			+" where a.alertkey=b.alertkey"
			+" and a.pbckey=c.stcr and c.party_id=a.objkey and c.organkey=a.organkey "
			+" and a.APPLICATION_NUM='N' and a.objkey is not null"
			+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_mid_case_transaction_temp(Connection conn,String alert_type,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into t07_mid_case_trans_"+alert_type+"_temp(organkey,party_id,stcr,alert_dt,curr_cd,status_cd)"
			+" select '',c.objkey,c.pbckey,c.maxdt";
			if(!curr_cd.equals("")){
				sql=sql+",c.curr_cd";
			}else{
				sql=sql+curr_cd;
			}
			sql=sql+",'0'  from (select  a.objkey,a.pbckey"+curr_cd+",max(a.alert_dt) as maxdt from  t07_alert_"+alert_type+" a"
			+" where a.APPLICATION_NUM='N' and a.objkey is not null"
			+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
			+" group by a.objkey,a.pbckey"+curr_cd;
			sql=sql+" union select  a.party_id as objkey,a.pbckey"+curr_cd+",max(a.alert_dt) as maxdt from t27_alert a where a.application_num='N' and a.party_id is not null "
			+" and a.ALERTTYPE='2' and a.ALERT_STATUS_CD='2'  and a.PBCKEYTYPE in("+Constants.pbckeytype+") "
			+" and a.alert_dt< "+func.vch2dt(statisticdate, "yyyy-mm-dd")
			+" group by a.party_id,a.pbckey "+curr_cd;
			sql=sql+") c";
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean deleteT07_case_transaction_ky_temp(Connection conn,String alert_type,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql="delete from  t07_case_transaction_"+alert_type+"_temp c"
			+" where exists (select 'X' from  t07_alert_trans_"+alert_type+" b,t07_alert_"+alert_type+" a,t07_pbcrule d"
		                  +" where   b.transactionkey=c.transactionkey and a.objkey=c.party_id and d.stcrkey=c.stcr   "
			              +"    and b.alertkey=a.alertkey"
			              +"  and d.pbckey=a.pbckey"
			              +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd")
			              +"  )";
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("删除t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_case_transaction_tempD(Connection conn,String alert_type,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into t07_case_transaction_"+alert_type+"_temp(organkey,party_id,transactionkey,stcr,alert_dt,status_cd)"
			+" select distinct a.organkey,a.objkey,b.transactionkey,a.pbckey,a.alert_dt,'0'"
			+" from  t07_alert_trans_"+alert_type+" b,t07_alert_"+alert_type+" a "
			+" where b.alertkey=a.alertkey"
			    +"    and a.objkey is not null and a.organkey is not null "
			    +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_case_transaction_tempD1(Connection conn,String alert_type,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into t07_case_transaction_"+alert_type+"_temp(alertkey,organkey,party_id,transactionkey,stcr,alert_dt,curr_cd,status_cd,acct_num,trans_amt)"
			+" select a.alertkey ,a.organkey,a.objkey,b.transactionkey,a.pbckey,a.alert_dt"+curr_cd+",'0',c.acct_num,0"
			+" from  t07_alert_trans_"+alert_type+" b,t07_alert_"+alert_type+" a,t47_transaction_d c"
			+" where b.alertkey=a.alertkey and b.transactionkey=c.transactionkey "
			    +"    and a.objkey is not null "
			    +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd")
			+" union select a.alertkey, a.organkey,a.party_id,b.transactionkey,a.pbckey,a.alert_dt"+curr_cd+",'0',b.acct_num,b.trans_amt"
			+" from  t27_alert_trans b,t27_alert  a"
			+" where b.alertkey=a.alertkey"
			    +"    and a.objkey is not null  and a.alerttype='1' and a.ALERT_STATUS_CD='2'"
			    +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_"+alert_type+"_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_case_transaction_tempK1(Connection conn,String statisticdate,String tablename,String fromtablename) throws Exception {

		boolean isSucc = true;

		try {
			String delsql="delete from "+tablename+" where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int count1 = SQLExecute.exeSql(conn, delsql);
			
			String sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,status_cd,trans_amt)"
			+" select  alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,acct_num,transactionkey,stcr,alert_dt,status_cd,trans_amt"
			+" from  "+fromtablename+" a";	
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_ky_temp表记录"+count+"个");
			
//			if(tablename.equals("T07_MALERTTRAN_KY_TEMP")){
//				delsql="delete from T07_MALERTACCT_KY_TEMP where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");
//				 count1 = SQLExecute.exeSql(conn, delsql);
//				    sql="insert into T07_MALERTACCT_KY_TEMP(alertkey,PARTY_ID,ACCT_NUM,STATISTIC_DT,STATUS_CD)"
//					    +" select  distinct a.alertkey,a.party_id,a.acct_num,a.alert_dt,'0'"
//						+" from  T07_MID_TRANSACTION_KY_TEMP a  ";
//                   count = SQLExecute.exeSql(conn, sql); 
//				 
//			}
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean  delT07_MALERTTRAN_KY_TEMP1(Connection conn) throws Exception {

		boolean isSucc = true;

		try {
			String delsql="delete from T07_MID_TRANSACTION_KY_TEMP1 a where exists(select 'x' from T07_MALERTTRAN_KY_TEMP b where b.objparty_id=a.objparty_id)";
			int count1 = SQLExecute.exeSql(conn, delsql);
			
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT07_MID_TRANSACTION_KY_TEMP(Connection conn,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into T07_MID_TRANSACTION_KY_TEMP(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,transactionkey,stcr,alert_dt,status_cd,trans_amt )";
	
			sql=sql+" select  distinct a.alertkey,'2',a.objkey"+curr_cd+",a.objkey,a.alert_dt,'',a.objkey,b.transactionkey,a.pbckey,a.alert_dt,'0',0"
			+" from  t07_alert_trans_ky b,t07_alert_ky a"
			+" where b.alertkey=a.alertkey"
			    +"   and a.objkey is not null "
			    +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_ky_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean insertT07_MALERTTRAN_KY_TEMP1(Connection conn,String statisticdate,String curr_cd) throws Exception {

		boolean isSucc = true;

		try {
			String sql="insert into T07_MID_TRANSACTION_KY_TEMP(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt )";
	
			sql=sql+" select  distinct a.alertkey,'1',a.objkey"+curr_cd+",a.objkey,a.alert_dt,'',a.objkey,'N',b.transactionkey,a.pbckey,a.alert_dt,'0',0"
			+" from  t07_alert_trans_ky b,t07_alert_ky a"
			+" where b.alertkey=a.alertkey"
			    +"   and a.objkey is not null "
			    +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_ky_temp表记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean insertT27_MID_TRANSACTION_KY_TEMP(Connection conn,String statisticdate,String curr_cd,String type,String tablename) throws Exception {

		boolean isSucc = true;

		try {
			
			
			String sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt )";
	
			sql=sql+" select   a.alertkey,a.ALERTTYPE,a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,b.transactionkey,a.pbckey,a.alert_dt,'0',b.trans_amt"
			+" from  t27_alert_trans b,t27_alert a"
			+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
			if(type.equals("1")){//单独生成案例的
				sql=sql+" and a.PBCKEYTYPE in("+Constants.pbckeytype+")"
				 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			}
			if(type.equals("2")){//单主体模型第1层的
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
					+" and c.keystcr=e.pbckey and d.MODULE_GREY='1' and c.STCR_TYPE='1' and e.pbctype='1' )"
					 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			}
			
//			if(type.equals("4")){//多主体模型第二层属性
//				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
//					+" and c.keystcr=e.pbckey and d.MODULE_GREY='2' and c.STCR_TYPE='1' and e.pbctype='2' and e.SUXFLAG='1' )";
//			}
			   sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'";
			   
			  int   count = SQLExecute.exeSql(conn, sql);
				logger.info("插入t07_case_transaction_ky_temp表记录"+count+"个");
				
				sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,stcr,alert_dt,status_cd,trans_amt )";
				
				sql=sql+" select   a.alertkey,'2',a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,a.pbckey,a.alert_dt,'0',0"
				+" from  t27_alert_acct b,t27_alert a"
				+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
				if(type.equals("1")){//单独生成案例的
					sql=sql+" and a.PBCKEYTYPE in("+Constants.pbckeytype+")"
					 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
				}
				if(type.equals("2")){//单主体模型第1层的
					sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
						+" and c.keystcr=e.pbckey and d.MODULE_GREY='1' and c.STCR_TYPE='1' and e.pbctype='1' )"
						 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
				}
				
//				if(type.equals("4")){//多主体模型第二层属性
//					sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
//						+" and c.keystcr=e.pbckey and d.MODULE_GREY='2' and c.STCR_TYPE='1' and e.pbctype='2' and e.SUXFLAG='1' )";
//				}
				   sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'"
				   +"  AND  NOT exists(SELECT 'X' FROM T07_MID_TRANSACTION_KY_TEMP F WHERE F.alertkey=b.alertkey and F.ACCT_NUM=B.ACCT_NUM)";
				  
				    count = SQLExecute.exeSql(conn, sql);
				    
				    sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,stcr,alert_dt,status_cd,trans_amt )";
					
					sql=sql+" select   a.alertkey,'2',a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,a.pbckey,a.alert_dt,'0',0"
					+" from  t27_alert_party b,t27_alert a"
					+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
					if(type.equals("1")){//单独生成案例的
						sql=sql+" and a.PBCKEYTYPE in("+Constants.pbckeytype+")"
						 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
					}
					if(type.equals("2")){//单主体模型第1层的
						sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
							+" and c.keystcr=e.pbckey and d.MODULE_GREY='1' and c.STCR_TYPE='1' and e.pbctype='1' )"
							 +"  and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
					}
				
//					if(type.equals("4")){//多主体模型第二层属性
//						sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
//							+" and c.keystcr=e.pbckey and d.MODULE_GREY='2' and c.STCR_TYPE='1' and e.pbctype='2' and e.SUXFLAG='1' )";
//					}
					   sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'"
					   +"  AND  NOT exists(SELECT 'X' FROM T07_MID_TRANSACTION_KY_TEMP F WHERE  F.alertkey=b.alertkey and F.PARTY_ID=B.PARTY_ID)";
					    
					    count = SQLExecute.exeSql(conn, sql);
			
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean insertT27_MID_TRANS_KY_TEMP(Connection conn,String statisticdate,String curr_cd,String tablename,String befordate,String module_no) throws Exception {

		boolean isSucc = true;

		try {
			String sql=func.deleteTable(tablename);
			int count = SQLExecute.exeSql(conn, sql); 
			//当日有预警的客户
			sql=func.deleteTable("T27_MID_OBJ2");
			 count = SQLExecute.exeSql(conn, sql); 
			 sql="insert into T27_MID_OBJ2(objkey,rulekey) "
				 +" select distinct a.party_id,'KY'  from t27_alert_party a where exists(select 'x' from t21_rule b,t21_pbcrule c ,t23_module_stcr d"
                 +" where b.rulekey=a.rulekey and  b.pbckey=c.pbckey and b.pbckey=d.keystcr  and c.suxflag='0' and c.moduleflag='1' and c.pbctype='1' and d.module_no='"+module_no+"'"
                 +" ) and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			 count = SQLExecute.exeSql(conn, sql); 
			
			 sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt )";
	
			sql=sql+" select   a.alertkey,a.ALERTTYPE,a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,b.transactionkey,a.pbckey,a.alert_dt,'0',b.trans_amt"
			+" from  t27_alert_trans b,t27_alert a"
			+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
			
			 sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'";
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
					+" and c.keystcr=e.pbckey and d.MODULE_GREY='1'   and d.module_no='"+module_no+"' )"
					+" and exists(select 'x' from  T27_MID_OBJ2 c where c.objkey=b.party_id )"
					+" and a.alert_dt>="+func.vch2dt(befordate, "yyyy-mm-dd")
					+" and a.alert_dt<="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			   
			    count = SQLExecute.exeSql(conn, sql);
				logger.info("插入t07_case_transaction_ky_temp表记录"+count+"个");
				
				sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,stcr,alert_dt,status_cd,trans_amt )";
				
				sql=sql+" select   a.alertkey,'2',a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,a.pbckey,a.alert_dt,'0',0"
				+" from  t27_alert_acct b,t27_alert a"
				+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
				
				sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
				+" and c.keystcr=e.pbckey and d.MODULE_GREY='1'   and d.module_no='"+module_no+"' )"
				+" and exists(select 'x' from  T27_MID_OBJ2 c where c.objkey=b.party_id )"
				+" and a.alert_dt>="+func.vch2dt(befordate, "yyyy-mm-dd")
						+" and a.alert_dt<="+func.vch2dt(statisticdate, "yyyy-mm-dd");
				
				   sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'"
				   +"  AND  NOT exists(SELECT 'X' FROM "+tablename+" F WHERE F.alertkey=b.alertkey and F.ACCT_NUM=B.ACCT_NUM)";
				  
				    count = SQLExecute.exeSql(conn, sql);
				    
				    sql="insert into "+tablename+"(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,stcr,alert_dt,status_cd,trans_amt )";
					
					sql=sql+" select   a.alertkey,'2',a.objkey"+curr_cd+",a.party_id,a.alert_dt,'',b.party_id,a.pbckey,a.alert_dt,'0',0"
					+" from  t27_alert_party b,t27_alert a"
					+" where b.alertkey=a.alertkey and a.ALERTTYPE='2'";
					
				
					sql=sql+" and a.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
					+" and c.keystcr=e.pbckey and d.MODULE_GREY='1'   and d.module_no='"+module_no+"' )"
					+" and exists(select 'x' from  T27_MID_OBJ2 c where c.objkey=b.party_id )"
						+" and a.alert_dt>="+func.vch2dt(befordate, "yyyy-mm-dd")
							+" and a.alert_dt<="+func.vch2dt(statisticdate, "yyyy-mm-dd");
					
					   sql=sql +"   and a.party_id is not null and a.ALERT_STATUS_CD='2'"
					   +"  AND  NOT exists(SELECT 'X' FROM "+tablename+" F WHERE  F.alertkey=b.alertkey and F.PARTY_ID=B.PARTY_ID)";
					    
					    count = SQLExecute.exeSql(conn, sql);
			
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	/**3号令 增加 ，优化单主体的跑批 **/
	public boolean insertT27_MID_TRANS_KY_TEMP_NEW(Connection conn,String statisticdate,String curr_cd,String tablename,String befordate,String module_no) throws Exception {

		boolean isSucc = true;

		try {
			String sql = this.func.deleteTable(tablename);
			int count = SQLExecute.exeSql(conn, sql);

			sql = this.func.deleteTable("T27_MID_OBJ2");
			count = SQLExecute.exeSql(conn, sql);
			sql = this.func.deleteTable("T27_ALERT_NEWADDMID");
			count = SQLExecute.exeSql(conn, sql);//只塞选可疑，避免大额参与进来 3号令
			sql = this.func.deleteTable("T27_ALERT_TRANS_NEWADDMID");
			count = SQLExecute.exeSql(conn, sql);
			sql = this.func.deleteTable("T27_ALERT_ACCT_NEWADDMID");
			count = SQLExecute.exeSql(conn, sql);
			sql = this.func.deleteTable("T27_ALERT_PARTY_NEWADDMID");
			count = SQLExecute.exeSql(conn, sql);
			sql = "insert into T27_MID_OBJ2(objkey,rulekey)  select distinct a.party_id,'KY'  from t27_alert_party a where exists(select 'x' from t21_rule b,t21_pbcrule c ,t23_module_stcr d where b.rulekey=a.rulekey and  b.pbckey=c.pbckey and b.pbckey=d.keystcr  and c.suxflag='0' and c.moduleflag='1' and c.pbctype='1' and d.module_no='"
					+ module_no
					+ "'"
					+ " ) and a.alert_dt="
					+ this.func.vch2dt(statisticdate, "yyyy-mm-dd");
			count = SQLExecute.exeSql(conn, sql);
			//modify xb 拆分两张表T27_ALERT_NEWADDMID  T27_ALERT_TRANS_NEWADDMID
			sql = "INSERT INTO T27_ALERT_NEWADDMID(alertkey,alerttype,rulekey,pbckey,alert_dt,organkey,obj_type_cd,objname,alert_status_cd,trans_amt,trans_num,party_num,acct_num,invalidate_dt,dealadvise,deal_usr,deal_dt,create_dt,party_cd,curr_cd,application_num,party_id,objkey,pbckeytype)" +
					" select t.alertkey,t.alerttype,t.rulekey,t.pbckey,t.alert_dt,t.organkey,t.obj_type_cd,t.objname,t.alert_status_cd,t.trans_amt,t.trans_num,t.party_num,t.acct_num,t.invalidate_dt,t.dealadvise,t.deal_usr,t.deal_dt,t.create_dt,t.party_cd,t.curr_cd,t.application_num,t.party_id,t.objkey,t.pbckeytype" +
					" from t27_alert t" +
					" where t.PBCKEY in" +
					" (select KEYSTCR" +
					" from T23_MODULE_STCR c, T23_RULE_MODULE d, t21_pbcrule e" +
					"  where c.MODULE_NO = d.MODULE_NO" +
					" and c.keystcr = e.pbckey and d.MODULE_GREY = '1'  and d.module_no = '"
					+ module_no
					+ "') " +
					" and t.alert_dt >=" 
					+ this.func.vch2dt(befordate, "yyyy-mm-dd")
					+" and t.alert_dt <="
					+ this.func.vch2dt(statisticdate, "yyyy-mm-dd")
					+" and t.ALERTTYPE = '2' and t.party_id is not null and t.ALERT_STATUS_CD = '2'";
		
			count = SQLExecute.exeSql(conn, sql);
			conn.commit();
			sql = "INSERT into  T27_ALERT_TRANS_NEWADDMID( alertkey,rulekey,pbckey,pbckeytype,party_id,acct_num,transactionkey,application_num,alert_dt,status,trans_amt)" +
					" select t.alertkey,t.rulekey,t.pbckey,t.pbckeytype,t.party_id,t.acct_num,t.transactionkey,t.application_num,t.alert_dt,t.status,t.trans_amt" +
					" from t27_alert_trans t  where exists (select 'x' from T27_MID_OBJ2 c where c.objkey = t.party_id)" +
					" and t.alertkey is not null";
			conn.commit();
			count = SQLExecute.exeSql(conn, sql);
			
			
			//modify ldf 优化sql语句，缩小from后面数据表的结果集。 2016年11月30日18:26:43
			sql = "insert into "
					+ tablename
					+ "(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt )";

			sql = sql
					+ " select   a.alertkey,a.ALERTTYPE,a.objkey"
					+ curr_cd
					+ ",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,b.transactionkey,a.pbckey,a.alert_dt,'0',b.trans_amt"
					+ " from  T27_ALERT_NEWADDMID a ,  T27_ALERT_TRANS_NEWADDMID"
					+ " b where a.alertkey=b.alertkey ";
			conn.commit();
			count = SQLExecute.exeSql(conn, sql);
			logger.info("插入t07_case_transaction_ky_temp表记录" + count + "个");
			
			//modify ldf 优化sql语句，缩小from后面数据表的结果集。 2016年11月30日18:26:43
			sql = " insert into T27_ALERT_ACCT_NEWADDMID(alertkey,acct_num,status,party_id,rulekey,alert_dt)" +
			" select t.alertkey,t.acct_num,t.status,t.party_id,t.rulekey,t.alert_dt" +
			" from t27_alert_acct t where NOT exists (SELECT 'X' FROM "+tablename+" F" +
			" WHERE F.alertkey = t.alertkey  and F.ACCT_NUM = t.ACCT_NUM) and exists (select 'x'  from T27_MID_OBJ2 c where c.objkey = t.party_id)" +
			" and t.alertkey is not null";
			conn.commit();
			count = SQLExecute.exeSql(conn, sql);
			sql = "insert into "
					+ tablename
					+ "(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,stcr,alert_dt,status_cd,trans_amt )";

			sql = sql
					+ " select   a.alertkey,'2',a.objkey"
					+ curr_cd
					+ ",a.party_id,a.alert_dt,'',b.party_id,b.acct_num,a.pbckey,a.alert_dt,'0',0"
					+ " from  T27_ALERT_NEWADDMID a , T27_ALERT_ACCT_NEWADDMID b where a.alertkey=b.alertkey";
			conn.commit();
			count = SQLExecute.exeSql(conn, sql);
			
			sql = " insert into T27_ALERT_PARTY_NEWADDMID(alertkey,party_id,status,rulekey,alert_dt)" +
			" select t.alertkey,t.party_id,t.status,t.rulekey,t.alert_dt from t27_alert_party t" +
			" where NOT exists (SELECT 'X' FROM "+tablename+" F" +
			" WHERE F.alertkey = t.alertkey and F.PARTY_ID = t.PARTY_ID)" +
			" and exists (select 'x' from T27_MID_OBJ2 c where c.objkey = t.party_id)" +
			" and t.alertkey is not null";
			conn.commit();
			count = SQLExecute.exeSql(conn, sql);
			
			//modify xb
			sql = "insert into "
				+ tablename
				+ "(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,stcr,alert_dt,status_cd,trans_amt )";

		sql = sql
				+ " select   a.alertkey,'2',a.objkey"
				+ curr_cd
				+ ",a.party_id,a.alert_dt,'',b.party_id,a.pbckey,a.alert_dt,'0',0"
				+ " FROM T27_ALERT_NEWADDMID a , T27_ALERT_PARTY_NEWADDMID  b" +
						" where a.alertkey = b.alertkey" ;
		conn.commit();
		count = SQLExecute.exeSql(conn, sql);
			
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean updateT07_case_TRANSACTION_KY_TEMP(Connection conn,String statisticdate,String curr_flag) throws Exception {

		boolean isSucc = true;

		try {
			String sql="update t07_case_transaction_ky_temp a set a.alert_dt="+func.vch2dt(statisticdate, "yyyy-mm-dd")
			+"  where  exists(select 'X' from T07_MID_TRANSACTION_KY_TEMP b where b.OBJPARTY_ID=a.OBJPARTY_ID and b.organkey=a.organkey and b.STCR=a.STCR";
			if(curr_flag.equals("1")){
				sql=sql+" and b.CURR_CD=a.CURR_CD";
			}
			sql=sql+" ) and  a.STATISTIC_DT<"+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int count = SQLExecute.exeSql(conn, sql);
			logger.info("updatet07_case_transaction_ky_temp表时间记录"+count+"个");
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	
	public boolean updateT07_case_Alert_status_appnum(Connection conn,String alert_type,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql = "UPDATE T07_ALERT_"+alert_type+" T1 SET ALERT_STATUS_CD='"
			+ Constants.ALERT_STATUS_CD + "' , application_num='N'"
			+ " WHERE T1.ALERT_MODE_CD = '" + Constants.SYS_ALERT+"'";
		if(alert_type.equals(Constants.ALERT_TYPE_CD_DE)){
			sql=sql+ " AND T1.ALERT_DT = "
			+ func.vch2dt(statisticdate, "yyyy-mm-dd");
		}else{
			sql=sql+" AND (T1.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_CASE_APPLICATION "
			+" WHERE  CAST_TYPE='2' AND DATE_STATUS_CD='"+Constants.DATE_STATUS_CD+"'  AND APP_STATE_CD!='5'"
			+" AND CASE_DATE="+ func.vch2dt(statisticdate, "yyyy-mm-dd")+")"
			+" OR (T1.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_REPORT "
			+" WHERE  REPORT_STATUS_CD='3'))";
		}
			int count = SQLExecute.exeSql(conn, sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public boolean updateT27_case_Alert_status_appnum(Connection conn,String statisticdate,String type) throws Exception {

		boolean isSucc = true;

		try {
			String sql = "UPDATE T27_ALERT  T1 SET ALERT_STATUS_CD='"+Constants.alert_status+"'"
			 + "WHERE EXISTS(SELECT 'X' FROM T07_CASE_NET_ALERT B WHERE B.ALERT_DT=T1.ALERT_DT  "
			+ " AND ( B.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_CASE_APPLICATION "
			+" WHERE   DATE_STATUS_CD='"+Constants.DATE_STATUS_CD+"'  AND APP_STATE_CD!='5' "
			+"   AND CASE_DATE="+ func.vch2dt(statisticdate, "yyyy-mm-dd")+") "
			+" OR  B.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_REPORT "
			+" WHERE  REPORT_STATUS_CD='3'))";
			if(type.equals("1")){//单独生成案例或即生成案例又生成网络
				sql=sql=" and T1.PBCKEYTYPE in("+Constants.pbckeytype+")";
			}
			if(type.equals("2")){//模型案例
				sql=sql="  and T1.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d,t21_pbcrule e where c.MODULE_NO=d.MODULE_NO"
					+" and c.stcr=e.pbckey and d.MODULE_GREY='1' and c.STCR_TYPE='1' and e.pbctype='1' )";
			}
			
			int count = SQLExecute.exeSql(conn, sql);
			
			
		
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean updateT27_case_Alert_status_appnum2(Connection conn,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql = "UPDATE T13_MFA_INFO  T1 SET STATUS='2' "
			 + " , application_num='N'"
			+ " WHERE  T1.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_CASE_APPLICATION "
			+" WHERE  CAST_TYPE='2' AND DATE_STATUS_CD='"+Constants.DATE_STATUS_CD+"' "
			+" AND CASE_DATE="+ func.vch2dt(statisticdate, "yyyy-mm-dd")+")";
			int count = SQLExecute.exeSql(conn, sql);
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean updateT27_case_Alert_status_appnum1(Connection conn,String statisticdate) throws Exception {

		boolean isSucc = true;

		try {
			String sql = "UPDATE T13_MFA_INFO  T1 SET FLOW_STATUS='2' "
			 + " , application_num='N'"
			+ " WHERE  T1.APPLICATION_NUM IN(SELECT APPLICATION_NUM FROM T07_CASE_APPLICATION "
			+" WHERE  CAST_TYPE='2' AND DATE_STATUS_CD='"+Constants.DATE_STATUS_CD+"' "
			+" AND CASE_DATE="+ func.vch2dt(statisticdate, "yyyy-mm-dd")+")";
			int count = SQLExecute.exeSql(conn, sql);
			
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	
	public boolean updateT07_case_trans_temp(Connection conn,String statisticdate,String newdate,String alertdifday,String maxcount,String trans_stcr_count) throws Exception {

		boolean isSucc = true;

		try {
			
			if(statisticdate.equals(newdate)){
				String sql = "update t07_case_transaction_ky_temp  set STATUS_CD='1'"
		              +" where alert_dt<="+ func.vch2dt(statisticdate, "yyyy-mm-dd");
					int count = SQLExecute.exeSql(conn, sql);
				logger.info("修改t07_case_transaction_ky_temp表"+count+"记录");	
			}
				
			String sql = "update t07_case_transaction_ky_temp set STATUS_CD='1'"
			 +" where objparty_id in(select b.objparty_id from( "
             +" select a.objparty_id,max(a.statistic_dt) as alert_dt from t07_case_transaction_ky_temp a group by a.objparty_id "
             +" ) b where  b.alert_dt<"+func.vch2dt(newdate, "yyyy-mm-dd")+")";
            
			int  count = SQLExecute.exeSql(conn, sql);
			logger.info("修改t07_case_transaction_ky_temp表"+count+"记录");	
			
            sql = "update t07_case_transaction_ky_temp a set a.STATUS_CD='1'"
              +"   where STATUS_CD='0' and exists (select 'X' from  (select OBJPARTY_ID,alert_dt from   t07_case_transaction_ky_temp b"
              +"              where  b.alert_dt>"+ func.vch2dt(newdate, "yyyy-mm-dd")
              +"               group by OBJPARTY_ID,alert_dt   having count(distinct transactionkey)> "+maxcount+") c where c.OBJPARTY_ID=a.OBJPARTY_ID and c.alert_dt>=a.alert_dt)"
             // +"  and a.alert_dt>="+ func.vch2dt(newdate, "yyyy-mm-dd")
               +" and a.alert_dt<="+ func.vch2dt(statisticdate, "yyyy-mm-dd");
             count = SQLExecute.exeSql(conn, sql);
			logger.info("修改t07_case_transaction_ky_temp表"+count+"记录");	
			
	     sql = "update t07_case_transaction_ky_temp a set a.STATUS_CD='1'"
                 +"   where  STATUS_CD='0' and  exists(select 'x' from t07_case_transaction_ky_temp b where b.OBJPARTY_ID=a.OBJPARTY_ID and  b.STATISTIC_DT <="+ func.vch2dt(alertdifday, "yyyy-mm-dd")+")"
				 +" and a.alert_dt<="+ func.vch2dt(statisticdate, "yyyy-mm-dd");
	     
            
			 count = SQLExecute.exeSql(conn, sql);
			 logger.info("修改t07_case_transaction_ky_temp表"+count+"记录");	
			 
			  sql = "update t07_case_transaction_ky_temp a set a.STATUS_CD='1'"
	              +"   where STATUS_CD='0' and exists (select 'X' from  (select OBJPARTY_ID from   t07_case_transaction_ky_temp b"
	            //  +"              where  b.alert_dt>"+ func.vch2dt(newdate, "yyyy-mm-dd")
	              +"               group by OBJPARTY_ID   having count(distinct b.stcr)> "+trans_stcr_count+") c where c.OBJPARTY_ID=a.OBJPARTY_ID )"
	             // +"  and a.alert_dt>="+ func.vch2dt(newdate, "yyyy-mm-dd")
	               +" and a.alert_dt<="+ func.vch2dt(statisticdate, "yyyy-mm-dd");
	             count = SQLExecute.exeSql(conn, sql);
				logger.info("修改t07_case_transaction_ky_temp表"+count+"记录");	
		} catch (Exception e) {
			
			isSucc = false;
			e.printStackTrace();
			throw e;
		}
		return isSucc;
	}
	public int updateT07_case_transaction_de_temp(Connection conn,String transcount)  throws Exception {
		String sql = "update t07_case_transaction_de_temp a set a.STATUS_CD='1' "
				+ " where exists (select 'X' from t07_case_transaction_de_temp b"
				+ " where b.organkey=a.organkey group by b.organkey"
				+ " having count(b.transactionkey)<=" + transcount
				+ " ) ";
		int count = SQLExecute.exeSql(conn, sql);
		logger.info("修改t07_case_transaction_de_temp表"+count+"记录");
		return count;
	}
	
//	public int updateT07_case_transaction_dk_temp(Connection conn,String alert_type,String status_cd)  throws Exception {
//		String sql = "update t07_case_transaction_"+alert_type+"_temp a set (a.party_chn_name,a.party_class_cd)=(select b.party_chn_name,b.party_class_cd from t47_party b where b.party_id=a.party_id) "
//				+ " where exists (select 'X' from t47_party c where c.party_id=a.party_id) "
//				+ " and  a.STATUS_CD='"+status_cd+"'";
//				
//		int count = SQLExecute.exeSql(conn, sql);
//		logger.info("修改t07_case_transaction_de_temp表"+count+"记录");
//		return count;
//	}
	
	public int delT07_case_transaction_ky_tempBystatus(Connection conn,String tablename)  throws Exception {
		String sql = "delete  from  "+tablename+" a where a.STATUS_CD='1' ";
			
		int count = SQLExecute.exeSql(conn, sql);
		
		return count;
	}
	
	public int delT07_case_transaction_ky_temp(Connection conn,String statisticdate,String tablename,String type)  throws Exception {
		String sql = "delete  from  "+tablename+" a where "
		+"  a.STATISTIC_DT<"+func.vch2dt(statisticdate, "yyyy-mm-dd");
		
		int count = SQLExecute.exeSql(conn, sql);
		
		return count;
	}
	public int updateT07_IsWrite(Connection conn,String flag)  throws Exception {

		int count=0;
		if(flag.equals("1")){
		
			String  sql="UPDATE T07_CASE_TRANSACTION_DE_TEMP A SET A.IS_MENU='1'"
			+" WHERE EXISTS (SELECT 'X' FROM t07_whitelist_info B WHERE B.PARTY_ID=A.PARTY_ID AND B.ISCHECK='1' AND B.ISUSE='0' )" 
			+"  and a.IS_MENU='0' ";
			count=SQLExecute.exeSql(conn, sql);	
			
		}
	   
		return count;
	}
	
	public int insertT07_mid_alert_trans(Connection conn,String statisticdate)  throws Exception {
	
		String sql = " insert into   T07_MID_ALERT_TRANS(alertkey,INSTRTYPE,ALERT_TYPE, OBJKEY,OBJPARTY_ID, ORGANKEY, PARTY_ID,ACCT_NUM, STCR,TRANSACTIONKEY,CURR_CD,STATUS_CD,ALERT_DT,INVALIDATE_DT,TRANS_AMT) "
			     +" SELECT DISTINCT  alertkey,'1','1',A.PARTY_ID,A.PARTY_ID,'N',A.PARTY_ID,A.ACCT_NUM,A.STCR,A.TRANSACTIONKEY,A.CURR_CD,'0',A.ALERT_DT,A.ALERT_DT,A.TRANS_AMT FROM T07_CASE_TRANSACTION_DE_TEMP A"
			     +" UNION ALL  SELECT  alertkey,'1',alerttype,'N',A.OBJPARTY_ID,'N',A.PARTY_ID,A.ACCT_NUM,A.STCR,A.TRANSACTIONKEY,A.CURR_CD,A.STATUS_CD,A.ALERT_DT,A.ALERT_DT ,A.TRANS_AMT" 
			     + "  FROM T07_CASE_TRANSACTION_KY_TEMP A    WHERE  A.STATUS_CD='1'  AND A.ALERT_DT<="+ func.vch2dt(statisticdate, "yyyy-mm-dd");
				int count = SQLExecute.exeSql(conn, sql);
		
		
		return count;
	}
	public int delT07_mid_alert_trans(Connection conn)  throws Exception {
		String delsql=func.deleteTable("T07_MID_ALERT_TRANS");
		int count = SQLExecute.exeSql(conn, delsql);
		return count;
	}
	
	
	
	public void updateAlertName(Connection conn) throws Exception {
		
			 //修改客户名称
			String sql=" UPDATE T07_MID_ALERT_TRANS A SET (party_chn_name,objparty_class_cd,OBJNAME,ORGANKEY)=(select b.party_chn_name,b.party_class_cd, b.party_chn_name,b.organkey from t47_party b where b.party_id=a.OBJPARTY_ID) "
					+ " where exists (select 'X' from t47_party c where c.party_id=a.OBJPARTY_ID) ";
			
			 int count = SQLExecute.exeSql(conn, sql);
				
		
	}
	public void updateT07_case_trans_de_temp(Connection conn) throws Exception {
		

		String sql=" UPDATE t07_case_transaction_de_temp A SET (acct_num,trans_amt)=(select b.acct_num, b.amt from t47_transaction_d b"
				+ " where b.transactionkey=a.transactionkey )"
				+ " where exists ( select 'x' from t47_transaction_d b where b.transactionkey=a.transactionkey ) " ;
		 int count = SQLExecute.exeSql(conn, sql);
			
	
}
	
	
	
	

}
