package com.ist.server.cal.aml.Case.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.TreeMap;


import org.apache.log4j.Logger;





import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.jcs.CatchManager;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.server.cal.aml.Case.dto.T23_rule_module;
import com.ist.server.cal.aml.common.Constants;
import com.ist.server.cal.aml.jrules.dto.IndicFact;
import com.ist.server.cal.aml.jrules.dto.V07_indic;







public class CaseBeforeBO {

	
	private static Logger logger = LogUtils.getLogger(CaseBeforeBO.class.getName());
	CatchManager cm = CatchManager.getInstance();
	//private HashMap pbcRuleMap = (HashMap) cm.getMapFromCache("getPbcruleHash");

	DBfunc func = DBfuncFactory.getDBInstance();

	public CaseBeforeBO(){
		
	}
	


	public HashMap selModule(Connection conn,String type) throws Exception {

		HashMap moduleMap=new HashMap();
			String sql="select a.module_no,b.keystcr,a.totalday "
                     +" from t23_rule_module a left join t23_module_stcr b"
                     +" on (a.module_no=b.module_no and b.stcr_type='2')"
                      +" where a.MODULE_GREY='"+type+"'  order by a.module_no";
			logger.debug(sql);
//			 ArrayList list=SQLExecute.executeQuery(conn, sql);
//		for(int i=0;i<list.size();i++){
			//TreeMap map=(TreeMap)list.get(i);
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		try {
			
				pstmt = conn.prepareStatement(sql);
			
				rs = pstmt.executeQuery();
		while (rs.next()) {
			String module_no=(String)rs.getString("MODULE_NO");
			String keystcr=(String)rs.getString("KEYSTCR");
			String totalday=rs.getInt("TOTALDAY")+"";
			if(moduleMap.containsKey(module_no)){
				
				String stcrstrs=(String)moduleMap.get(module_no);
				String[] stcrstr=stcrstrs.split(";");
				String key1=stcrstr[0]+",'"+keystcr+"'";
				int  stcrcount=Integer.parseInt(stcrstr[1])+1;
				moduleMap.put(module_no, key1+";"+stcrcount+";"+totalday);
				
			}else{
				if(keystcr==null){
					moduleMap.put(module_no,"N;0;"+totalday);	
				}else{
				moduleMap.put(module_no, "'"+keystcr+"';1;"+totalday);
				}
			}
		}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			throw sqle;
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
		//}
		
		return moduleMap;
	}
	public void delT27_MID_TRANS_KY_TEMP(Connection conn,String tableaname,String statisticdate) throws Exception {

	
		String sql=" delete from "+tableaname
			+" a where exists(select 'x' from t21_pbcrule b where b.pbckey=a.STCRKEY and b.MODULEFLAG='1' and b.SUXFLAG='1') "
			+" and exists(select 'x' from t07_case_net_alert c where c.alertkey=a.alertkey and c.case_date<"+func.vch2dt(statisticdate, "yyyy-MM-dd")+" )";
		int count = SQLExecute.exeSql(conn, sql);
		
	}
	
	
	public void insertT07_MALERTSTCR_KY_TEMP(Connection conn) throws Exception {

		String delsql=func.deleteTable("T07_MALERTSTCR_KY_TEMP");
		int count = SQLExecute.exeSql(conn, delsql);
		String sql=" insert into T07_MALERTSTCR_KY_TEMP(ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select distinct ALERTKEY,OBJPARTY_ID,STCR,ALERT_DT,'0' from T07_MALERTTRAN_KY_TEMP1 ";
		count = SQLExecute.exeSql(conn, sql);
		
	}
	
	public boolean insertT07_MALERTTRAN_KY_TEMP(Connection conn,String status_cd,String statisticdate) throws Exception {

		boolean isSucc = true;
          
			String  sql=" insert into T07_MALERTTRAN_KY_TEMP(alertkey,ALERTTYPE,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt)";
	
			sql=sql+" select c.* from( select a.alertkey,a.ALERTTYPE,a.OBJKEY,a.CURR_CD,a.OBJPARTY_ID,"+func.vch2dt(statisticdate, "yyyy-MM-dd")+",a.organkey,a.party_id,a.ACCT_NUM,a.transactionkey,a.stcr,a.alert_dt,'"+status_cd+"',a.trans_amt"
					+" from  T07_MALERTTRAN_KY_TEMP1 a where exists(select 'x' from  T07_MALERTSTCR_KY_TEMP b where b.alertkey=a.alertkey and b.status_cd='1') "
					+" )c left join  T07_MALERTTRAN_KY_TEMP d on d.alertkey=c.alertkey  where d.alertkey is null ";
			
			   int  count = SQLExecute.exeSql(conn, sql);
	
		
		return isSucc;
	}
	
	public void insertT07_MALERTSTCR_KY_TEMP1(Connection conn,String statisticdate) throws Exception {
	
		//当日有预警的客户
		
			func.deleteTable(conn,"M13_NET_MID_RE");
		//int  count1 = SQLExecute.exeSql(conn, sql1); 
		String sql1="insert into M13_NET_MID_RE(NET_ID) "
			 +" select distinct net_id from M13_net_trans_day b where  b.alert_dt="+func.vch2dt(statisticdate, "yyyy-MM-dd");
             
		 int count1 = SQLExecute.exeSql(conn, sql1); 
		
		
	//网络客户关系表
		 func.deleteTable(conn,"M13_net_party_day");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_party_day (net_id,party_id,trans_count,trans_amt,min_dt)");
		sql.append("   SELECT   n.net_id, n.party_id,count(transactionkey),sum(n.cny_amt),MIN(N.alert_dt) ");
		sql.append("     FROM M13_net_trans_day n  where exists(select 'x' from M13_NET_MID_RE b where b.net_id=n.net_id ");
		sql.append("   )   group by  n.net_id, n.party_id");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		 //找出网络和最小预警日期的关系
	
		 func.deleteTable(conn,"M13_net_trans_day_statistic");
			
		 sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_trans_day_statistic (net_id,trans_count,trans_amt,min_dt)");
		sql.append("   SELECT n.net_id,sum(n.trans_count),sum(n.trans_amt),MIN(N.min_dt) ");
		sql.append("     FROM M13_net_party_day n ");
		sql.append("    GROUP BY n.NET_ID  ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
	
		// 其他用于多主体模型不是属性的，规则特征的暂时不处理
 
		
//      DateUtils du=new DateUtils();
//      String befordate=du.getDateChangeALL(statisticdate+" 00:00:00", "1", -day);
		
		 func.deleteTable(conn,"t27_mid_alert1");
		 String str="insert into t27_mid_alert1(alertkey,party_id,pbckey,alert_dt)"
			 +" select distinct t.alertkey,t.party_id,t1.pbckey,t1.alert_dt from T27_ALERT_PARTY T ,T27_ALERT T1"
			+" WHERE T.ALERTKEY=T1.ALERTKEY  and t1.alert_status_cd='2' AND T1.ALERTTYPE='2'";    //只塞选可疑，避免大额参与进来 3号令
			//+" and t1.PBCKEY in(select pbckey from t21_pbcrule where pbckeytype in('2','3') )";
			SQLExecute.exeSql(conn, str); 
			conn.commit();
		 

		//将网络和网络属性的预警插入到模型特征
		String delsql=func.deleteTable("T07_MALERTSTCR_KY_TEMP1");
		int count = SQLExecute.exeSql(conn, delsql);
		/*String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select  distinct A.NET_ID,B.ALERTKEY,A.NET_ID,B.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day  A,(select distinct t.alertkey,t.party_id,t1.pbckey,t1.alert_dt from T27_ALERT_PARTY T ,T27_ALERT T1"
			+" WHERE T.ALERTKEY=T1.ALERTKEY  and t1.alert_status_cd='2' ";
			isql=isql+" and t1.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d where c.MODULE_NO=d.MODULE_NO"
					+" and d.MODULE_GREY='2' ))B,M13_net_trans_day_statistic c ";
			isql=isql+" where   A.party_id=B.party_id and a.net_id=c.net_id  and b.ALERT_DT>=c.min_dt  "
			+" AND　b.ALERT_DT<="+func.vch2dt(statisticdate, "yyyy-MM-dd")
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  ) ";*/
		
		String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select  distinct A.NET_ID,B.ALERTKEY,A.NET_ID,B.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day  A,t27_mid_alert1 B,M13_net_trans_day_statistic c ";
			isql=isql+" where   A.party_id=B.party_id and a.net_id=c.net_id  and b.ALERT_DT>=c.min_dt  "
			+" AND　b.ALERT_DT<="+func.vch2dt(statisticdate, "yyyy-MM-dd")
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  ) ";

		count = SQLExecute.exeSql(conn, isql);
		conn.commit();
		
	}
	
	public void insertT07_MALERTSTCR_KY_TEMP1_MODEL(Connection conn,String statisticdate) throws Exception {
		
		//当日有预警的客户
		
			func.deleteTable(conn,"M13_NET_MID_RE");
		//int  count1 = SQLExecute.exeSql(conn, sql1); 
		String sql1="insert into M13_NET_MID_RE(NET_ID) "
			 +" select distinct net_id from M13_net_trans_day b where  b.alert_dt="+func.vch2dt(statisticdate, "yyyy-MM-dd");
             
		 int count1 = SQLExecute.exeSql(conn, sql1); 
		
		
	//网络客户关系表
		 func.deleteTable(conn,"M13_net_party_day");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_party_day (net_id,party_id,trans_count,trans_amt,min_dt,module_no)");
		sql.append("   SELECT   n.net_id, n.party_id,count(transactionkey),sum(n.cny_amt),MIN(N.alert_dt),n.module_no ");
		sql.append("     FROM M13_net_trans_day n  where exists(select 'x' from M13_NET_MID_RE b where b.net_id=n.net_id ");
		sql.append("   )   group by  n.net_id, n.party_id,n.module_no");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		 //找出网络和最小预警日期的关系
	
		 func.deleteTable(conn,"M13_net_trans_day_statistic");
			
		 sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_trans_day_statistic (net_id,trans_count,trans_amt,min_dt)");
		sql.append("   SELECT n.net_id,sum(n.trans_count),sum(n.trans_amt),MIN(N.min_dt) ");
		sql.append("     FROM M13_net_party_day n ");
		sql.append("    GROUP BY n.NET_ID  ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
	
		// 其他用于多主体模型不是属性的，规则特征的暂时不处理
 
		
//      DateUtils du=new DateUtils();
//      String befordate=du.getDateChangeALL(statisticdate+" 00:00:00", "1", -day);
		
		 func.deleteTable(conn,"t27_mid_alert1");
		 String str="insert into t27_mid_alert1(alertkey,party_id,pbckey,alert_dt)"
			 +" select distinct t.alertkey,t.party_id,t1.pbckey,t1.alert_dt from T27_ALERT_PARTY T ,T27_ALERT T1"
			+" WHERE T.ALERTKEY=T1.ALERTKEY  and t1.alert_status_cd='2' ";
			//+" and t1.PBCKEY in(select pbckey from t21_pbcrule where pbckeytype in('2','3') )";
			SQLExecute.exeSql(conn, str); 
			conn.commit();
		 

		//将网络和网络属性的预警插入到模型特征
		String delsql=func.deleteTable("T07_MALERTSTCR_KY_TEMP1");
		int count = SQLExecute.exeSql(conn, delsql);
		/*String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select  distinct A.NET_ID,B.ALERTKEY,A.NET_ID,B.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day  A,(select distinct t.alertkey,t.party_id,t1.pbckey,t1.alert_dt from T27_ALERT_PARTY T ,T27_ALERT T1"
			+" WHERE T.ALERTKEY=T1.ALERTKEY  and t1.alert_status_cd='2' ";
			isql=isql+" and t1.PBCKEY in(select KEYSTCR from T23_MODULE_STCR c,T23_RULE_MODULE d where c.MODULE_NO=d.MODULE_NO"
					+" and d.MODULE_GREY='2' ))B,M13_net_trans_day_statistic c ";
			isql=isql+" where   A.party_id=B.party_id and a.net_id=c.net_id  and b.ALERT_DT>=c.min_dt  "
			+" AND　b.ALERT_DT<="+func.vch2dt(statisticdate, "yyyy-MM-dd")
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  ) ";*/
		
		String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select  distinct A.NET_ID,B.ALERTKEY,A.NET_ID,B.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day  A,t27_mid_alert1 B,M13_net_trans_day_statistic c,"
			+" (select distinct c.rulekey,c.pbckey,e.module_no from t21_rule c, t23_module_stcr e where c.pbckey =e.keystcr) F";
			isql=isql+" where   A.party_id=B.party_id and a.net_id=c.net_id  and b.ALERT_DT>=c.min_dt  "
					+" and B.PBCKEY=f.PBCKEY and f.module_no = A.module_no"
			+" AND　b.ALERT_DT<="+func.vch2dt(statisticdate, "yyyy-MM-dd")
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  ) ";

		count = SQLExecute.exeSql(conn, isql);
		conn.commit();
		
	}
	
	public void insertT07_MALERTSTCR_KY_TEMP11(Connection conn,String statisticdate) throws Exception {
		
		
		
		
	//网络客户关系表
		 func.deleteTable(conn,"M13_net_party_day");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_party_day (net_id,party_id)");
		sql.append("   SELECT  distinct n.net_id, n.party_id ");
		sql.append("     FROM M13_net_trans_day n ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
	
		//找出网络和最小预警日期的关系
		
		 func.deleteTable(conn,"M13_net_trans_day_statistic");
			
		 sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_trans_day_statistic (net_id,trans_count,trans_amt,min_dt)");
		sql.append("   SELECT n.net_id,sum(n.trans_count),sum(n.trans_amt),MIN(N.min_dt) ");
		sql.append("     FROM M13_net_party_day n ");
		sql.append("    GROUP BY n.NET_ID  ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		 

		//将网络和网络属性的预警插入到模型特征
		String delsql=func.deleteTable("T07_MALERTSTCR_KY_TEMP1");
		int count = SQLExecute.exeSql(conn, delsql);
				
		String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select  distinct A.NET_ID,B.ALERTKEY,A.NET_ID,c.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day  A,t27_alert_party B,t21_rule c ";
			isql=isql+" where   A.party_id=B.party_id and b.rulekey=c.rulekey AND interfacekey='BS'  " //只塞选可疑，避免大额参与进来 3号令
			+" AND　b.ALERT_DT="+func.vch2dt(statisticdate, "yyyy-MM-dd")
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  )  and a.CASE_DATE="+func.vch2dt(statisticdate, "yyyy-MM-dd");

		count = SQLExecute.exeSql(conn, isql);
		conn.commit();
		
	}
	
	public void insertT07_MALERTSTCR_KY_TEMP11_MODEL(Connection conn,String statisticdate) throws Exception {
		//网络客户关系表
		func.deleteTable(conn,"M13_net_party_day");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_party_day (net_id, party_id, module_no,trans_count,trans_amt,min_dt )");
		sql.append("   SELECT n.net_id, n.party_id, n.module_no,count(transactionkey),sum(n.cny_amt),MIN(N.alert_dt) ");
		sql.append("     FROM M13_net_trans_day n group by  n.net_id, n.party_id,n.module_no ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
	
		//找出网络和最小预警日期的关系
		
		 func.deleteTable(conn,"M13_net_trans_day_statistic");
			
		 sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_trans_day_statistic (net_id,trans_count,trans_amt,min_dt)");
		sql.append("   SELECT n.net_id,sum(n.trans_count),sum(n.trans_amt),MIN(N.min_dt) ");
		sql.append("     FROM M13_net_party_day n ");
		sql.append("    GROUP BY n.NET_ID  ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		 
		String delsql=func.deleteTable("T07_MALERTSTCR_KY_TEMP1");
		int count = SQLExecute.exeSql(conn, delsql);
				
		String isql=" insert into T07_MALERTSTCR_KY_TEMP1(NET_ID,ALERTKEY,OBJPARTY_ID,STCRKEY,ALERT_DT,STATUS_CD)"
			+" select /*+use_hash(F,B)*/ distinct A.NET_ID,B.ALERTKEY,A.NET_ID,F.PBCKEY,B.ALERT_DT,'0' from M13_net_party_day A,t27_alert_party B,"
			+"(select distinct c.rulekey,c.pbckey,e.module_no from t21_rule c, t23_module_stcr e where c.pbckey =e.keystcr) F ";
			isql=isql+" where A.party_id=B.party_id and b.rulekey=f.rulekey and f.module_no = A.module_no "
			+" AND　b.ALERT_DT="+func.vch2dt(statisticdate, "yyyy-MM-dd") 
			+" union  all "
			+" select  net_id,'N',net_id,e.pbckey,a.case_date,'0' from T07_CASE_NET_INDIC a,t21_rule e where a.rulekey=e.rulekey and  a.application_num='N' "
		    +"  and e.pbckey in(select c.KEYSTCR from T23_MODULE_STCR c, "
			+" T23_RULE_MODULE d where c.MODULE_NO = d.MODULE_NO and d.MODULE_GREY = '2'  )  and a.CASE_DATE="+func.vch2dt(statisticdate, "yyyy-MM-dd");

		count = SQLExecute.exeSql(conn, isql);
		conn.commit();
		
	}
	
	public void dealModule(Connection conn,String module_no,String stcrstr,String stcrcount,String statisticdate) throws Exception {
		//模型分值表
		  String delsql= func.deleteTable("T07_MODULE_SCORE_TEMP");
		  int count = SQLExecute.exeSql(conn, delsql); 
		
		  
		    String sql="insert into T07_MODULE_SCORE_TEMP(net_id,module_no,sumscore)"
		           +" select a.objparty_id,b.module_no,sum(b.stcrscore) as sumscore"
		           +" from (select distinct objparty_id,stcrkey from T07_MALERTSTCR_KY_TEMP) a,t23_module_stcr b"
		           +" where a.stcrkey=b.keystcr  and b.module_no='"+module_no+"'"
		           +" group by  a.objparty_id,b.module_no";
			 count = SQLExecute.exeSql(conn, sql); 
			 conn.commit();
		
		//查询出符合分值条件的
		 sql="update  T07_MALERTSTCR_KY_TEMP set status_cd='1',alerttype='1' where objparty_id in ("
		           +" select c.net_id "
		           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d"
		           +" where c.module_no=d.module_no and c.sumscore>=d.case_minscore and d.module_no='"+module_no+"')";
		 count = SQLExecute.exeSql(conn, sql);
		logger.debug("修改模型分值记录数"+count);
		
		  //插入模型分值表
       String  isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,OBJKEY,SUMSCORE,CASE_DATE)"
	           +" select '2','1',c.MODULE_NO,c.NET_ID,C.NET_ID,c.SUMSCORE,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
	           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d"
		           +" where c.module_no=d.module_no and c.sumscore>=d.case_minscore and d.module_no='"+module_no+"' ";
	 count = SQLExecute.exeSql(conn, isql);
	 conn.commit();
		if(!stcrcount.equals("0")){
			//匹配特征
			String sqlstr="update T07_MALERTSTCR_KY_TEMP set status_cd='1',alerttype='2' where objparty_id in( select objparty_id from(select objparty_id,  count(distinct stcrkey) as stcrcount from T07_MALERTSTCR_KY_TEMP a where a.status_cd='0' and "
				+" a.stcrkey in("+stcrstr+") group by objparty_id )b where b.stcrcount="+stcrcount+")";
			
			count =count+ SQLExecute.exeSql(conn, sqlstr);
			logger.debug("修改模型关键特征记录数"+module_no+"::::"+count);
			
			//插入模型分值表
	          isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,objkey,CASE_DATE)"
		           +" select  distinct '2','2','"+module_no+"',objparty_id,objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
		           +" from T07_MALERTSTCR_KY_TEMP a "
		           +" where a.status_cd='1' and a.alerttype='2'";
		       count = SQLExecute.exeSql(conn, isql);
		       conn.commit();  
		}
		
			
	
	}
	
	public void insertMfa(Connection conn,String statisticdate) throws Exception {
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO t13_mfa_stcr_trans  ");
		sql.append(" 		(NET_ID,STCR,TRANSACTIONKEY,PARTY_ID,ACCT_NUM,CURR_CD,PARTY_CLASS_CD, ");
		sql.append(" 		TRANS_AMT,DATA_DT,ORGANKEY,OPP_ACCT_NUM,OPP_PARTY_ID,OPP_PARTY_CLASS_CD, ");
		sql.append(" 		CURRENCY_CD,USD_AMT,CNY_AMT,TX_DT,CHANNEL,RECEIVE_PAY_CD,PARTY_CHN_NAME, ");
		sql.append(" 		CASH_TRANS_FLAG,TX_GO_COUNTRY,TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA) ");
		sql.append(" SELECT distinct N.NET_ID,T.rulekey STCR,N.TRANSACTIONKEY,N.PARTY_ID,N.ACCT_NUM,N.CURR_CD,N.PARTY_CLASS_CD,N.TRANS_AMT, ");
		sql.append( func.vch2dt(statisticdate, "yyyy-MM-dd") +" DATA_DT,");
		sql.append("        N.ORGANKEY,N.OPP_ACCT_NUM,N.OPP_PARTY_ID,N.OPP_PARTY_CLASS_CD, ");
		sql.append(" 		N.CURRENCY_CD,N.USD_AMT,N.CNY_AMT,N.TX_DT,N.CHANNEL,N.RECEIVE_PAY_CD,N.PARTY_CHN_NAME, ");
		sql.append(" 		N.CASH_TRANS_FLAG,N.TX_GO_COUNTRY,N.TX_GO_AREA,N.TX_OCCUR_COUNTRY,N.TX_OCCUR_AREA ");
		sql.append("   FROM M13_mfa_mid o, M13_net_trans_day n,M13_net_stcr_rel t");
		sql.append("  WHere o.net_id = n.net_id    ");
		sql.append("  and   n.net_id = t.net_id ");
		
		SQLExecute.exeSql(conn, sql.toString());
		 
		

		
	}
	
	public void dealModule1(Connection conn,HashMap moduleMap,String statisticdate) throws Exception {
		  
		//模型分值表
		  String delsql= func.deleteTable("T07_MODULE_SCORE_TEMP");
		  int count = SQLExecute.exeSql(conn, delsql); 
		
		  
		    String sql="insert into T07_MODULE_SCORE_TEMP(net_id,module_no,sumscore)"
		    	  +" select a.net_id,b.module_no,sum(b.stcrscore) as sumscore"
		           +" from  (select distinct net_id,stcrkey from T07_MALERTSTCR_KY_TEMP1) a,t23_module_stcr b,t23_rule_module m"
		           +" where a.stcrkey=b.keystcr and b.module_no=m.module_no and m.module_grey='2'"
		           +" group by  a.net_id,b.module_no ";
			 count = SQLExecute.exeSql(conn, sql); 
			 conn.commit();
			 
	    //匹配分值
		String isql="update T07_MALERTSTCR_KY_TEMP1 set status_cd='1',alerttype='1' where net_id in ("
		           +" select c.net_id "
		           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d,t23_rule_module m"
		           +" where c.module_no=d.module_no and d.module_no=m.module_no and m.module_grey='2' and c.sumscore>=d.case_minscore)";
		
//		String isql="update T07_MALERTSTCR_KY_TEMP1 a set status_cd='1',alerttype='1' where exists("
//	           +" select  'x' from( "
//              +"               select d.module_no "
//              +"               from T07_MODULE_SCORE_TEMP c ,t23_rule_module d "
//              +"             where c.module_no=d.module_no  and c.sumscore>=d.case_minscore)b,t23_module_stcr e "
//              +"  where b.module_no=e.module_no and  e.keystcr=a.stcrkey ";
		
		 count = SQLExecute.exeSql(conn, isql);
		logger.debug("分值count::"+count);
          conn.commit();
          //插入模型分值表
          isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,SUMSCORE,CASE_DATE)"
	           +" select '3','1',c.MODULE_NO,c.NET_ID,c.SUMSCORE,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
	           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d,t23_rule_module m"
		      +" where c.module_no=d.module_no and d.module_no=m.module_no and m.module_grey='2' and c.sumscore>=d.case_minscore ";
	 count = SQLExecute.exeSql(conn, isql);
          
		Iterator iter=moduleMap.keySet().iterator();
		while(iter.hasNext()){
			String module_no=(String)iter.next();
			String stcr=(String)moduleMap.get(module_no);
			String[] stcrstrs=stcr.split(";");
			String stcrstr=stcrstrs[0];
			int stcrcount=Integer.parseInt(stcrstrs[1]);
			if(stcrcount!=0){
			//匹配特征
			String sqlstr="update T07_MALERTSTCR_KY_TEMP1  a set status_cd='1',alerttype='2' where exists( select 'x' from(select objparty_id,  count(distinct stcrkey) as stcrcount from T07_MALERTSTCR_KY_TEMP1 a where a.status_cd='0' and "
				+" a.stcrkey in("+stcrstr+") group by objparty_id )b where b.objparty_id=a.objparty_id and  b.stcrcount="+stcrcount+")";	
			
			count = SQLExecute.exeSql(conn, sqlstr);
			logger.debug("特征count::"+count);
			conn.commit();
			 //插入模型分值表
	          isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,CASE_DATE)"
		           +" select  distinct '3','2','"+module_no+"',objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
		           +" from T07_MALERTSTCR_KY_TEMP1 a left join T07_CASE_MODULE_SCORE b on b.net_id=a.objparty_id "
		           +" where a.status_cd='1' and a.alerttype='2' and b.net_id is null ";
		       count = SQLExecute.exeSql(conn, isql);
		       conn.commit();
			}
			
		}
	
	
	}
	
