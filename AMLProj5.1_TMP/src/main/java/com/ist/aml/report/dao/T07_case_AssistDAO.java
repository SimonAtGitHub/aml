package com.ist.aml.report.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_case_Assist;
import com.ist.aml.report.dto.T07_app_movefate;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;


public class T07_case_AssistDAO extends BaseDAO {
    private static Logger logger = LogUtils.getLogger(T07_case_AssistDAO.class.getName());

    /**
     * 构造函数
     */
    public T07_case_AssistDAO() {
    }
    public ArrayList getT07_case_AssistList(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist,int iStartRec,int iPageSize) throws SQLException {
    	ArrayList list = (ArrayList)sqlMap.queryForList("getT07_case_AssistList", t07_case_Assist,iStartRec,iPageSize);
    	
    	ArrayList alist=new ArrayList();
    	
        LinkedHashMap stockholderSortMap = cm.getMapFromCache("checkcasestatus");
        LinkedHashMap orgMap=cm.getMapFromCache("organ");
    	try{
	    	for(int i=0;i<list.size();i++){
	    		T07_case_Assist t07_case_Assist1=(T07_case_Assist)list.get(i);
	    		if(t07_case_Assist1.getStatus()!=null){
	    			t07_case_Assist1.setStatus_disp((String)stockholderSortMap.get(t07_case_Assist1.getStatus()));
	    		}
	    		if(t07_case_Assist1.getReq_organkey()!=null){
	    			t07_case_Assist1.setReq_orgname((String)orgMap.get(t07_case_Assist1.getReq_organkey()));
	    		}
	    		if(t07_case_Assist1.getDeal_organkey()!=null){
	    			t07_case_Assist1.setDeal_orgname((String)orgMap.get(t07_case_Assist1.getDeal_organkey()));
	    		}
	    		if(t07_case_Assist1.getReq_time()!=null){
	    			t07_case_Assist1.setReq_time_disp(DateUtils.dateToStringShort(t07_case_Assist1.getReq_time()));
	    		}
	    		if(t07_case_Assist1.getDeal_time()!=null){
	    			t07_case_Assist1.setDeal_time_disp(DateUtils.dateToStringShort(t07_case_Assist1.getDeal_time()));
	    		}
	    		
	    		alist.add(t07_case_Assist1);
	    	}
    	}catch(Exception e){
    		System.out.println("efff:"+e.getMessage());
    	}
    	return alist;
    }
    public int getT07_case_AssistListCount(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist) throws SQLException {
    	Integer count = (Integer)sqlMap.queryForObject("getT07_case_AssistListCount", t07_case_Assist);
    	return count.intValue();
    }
    public ArrayList getT07_case_tranOrganList(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist) throws SQLException {
    	ArrayList list = (ArrayList)sqlMap.queryForList("getT07_case_tranOrganList", t07_case_Assist);
    	return list;
    }
    public ArrayList getT07_case_acctOrganList(SqlMapClient sqlMap, String acctStr) throws SQLException {
    	ArrayList list = (ArrayList)sqlMap.queryForList("getT07_case_acctOrganList", acctStr);
    	return list;
    }
     
    public int getMaxReqQueue(SqlMapClient sqlMap,T07_case_Assist t07_case_Assist) throws SQLException {
    	Integer i = (Integer)sqlMap.queryForObject("getMaxREQ_QUEUE", t07_case_Assist);
    	if(i!=null)
    		return i.intValue();
    	else
    		return 0;
    }
    
    
    public int insertT07_Case_Assist(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist) throws SQLException {
    	int i = sqlMap.update("insertT07_case_Assist", t07_case_Assist);
    	return i;
    }
    
