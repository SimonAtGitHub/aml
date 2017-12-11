/*
 * Created on Sep 21, 2006
 * 
 * This class is a simple Job which prints out execution time with its trigger's name
 */
package com.ist.common;


import java.io.Reader;

import java.util.ArrayList;
import java.util.Date;




import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.bo.T07_FlowBo;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;



/**
 */
public class MyJob_UpdateCase  {
	 private static Logger logger = LogUtils.getLogger(MyJob_UpdateCase.class.getName());
	 
	


	
	    public SqlMapClient sqlMap = null;
 public SqlMapClient getSqlMap() {
			return sqlMap;
		}


		public void setSqlMap(SqlMapClient sqlMap) {
			this.sqlMap = sqlMap;
		}

    public MyJob_UpdateCase() {
    }

    public void executeCase()throws Exception {
       
        String query = "";
      //  Reader reader =null;
        try{
        	
/*//        	// 1 清理案例验证中间表
    		query = "DELETE FROM T07_CASE_VALIDATE";
    		 int count=sqlMap.update("updateSQL", query); 
    		logger.debug("删除T07_CASE_VALIDATE表记录数:" + count);

    		// 2 将需要验证的案例编号写入t07_case_validate,当日案例和一个月时间内验证状态为0的
    		query = "INSERT INTO T07_CASE_VALIDATE (APPLICATION_NUM,CASE_TYPE) "
    				+ "SELECT T.APPLICATION_NUM,T.CAST_TYPE "
    				+ "FROM T07_CASE_APPLICATION T "
    				+ "WHERE T.APP_STATE_CD='1'"
    				+ "AND T.CASE_KIND IN  ('N','A') "
    				+ "AND (T.VALIDATE_IND = '0' OR T.VALIDATE_IND IS NULL OR "
				    + "T.VALIDATE_IND = '')";
    		count = sqlMap.update("updateSQL", query); 
    	 
    		logger.debug("插入T07_CASE_VALIDATE表待验证记录数:" + count);

    		// 3 根据交易验证状态更新validate_ind(分别更新大额,可疑案例)
    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT CASE WHEN COUNT(B.TRANSACTIONKEY) > 0 "
    				+ "THEN '0' ELSE '1' END FROM T07_CASE_TRANSACTION A,T47_TRANSACTION_UC B "
    				+ "WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY AND A.APPLICATION_NUM=T.APPLICATION_NUM "
    				+ "AND A.STATUS_CD!='4'" //已排除预警包含的交易
    				+ "AND (B.VALIDATE_IND !='1' OR B.VALIDATE_IND IS NULL)) WHERE T.CASE_TYPE='1'";
    		count = sqlMap.update("updateSQL", query); 
    		 
    		logger.debug("更新大额交易验证标志记录数:" + count);

    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT CASE WHEN COUNT(B.TRANSACTIONKEY) > 0 "
    				+ "THEN '0' ELSE '1' END FROM T07_CASE_TRANSACTION A,T47_TRANSACTION_UC B "
    				+ "WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY AND A.APPLICATION_NUM=T.APPLICATION_NUM "
    				+ "AND A.STATUS_CD!='4'" //已排除预警包含的交易
    				+ "AND (B.VALIDATE_IND2 !='1' OR B.VALIDATE_IND2 IS NULL)) WHERE T.CASE_TYPE='2'";
    		count = sqlMap.update("updateSQL", query); 
    		 
    		logger.debug("更新可疑交易验证标志记录数:" + count);

    		// 4 根据客户验证状态更新validate_ind2
    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT CASE WHEN COUNT(B.PARTY_ID) > 0 "
    				+ "THEN '0' ELSE '1' END FROM T07_CASE_PARTY A,T47_PARTY_UC B "
    				+ "WHERE A.PARTY_ID=B.PARTY_ID AND A.APPLICATION_NUM=T.APPLICATION_NUM "
    				+ "AND A.STATUS_CD!='1' "//已排除预警包含的客户
    				+ "AND (B.VALIDATE_IND !='1' OR B.VALIDATE_IND IS NULL)) "
    				+ "WHERE T.CASE_TYPE='1'";
    		count = sqlMap.update("updateSQL", query); 
    	 
    		logger.debug("更新大额客户验证标志记录数:" + count);

    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT CASE WHEN COUNT(B.PARTY_ID) > 0 "
    				+ "THEN '0' ELSE '1' END FROM T07_CASE_PARTY A,T47_PARTY_UC B "
    				+ "WHERE A.PARTY_ID=B.PARTY_ID AND A.APPLICATION_NUM=T.APPLICATION_NUM "
    				+ "AND A.STATUS_CD!='1' "//已排除预警包含的客户
    				+ "AND (B.VALIDATE_IND2 !='1' OR B.VALIDATE_IND2 IS NULL)) "
    				+ "WHERE T.CASE_TYPE='2'";
    		count = sqlMap.update("updateSQL", query); 
    		 
    		logger.debug("更新可疑客户验证标志记录数:" + count);

    		// 5 根据validate_ind和validate_ind2更新t07_case_application
    		query = " UPDATE T07_CASE_APPLICATION T SET T.VALIDATE_IND=( SELECT CASE WHEN A.VALIDATE_IND='1' "
    				+ "AND A.VALIDATE_IND2='1' THEN '1' ELSE '0' END FROM T07_CASE_VALIDATE A "
    				+ "WHERE A.APPLICATION_NUM=T.APPLICATION_NUM ) WHERE EXISTS (SELECT 'A' "
    				+ "FROM T07_CASE_VALIDATE B WHERE T.APPLICATION_NUM=B.APPLICATION_NUM) ";
    		count = sqlMap.update("updateSQL", query); 
    	 
    		logger.debug("更新案例表验证标志记录数:" + count);*/
        	
        	T07_FlowBo t07_flowbo=new T07_FlowBo();
        	ArrayList list=new ArrayList();
        	 list=t07_flowbo.t07_caseValidate(list,"");
    	    for(int i=0;i<list.size();i++){
    	    	query=(String)list.get(i);
    	    	int count = sqlMap.update("updateSQL", query); 
    	    }
       
        }catch(Exception e){
        	e.printStackTrace();
        }
        finally {
            try {
            	//sqlMap.endTransaction();
            	// reader.close();
            }
            catch (Exception e) {

            }
        }
    }
}
