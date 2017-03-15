package com.ist.onlineserver.cal.aml.dao;



import java.sql.Connection;

import com.ist.common.database.SQLExecute;
import com.ist.common.properties.SysConfig;
import com.ist.common.properties.XMLProperties;
import com.ist.common.util.DateUtils;


public class T07_writeoper_totalDao {

	public T07_writeoper_totalDao( ){
		
	}
	public String  deleteT07_writeoper_total(String tablename)throws Exception{
		String sql="delete from  "+tablename;
		return sql;
	}
	public String insertT07_writeoper_tran()throws Exception{
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,party_class_cd,uporgankey,total_num,nooper_num,oper_num) ";
		sql=sql+"  select c.tx_dt,c.organkey,'1',c.party_class_cd,'',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
             +" from("
             +" select a.tx_dt,a.organkey,a.party_class_cd,count(a.transactionkey) as total_num"
             +" from T47_Transaction_Ub a"
             +" group by a.tx_dt,a.organkey,a.party_class_cd) c,(select b.tx_dt,b.organkey,b.party_class_cd,count(b.transactionkey) as nooper_num"
                                               +" from T47_Transaction_Ub b"
                                               +" where b.ADDTIONAL='0'"
                                               +" group by b.tx_dt,b.organkey,b.party_class_cd) d"
             +" where c.tx_dt=d.tx_dt"
             +" and c.organkey=d.organkey  and c.party_class_cd=d.party_class_cd";
	