	public String dealNet(Connection conn,String statisticdate) throws Exception {

		HashMap map=this.getNetPara(conn);
		String sumcount="0";
		if(map.get("1001")!=null){
			sumcount=(String)map.get("1001");
			if(sumcount.indexOf(",")!=-1){
				sumcount=sumcount.split(",")[0];	
			}
		}
		String sumamt="0";
		if(map.get("1002")!=null){
			sumamt=(String)map.get("1002");
			sumamt=sumamt.replaceAll(",", "");
		}
		String alertday="0";
		if(map.get("1003")!=null){
			alertday=(String)map.get("1003");
		}
		String isql="update T07_MALERTSTCR_KY_TEMP1 b set status_cd='1',alerttype='3' where exists("
		           +" select 'x' "
		           +" from  M13_net_trans_day_statistic a"
		           +" where (a.trans_count>="+sumcount+" or a.trans_amt>="+sumamt
		           +") and a.net_id=b.net_id ) and b.status_cd='0' ";
		int count = SQLExecute.exeSql(conn, isql);
         logger.debug("count:::"+count);
         
       //插入模型分值表
         isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,NET_ID,trans_count,trans_amt,CASE_DATE)"
	           +" select   '3','3',net_id,trans_count,trans_amt,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
	           +" from M13_net_trans_day_statistic a "
	           +" where (a.trans_count>="+sumcount+" or a.trans_amt>="+sumamt
	           +" ) and exists(select 'x' from T07_MALERTSTCR_KY_TEMP1 b where b.net_id=a.net_id and b.status_cd='1' and b.alerttype='3' )";
	       count = SQLExecute.exeSql(conn, isql);
	       conn.commit();
         
