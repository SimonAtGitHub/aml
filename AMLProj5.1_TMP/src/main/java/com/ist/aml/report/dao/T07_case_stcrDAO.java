/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-27   青蛙		创建  
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
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T07_node;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;

public class T07_case_stcrDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7120003086595844789L;
	private static Logger logger = LogUtils.getLogger(T07_case_stcrDAO.class
			.getName());

	/** 
	 * 构造函数 
	 */
	public T07_case_stcrDAO() {
	}



	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_node T07_node 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_stcr_ky(SqlMapClient sqlMap, T07_case_stcr t07_case_stcr)
			throws SQLException {
		int i = sqlMap.update("insertT07_case_stcr_ky", t07_case_stcr);
		return i;
	}
	
	public int insertT07_case_stcr_ky1(SqlMapClient sqlMap, T07_case_stcr t07_case_stcr)
	throws SQLException {
int i = sqlMap.update("insertT07_case_stcr_ky1", t07_case_stcr);
return i;
}


	public int insertT07_case_stcr_de(SqlMapClient sqlMap, T07_case_stcr t07_case_stcr)
	throws SQLException {
	int i = sqlMap.update("insertT07_case_stcr_de", t07_case_stcr);
	return i;
}
}
