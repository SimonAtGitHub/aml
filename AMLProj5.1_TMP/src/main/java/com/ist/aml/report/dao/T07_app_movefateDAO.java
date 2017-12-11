/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-27   青蛙		创建  
 */

package com.ist.aml.report.dao;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_app_movefate;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;

public class T07_app_movefateDAO extends BaseDAO {


	/**
	 * 构造函数
	 */
	public T07_app_movefateDAO() {
	}
	
	
	public int modifyT07_app_movefate(SqlMapClient sqlMap,
			T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("modifyT07_app_movefate", t07_app_movefate);
		return i;
	}
	public int insertT07_app_movefate(SqlMapClient sqlMap,
			T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("insertT07_app_movefate", t07_app_movefate);
		return i;
	}
	public ArrayList checkCurr_oper_id(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_checkCurr_oper_id", credittask);

		return list;
	}
	
	public T07_app_movefate getT07_app_movefateDisp(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		T07_app_movefate t07_app_movefate = (T07_app_movefate) sqlMap
				.queryForObject("getT07_app_movefateDisp", credittask);
		if (t07_app_movefate == null)
			t07_app_movefate = new T07_app_movefate();
		return t07_app_movefate;
	}
	
	public int getT07_app_moveftSeqNum(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_app_moveftSeqNum", credittask);
		return iCount.intValue();
	}


}
