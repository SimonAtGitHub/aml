/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2010-12-14] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.lip.dao;

/**
 * <p>
 * T00_list_colsDAO.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.*;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.*;
import org.apache.struts.action.ActionForm;

import com.ist.aml.lip.dto.T00_list_cols;
import com.ist.aml.lip.dto.T10_pr_audit;
import com.ist.aml.report.dao.T07_BlacklistDAO;

import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.jcs.CatchManager;

import com.ist.util.StringUtils;
import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_lipDAO extends BaseDAO {
	private static Logger logger = LogUtils.getLogger(T07_lipDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T07_lipDAO() {
	}

	public String getT10_pr_auditVerson(SqlMapClient sqlMap,
			T10_pr_audit t10_pr_audit) throws SQLException {
		 String verson = (String) sqlMap.queryForObject( "getT10_pr_auditVersion", t10_pr_audit);
	      return verson;
	
	}
	public int insertT10_pr_audit(SqlMapClient sqlMap, T10_pr_audit t10_pr_audit)
	throws SQLException {
	int i = sqlMap.update("insertT10_pr_audit", t10_pr_audit);
	return i;
	}
	/**
	 * 取得列字符串，用于select查询的列字段(字段前带t1)
	 * 
	 * @param t00_list_cols_list
	 * @return
	 */
	public String getT00_list_cols_colkeys_t1(List t00_list_cols_list) {
		String colkeys = "";
		if (t00_list_cols_list == null)
			t00_list_cols_list = new ArrayList();
		for (int i = 0; i < t00_list_cols_list.size(); i++) {
			T00_list_cols temp = (T00_list_cols) t00_list_cols_list.get(i);
			if (temp == null)
				continue;

			if (i == t00_list_cols_list.size() - 1) {
				colkeys += "t1."+temp.getColkey();
			} else {
				colkeys += "t1."+temp.getColkey() + ",";
			}

		}
		return colkeys;
	}
	
	/**
	 * 
	 * 分页查询 并且 转码
	 * @param sqlMap
	 * @param sql
	 * @param iStartRec
	 * @param iPageSize
	 * @param keyCateMap 转码所需的colkey 与 category或 dicttype所对应 map
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT00_list_cols_resultList(SqlMapClient sqlMap,
			String sql, int iStartRec, int iPageSize,Map keyCateMap) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT00_list_cols_resultList", sql, iStartRec, iPageSize);
		if(keyCateMap==null) keyCateMap=new HashMap();
		ArrayList result = new ArrayList();
		Iterator iter = list.iterator();
		
		while (iter.hasNext()) {
			LinkedHashMap map = (LinkedHashMap) iter.next();
			List rowList = new ArrayList();
			Iterator lineIter = map.keySet().iterator();

			while (lineIter.hasNext()) {
				String key = (String) lineIter.next();
				String value = (String) map.get(key) == null ? "": (String) map.get(key);
				if(keyCateMap.containsKey(key)){
				String dicttype=(String)keyCateMap.get(key);
				
				LinkedHashMap categoryMap = cm.getMapFromCache(dicttype);
				value= (String)categoryMap.get(value) == null ? value: (String)categoryMap.get(value);
				
				}
				rowList.add(value);
				
			}
			result.add(rowList);
		}

		logger.debug("getT00_list_cols_resultList==" + result);

		return result;
	}
	
	/**
	 * 取得查询条件值
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	public Map getWhereConditionMap(HttpServletRequest request) {
		String newsearchflag = request.getParameter("newsearchflag");
		if (StringUtils.null2String(newsearchflag).equals("")) {
			return null;
		}
		Map map = new HashMap();

		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if (name == null)
				continue;
			
			String value = request.getParameter(name);
			
			if (StringUtils.null2String(value).equals(""))
				continue;
			//特殊处理
			if(name.endsWith("_disp"))
			{
				map.put(name, value);
			}
			// 过滤掉非当前页面的参数
			if (this.IsFilterParam(name))
				continue;
			
			map.put(name, value);
			
		}

		return map;
	}
	/**
	 * 是否是需要过滤的参数
	 * 
	 * @param param
	 * @return true 是 FALSE 否
	 */

	public boolean IsFilterParam(String param) {
		boolean filter = false;

		if (param.equalsIgnoreCase("newsearchflag")) {
			filter = true;
		} else if (param.equalsIgnoreCase("menu_id")) {
			filter = true;
		} else if (param.equalsIgnoreCase("where")) {
			filter = true;
		} else if (param.equalsIgnoreCase("tableend")) {
			filter = true;
		} else if (param.equalsIgnoreCase("tablecode")) {
			filter = true;
		} else if (param.equalsIgnoreCase("intpage")) {
			filter = true;
		} else if (param.equalsIgnoreCase("sort_column")) {
			filter = true;
		} else if (param.equalsIgnoreCase("sort_type")) {
			filter = true;
		} else if (param.startsWith("org.apache")) {
			filter = true;
		} else if (param.equalsIgnoreCase("ram")) {
			filter = true;
		}if (param.equalsIgnoreCase("selectkey")) {
			filter = true;
		}if (param.equalsIgnoreCase("com_ist_aml_hiddenFlag")) {
			filter = true;
		}
		if (param.endsWith("_disp")) {
			filter = true;
		}

		return filter;
	}
	
	/**
	 * 取得列字符串，用于select查询的列字段
	 * 
	 * @param t00_list_cols_list
	 * @return
	 */
	public String getT00_list_cols_colkeys(List t00_list_cols_list) {
		String colkeys = "";
		if (t00_list_cols_list == null)
			t00_list_cols_list = new ArrayList();
		for (int i = 0; i < t00_list_cols_list.size(); i++) {
			T00_list_cols temp = (T00_list_cols) t00_list_cols_list.get(i);
			if (temp == null)
				continue;

			if (i == t00_list_cols_list.size() - 1) {
				colkeys += temp.getColkey();
			} else {
				colkeys += temp.getColkey() + ",";
			}

		}
		return colkeys;
	}
	
	/**
	 * 取得查询条件
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	public String getWhereCondition(HttpServletRequest request) {
	
		String newsearchflag =StringUtils
				.null2String(request.getParameter("newsearchflag"));
		if (newsearchflag.equals("")) {
			return "";
		}
		
		StringBuffer cond = new StringBuffer();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			if (name == null)
				continue;

			if (this.IsFilterParam(name))
				continue;// 过滤掉非当前页面的参数
			String value = request.getParameter(name);
			if (StringUtils.null2String(value).equals(""))
				continue;

			if (name.toLowerCase().indexOf("_min") != -1) {// 日期情况,最小值
				name = name.substring(0, name.toLowerCase().indexOf("_min"));
				cond.append("AND " + name + " >= '" + value + "' ");
			} else if (name.toLowerCase().indexOf("_max") != -1) {// 日期情况,最大值
				name = name.substring(0, name.toLowerCase().indexOf("_max"));
				cond.append("AND " + name + " <= '" + value + "' ");
			} else if (value.indexOf(',') > 0) {
				String[] values = value.split(",");
				String temp="and (";
				for(int i=0;i<values.length;i++){
					if(i!=values.length-1){
						temp +=name +" like '%"+values[i]+"%' or ";
					}
					else{
						temp +=name +" like '%"+values[i]+"%') ";	
					}
				}
				
				cond.append(temp);
			} else {// 模糊查询
				
					cond.append("AND " + name + " like '%" + value + "%' ");
				
			}
		}

		return cond.toString();
	}
}