		return alertday;
	
	}
	
	public void dealNetTrans(Connection conn,String sumcount) throws Exception {

	
	
		if(sumcount.indexOf(",")!=-1){
			String[] sumcounts=sumcount.split(",");
			String isql="delete from  T07_MALERTSTCR_KY_TEMP1 b  where exists("
		           +" select 'x' "
		           +" from  M13_net_trans_day_statistic a"
		           +" where a.trans_count>="+sumcounts[1]
		           +" and a.net_id=b.net_id ) and b.status_cd='0' ";
		int count = SQLExecute.exeSql(conn, isql);
         logger.debug("count:::"+count);
         conn.commit();
	
		}
		
	       
         
	
	
	}
	public HashMap getNetPara(Connection conn)throws Exception{
		String sql="select defkey,defvalue from t23_net_para";
		HashMap map=SQLExecute.executeQueryHash(conn, sql);
		return map;
	}
	public void insertMidNetTrans(Connection conn,String befordate,String statisticdate,String sumcount) throws Exception {
		String delsql=func.deleteTable("M13_NET_MID_RE");
		SQLExecute.exeSql(conn, delsql.toString());
		//找到需要删除的net_id
		StringBuffer sql=new StringBuffer();
		sql.append(" INSERT INTO M13_NET_MID_RE (net_id,statisticdate)");
		sql.append(" 	select b.net_id ,"+func.vch2dt(statisticdate, "yyyy-MM-dd")+" from T07_MALERTSTCR_KY_TEMP1 b where   b.status_cd='1'");
		sql.append("    union select   c.net_id, "+func.vch2dt(statisticdate, "yyyy-MM-dd")+" from  M13_net_trans_day c ");
		sql.append(" 	where  c.alert_dt<"+func.vch2dt(befordate, "yyyy-mm-dd"));	
		
	
		if(sumcount.indexOf(",")!=-1){
			String[] sumcounts=sumcount.split(",");
				sql.append( " union select a.net_id ,"+func.vch2dt(statisticdate, "yyyy-MM-dd"));
			    sql.append(" from  M13_net_trans_day_statistic a");
			    sql.append(" where a.trans_count>="+sumcounts[1]);
			  
		
	
		}
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		

		
		//保存剩余的网络
		SQLExecute.exeSql(conn, func.deleteTable("M13_net_trans_keep"));
		sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_trans_keep ");
		sql.append(" (NET_ID,TRANSACTIONKEY,PARTY_ID,ACCT_NUM,CURR_CD,PARTY_CLASS_CD,TRANS_AMT,alert_dt, ");
		sql.append(" 		ORGANKEY,OPP_ACCT_NUM,OPP_PARTY_ID,OPP_NAME,OPP_PARTY_CLASS_CD,CURRENCY_CD,USD_AMT,CNY_AMT, ");
		sql.append(" 		TX_DT,CHANNEL,RECEIVE_PAY_CD,PARTY_CHN_NAME,CASH_TRANS_FLAG,TX_GO_COUNTRY, ");
		sql.append(" 		TX_GO_AREA,TX_OCCUR_COUNTRY,TX_OCCUR_AREA,TX_CD,DT_TIME) ");
		sql.append(" select a.NET_ID,a.TRANSACTIONKEY,a.PARTY_ID,a.ACCT_NUM,a.CURR_CD,a.PARTY_CLASS_CD,a.TRANS_AMT,a.alert_dt, ");
		sql.append(" 		a.ORGANKEY,a.OPP_ACCT_NUM,a.OPP_PARTY_ID,a.OPP_NAME,a.OPP_PARTY_CLASS_CD,a.CURRENCY_CD,a.USD_AMT,a.CNY_AMT, ");
		sql.append(" 		a.TX_DT,a.CHANNEL,a.RECEIVE_PAY_CD,a.PARTY_CHN_NAME,a.CASH_TRANS_FLAG,a.TX_GO_COUNTRY, ");
		sql.append(" 		a.TX_GO_AREA,a.TX_OCCUR_COUNTRY,a.TX_OCCUR_AREA,a.TX_CD,a.DT_TIME from  M13_net_trans_day a  left join M13_NET_MID_RE b ");
		sql.append(" 	on a.net_id=b.net_id	where b.net_id is null ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		
         SQLExecute.exeSql(conn, func.deleteTable("M13_net_acct_keep"));
		
		sql=new StringBuffer();
		sql.append(" INSERT INTO M13_net_acct_keep ");
		sql.append("   (net_id, acct_num, flag, create_dt) ");
		sql.append("   SELECT d.net_id, d.acct_num, d.flag, d.create_dt ");
		sql.append("     FROM M13_net_acct_day d ");
		sql.append("     LEFT JOIN M13_NET_MID_RE m ");
		sql.append("       ON (d.net_id = m.net_id) ");
		sql.append("    WHERE m.net_id IS NULL      ");
		SQLExecute.exeSql(conn, sql.toString());
		conn.commit();
		
	}
	
	public boolean insertT07_MALERTTRAN_KY_TEMP2(Connection conn,String statisticdate,String status_cd,String alertday) throws Exception {

		boolean isSucc = true;
          
			String  sql=" insert into T07_MALERTTRAN_KY_TEMP2(alertkey,ALERTTYPE,net_id,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,transactionkey,stcr,alert_dt,status_cd,trans_amt)";
	
			sql=sql+"  select  a.alertkey,a.ALERTTYPE,c.net_id,c.net_id,a.CURR_CD,c.net_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")+",a.organkey,b.party_id,b.ACCT_NUM,b.transactionkey,a.pbckey,a.alert_dt,'"+status_cd+"',b.trans_amt"
					+"  from T27_ALERT_trans b ,T27_ALERT a ,T07_MALERTSTCR_KY_TEMP1 c "
			        +" WHERE b.ALERTKEY=a.ALERTKEY  and  a.alertkey=c.alertkey and c.status_cd='1'";
			if(alertday.equals("0")){
				sql=sql+" and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-MM-dd");
			}

			   int  count = SQLExecute.exeSql(conn, sql);
			   conn.commit();
			   sql=" insert into T07_MALERTTRAN_KY_TEMP2(alertkey,ALERTTYPE,net_id,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,ACCT_NUM,stcr,alert_dt,status_cd,trans_amt)";
			   sql=sql+" select d.* from( select  a.alertkey,a.ALERTTYPE,c.net_id,c.net_id as objkey,a.CURR_CD,c.net_id as objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")+" as statisticdate,a.organkey,b.party_id,b.ACCT_NUM,a.pbckey,a.alert_dt,'"+status_cd+"',0"
				+"  from T27_ALERT_acct b ,T27_ALERT a ,T07_MALERTSTCR_KY_TEMP1 c  "
		        +" WHERE a.ALERTKEY=c.ALERTKEY and  b.alertkey=a.alertkey and c.status_cd='1'";
		        if(alertday.equals("0")){
					sql=sql+" and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-MM-dd");
				}
		        sql=sql+" ) d left join  T07_MALERTTRAN_KY_TEMP2 c on c.alertkey=d.alertkey  where c.alertkey is null ";

		     count = SQLExecute.exeSql(conn, sql);
		     conn.commit();
		     sql=" insert into T07_MALERTTRAN_KY_TEMP2(alertkey,ALERTTYPE,net_id,OBJKEY,CURR_CD,OBJPARTY_ID,STATISTIC_DT,organkey,party_id,stcr,alert_dt,status_cd,trans_amt)";
		     sql=sql+" select d.* from( select a.alertkey,a.ALERTTYPE,c.net_id,c.net_id as objkey,a.CURR_CD,c.net_id as objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")+" as statisticdate,a.organkey,b.party_id,a.pbckey,a.alert_dt,'"+status_cd+"',0"
				+"  from T27_ALERT_party b ,T27_ALERT a ,T07_MALERTSTCR_KY_TEMP1 c  "
		        +" WHERE b.ALERTKEY=a.ALERTKEY  and  a.alertkey=c.alertkey and c.status_cd='1'";
		        if(alertday.equals("0")){
					sql=sql+" and a.alert_dt="+func.vch2dt(statisticdate, "yyyy-MM-dd");
				}
		        sql=sql+" ) d left join  T07_MALERTTRAN_KY_TEMP2 c on c.alertkey=d.alertkey  where c.alertkey is null";

		     count = SQLExecute.exeSql(conn, sql);
		     conn.commit();
		     //交易金额最大的客户放入中间表
		      func.deleteTable(conn,"M13_net_party_day");
				
			
				sql=" INSERT INTO M13_net_party_day (net_id,party_id,trans_amt)"
			    +" select c.net_id,c.party_id,c.trans_amt from("
				+" select  t.net_id,t.party_id,t.trans_amt,ROW_NUMBER() OVER(PARTITION BY t.net_id ORDER BY t.trans_amt DESC) PK"
				+" from(  SELECT   n.objparty_id as net_id, n.party_id,sum(n.trans_amt) as trans_amt"
				+"     FROM T07_MALERTTRAN_KY_TEMP2 n where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-MM-dd")+"  group by  n.objparty_id, n.party_id) t )c where c.PK=1";
				SQLExecute.exeSql(conn, sql.toString());
				conn.commit();
		     
		     // 修改T07_MALERTTRAN_KY_TEMP2中的OBJPARTY_ID
		     sql="update T07_MALERTTRAN_KY_TEMP2 d set objparty_id=("
		    	 +" select tt.party_id from  M13_net_party_day  tt where tt.net_id=d.objparty_id)"
                 +" where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-MM-dd");
		    	 
		     
		     count = SQLExecute.exeSql(conn, sql);
		     
		
		return isSucc;
	}
	
	
	public boolean updateT07_MALERTTRAN_KY_TEMP2(Connection conn,String beforeday) throws Exception {

		boolean isSucc = true;
		 func.deleteTable(conn,"T27_MID_OBJ2");
			
			String sql=" INSERT INTO T27_MID_OBJ2 (OBJKEY,RULEKEY)"
		    +" select distinct t.objparty_id,'N'  "
			+"     FROM T07_MALERTTRAN_KY_TEMP2 t where status_cd='0' and  statistic_dt<="+func.vch2dt(beforeday, "yyyy-MM-dd");
			SQLExecute.exeSql(conn, sql.toString());
			conn.commit();
			String currdate=DateUtils.getCurrDate().replaceAll("-", "")+DateUtils.getHour(DateUtils.getCurrDateTime())+DateUtils.getMinute(DateUtils.getCurrDateTime());
		     // 修改T07_MALERTTRAN_KY_TEMP2中的状态和网络id
		      sql=" update T07_MALERTTRAN_KY_TEMP2 d set status_cd='1', objkey='"+currdate+"'||d.objparty_id "
		    	 +" where exists(select 'x'  from T27_MID_OBJ2 e where e.objkey=d.objparty_id) "
		    	 +"  and d.status_cd='0' ";
		     
		       SQLExecute.exeSql(conn, sql);
		    conn.commit();
		    
               
	       
	       
		
		return isSucc;
	}
	
	public int delT07_MALERTTRAN_KY_Bystatus(Connection conn,String tablename)  throws Exception {
		String sql = "delete  from  "+tablename+" a where a.STATUS_CD='1' ";
			
		int count = SQLExecute.exeSql(conn, sql);
		
		return count;
	}
	public int delT07_MALERTTRAN_KY_Bystatus(Connection conn,String tablename,String statisticdate)  throws Exception {
		String sql = "delete  from  "+tablename+" a where a.STATUS_CD='1' and STATISTIC_DT !="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			
		int count = SQLExecute.exeSql(conn, sql);
		
		return count;
	}
	
	public boolean updateT07_MALERTTRAN_KY_TEMP(Connection conn,String beforeday) throws Exception {

		boolean isSucc = true;
		 func.deleteTable(conn,"T27_MID_OBJ2");
			
			String sql=" INSERT INTO T27_MID_OBJ2 (OBJKEY,RULEKEY)"
					+" select  distinct t.objparty_id,'N' "
					+"     FROM T07_MALERTTRAN_KY_TEMP t where status_cd='0' and  statistic_dt<="+func.vch2dt(beforeday, "yyyy-MM-dd");
			SQLExecute.exeSql(conn, sql.toString());
			conn.commit();

		     // 修改T07_MALERTTRAN_KY_TEMP2中的状态和网络id
		      sql="update T07_MALERTTRAN_KY_TEMP d set status_cd='1' "
		    	 +"  where status_cd='0'  and exists(select 'x' from  T27_MID_OBJ2 t where d.objparty_id=t.OBJKEY) ";
		    
		   int   count = SQLExecute.exeSql(conn, sql);
		     
		
		return isSucc;
	}

   
	 /** add by liuchao 20170419 * 3号令新增方法 begin
	 * @throws SQLException */ 
	public ArrayList getT23_model_cond(Connection conn, String obj_type,String module_no) throws SQLException {
		// TODO Auto-generated method stub
		  StringBuffer sql = new StringBuffer();
		obj_type = "'" + obj_type + "'";
		sql.setLength(0);
		sql.append("SELECT                                                         ");
		 sql.append("  T.MODULE_NO,T1.KEY_STCR_K,T1.STCR_K_NO,T1.STCR_K_DES,T1.STCR_SCORE,T.CASE_MINSCORE ");
 		sql.append("FROM                                                           ");
		sql.append("  T23_RULE_MODULE T,                                       ");
		sql.append("   T23_MODULE_STCR_K T1                                           ");
		sql.append("WHERE                                                          ");
		sql.append("  T.MODULE_NO=T1.MODULE_NO      AND STATUS_CD='1'                                   ");
		sql.append("AND                                                            ");
		sql.append("  T.MODULE_GREY =                                                ");
		 sql.append(obj_type);
		 if(module_no!=null&&!module_no.equals("")){
			 sql.append(" AND T.MODULE_NO= '"+module_no+"'");	 
		 }
		logger.info(sql.toString());
		ArrayList<?> list = SQLExecute.executeQuery(conn, sql.toString(), null, new T23_rule_module());
		Iterator<?> modelIter = list.iterator();
		String fomula_exp = ""; // 表達式
		ArrayList<?> list1 = new ArrayList<Object>();
		while (modelIter.hasNext()) {
			T23_rule_module t23_rule_module = (T23_rule_module) modelIter.next();
			fomula_exp = t23_rule_module.getStcr_k_no();
			String fomula_exp_r = "";// 用逗號替換的表達式
			int fetr_cnt = 0;
			if (!fomula_exp.equals("")) {
				String[] fomula_Array = fomula_exp.split("&");
				for (int i = 0; i < fomula_Array.length; i++) {
					if (i == 0) {
						fomula_exp_r += "'" + fomula_Array[0] + "'";

					} else {
						fomula_exp_r += ",'" + fomula_Array[i] + "'";
					}
					fetr_cnt++;
				}

			}
			t23_rule_module.setFomula_exp_r(fomula_exp_r);
			t23_rule_module.setStcr_cnt(fetr_cnt);

		}
		return list;
	}
	public void dealModule1_new(Connection conn,String statisticdate,ArrayList multiList) throws Exception {
		  
		//模型分值表
		  String delsql= func.deleteTable("T07_MODULE_SCORE_TEMP");
		  int count = SQLExecute.exeSql(conn, delsql); 
		
		  
		    String sql="insert into T07_MODULE_SCORE_TEMP(net_id,module_no,sumscore)"
		    	  +" select a.net_id,b.module_no,sum(b.stcrscore) as sumscore"
		           +" from  (select distinct net_id,stcrkey from T07_MALERTSTCR_KY_TEMP1) a,t23_module_stcr b,t23_rule_module m"
		           +" where a.stcrkey=b.keystcr and b.module_no=m.module_no and m.module_grey='2'"
		           +" group by  a.net_id,b.module_no ";
			 count = SQLExecute.exeSql(conn, sql); 
			 conn.commit();
			 
	    //匹配分值
		String isql="update T07_MALERTSTCR_KY_TEMP1 set status_cd='1',alerttype='1' where (net_id,STCRKEY) in ("
		           +" select c.net_id,M.KEYSTCR "
		           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d,t23_module_stcr m"
		           +" where c.module_no=d.module_no and d.module_no=m.module_no and D.module_grey='2' and c.sumscore>=d.case_minscore)";
		
//		String isql="update T07_MALERTSTCR_KY_TEMP1 a set status_cd='1',alerttype='1' where exists("
//	           +" select  'x' from( "
//              +"               select d.module_no "
//              +"               from T07_MODULE_SCORE_TEMP c ,t23_rule_module d "
//              +"             where c.module_no=d.module_no  and c.sumscore>=d.case_minscore)b,t23_module_stcr e "
//              +"  where b.module_no=e.module_no and  e.keystcr=a.stcrkey ";
		
		 count = SQLExecute.exeSql(conn, isql);
		logger.debug("分值count::"+count);
          conn.commit();
          //插入模型分值表
          isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,SUMSCORE,CASE_DATE)"
	           +" select '3','1',c.MODULE_NO,c.NET_ID,c.SUMSCORE,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
	           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d "
		      +" where c.module_no=d.module_no  and D.module_grey='2' and c.sumscore>=d.case_minscore ";
	 count = SQLExecute.exeSql(conn, isql);
          
		 
		for (int i = 0; i < multiList.size(); i++) {
			T23_rule_module t23_rule_module = (T23_rule_module) multiList.get(i);
			int cond_seq =   Integer.parseInt(t23_rule_module.getKey_stcr_k())  ;
			int stcr_cnt = t23_rule_module.getStcr_cnt();
			String fomula_desc = t23_rule_module.getStcr_k_des();
			String fomula_exp_r = t23_rule_module.getFomula_exp_r();
			String fomula_exp = t23_rule_module.getStcr_k_no();
			double min_score =   Double.parseDouble(t23_rule_module.getCase_minscore());
			double module_score=Double.parseDouble(t23_rule_module.getStcr_score());

			String model_id = "'"+t23_rule_module.getModule_no()+"'";
			 
			sql="";
			sql="        update T07_MALERTSTCR_KY_TEMP1  T set status_cd='1',alerttype='2'         " +
					"  WHERE EXISTS(SELECT 1 FROM T07_MODULE_SCORE_TEMP T1 ,t23_module_stcr M            WHERE T.OBJPARTY_ID=T1.NET_ID            " +
					"  AND T1.SUMSCORE>="+module_score+"  AND T1.MODULE_NO=M.MODULE_NO AND M.KEYSTCR=T.STCRKEY           AND T1.MODULE_NO="+model_id+")             AND EXISTS(           " +
					"    SELECT 1 FROM                ( SELECT T2.OBJPARTY_ID,COUNT(DISTINCT T2.STCRKEY) AS STCR_CNT FROM T07_MALERTSTCR_KY_TEMP1 T2 " +
					"                WHERE  T2.STCRKEY IN ("+fomula_exp_r+")                GROUP BY T2.OBJPARTY_ID ) T2 WHERE T.OBJPARTY_ID=T2.OBJPARTY_ID              " +
					"    AND T2.STCR_CNT="+stcr_cnt+" ) AND T.STATUS_CD='0'             ";
			
			 
			SQLExecute.exeSql(conn, sql);
			conn.commit();		                        
			 //插入模型分值表
	          isql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,CASE_DATE)"
		           +" select  distinct '3','2',"+model_id+",objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
		           +" from T07_MALERTSTCR_KY_TEMP1 a left join T07_CASE_MODULE_SCORE b on b.net_id=a.objparty_id "
		           +" where a.status_cd='1' and a.alerttype='2' and b.net_id is null ";
		       count = SQLExecute.exeSql(conn, isql);		                                             

		}
	
	}



	public void dealModule_new(Connection conn, ArrayList multiList,
			String statisticdate,String module_no) throws Exception {
		// TODO Auto-generated method stub
		String delsql= func.deleteTable("T07_MODULE_SCORE_TEMP");
		  int count = SQLExecute.exeSql(conn, delsql); 
		
		  
		    String sql="insert into T07_MODULE_SCORE_TEMP(net_id,module_no,sumscore)"
		           +" select a.objparty_id,b.module_no,sum(b.stcrscore) as sumscore"
		           +" from (select distinct objparty_id,stcrkey from T07_MALERTSTCR_KY_TEMP) a,t23_module_stcr b"
		           +" where a.stcrkey=b.keystcr  and b.module_no='"+module_no+"'"
		           +" group by  a.objparty_id,b.module_no";
			 count = SQLExecute.exeSql(conn, sql); 
			 conn.commit();
		
		//查询出符合分值条件的
		 sql="update  T07_MALERTSTCR_KY_TEMP set status_cd='1',alerttype='1' where objparty_id in ("
		           +" select c.net_id "
		           +" from T07_MODULE_SCORE_TEMP c ,t23_rule_module d"
		           +" where c.module_no=d.module_no and c.sumscore>=d.case_minscore and d.module_no='"+module_no+"')";
		 count = SQLExecute.exeSql(conn, sql);
		logger.debug("修改模型分值记录数"+count);
		for (int i = 0; i < multiList.size(); i++) {
			T23_rule_module t23_rule_module = (T23_rule_module) multiList.get(i);
			int cond_seq =   Integer.parseInt(t23_rule_module.getKey_stcr_k())  ;
			int stcr_cnt = t23_rule_module.getStcr_cnt();
			String fomula_desc = t23_rule_module.getStcr_k_des();
			String fomula_exp_r = t23_rule_module.getFomula_exp_r();
			String fomula_exp = t23_rule_module.getStcr_k_no();
			double min_score =   Double.parseDouble(t23_rule_module.getCase_minscore());
			double module_score=Double.parseDouble(t23_rule_module.getStcr_score());

			String model_id = "'"+t23_rule_module.getModule_no()+"'";
			 
			sql="";
			sql="        update T07_MALERTSTCR_KY_TEMP  T set status_cd='1',alerttype='2'         " +
					"  WHERE EXISTS(SELECT 1 FROM T07_MODULE_SCORE_TEMP T1 ,t23_module_stcr M            WHERE T.OBJPARTY_ID=T1.NET_ID            " +
					"  AND T1.SUMSCORE>="+module_score+"  AND T1.MODULE_NO=M.MODULE_NO AND M.KEYSTCR=T.STCRKEY           AND T1.MODULE_NO="+model_id+")             AND EXISTS(           " +
					"    SELECT 1 FROM                ( SELECT T2.OBJPARTY_ID,COUNT(DISTINCT T2.STCRKEY) AS STCR_CNT FROM T07_MALERTSTCR_KY_TEMP T2 " +
					"                WHERE  T2.STCRKEY IN ("+fomula_exp_r+")                GROUP BY T2.OBJPARTY_ID ) T2 WHERE T.OBJPARTY_ID=T2.OBJPARTY_ID              " +
					"    AND T2.STCR_CNT="+stcr_cnt+" ) AND T.STATUS_CD='0'            ";
			
			 
			SQLExecute.exeSql(conn, sql);
			conn.commit();		                        
			 //插入模型分值表
			sql="insert into  T07_CASE_MODULE_SCORE(MODULETYPE,ALERTTYPE,MODULE_NO,NET_ID,CASE_DATE)"
		           +" select  distinct '2','2',"+model_id+",objparty_id,"+func.vch2dt(statisticdate, "yyyy-MM-dd")
		           +" from T07_MALERTSTCR_KY_TEMP a left join T07_CASE_MODULE_SCORE b on b.net_id=a.objparty_id "
		           +" where a.status_cd='1' and a.alerttype='2' and b.net_id is null ";
		       count = SQLExecute.exeSql(conn, sql);		                                             
		       
		}
	}
	public ArrayList getT23_model_cond_OBJ(Connection conn, String obj_type) throws SQLException {
		// TODO Auto-generated method stub
		  StringBuffer sql = new StringBuffer();
		obj_type = "'" + obj_type + "'";
		sql.setLength(0);
		sql.append("SELECT                                                         ");
		 sql.append("  T.MODULE_NO,STCR_S_NO  AS STCR_K_NO ");
 		sql.append("FROM                                                           ");
		sql.append("  T23_RULE_MODULE T,                                       ");
		sql.append("   T23_MODULE_STCR_S T1                                           ");
		sql.append("WHERE                                                          ");
		sql.append("  T.MODULE_NO=T1.MODULE_NO      AND STATUS_CD='1'                                   ");
		sql.append("AND                                                            ");
		sql.append("  T.MODULE_GREY =                                                ");
		 sql.append(obj_type +" ORDER BY T.MODULE_NO,KEY_STCR_S DESC");
		 
		logger.info(sql.toString());
		ArrayList<?> list = SQLExecute.executeQuery(conn, sql.toString(), null, new T23_rule_module());
		Iterator<?> modelIter = list.iterator();
		String fomula_exp = ""; // 表達式
		ArrayList<?> list1 = new ArrayList<Object>();
		while (modelIter.hasNext()) {
			T23_rule_module t23_rule_module = (T23_rule_module) modelIter.next();
			fomula_exp = t23_rule_module.getStcr_k_no();
			String fomula_exp_r = "";// 用逗號替換的表達式
			int fetr_cnt = 0;
			if (!fomula_exp.equals("")) {
				String[] fomula_Array = fomula_exp.split("&");
				for (int i = 0; i < fomula_Array.length; i++) {
					if (i == 0) {
						fomula_exp_r += "'" + fomula_Array[0] + "'";

					} else {
						fomula_exp_r += ",'" + fomula_Array[i] + "'";
					}
					fetr_cnt++;
				}

			}
			t23_rule_module.setFomula_exp_r(fomula_exp_r);
			t23_rule_module.setStcr_cnt(fetr_cnt);

		}
		return list;
	}
	
	 /** add by liuchao 20170419 * 3号令新增方法 end
	 * @throws SQLException */ 
	
}