		return sql;
	}

	public String insertT07_writeoper_rtran1()throws Exception{
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,total_num,nooper_num,oper_num,modifydate) ";
		sql=sql+"  select c.tx_dt,c.organkey,'21',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num,'"
             +DateUtils.getCurrTime()+"' from("
             +" select   a.tx_dt ,a.organkey,count(distinct a.transactionkey) as total_num"
             +" from T47_Transaction_UC  a where   a.handle_status_cd='1'";
		   
		sql=sql+" group by a.tx_dt,a.organkey) c,(select b.tx_dt,b.organkey,count(distinct b.transactionkey) as nooper_num"
                                               +" from T47_Transaction_UC b"
                                               +" where  (b.validate_ind='0' or b.validate_ind2='0')  and b.handle_status_cd='1'";                                   
                                               sql=sql+" group by b.tx_dt,b.organkey) d "
             +" where c.tx_dt=d.tx_dt  "
             +" and c.organkey=d.organkey ";
		return sql;
	}
	
	public String insertT07_writeoper_rtran(String validate_type,String case_type,String alert_type)throws Exception{
		String sql="insert into T07_writeoper_total(tx_dt,date_dt,organkey,type,party_class_cd,uporgankey,case_type,total_num,nooper_num,oper_num,modifydate) ";
		sql=sql+"  select c.tx_dt,c.case_date,c.organkey,'2',c.party_class_cd,'','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num,'"
             +DateUtils.getCurrTime()+"' from("
             +" select   a.tx_dt , e.case_date,a.organkey,a.party_class_cd,count(distinct a.transactionkey) as total_num"
             +" from T47_Transaction_UC  a,t07_case_transaction_"+alert_type+" e where  a.transactionkey=e.transactionkey and  a."+validate_type+" in('0','1') and a.handle_status_cd='1' and e.STATUS_CD='1' ";
		if(case_type.equals("1")){
			sql=sql+" and (a.validate_ind2 is null or a.validate_ind2='')";
		}       
		sql=sql+" group by a.tx_dt,e.case_date,a.organkey,a.party_class_cd) c,(select b.tx_dt,f.case_date ,b.organkey,b.party_class_cd,count(distinct b.transactionkey) as nooper_num"
                                               +" from T47_Transaction_UC b,t07_case_transaction_"+alert_type+" f"
                                               +" where b.transactionkey=f.transactionkey and  b."+validate_type+"='0' and b.handle_status_cd='1' and f.STATUS_CD='1'";
                                               if(case_type.equals("1")){
                                       			sql=sql+" and (b.validate_ind2 is null or b.validate_ind2='')";
                                       		  }                                        
                                               sql=sql+" group by b.tx_dt,f.case_date,b.organkey,b.party_class_cd) d "
             +" where c.tx_dt=d.tx_dt and c.case_date=d.case_date "
             +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
		return sql;
	}
	
	public String insertT07_writeoper_errortran(String case_type,String tablename)throws Exception{
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,party_class_cd,uporgankey,case_type,total_num,nooper_num,oper_num) ";
		//判断数据库类型

		String dbtype = SysConfig.getProperty("database.dbtype");
		if(case_type.equals("1")){
			if(dbtype!=null && dbtype.toLowerCase().equals("oracle")){
				sql=sql+"  select "+this.getDateStr("substr(c.tx_dt,1,8)")+",c.organkey,'4',c.party_class_cd,'','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
	             +" from("
	             +" select b.organkey as organkey,a.pbc_crt_dt as tx_dt ,a.party_class_cd,count( a.ticd) as total_num"
	             +" from "+tablename+" a ,t47_transaction_uc  b where a.ticd=b.transactionkey and  a.errors_type in('1','2')"
	             +" group by b.organkey ,a.pbc_crt_dt,a.party_class_cd) c,(select b.organkey as organkey,a.pbc_crt_dt as tx_dt ,a.party_class_cd,count( a.ticd) as nooper_num"
	                                                                 +" from "+tablename+" a ,t47_transaction_uc  b where a.ticd=b.transactionkey and a.validate_ind='0' and a.errors_type in('1','2') "
	                                                                +" group by b.organkey ,a.pbc_crt_dt,a.party_class_cd) d"
	             +" where c.tx_dt=d.tx_dt"
	             +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
			}
			if(dbtype!=null && dbtype.toLowerCase().equals("db2")){
				sql=sql+"  select date(substr(c.tx_dt,1,4)||'-'||substr(c.tx_dt,5,2)||'-'||substr(c.tx_dt,7,2))"+",c.organkey,'4',c.party_class_cd,'','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
	             +" from("
	             +" select b.organkey as organkey,a.pbc_crt_dt as tx_dt ,a.party_class_cd,count( a.ticd) as total_num"
	             +" from "+tablename+" a ,t47_transaction_uc  b where a.ticd=b.transactionkey and  a.errors_type in('1','2')"
	             +" group by b.organkey ,a.pbc_crt_dt,a.party_class_cd) c,(select b.organkey as organkey,a.pbc_crt_dt as tx_dt ,a.party_class_cd,count( a.ticd) as nooper_num"
	                                                                 +" from "+tablename+" a ,t47_transaction_uc  b where a.ticd=b.transactionkey and a.validate_ind='0' and a.errors_type in('1','2') "
	                                                                +" group by b.organkey ,a.pbc_crt_dt,a.party_class_cd) d"
	             +" where c.tx_dt=d.tx_dt"
	             +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
			}
		
		}else{
			if(dbtype!=null && dbtype.toLowerCase().equals("oracle")){
				sql=sql+"  select "+this.getDateStr("substr(c.tx_dt,1,8)")+",c.organkey,'4',c.party_class_cd,'','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num  as oper_num"
	            +" from("
	            +" select  c.organkey as organkey, a.pbc_crt_dt as tx_dt,a.party_class_cd,count( a.ticd) as total_num"
	            +" from t07_nbs_rpdi a,t07_nbs_rbif b, t47_transaction_uc c  where a.reportkey=b.reportkey and  a.ticd=c.transactionkey and   a.errors_type in('1','2')"
	            +"  group by c.organkey,a.pbc_crt_dt,a.party_class_cd) c,(select c.organkey as organkey, a.pbc_crt_dt as tx_dt,a.party_class_cd,count( a.ticd) as nooper_num"
	                                              +" from t07_nbs_rpdi a,t07_nbs_rbif b , t47_transaction_uc c  where a.reportkey=b.reportkey and  a.ticd=c.transactionkey and  a.reportkey=b.reportkey and "
	                                              +"  a.validate_ind='0' and   a.errors_type in('1','2') " 
	                                              +" group by c.organkey,a.pbc_crt_dt,a.party_class_cd) d"
	            +" where c.tx_dt=d.tx_dt"
	            +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
			}
			if(dbtype!=null && dbtype.toLowerCase().equals("db2")){
				sql=sql+"  select date(substr(c.tx_dt,1,4)||'-'||substr(c.tx_dt,5,2)||'-'||substr(c.tx_dt,7,2)) "+",c.organkey,'4',c.party_class_cd,'','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num  as oper_num"
	            +" from("
	            +" select  c.organkey as organkey, a.pbc_crt_dt as tx_dt,a.party_class_cd,count( a.ticd) as total_num"
	            +" from t07_nbs_rpdi a,t07_nbs_rbif b, t47_transaction_uc c  where a.reportkey=b.reportkey and  a.ticd=c.transactionkey and   a.errors_type in('1','2')"
	            +"  group by c.organkey,a.pbc_crt_dt,a.party_class_cd) c,(select c.organkey as organkey, a.pbc_crt_dt as tx_dt,a.party_class_cd,count( a.ticd) as nooper_num"
	                                              +" from t07_nbs_rpdi a,t07_nbs_rbif b , t47_transaction_uc c  where a.reportkey=b.reportkey and  a.ticd=c.transactionkey and  a.reportkey=b.reportkey and "
	                                              +"  a.validate_ind='0' and   a.errors_type in('1','2') " 
	                                              +" group by c.organkey,a.pbc_crt_dt,a.party_class_cd) d"
	            +" where c.tx_dt=d.tx_dt"
	            +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
			}
			
		}
		return sql;
	}
	
	public String insertT07_writeoper_nparty(String validate_type,String case_type,String alerttype )throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,party_class_cd,uporgankey,type,case_type,total_num,nooper_num,oper_num) ";
		sql=sql+"  select c.case_date,c.organkey,c.party_class_cd,'','3','"+case_type+"',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
             +" from("
             +"  select e.case_date, a.organkey,a.party_class_cd ,count(distinct a.party_id) as total_num"
             +"  from t47_party_uc a,t07_case_stcr_"+alerttype+" e  where a.party_id=e.party_id and a."+validate_type+" in('0','1')";
             if(case_type.equals("1")){
     			sql=sql+" and (a.validate_ind2 is null or a.validate_ind2='')";
     		}   
             sql=sql+"  group by e.case_date,a.organkey,a.party_class_cd)c,(select e.case_date,a.organkey,a.party_class_cd,count(distinct a.party_id) as nooper_num"
                                   +" from  t47_party_uc a,t07_case_stcr_"+alerttype+" e"
                                   +" where a.party_id=e.party_id and a."+validate_type+"='0'";
             if(case_type.equals("1")){
      			sql=sql+" and (a.validate_ind2 is null or a.validate_ind2='')";
      		 } 
             sql=sql+" group by  e.case_date,a.organkey,a.party_class_cd)d"
             +" where  c.case_date=d.case_date and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd ";
	
		return sql;
	}
