/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2007-04-03   青蛙		创建  
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
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_alert_attach;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;

public class T07_alert_attachDAO extends BaseDAO {
	/**
		 * 
		 */
	private static final long serialVersionUID = -914324236882504280L;
	private static Logger logger = LogUtils.getLogger(T07_alert_attachDAO.class
			.getName());

	/** 
	 * 构造函数 
	 */
	public T07_alert_attachDAO() {
	}

	/** 
	 * 取得列表（可分页）  
	 * @param sqlMap SqlMapClient 
	 * @param t07_alert_attach T07_alert_attach 
	 * @param iStartRec int   
	 * @param iPageSize int   
	 * @throws SQLException   
	 * @return ArrayList 
	 */
	public ArrayList getT07_alert_attachList(SqlMapClient sqlMap,
			T07_alert_attach t07_alert_attach, int iStartRec, int iPageSize,ApplicationContext context)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_alert_attachList", t07_alert_attach, iStartRec,
				iPageSize);
		ArrayList t07_alert_attachList = new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		 String rootPath =sysConfig.getProperty("data.import");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_alert_attach t07_alert_attach1 = (T07_alert_attach) iter.next();
			if (t07_alert_attach1.getLoad_date() != null) {
				t07_alert_attach1.setLoad_date_disp(DateUtils
						.dateToStringShort(t07_alert_attach1.getLoad_date()));
			}
			if(t07_alert_attach1.getAttach_name()!=null &&!t07_alert_attach1.getAttach_name().equals("")){
				t07_alert_attach1.setAttach_name(rootPath+t07_alert_attach1.getAttach_name());
			}
			t07_alert_attachList.add(t07_alert_attach1);
		}
		return t07_alert_attachList;
	}

	public ArrayList getT07_alert_attachList(SqlMapClient sqlMap,
			T07_alert_attach t07_alert_attach,ApplicationContext context) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_alert_attachList", t07_alert_attach);
		ArrayList t07_alert_attachList = new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		 String rootPath =sysConfig.getProperty("data.import");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_alert_attach t07_alert_attach1 = (T07_alert_attach) iter.next();
			if (t07_alert_attach1.getLoad_date() != null) {
				t07_alert_attach1.setLoad_date_disp(DateUtils
						.dateToStringShort(t07_alert_attach1.getLoad_date()));
			}
			if(t07_alert_attach1.getAttach_name()!=null && !t07_alert_attach1.getAttach_name().equals("")){
				t07_alert_attach1.setAttach_name(rootPath+t07_alert_attach1.getAttach_name());
			}
			t07_alert_attachList.add(t07_alert_attach1);
		}
		return t07_alert_attachList;
	}

	/** 
	 * 取得记录总数 
	 * @param sqlMap SqlMapClient 
	 * @param t07_alert_attach T07_alert_attach 
	 * @throws SQLException   
	 * @return int  
	 */
	public int getT07_alert_attachListCount(SqlMapClient sqlMap,
			T07_alert_attach t07_alert_attach) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_alert_attachListCount", t07_alert_attach);
		return iCount.intValue();
	}

	/** 
	 * 取单条明细操作 
	 * @param sqlMap SqlMapClient 
	 * @param Application_num String  
	 * @throws SQLException   
	 * @return T07_alert_attach  
	 */
	public T07_alert_attach getT07_alert_attachDisp(SqlMapClient sqlMap,
			String application_num) throws SQLException {
		T07_alert_attach t07_alert_attach = (T07_alert_attach) sqlMap
				.queryForObject("getT07_alert_attachDisp", application_num);
		if (t07_alert_attach == null)
			t07_alert_attach = new T07_alert_attach();
		return t07_alert_attach;
	}
	public T07_alert_attach getT07_alert_attachDispByAttachkey(SqlMapClient sqlMap,
			String attachkey) throws SQLException {
		T07_alert_attach t07_alert_attach = (T07_alert_attach) sqlMap
				.queryForObject("getT07_alert_attachDispByAttachkey", attachkey);
		if (t07_alert_attach == null)
			t07_alert_attach = new T07_alert_attach();
		return t07_alert_attach;
	}
	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_alert_attach T07_alert_attach 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_alert_attach(SqlMapClient sqlMap,
			T07_alert_attach t07_alert_attach) throws SQLException {
		int i = sqlMap.update("insertT07_alert_attach", t07_alert_attach);
		return i;
	}

	/** 
	 * 修改操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_alert_attach T07_alert_attach 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT07_alert_attach(SqlMapClient sqlMap,
			T07_alert_attach t07_alert_attach) throws SQLException {
		int i = sqlMap.update("modifyT07_alert_attach", t07_alert_attach);
		return i;
	}

	/** 
	 * 删除操作 
	 * @param sqlMap SqlMapClient 
	 * @param Application_num String  
	 * @throws SQLException   
	 * @return int  
	 */
	public int deleteT07_alert_attach(SqlMapClient sqlMap,
			String attachkey) throws SQLException {
		int i = sqlMap.update("deleteT07_alert_attach", attachkey);
		return i;
	}

	/** 
	 * 删除操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_alert_attach T07_alert_attach
	 * @throws SQLException   
	 * @return int  
	 */
	public int deleteT07_alert_attach(SqlMapClient sqlMap, T07_alert_attach attach) throws SQLException {
		int i = sqlMap.update("deleteT07_alert_attach1", attach);
		return i;
	}

	public T07_alert_attach getT07_alert_attachDisp(SqlMapClient sqlMap, T07_alert_attach t07AlertAttach) throws SQLException {
		T07_alert_attach t07_alert_attach = (T07_alert_attach) sqlMap.queryForObject("getT07_alert_attachDisp1", t07AlertAttach);
		if (t07_alert_attach == null)
			t07_alert_attach = new T07_alert_attach();
		return t07_alert_attach;
	}
}
