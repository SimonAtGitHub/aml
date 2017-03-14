package com.ist.aml.information.dao;
/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组-lijie
 * @version 4.0.1
 */
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.information.dto.T47_Opp_info;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;

public class T47_Opp_infoDAO extends BaseDAO{

	/** 
	 * 构造函数 
	 */
	public T47_Opp_infoDAO() {
	}

	/** 
	 * add by dingke
	 * 取得列表（可分页）  
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @param iStartRec int   
	 * @param iPageSize int   
	 * @throws SQLException   
	 * @return ArrayList 
	 */
	public ArrayList getT47_Opp_infoList(SqlMapClient sqlMap,
			T47_Opp_info t47_opp_info, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_Opp_infoList",
				t47_opp_info, iStartRec, iPageSize);
		ArrayList t47_opp_infoList = new ArrayList();
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap clienttypeMap = cm.getMapFromCache("pbc_cttp");
		LinkedHashMap accttypemapMap = cm.getMapFromCache("pbc_catp");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_Opp_info t47_opp_info1 = (T47_Opp_info) iter.next();
			if (t47_opp_info1.getOpp_card_type() != null
					&& !"".equals(t47_opp_info1.getOpp_card_type())) {
				String opp_card_type = t47_opp_info1.getOpp_card_type()
						.substring(0, 2);
				String opp_card_type_inf = t47_opp_info1.getOpp_card_type()
						.substring(2);
				t47_opp_info1.setOpp_card_type(opp_card_type);
				t47_opp_info1.setOpp_card_type_inf(opp_card_type_inf);
				t47_opp_info1.setOpp_card_type_disp((String) card_typeMap
						.get(t47_opp_info1.getOpp_card_type()));
			}
			if (t47_opp_info1.getOpp_pbc_party_class_cd() != null) {
				t47_opp_info1
						.setOpp_pbc_party_class_cd_disp((String) clienttypeMap
								.get((t47_opp_info1.getOpp_pbc_party_class_cd())));
			}

			if (t47_opp_info1.getOpp_acct_type_cd() != null) {
				t47_opp_info1.setOpp_acct_type_cd_disp((String) accttypemapMap
						.get(t47_opp_info1.getOpp_acct_type_cd()));
			}

			t47_opp_infoList.add(t47_opp_info1);

		}
		return t47_opp_infoList;
	}

	/** 
	 * 取得记录总数 
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @throws SQLException   
	 * @return int  
	 */
	public int getT47_Opp_infoListCount(SqlMapClient sqlMap,
			T47_Opp_info t47_opp_info) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_Opp_infoListCount", t47_opp_info);
		return iCount.intValue();
	}

	/** 
	 * 取单条明细操作 
	 * @param sqlMap SqlMapClient 
	 * @param Opp_sys_id String  
	 * @throws SQLException   
	 * @return T47_Opp_info  
	 */
	public T47_Opp_info getT47_Opp_infoDisp(SqlMapClient sqlMap,
			String opp_sys_id) throws SQLException {
		T47_Opp_info t47_opp_info = (T47_Opp_info) sqlMap.queryForObject(
				"getT47_Opp_infoDisp", opp_sys_id);
		if (t47_opp_info == null)
			t47_opp_info = new T47_Opp_info();
		return t47_opp_info;
	}

	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT47_Opp_info(SqlMapClient sqlMap, T47_Opp_info t47_opp_info)
			throws SQLException {
		int i = sqlMap.update("insertT47_Opp_info", t47_opp_info);
		return i;
	}

	/** 
	 * 修改操作  add by dingke
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT47_Opp_info2(SqlMapClient sqlMap,
			T47_Opp_info t47_opp_info) throws SQLException {
		int i = sqlMap.update("modifyT47_Opp_info2", t47_opp_info);
		return i;
	}

	/** 
	 * 修改操作  add by dingke
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT47_Opp_info1(SqlMapClient sqlMap,
			T47_Opp_info t47_opp_info) throws SQLException {
		int i = sqlMap.update("modifyT47_Opp_info1", t47_opp_info);
		return i;
	}

	/** 
	 * 修改操作 
	 * @param sqlMap SqlMapClient 
	 * @param t47_opp_info T47_Opp_info 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT47_Opp_info(SqlMapClient sqlMap, T47_Opp_info t47_opp_info)
			throws SQLException {
		int i = sqlMap.update("modifyT47_Opp_info", t47_opp_info);
		return i;
	}

	/** 
	 * 删除操作 
	 * @param sqlMap SqlMapClient 
	 * @param Opp_sys_id String  
	 * @throws SQLException   
	 * @return int  
	 */
	public int deleteT47_Opp_info(SqlMapClient sqlMap, String opp_sys_id)
			throws SQLException {
		int i = sqlMap.update("deleteT47_Opp_info", opp_sys_id);
		return i;
	}

	
}