public String insertT07_writeoper_party()throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,total_num,nooper_num,oper_num) ";
		sql=sql+"  select c.case_date,c.organkey,'31',c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
             +" from("
             +"  select  "+this.getCurrDateStr("")+" as case_date, a.organkey,count(distinct a.party_id) as total_num"
             +"  from t47_party_uc a";
             
             sql=sql+"  group by a.organkey)c,(select a.organkey,count(distinct a.party_id) as nooper_num"
                                   +" from  t47_party_uc a"
                                   +" where a.validate_ind='0' or a.validate_ind2='0'";
           
             sql=sql+" group by  a.organkey)d"
             +" where  c.organkey=d.organkey ";
	
		return sql;
	}
	public String insertT07_writeoper_errorparty(String case_type)throws Exception{
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,uporgankey,case_type,party_class_cd,total_num,nooper_num,oper_num) ";
		if(case_type.equals("1")){
		sql=sql+"  select  "+this.getDateStr("substr(c.pbc_crt_dt,1,8)")+",c.organkey,'5','','1',c.cttp,c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
             +" from("
             +" select b.CREATE_ORG as organkey,a.pbc_crt_dt,a.cttp,count(distinct a.csnm) as total_num"
             +" from (select csnm, case when CITP='19' or CITP='29' then 'C'  else 'I'  end as cttp,pbc_crt_dt ,reportkey,errors_type  from T07_NBH_CTIF) A, T07_REPORT B where A.REPORTKEY = B.REPORTKEY and  a.errors_type in('1','2')  "
             +" group by b.CREATE_ORG,a.cttp,a.pbc_crt_dt) c,(select b.CREATE_ORG as organkey,a.pbc_crt_dt,a.cttp,count( distinct a.csnm) as nooper_num"
             +"                                   from (select csnm, case when CITP='19' or CITP='29' then 'C'  else 'I'  end as cttp,pbc_crt_dt ,reportkey,errors_type,validate_ind  from T07_NBH_CTIF) A, T07_REPORT B where A.REPORTKEY = B.REPORTKEY and  a.validate_ind='0'  "
                                              +" group by b.CREATE_ORG,a.cttp,a.pbc_crt_dt) d"
             +" where  c.organkey=d.organkey and c.pbc_crt_dt=d.pbc_crt_dt  and c.cttp=d.cttp  ";
		}else{
		sql=sql+"  select "+this.getDateStr("substr(c.pbc_crt_dt,1,8)")+",c.organkey,'5','','2',case when c.cttp='02' then 'I' else 'C' end,c.total_num,case when (d.nooper_num is null ) then 0 else  d.nooper_num end  as nooper_num,c.total_num-d.nooper_num as oper_num"
            +" from("
            +" select b.CREATE_ORG as organkey,a.pbc_crt_dt,a.cttp,count(distinct a.csnm) as total_num"
            +" from T07_NBS_CTIF A, T07_REPORT B where A.REPORTKEY = B.REPORTKEY and  a.errors_type in('1','2') "
            +" group by b.CREATE_ORG,a.cttp,a.pbc_crt_dt) c,(select b.CREATE_ORG as organkey,a.pbc_crt_dt,a.cttp,count(distinct a.csnm) as nooper_num"
            +"                                   from  T07_NBS_CTIF A, T07_REPORT B where A.REPORTKEY = B.REPORTKEY and  a.validate_ind='0'  "
                                             +" group by b.CREATE_ORG,a.cttp,a.pbc_crt_dt) d "
            +" where  c.organkey=d.organkey and c.pbc_crt_dt=d.pbc_crt_dt  and c.cttp=d.cttp  ";
		
		}
		return sql;
	}
	public String insertT07_writeoper_errorAcct()throws Exception{
	
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,uporgankey,case_type,party_class_cd,total_num,nooper_num,oper_num) ";
		sql=sql+"  select "+this.getCurrDateStr("")+",c.organkey,'6','','2',case when c.cttp='02' then 'I' else 'C' end as cttp,c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
             +" from("
             +" select e.pbc_crt_dt, e.cttp,b.CREATE_ORG as organkey, count(distinct a.ctac) as total_num"
             +" from t07_nbs_atif a,t07_nbs_ctif e , t07_report b"
             +" where a.reportkey=b.reportkey and e.reportkey=a.reportkey and a.ctif_seqno=e.ctif_seqno  and a.errors_type in('1','2') "
             +"  group by b.CREATE_ORG,e.pbc_crt_dt,e.cttp) c,"
             +" (select e.pbc_crt_dt,e.cttp, b.CREATE_ORG as organkey, count(distinct a.ctac) as nooper_num"
             +" from t07_nbs_atif a,t07_nbs_ctif e ,t07_report b"
             +" where a.reportkey=b.reportkey and e.reportkey=a.reportkey and a.ctif_seqno=e.ctif_seqno  and a.validate_ind = '0'"
             +" group by b.CREATE_ORG,e.pbc_crt_dt,e.cttp) d"
            +"  where c.organkey = d.organkey and c.pbc_crt_dt=d.pbc_crt_dt and c.cttp=d.cttp";
     
		
		return sql;
	}
	public int insertT07_writeoper_ncase(Connection conn,String case_kind,String totaltype)throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,case_type,party_class_cd,post_id,validate_dt,nooper_num) ";
		sql=sql+"  select a.case_date,a.app_org_id,'"+totaltype+"',a.cast_type,a.party_class_cd, "
		       +"     case when a.post_id='P0102' or a.post_id='P0302' then '1'"
               +"           when a.post_id='P0103' or a.post_id='P0303' then '2'"
               +"           when a.post_id='P0104' or a.post_id='P0304' then '3'"
               +"     end  as postid ,a.case_end_date,count(a.application_num) as nooper_num"
               +"   from t07_case_application a"
               +"    where a.case_kind in("+case_kind+") and a.app_state_cd in('1') and a.post_id is not null "
               +"     group by a.case_date,a.app_org_id,a.cast_type,a.post_id,a.case_end_date,a.party_class_cd";
		 int count = SQLExecute.exeSql(conn, sql);
		return count;
	}
	public int updateT07_writeoper_ncase1(Connection conn,String totaltype,String case_kind)throws Exception{
		
		String sql="update T07_writeoper_total c set total_num=(select count(a.application_num)"
                   +"                             from t07_case_application a"
                   +"                             where a.app_org_id=c.organkey "
                   +"                                 and a.cast_type=c.case_type"
                   +"                                 and c.date_dt=a.case_date and a.party_class_cd=c.party_class_cd"
                   +"                                  and a.case_kind in("+case_kind+"))"                                  
                   +" where c.type='"+totaltype+"'";
		 int count=SQLExecute.exeSql(conn, sql);
			return count;
	}
	public int updateT07_writeoper_ncase2(Connection conn,String totaltype)throws Exception{
		
		String sql="update T07_writeoper_total c set oper_num=total_num-nooper_num"                                        
                   +" where c.type='"+totaltype+"'";
          
		 int count=SQLExecute.exeSql(conn, sql);
			return count;
	}
	
	public int insertT07_writeoper_report(Connection conn,String report_kind,String totaltype)throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,nooper_num) ";
		sql=sql+"     select a.data_dt,a.create_org,'"+totaltype+"',count(a.reportkey)"
               +"     from  t07_report a"
               +"      where a.pbc_msg_type_cd in("+report_kind+")"
               +"      and a.report_status_cd in('1','3')"
               +" group by a.data_dt,a.create_org";
		
		int count=SQLExecute.exeSql(conn, sql);
		return count;
	}
	public int updateT07_writeoper_report(Connection conn,String totaltype,String report_kind)throws Exception{
		
		String sql="update T07_writeoper_total c set total_num=(select count(a.reportkey)"
                   +"                             from t07_report a"
                   +"                             where a.create_org=c.organkey"
                   +"                                 and c.date_dt=a.data_dt "
                   +"                             and a.pbc_msg_type_cd in("+report_kind+") )"                                 
                   +" where c.type='"+totaltype+"'";
		
		int count=SQLExecute.exeSql(conn, sql);
		return count;
	}
	public int insertT07_writeoper_packet(Connection conn,String totaltype,String packetstatus,String dbtype)throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,nooper_num) ";
		String currdate="";
		if(dbtype!=null && dbtype.toLowerCase().equals("oracle")){
    		currdate="to_date(c.SENDDATE_CH,'yyyy-mm-dd')";
    	}
    	if(dbtype!=null && dbtype.toLowerCase().equals("db2")){
    		currdate="date(substr(c.SENDDATE_CH,1,4)||'-'||substr(c.SENDDATE_CH,5,2)||'-'||substr(c.SENDDATE_CH,7,2))";
    	}
		
		sql=sql+"    select "+currdate+", a.inner_organkey,'"+totaltype+"', count(c.packetkey)"
               +"     from  t07_packet c,t07_report_organ a"
               +"      where c.reportorgankey=a.report_organkey and  c.packet_status_cd in("+packetstatus+")"
               +"  group by c.SENDDATE_CH, a.inner_organkey";
		
		int count=SQLExecute.exeSql(conn, sql);
		return count;
	}
