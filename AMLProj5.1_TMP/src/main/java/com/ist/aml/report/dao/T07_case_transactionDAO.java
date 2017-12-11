/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2007-12-05   青蛙		创建  
 */

package com.ist.aml.report.dao;

/** 
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>  
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2003 - 2006</p>  
 * <p>Company: 北京银丰新融科技开发有限公司</p>  
 * @author 研发组   
 * @version 1.0  
 */

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_case_transaction;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;

public class T07_case_transactionDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7444183209526751787L;
	private static Logger logger = LogUtils
			.getLogger(T07_case_transactionDAO.class.getName());

	/** 
	 * 构造函数 
	 */
	public T07_case_transactionDAO() {
	}

	/** 
	 * 取得列表（可分页）  
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @param iStartRec int   
	 * @param iPageSize int   
	 * @throws SQLException   
	 * @return ArrayList 
	 */
	public ArrayList getT07_case_transactionList(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction, int iStartRec,
			int iPageSize) throws SQLException {
		/*        ArrayList list = (ArrayList)sqlMap.queryForList("getT07_case_transactionList",t07_case_transaction,iStartRec,iPageSize); */
		ArrayList t07_case_transactionList = new ArrayList();
		//CatchManager cm = CatchManager.getInstance();
		//TreeMap flagMap = cm.getColumnCatch("flag",true);
		//Iterator iter = t07_case_transactionList.iterator();
		//while(iter.hasNext()){
		//T07_case_transaction t07_case_transaction = (T07_case_transaction)iter.next();
		//t07_case_transaction.setFlag_disp( (String)flagMap.get( t07_case_transaction.getFlag() )  );
		//t07_case_transaction.setCreatedate_disp( DateUtils.dateToString( t07_case_transaction.getCreatedate() ) );
		//    t07_case_transactionList1.add(t07_case_transaction);
		//}
		return t07_case_transactionList;
	}

	/** 
	 * 取得记录总数 
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int getT07_case_transactionListCount(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_case_transactionListCount", t07_case_transaction);
		return iCount.intValue();
	}

	/** 
	 * 取单条明细操作 
	 * @param sqlMap SqlMapClient 
	 * @param Application_num String  
	 * @throws SQLException   
	 * @return T07_case_transaction  
	 */
	public T07_case_transaction getT07_case_transactionDisp(
			SqlMapClient sqlMap, T07_case_transaction t07_case_transaction1) throws SQLException {
		T07_case_transaction t07_case_transaction = (T07_case_transaction) sqlMap
				.queryForObject("getT07_case_transactionDisp", t07_case_transaction1);
		if (t07_case_transaction == null)
			t07_case_transaction = new T07_case_transaction();
		return t07_case_transaction;
	}
	public T07_case_transaction getT07_case_transactionDisp(
			SqlMapClient sqlMap, String application_num) throws SQLException {
		T07_case_transaction t07_case_transaction = (T07_case_transaction) sqlMap
				.queryForObject("getT07_case_transactionDisp", application_num);
		if (t07_case_transaction == null)
			t07_case_transaction = new T07_case_transaction();
		return t07_case_transaction;
	}

	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_transaction(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_transaction",
				t07_case_transaction);
		return i;
	}

	/** 
	 * 插入操作 2
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_transaction_ky(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_transaction_ky",
				t07_case_transaction);
		return i;
	}
	/** 
	 * 大额插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_transaction_de(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_transaction_de",
				t07_case_transaction);
		return i;
	}
	/** 
	 * 插入操作 liangchy 案例审批成功，写入案例和交易的关系信息
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_tran(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_tran", t07_case_transaction);
		return i;
	}

	/** 
	 * 修改操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_transaction T07_case_transaction 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT07_case_transaction(SqlMapClient sqlMap,
			T07_case_transaction t07_case_transaction) throws SQLException {
		int i = sqlMap.update("modifyT07_case_transaction",
				t07_case_transaction);
		return i;
	}

	/** 
	 * 删除操作 
	 * @param sqlMap SqlMapClient 
	 * @param Application_num String  
	 * @throws SQLException   
	 * @return int  
	 */
	public int deleteT07_case_transaction(SqlMapClient sqlMap,
			String application_num) throws SQLException {
		int i = sqlMap.update("deleteT07_case_transaction", application_num);
		return i;
	}
}
