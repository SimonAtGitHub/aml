/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2009-02-02] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.offs_report.dao;

/**
 * <p>T07_recordDAO.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.*;
import java.sql.*;

import org.apache.log4j.*;

//import com.ist.common.util.*;  
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dto.T00_user;

import com.ist.util.DateUtils;
import com.ist.aml.offs_report.dto.*;
import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_recordDAO extends BaseDAO {

	/**
	 * 构造函数
	 */
	public T07_recordDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_record
	 *            T07_record
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_recordList(SqlMapClient sqlMap,
			T07_record t07_record, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_recordList",
				t07_record, iStartRec, iPageSize);
		ArrayList t07_recordList = new ArrayList();
		LinkedHashMap organ = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_record record = (T07_record) iter.next();
			if (record == null)
				continue;
			if (record.getCreate_dt() != null) {
				record.setCreate_dt_disp(DateUtils.dateToStringShort(record
						.getCreate_dt()));
			}
			if (record.getCreate_end_dt() != null) {
				record.setCreate_end_dt_disp(DateUtils.dateToStringShort(record
						.getCreate_end_dt()));
			}
			record.setOrgankey((String) organ.get(record.getOrgankey()));
			t07_recordList.add(record);
		}
		return t07_recordList;
	}

	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t00_user
	 *            T00_user
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_recordListCount(SqlMapClient sqlMap, T07_record t07_record)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_recordListCount", t07_record);
		return iCount.intValue();
	}

	/**
	 * 取得列表（不分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_record
	 *            T07_record
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_recordList(SqlMapClient sqlMap,
			T07_record t07_record) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_recordList",
				t07_record);
		ArrayList t07_recordList = new ArrayList();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_record record = (T07_record) iter.next();
			if (record == null)
				continue;
			if (record.getCreate_dt() != null) {
				record.setCreate_dt_disp(DateUtils.dateToStringShort(record
						.getCreate_dt()));
			}
			if (record.getCreate_end_dt() != null) {
				record.setCreate_end_dt_disp(DateUtils.dateToStringShort(record
						.getCreate_end_dt()));
			}
			// record.setOrgankey((String)organ.get(record.getOrgankey()));
			t07_recordList.add(record);
		}
		return t07_recordList;
	}

	/**
	 * 取配合任何调查的汇总信息
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Record_id
	 *            String
	 * @throws SQLException
	 * @return T07_record
	 */
	public T07_record getT07_recordsum(SqlMapClient sqlMap,
			T07_record t07_record, XMLProperties sysconfig) throws SQLException {
		String databaseType = sysconfig.getProperty("database.dbtype");
		T07_record t07_recordsum = null;
		if ("DB2".equalsIgnoreCase(databaseType)) {
			t07_recordsum = (T07_record) sqlMap.queryForObject(
					"getT07_recordsumdb2", t07_record);

		} else {
			t07_recordsum = (T07_record) sqlMap.queryForObject(
					"getT07_recordsum", t07_record);

		}
		//
		if (t07_recordsum == null)
			t07_recordsum = new T07_record();
		String amt = ".00";
		String amt1 = "0.00";
		String sum = "0";
		if (t07_recordsum.getRemark6() != null
				&& !t07_recordsum.getRemark6().equals("")) {
			if (t07_recordsum.getRemark6().indexOf(".") == -1) {
				t07_recordsum.setRemark6(t07_recordsum.getRemark6() + amt);
			} else if (t07_recordsum.getRemark6().indexOf(".") == 0) {
				t07_recordsum.setRemark6(sum + t07_recordsum.getRemark6());
			}
			int ind = t07_recordsum.getRemark6().indexOf(".");
			if (t07_recordsum.getRemark6().substring(ind).length() == 2) {
				t07_recordsum.setRemark6(t07_recordsum.getRemark6() + sum);
			}
		} else {
			t07_recordsum.setRemark6(amt1);
		}
		if (t07_recordsum.getRemark8() != null
				&& !t07_recordsum.getRemark8().equals("")) {
			if (t07_recordsum.getRemark8().indexOf(".") == -1) {
				t07_recordsum.setRemark8(t07_recordsum.getRemark8() + amt);
			} else if (t07_recordsum.getRemark8().indexOf(".") == 0) {
				t07_recordsum.setRemark8(sum + t07_recordsum.getRemark8());
			}
			int ind = t07_recordsum.getRemark8().indexOf(".");
			if (t07_recordsum.getRemark8().substring(ind).length() == 2) {
				t07_recordsum.setRemark8(t07_recordsum.getRemark8() + sum);
			}
		} else {
			t07_recordsum.setRemark8(amt1);
		}
		if (t07_recordsum.getRemark10() != null
				&& !t07_recordsum.getRemark10().equals("")) {
			if (t07_recordsum.getRemark10().indexOf(".") == -1) {
				t07_recordsum.setRemark10(t07_recordsum.getRemark10() + amt);
			} else if (t07_recordsum.getRemark10().indexOf(".") == 0) {
				t07_recordsum.setRemark10(sum + t07_recordsum.getRemark10());
			}
			int ind = t07_recordsum.getRemark10().indexOf(".");
			if (t07_recordsum.getRemark10().substring(ind).length() == 2) {
				t07_recordsum.setRemark10(t07_recordsum.getRemark10() + sum);
			}
		} else {
			t07_recordsum.setRemark10(amt1);
		}
		if (t07_recordsum.getRemark12() != null
				&& !t07_recordsum.getRemark12().equals("")) {
			if (t07_recordsum.getRemark12().indexOf(".") == -1) {
				t07_recordsum.setRemark12(t07_recordsum.getRemark12() + amt);
			} else if (t07_recordsum.getRemark12().indexOf(".") == 0) {
				t07_recordsum.setRemark12(sum + t07_recordsum.getRemark12());
			}
			int ind = t07_recordsum.getRemark12().indexOf(".");
			if (t07_recordsum.getRemark12().substring(ind).length() == 2) {
				t07_recordsum.setRemark12(t07_recordsum.getRemark12() + sum);
			}
		} else {
			t07_recordsum.setRemark12(amt1);
		}
		if (t07_recordsum.getRemark4() != null
				&& !t07_recordsum.getRemark4().equals("")) {
		} else {
			t07_recordsum.setRemark4(sum);
		}
		if (t07_recordsum.getRemark5() != null
				&& !t07_recordsum.getRemark5().equals("")) {
		} else {
			t07_recordsum.setRemark5(sum);
		}
		if (t07_recordsum.getRemark7() != null
				&& !t07_recordsum.getRemark7().equals("")) {
		} else {
			t07_recordsum.setRemark7(sum);
		}
		if (t07_recordsum.getRemark9() != null
				&& !t07_recordsum.getRemark9().equals("")) {
		} else {
			t07_recordsum.setRemark9(sum);
		}
		if (t07_recordsum.getRemark11() != null
				&& !t07_recordsum.getRemark11().equals("")) {
		} else {
			t07_recordsum.setRemark11(sum);
		}
		return t07_recordsum;
	}

	/**
	 * 内部审计结论信息
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Record_id
	 *            String
	 * @throws SQLException
	 * @return T07_record
	 */
	public T07_record getT07_recordor(SqlMapClient sqlMap, T07_record t07_record)
			throws SQLException {
		T07_record t07_recordor = (T07_record) sqlMap.queryForObject(
				"getT07_recordor", t07_record);
		if (t07_recordor == null)
			t07_recordor = new T07_record();
		LinkedHashMap remarkMap = cm.getMapFromCache("remark");
		if (!t07_recordor.getRemark4().equals("")
				&& t07_recordor.getRemark4() != null) {
			t07_recordor.setRemark4((String) remarkMap.get(t07_recordor
					.getRemark4()));
		}
		if (!t07_recordor.getRemark5().equals("")
				&& t07_recordor.getRemark5() != null) {
			t07_recordor.setRemark5((String) remarkMap.get(t07_recordor
					.getRemark5()));
		}
		if (!t07_recordor.getRemark6().equals("")
				&& t07_recordor.getRemark6() != null) {
			t07_recordor.setRemark6((String) remarkMap.get(t07_recordor
					.getRemark6()));
		}
		if (!t07_recordor.getRemark7().equals("")
				&& t07_recordor.getRemark7() != null) {
			t07_recordor.setRemark7((String) remarkMap.get(t07_recordor
					.getRemark7()));
		}
		if (!t07_recordor.getRemark8().equals("")
				&& t07_recordor.getRemark8() != null) {
			t07_recordor.setRemark8((String) remarkMap.get(t07_recordor
					.getRemark8()));
		}
		if (!t07_recordor.getRemark9().equals("")
				&& t07_recordor.getRemark9() != null) {
			t07_recordor.setRemark9((String) remarkMap.get(t07_recordor
					.getRemark9()));
		}
		if (!t07_recordor.getRemark10().equals("")
				&& t07_recordor.getRemark10() != null) {
			t07_recordor.setRemark10((String) remarkMap.get(t07_recordor
					.getRemark10()));
		}
		return t07_recordor;
	}

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_record
	 *            T07_record
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_record(SqlMapClient sqlMap, T07_record t07_record)
			throws SQLException {
		int i = sqlMap.update("insertT07_record", t07_record);
		return i;
	}

	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Record_id
	 *            String
	 * @throws SQLException
	 * @return T07_record
	 */
	public T07_record getT07_recordDisp(SqlMapClient sqlMap, String record_id)
			throws SQLException {
		T07_record t07_record = (T07_record) sqlMap.queryForObject(
				"getT07_recordDisp", record_id);
		if (t07_record == null)
			t07_record = new T07_record();
		return t07_record;
	}

	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_record
	 *            T07_record
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_record(SqlMapClient sqlMap, T07_record t07_record)
			throws SQLException {
		int i = sqlMap.update("modifyT07_record", t07_record);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Record_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_record(SqlMapClient sqlMap, String record_id)
			throws SQLException {
		int i = sqlMap.update("deleteT07_record", record_id);
		return i;
	}

}