public int insertT07_writeoper_packet1(Connection conn)throws Exception{
		
		String sql="insert into T07_writeoper_total(date_dt,organkey,type,nooper_num) ";
		sql=sql+"    select "+this.getCurrDateStr("")+",a.create_org,'12',count(a.reportkey) "
               +"     from t07_report a"
               +"     where a.report_status_cd in('3','4') group by a.create_org";
             
		int count=SQLExecute.exeSql(conn, sql);
		return count;
	}
	
public int insertT07_riskaudit_total(Connection conn)throws Exception{
		
		String sql="insert into T07_RISTAUDIT_TOTAL(ORGANKEY,NOOPER_NUM,MODIFYDATE) ";
		
		
		sql=sql+"    SELECT ORGANKEY,COUNT(RESULEKEY)  AS NOOPER_NUM,'"+DateUtils.getCurrTime()+"'"
               +" FROM T08_PARTY_RESULT WHERE  MODIFY_CD='0'GROUP BY ORGANKEY";
             
		int count=SQLExecute.exeSql(conn, sql);
		return count;
	}
public int insertT07_writeoper_risk(Connection conn)throws Exception{
	
	String sql="insert into T07_writeoper_total(date_dt,organkey,type,party_class_cd,total_num,nooper_num,oper_num) ";
	sql=sql+"  select c.tx_dt,c.organkey,'13',c.party_class_cd,c.total_num,d.nooper_num as nooper_num,c.total_num-d.nooper_num as oper_num"
         +" from("
         +" SELECT organkey,create_dt as tx_dt,party_class_cd,count(RESULEKEY) as total_num"
         +" from T37_PARTY_RESULT  where FRISTAPPRALEVEL>='1004'"
         +" group by ORGANKEY,create_dt,party_class_cd) c,(SELECT organkey,create_dt as tx_dt,party_class_cd,count(RESULEKEY) as nooper_num"
                                           +" from T37_PARTY_RESULT "
                                           +" where MODIFY_CD='0' and FRISTAPPRALEVEL>='1004'"
                                           +" group by ORGANKEY,create_dt,party_class_cd) d"
         +" where c.tx_dt=d.tx_dt"
         +" and c.organkey=d.organkey and c.party_class_cd=d.party_class_cd";

	int count=SQLExecute.exeSql(conn, sql);
	return count;
}

public String getCurrDateStr(String  currdate){
	if(currdate==null || currdate.equals("")){
     currdate=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
	}
	String dbtype = SysConfig.getProperty("database.dbtype");
	if(dbtype!=null && dbtype.toLowerCase().equals("oracle")){
		currdate="to_date('"+currdate+"','yyyy-mm-dd')";
	}
	if(dbtype!=null && dbtype.toLowerCase().equals("db2")){
		
		currdate="date('"+currdate+"')";
	}
	return currdate;
}
public String getDateStr(String  currdate){
	if(currdate==null || currdate.equals("")){
     currdate=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
     currdate="'"+currdate+"'";
	}
	String dbtype = SysConfig.getProperty("database.dbtype");
	if(dbtype!=null && dbtype.toLowerCase().equals("oracle")){
		currdate="to_date("+currdate+",'yyyy-mm-dd')";
	}
	if(dbtype!=null && dbtype.toLowerCase().equals("db2")){
		currdate="date("+currdate+")";
	}
	return currdate;
}
	
   
   
	
}
