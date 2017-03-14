/*
 * Created on Sep 21, 2006
 * 
 * This class is a simple Job which prints out execution time with its trigger's name
 */
package com.ist.common;


import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;






import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



import com.ibatis.sqlmap.client.SqlMapClient;





import com.ist.aml.information.dto.T07_Supervise_msg;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;

import com.ist.platform.dao.T07_writeoper_totalDao;



/**
 */
public class WorkJob {
	 public XMLProperties sysConfig = null;
	   
	    public XMLProperties getSysConfig() {
		return sysConfig;
	}


	public void setSysConfig(XMLProperties sysConfig) {
		this.sysConfig = sysConfig;
	}


	public CatchManager getCm() {
		return cm;
	}


	public void setCm(CatchManager cm) {
		this.cm = cm;
	}
		public CatchManager cm = null;
	    
	    public SqlMapClient sqlMap = null;
    public SqlMapClient getSqlMap() {
			return sqlMap;
		}


		public void setSqlMap(SqlMapClient sqlMap) {
			this.sqlMap = sqlMap;
		}





    public void executeWork() throws Exception {

       
        try{
        	
        	String dbtype= sysConfig.getProperty("database.dbtype");
        	
        	ArrayList list=new ArrayList();
        	T07_writeoper_totalDao t07_writeoperDao=new T07_writeoper_totalDao(sysConfig);
        	//删除统计表
        	String sql=t07_writeoperDao.deleteT07_writeoper_total("T07_writeoper_total");
        	 sqlMap.update("updateSQL", sql); 	
        	//统计第一次交易补录的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_tran();
        	 list.add(sql);
        	//统计第二次交易补录大额的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_rtran("validate_ind","1","DE");
        	 list.add(sql);
//        	统计第二次交易补录可疑的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_rtran("validate_ind2","2","KY");
        	 list.add(sql);
        	 sql=t07_writeoperDao.insertT07_writeoper_rtran1();
        	 list.add(sql);
        	 //统计正常客户补录的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_nparty("validate_ind","1","DE");
        	 list.add(sql);
        	 sql=t07_writeoperDao.insertT07_writeoper_nparty("validate_ind2","2","KY");
        	 list.add(sql);
        	 sql=t07_writeoperDao.insertT07_writeoper_party();
        	 list.add(sql);
        	 //统计错误交易补录的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_errortran("1","t07_nbh_tsdt");
        	 list.add(sql);
        	 sql=t07_writeoperDao.insertT07_writeoper_errortran("1","t07_ibh_tsdt");
        	 list.add(sql);
        	 sql=t07_writeoperDao.insertT07_writeoper_errortran("2","");
        	 list.add(sql);
        	 //统计错误客户补录的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_errorparty("1");
        	 list.add(sql);
         	 sql=t07_writeoperDao.insertT07_writeoper_errorparty("2");
        	 list.add(sql);
        	 //统计错误账户补录的数量
        	 sql=t07_writeoperDao.insertT07_writeoper_errorAcct();
        	 list.add(sql);
        	 for(int i=0;i<list.size();i++){
        		String str=(String)list.get(i) ;
        		 int count=sqlMap.update("updateSQL", str); 
        		
        	 }
        	 
        	 //统计正常案例的数量
        	 int count=t07_writeoperDao.insertT07_writeoper_ncase(sqlMap,"'N','A'", "7");
        	 count=t07_writeoperDao.updateT07_writeoper_ncase1( sqlMap,"7", "'N','A'");
        	 count=t07_writeoperDao.updateT07_writeoper_ncase2(sqlMap,"7");
        	
        	 //统计特殊案例的数量
        	 count=t07_writeoperDao.insertT07_writeoper_ncase(sqlMap,"'C','D'", "8"); 
        	 count=t07_writeoperDao.updateT07_writeoper_ncase1(sqlMap,"8", "'C','D'");
        	 count=t07_writeoperDao.updateT07_writeoper_ncase2(sqlMap,"8");
        	
        	 //统计正常报告的数量
        	 count=t07_writeoperDao.insertT07_writeoper_report(sqlMap,"'N','A'", "9");
        	 count=t07_writeoperDao.updateT07_writeoper_report( sqlMap,"9", "'N','A'");
        	 count=t07_writeoperDao.updateT07_writeoper_ncase2(sqlMap,"9");
             //统计特殊报告的数量
        	 count=t07_writeoperDao.insertT07_writeoper_report(sqlMap,"'C','D','I'", "10");
        	 count=t07_writeoperDao.updateT07_writeoper_report(sqlMap, "10", "'C','D','I'");
        	 count=t07_writeoperDao.updateT07_writeoper_ncase2(sqlMap, "10");
             //统计数据包为下载和回执的数量
        	 count=t07_writeoperDao.insertT07_writeoper_packet(sqlMap, "11","'1'",dbtype);
        	 count=t07_writeoperDao.insertT07_writeoper_packet1(sqlMap);
             //统计高风险未调整的数量
        	 count=t07_writeoperDao.insertT07_writeoper_risk(sqlMap);

        	 LinkedHashMap organMap=cm.getMapFromCache("organ");
             T07_Supervise_msg t07_supervise_msg=new T07_Supervise_msg();
             Iterator iter=organMap.keySet().iterator();
             while(iter.hasNext()){
            	 String organkey=(String)iter.next();
            	 String organkeys = "SELECT SUBORGANKEY FROM T87_ORGAN_MAP WHERE ORGANKEY='"+organkey+"'";
         		  t07_supervise_msg.setOrgankeys(organkeys);
         		  cm.sysCodeTable2ListCatchByOrgankey(sqlMap, t07_supervise_msg, "getT07_Writeoper_totalList", organkey);
             }
////           删除统计表
//            sql=t07_writeoperDao.deleteT07_writeoper_total("T07_RISTAUDIT_TOTAL");
//         	 sqlMap.update("updateSQL", sql); 	
//             //统计未调整的客户风险评级机构数
//             count=t07_writeoperDao.insertT07_riskaudit_total(sqlMap);
//    			
       
        }catch(Exception e){
        	e.printStackTrace();
        }
        
    }
}
