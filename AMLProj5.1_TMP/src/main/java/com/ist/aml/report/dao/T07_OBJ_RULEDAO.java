/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2009-06-23   青蛙		创建  
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

import java.util.*;
import java.sql.*;

import org.apache.log4j.*;

import com.ist.util.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.jcs.*;
import com.ist.aml.report.dto.*;
import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_OBJ_RULEDAO extends BaseDAO {
	private static Logger logger = LogUtils.getLogger(T07_OBJ_RULEDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T07_OBJ_RULEDAO() {
	}

	/**
	 * 取得列表
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_OBJ_RULE_blackList(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap
				.queryForList("getT07_OBJ_RULE_blackList", t07_obj_rule,
						iStartRec, iPageSize);
		ArrayList t07_obj_ruleList = new ArrayList();
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		// start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

		LinkedHashMap ischeckforpartyMap = new LinkedHashMap();

		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		if ("1".equals(t87_sysparaMap.get("404"))) {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty0");
		} else {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty");
		}

		// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_OBJ_RULE t07_obj_rule1 = (T07_OBJ_RULE) iter.next();
			if (t07_obj_rule1.getParty_class_cd() != null) {
				t07_obj_rule1.setParty_class_cd((String) list_typeMap
						.get(t07_obj_rule1.getParty_class_cd()));
			}
			if (t07_obj_rule1.getIsuse() != null) {
				t07_obj_rule1.setIsuse((String) isuseMap.get(t07_obj_rule1
						.getIsuse()));
			}
			if (t07_obj_rule1.getOrgankey() != null) {
				t07_obj_rule1.setOrgankey((String) organMap.get(t07_obj_rule1
						.getOrgankey()));
			}
			t07_obj_rule1.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_obj_rule1.getCreate_dt()));

			// start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作
			if (t07_obj_rule1.getIscheck() != null
					&& !t07_obj_rule1.getIscheck().equals("")) {
				t07_obj_rule1.setIscheck_disp((String) ischeckforpartyMap
						.get(t07_obj_rule1.getIscheck()));
			}
			// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			t07_obj_ruleList.add(t07_obj_rule1);
		}
		return t07_obj_ruleList;
	}

	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_OBJ_RULEList_blackCount(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_OBJ_RULEList_blackCount", t07_obj_rule);
		return iCount.intValue();
	}

	/**
	 * 取得列表（可分页）孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_OBJ_RULEList(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_OBJ_RULEList",
				t07_obj_rule, iStartRec, iPageSize);
		ArrayList t07_obj_ruleList = new ArrayList();
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		// start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

		LinkedHashMap ischeckforpartyMap = new LinkedHashMap();

		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		if ("1".equals(t87_sysparaMap.get("404"))) {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty0");
		} else {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty");
		}

		// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_OBJ_RULE t07_obj_rule1 = (T07_OBJ_RULE) iter.next();
			if (t07_obj_rule1.getParty_class_cd() != null) {
				t07_obj_rule1.setParty_class_cd((String) list_typeMap
						.get(t07_obj_rule1.getParty_class_cd()));
			}
			if (t07_obj_rule1.getIsuse() != null) {
				t07_obj_rule1.setIsuse((String) isuseMap.get(t07_obj_rule1
						.getIsuse()));
			}
			if (t07_obj_rule1.getOrgankey() != null) {
				t07_obj_rule1.setOrgankey((String) organMap.get(t07_obj_rule1
						.getOrgankey()));
			}
			t07_obj_rule1.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_obj_rule1.getCreate_dt()));

			// start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作
			if (t07_obj_rule1.getIscheck() != null
					&& !t07_obj_rule1.getIscheck().equals("")) {
				t07_obj_rule1.setIscheck_disp((String) ischeckforpartyMap
						.get(t07_obj_rule1.getIscheck()));
			}
			// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			t07_obj_ruleList.add(t07_obj_rule1);
		}
		return t07_obj_ruleList;
	}
     /**
      * 联网核查
      * */
	public ArrayList getT07_OBJ_RULECheck(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_OBJ_RULECheck",
				t07_obj_rule, iStartRec, iPageSize);
		ArrayList t07_obj_ruleList = new ArrayList();
		LinkedHashMap checkresultMap = cm.getMapFromCache("checkresults");
		LinkedHashMap checkmethodMap = cm.getMapFromCache("checkmethod");
		LinkedHashMap is_instMap = cm.getMapFromCache("is_inst");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_OBJ_RULE t07_obj_rule1 = (T07_OBJ_RULE) iter.next();
			if(t07_obj_rule1.getCheckdate()!=null){
				String checkdate = t07_obj_rule1.getCheckdate();
				checkdate = checkdate.substring(0,4)+ "-" + checkdate.substring(4,6) + "-" + checkdate.substring(6,8);
				t07_obj_rule1.setCheckdate(checkdate);
			}
			if(t07_obj_rule1.getCheckdate1()!=null){
				String checkdate1 = t07_obj_rule1.getCheckdate1();
				checkdate1 = checkdate1.substring(0,4)+ "-" + checkdate1.substring(4,6) + "-" + checkdate1.substring(6,8);
				t07_obj_rule1.setCheckdate1(checkdate1);
			}
			if (t07_obj_rule1.getResult() != null) {
				t07_obj_rule1.setResult((String) checkresultMap
						.get(t07_obj_rule1.getResult()));
			}
			if (t07_obj_rule1.getIs_inst() != null) {
				t07_obj_rule1.setIs_inst((String) is_instMap.get(t07_obj_rule1
						.getIs_inst()));
			}
			t07_obj_ruleList.add(t07_obj_rule1);
		}
		return t07_obj_ruleList;
	}
	public int getT07_OBJ_RULECheckCount(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_OBJ_RULECheckCount", t07_obj_rule);
		return iCount.intValue();
	}
	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_OBJ_RULEListCount(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_OBJ_RULEListCount", t07_obj_rule);
		return iCount.intValue();
	}
	public ArrayList getT07_greyList(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_greyList",
				t07_obj_rule, iStartRec, iPageSize);
		ArrayList t07_obj_ruleList = new ArrayList();
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_OBJ_RULE t07_obj_rule1 = (T07_OBJ_RULE) iter.next();
			if (t07_obj_rule1.getParty_class_cd() != null) {
				t07_obj_rule1.setParty_class_cd((String) list_typeMap
						.get(t07_obj_rule1.getParty_class_cd()));
			}
			if (t07_obj_rule1.getIsuse() != null) {
				t07_obj_rule1.setIsuse((String) isuseMap.get(t07_obj_rule1
						.getIsuse()));
			}
			if (t07_obj_rule1.getOrgankey() != null) {
				t07_obj_rule1.setOrgankey((String) organMap.get(t07_obj_rule1
						.getOrgankey()));
			}
			t07_obj_rule1.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_obj_rule1.getCreate_dt()));
			t07_obj_ruleList.add(t07_obj_rule1);
		}
		return t07_obj_ruleList;
	}

	public int getT07_greyListCount(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_greyListCount", t07_obj_rule);
		return iCount.intValue();
	}
    /**
     * 联网核查明细
     * */
	public T07_OBJ_RULE getT07_OBJ_RULEDispCheck(SqlMapClient sqlMap, T07_OBJ_RULE t07_OBJ_RULE)
			throws SQLException {
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) sqlMap.queryForObject(
				"getT07_OBJ_RULEDispCheck", t07_OBJ_RULE);
		LinkedHashMap checkresultMap = cm.getMapFromCache("checkresults");
		LinkedHashMap checkmethodMap = cm.getMapFromCache("checkmethod");
		LinkedHashMap is_instMap = cm.getMapFromCache("is_inst");
		if (t07_obj_rule.getResult()!= null && !"".equals(t07_obj_rule.getResult())) {
			t07_obj_rule.setResult((String) checkresultMap.get(t07_obj_rule
					.getResult()));
		}
		if(t07_obj_rule.getCheckdate()!=null){
			String checkdate = t07_obj_rule.getCheckdate();
			checkdate = checkdate.substring(0,4)+ "-" + checkdate.substring(4,6) + "-" + checkdate.substring(6,8);
			t07_obj_rule.setCheckdate(checkdate);
		}
		if (t07_obj_rule.getCheckmode()!= null && !"".equals(t07_obj_rule.getCheckmode())) {
			t07_obj_rule.setCheckmode((String) checkmethodMap.get(t07_obj_rule
					.getCheckmode()));
		}
		if (t07_obj_rule.getIs_inst()!= null && !"".equals(t07_obj_rule.getIs_inst())) {
			t07_obj_rule.setIs_inst((String) is_instMap.get(t07_obj_rule
					.getIs_inst()));
		}
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		return t07_obj_rule;
	}
	/**
	 * 联网核查修改明细
	 * */
	/**
     * 联网核查明细
     * */
	public T07_OBJ_RULE getT07_OBJ_RULEDispCheck0(SqlMapClient sqlMap, T07_OBJ_RULE t07_OBJ_RULE)
			throws SQLException {
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) sqlMap.queryForObject(
				"getT07_OBJ_RULEDispCheck0", t07_OBJ_RULE);
		if(t07_obj_rule.getCheckdate()!=null){
			String checkdate = t07_obj_rule.getCheckdate();
			checkdate = checkdate.substring(0,4)+ "-" + checkdate.substring(4,6) + "-" + checkdate.substring(6,8);
			t07_obj_rule.setCheckdate(checkdate);
		}
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		return t07_obj_rule;
	}
	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return T07_OBJ_RULE
	 */
	public T07_OBJ_RULE getT07_OBJ_RULEDisp(SqlMapClient sqlMap, T07_OBJ_RULE t07_OBJ_RULE)
			throws SQLException {
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) sqlMap.queryForObject(
				"getT07_OBJ_RULEDisp", t07_OBJ_RULE);
		// 客户类型
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		// 免检测类型
		LinkedHashMap rule_typeMap = cm.getMapFromCache("rule_type");
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		if (org.apache.commons.lang.StringUtils.isNotBlank(t07_obj_rule.getParty_class_cd()))
			t07_obj_rule.setParty_class_cd((String) list_typeMap.get(t07_obj_rule.getParty_class_cd()));
		
		
		if (t07_obj_rule.getRule_type() != null && !"".equals(t07_obj_rule.getRule_type())) {
			t07_obj_rule.setRule_type_disp((String) rule_typeMap.get(t07_obj_rule.getRule_type()));
		}

		if (t07_obj_rule.getIsuse() != null && !"".equals(t07_obj_rule.getIsuse())) {
			t07_obj_rule.setIsuse_disp((String) isuseMap.get(t07_obj_rule
					.getIsuse()));
		}

		t07_obj_rule.setValidate_dt_disp(DateUtils
				.dateToStringShort(t07_obj_rule.getValidate_dt()));
		if (t07_obj_rule.getValidate_dt_new() != null) {
			t07_obj_rule.setValidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_obj_rule.getValidate_dt_new()));
		}

		t07_obj_rule.setInvalidate_dt_disp(DateUtils
				.dateToStringShort(t07_obj_rule.getInvalidate_dt()));
		if (t07_obj_rule.getInvalidate_dt_new() != null) {
			t07_obj_rule.setInvalidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_obj_rule.getInvalidate_dt_new()));
		}

		t07_obj_rule.setCreate_dt_disp(DateUtils.dateToStringShort(t07_obj_rule
				.getCreate_dt()));
		System.out.print(DateUtils.dateToStringShort(t07_obj_rule
				.getCreate_dt()));
		t07_obj_rule.setModify_dt_disp(DateUtils.dateToStringShort(t07_obj_rule
				.getModify_dt()));
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		return t07_obj_rule;
	}

	/**
	 * 判断对象是否重复 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_tracklist
	 *            T07_TRACKlist
	 * @throws SQLException
	 * @return boolean
	 */
	public boolean getT07_OBJ_RULElist(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		boolean flag = true;
		Integer iCount = (Integer) sqlMap.queryForObject("getT07_OBJ_RULElist",
				t07_obj_rule);
		if (iCount.intValue() > 0) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 插入白名单操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_OBJ_RULE(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("insertT07_OBJ_RULE", t07_obj_rule);
		return i;
	}
/**
 * 联网核查插入操作
 * */
	public int insertT07_OBJ_RULECheck(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("insertT07_OBJ_RULECheck", t07_obj_rule);
		return i;
	}
	/**
	 * 插入入行规则操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_OBJ_RULES(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("insertT07_OBJ_RULES", t07_obj_rule);
		return i;
	}

	public int insertT07_grey(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("insertT07_grey", t07_obj_rule);
		return i;
	}

	/**
	 * 修改操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE", t07_obj_rule);
		return i;
	}
    /**
     * 联网核查修改提交动作
     * */
	public int modifyT07_OBJ_RULECheck(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULECheck", t07_obj_rule);
		return i;
	}
	/**
	 * 删除入行规则操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_OBJ_RULES(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		int i = sqlMap.update("deleteT07_OBJ_RULES", party_id);
		return i;
	}

	/**
	 * 修改操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_check(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_check", t07_obj_rule);
		return i;
	}

	/**
	 * 删除操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_OBJ_RULE(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		int i = sqlMap.update("deleteT07_OBJ_RULE", party_id);
		return i;
	}
    /**
     * 联网核查删除
     * */
	public int deleteT07_OBJ_RULECheck(SqlMapClient sqlMap, String id_no)
			throws SQLException {
		int i = sqlMap.update("deleteT07_OBJ_RULECheck", id_no);
		return i;
	}
	public T07_OBJ_RULE getT07_greyDisp(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) sqlMap.queryForObject(
				"getT07_greyDisp", party_id);
		// 客户类型
		LinkedHashMap list_typeMap = cm.getMapFromCache("list_type");

		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		if (t07_obj_rule.getParty_class_cd() != null)
			t07_obj_rule.setParty_class_cd((String) list_typeMap
					.get(t07_obj_rule.getParty_class_cd()));

		t07_obj_rule.setIsuse((String) isuseMap.get(t07_obj_rule.getIsuse()));
		if (t07_obj_rule.getIsuse_new() != null
				&& !t07_obj_rule.getIsuse_new().equals("")) {
			t07_obj_rule.setIsuse_new((String) isuseMap.get(t07_obj_rule
					.getIsuse_new()));
		}

		if (t07_obj_rule.getCreate_dt() != null)
			t07_obj_rule.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_obj_rule.getCreate_dt()));

		t07_obj_rule.setModify_dt_disp(DateUtils.dateToStringShort(t07_obj_rule
				.getModify_dt()));
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		return t07_obj_rule;
	}

	public int modifyT07__grey(SqlMapClient sqlMap, T07_OBJ_RULE t07_obj_rule)
			throws SQLException {
		int i = sqlMap.update("modifyT07_grey", t07_obj_rule);
		return i;
	}

	/**
	 * 添加审核操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_ischeck0(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_ischeck0", t07_obj_rule);
		return i;
	}

	/**
	 * 添加审批不通过操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_ischeckaddno(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_ischeckaddno", t07_obj_rule);
		return i;
	}

	/**
	 * 修改审批不通过操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_ischeckupdateno(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_ischeckupdateno",
				t07_obj_rule);
		return i;
	}

	/**
	 * 添加审核操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_black_ischeck0(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap
				.update("modifyT07_OBJ_RULE_black_ischeck0", t07_obj_rule);
		return i;
	}

	/**
	 * 取单条明细操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return T07_OBJ_RULE
	 */
	public T07_OBJ_RULE getT07_OBJ_RULE_blackDisp(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) sqlMap.queryForObject(
				"getT07_OBJ_RULE_blackDisp", party_id);
		// 客户类型
		LinkedHashMap list_typeMap = cm.getMapFromCache("list_type");
		// 免检测类型
		LinkedHashMap rule_typeMap = cm.getMapFromCache("rule_type");
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		t07_obj_rule.setParty_class_cd((String) list_typeMap.get(t07_obj_rule
				.getParty_class_cd()));
		t07_obj_rule.setRule_type((String) rule_typeMap.get(t07_obj_rule
				.getRule_type()));
		if (t07_obj_rule.getRule_type_new() != null
				&& !t07_obj_rule.getRule_type_new().equals("")) {
			t07_obj_rule.setRule_type_new((String) rule_typeMap
					.get(t07_obj_rule.getRule_type_new()));
		}

		t07_obj_rule.setIsuse((String) isuseMap.get(t07_obj_rule.getIsuse()));
		if (t07_obj_rule.getIsuse_new() != null
				&& !t07_obj_rule.getIsuse_new().equals("")) {
			t07_obj_rule.setIsuse_new((String) isuseMap.get(t07_obj_rule
					.getIsuse_new()));
		}

		t07_obj_rule.setValidate_dt_disp(DateUtils
				.dateToStringShort(t07_obj_rule.getValidate_dt()));
		if (t07_obj_rule.getValidate_dt_new() != null) {
			t07_obj_rule.setValidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_obj_rule.getValidate_dt_new()));
		}

		t07_obj_rule.setInvalidate_dt_disp(DateUtils
				.dateToStringShort(t07_obj_rule.getInvalidate_dt()));
		if (t07_obj_rule.getInvalidate_dt_new() != null) {
			t07_obj_rule.setInvalidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_obj_rule.getInvalidate_dt_new()));
		}

		t07_obj_rule.setCreate_dt_disp(DateUtils.dateToStringShort(t07_obj_rule
				.getCreate_dt()));
		System.out.print(DateUtils.dateToStringShort(t07_obj_rule
				.getCreate_dt()));
		t07_obj_rule.setModify_dt_disp(DateUtils.dateToStringShort(t07_obj_rule
				.getModify_dt()));
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		return t07_obj_rule;
	}

	/**
	 * 添加审批操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_black_ischeck(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_black_ischeck", t07_obj_rule);
		return i;
	}

	/**
	 * 添加审批操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_ischeck(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_ischeck", t07_obj_rule);
		return i;
	}

	/**
	 * 添加审批操作 孙日朋 2009-6-26
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_obj_rule
	 *            T07_OBJ_RULE
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_OBJ_RULE_ischeckall(SqlMapClient sqlMap,
			T07_OBJ_RULE t07_obj_rule) throws SQLException {
		int i = sqlMap.update("modifyT07_OBJ_RULE_ischeckall", t07_obj_rule);
		return i;
	}

}