    public T07_case_Assist getT07_Case_Assist_disp(SqlMapClient sqlMap, String assitno) throws SQLException {
    	T07_case_Assist t07_case_Assist = (T07_case_Assist)sqlMap.queryForObject("getT07_case_Assist_disp", assitno);
    	
         LinkedHashMap orgMap=cm.getMapFromCache("organ");
        if(t07_case_Assist.getReq_organkey()!=null){
        	t07_case_Assist.setReq_orgname((String)orgMap.get(t07_case_Assist.getReq_organkey()));
		}
		if(t07_case_Assist.getReq_time()!=null){
			t07_case_Assist.setReq_time_disp(DateUtils.dateToStringShort(t07_case_Assist.getReq_time()));
		}
    	return t07_case_Assist;
    }
    
    
    public int updateT07_Case_Assist(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist) throws SQLException {
    	int i = sqlMap.update("updateT07_case_Assist", t07_case_Assist);
    	return i;
    }
    public int delT07_Case_Assist(SqlMapClient sqlMap, T07_case_Assist t07_case_Assist) throws SQLException {
    	int i = sqlMap.update("delT07_case_Assist", t07_case_Assist);
    	return i;
    } 
    public int getValidated_transactionListCount(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
	
		Integer	iCount = (Integer) sqlMap.queryForObject(
				"getT07_transacionListkyCount", t47_transaction);
	
		
		return iCount.intValue();
	}
    public ArrayList getValidatedT47_case_transactionList(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize) throws SQLException {

		//System.out.println("交易处理状态还没有数据,本应查找处理状态为处理中的预警! =================以后修改=================");
		String alert_type = t47_transaction.getAlert_type();
	
		ArrayList	 list = (ArrayList) sqlMap.queryForList(
				"getT07_transacionkyList", t47_transaction,iStartRec,iPageSize);
		
		Iterator iter = list.iterator();
		ArrayList list1=new ArrayList();

		
		LinkedHashMap validateMap = cm.getMapFromCache("yesNo");
//		 机构
		LinkedHashMap organMap= cm.getMapFromCache("organ");
		
		
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		
		//币种
		LinkedHashMap currcdMap = cm.getMapFromCache("curr_cd");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		
		while (iter.hasNext()) {
			t47_transaction = (T47_transaction) iter.next();
			t47_transaction.setAlert_type(alert_type);
			// 把货币转换成标准格式
			MoneyUtils mUtils=new MoneyUtils(); 
			
			if(t47_transaction.getAmt()!=null)
			{
				String amt_money=mUtils.FormatMoney(t47_transaction.getAmt().doubleValue());
				t47_transaction.setAmt_string(amt_money);
			}

			
	        
						
			//抹帐标志
			//LinkedHashMap  cancelMap = cm.getMapFromCache("cancel_ind", true);
			
			String organkey=t47_transaction.getOrgankey();
			//机构信息
			if(organkey !=null && !organkey.equals(""))
			{
				t47_transaction.setOrganName((String)organMap.get(organkey));
			}
			
	        // 交易日期
			if(t47_transaction.getTx_dt()!=null){
			t47_transaction.setTx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getTx_dt()));
			}
									
						
	       //借贷标志
			String debit_credit = t47_transaction.getDebit_credit();
		
			if (debit_credit != null && !"".equals(debit_credit)) {

				t47_transaction.setDebit_credit_disp((String) trackflagMap
						.get(debit_credit));
			}
			
			//币种
			String currency_cd=t47_transaction.getCurrency_cd();
			if(currency_cd!=null && !currency_cd.equals("") )
			{
				t47_transaction.setCurrency_cd_disp((String)currcdMap.get(currency_cd));
			}
						
			//抹帐标志
		/*	String cancle_ind=t47_transaction.getCancel_ind();
			if (cancle_ind != null && !"".equals(cancle_ind)) {

				t47_transaction.setCancel_ind_disp((String)cancelMap.get(cancle_ind));
			}*/
			
			//	交易类型
			String tx_type="";
			if (t47_transaction.getTx_type_cd() != null
					&& !"".equals(t47_transaction.getTx_type_cd())) {
				tx_type=(String)tradetypeMap.get(t47_transaction.getTx_type_cd());
				t47_transaction.setTx_type_cd_disp(tx_type);
			}
			 	t47_transaction.setValidate_ind(t47_transaction.getValidate_ind2());
		           if(!"1".equals(t47_transaction.getValidate_ind2())){
		        	   t47_transaction.setValidate_ind("0");
		           }
		           if(t47_transaction.getValidate_ind2()!=null && !t47_transaction.getValidate_ind2().equals("")){
		        	   t47_transaction.setValidate_ind_disp((String)validateMap.get(t47_transaction.getValidate_ind()));
		           }
		        list1.add(t47_transaction);

	         }
	
		return list1;
	}
   
   
}
