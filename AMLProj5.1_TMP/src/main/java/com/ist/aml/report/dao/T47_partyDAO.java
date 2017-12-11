/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-28   青蛙		创建  
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

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.information.dto.T47_Opp_info;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.CopyBean;
import com.ist.common.InnerDao;
import com.ist.common.JSonUtil;
import com.ist.common.LogUtils;
import com.ist.common.OuterDao;
import com.ist.common.RequestObject;
import com.ist.common.base.BaseDAO;
import com.ist.common.db.results.DefaultDbQuery;
import com.ist.common.db.results.I_DatabaseQuery;
import com.ist.common.db.results.oracle.OracleQuery;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.common.util.StringUtils;
import com.ist.util.DateUtils;


public class T47_partyDAO extends BaseDAO {

	/**
	 * 构造函数
	 */
	public T47_partyDAO() {
	}

	public T47_party getT47_partyById(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getT47_partyDisp", party_id);
		if (t47_party == null)
			t47_party = new T47_party();
		return t47_party;
	}
	
	public ArrayList getT47_partyList(SqlMapClient sqlMap,
			T47_party t47_party, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_partyList",
				t47_party, iStartRec, iPageSize);
		ArrayList t47_partyList = new ArrayList();
		// 客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		// 客户证件类型
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		//客户归属机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_party t47_party1 = (T47_party) iter.next();
			// 把客户对象类型进行转换，以供显示
			if (t47_party1.getParty_class_cd() != null) {
				t47_party1.setParty_class_cd_disp((String) clienttypeMap.get(t47_party1.getParty_class_cd()));
			}
			//证件类型
			if (t47_party1.getCard_type() != null && !t47_party1.getCard_type().equals("")) {
				t47_party1.setCard_type_disp((String) card_typeMap.get(t47_party1.getCard_type()));
			}
			//归属机构
			if(t47_party1.getOrgankey() != null && !"".equals(t47_party1.getOrgankey())){
				t47_party1.setOrgan_name((String)organMap.get(t47_party1.getOrgankey()));
			}
			t47_partyList.add(t47_party1);
		}
		return t47_partyList;
	}
	
	public int getT47_partyListCount(SqlMapClient sqlMap, T47_party t47_party)
	throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject("getT47_partyListCount", t47_party);
		return iCount.intValue();
	}

	public ArrayList getT47_party_ucList(SqlMapClient sqlMap,
			T47_party t47_party, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_party_ucList",
				t47_party, iStartRec, iPageSize);
		ArrayList t47_partyList = new ArrayList();

		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_party t47_party1 = (T47_party) iter.next();
			// 把客户对象类型进行转换，以供显示
			if (t47_party1.getParty_class_cd() != null) {
				t47_party1.setParty_class_cd((String) clienttypeMap
						.get(t47_party1.getParty_class_cd()));
			}
			if (t47_party1.getCard_type() != null
					&& !t47_party1.getCard_type().equals("")) {
				t47_party1.setCard_type((String) card_typeMap.get(t47_party1
						.getCard_type()));
			}
			if (t47_party1.getCountry_cd() != null) {
				t47_party1.setCountry_cd((String) countryMap.get(t47_party1
						.getCountry_cd()));
			}

			if ((t47_party1.getValidate_ind() != null && "0".equals(t47_party1
					.getValidate_ind()))
					|| (t47_party1.getValidate_ind2() != null && "0"
							.equals(t47_party1.getValidate_ind2()))
					|| (t47_party1.getValidate_ind2() != null && "2"
							.equals(t47_party1.getValidate_ind()))
					|| (t47_party1.getValidate_ind2() != null && "2"
							.equals(t47_party1.getValidate_ind2()))) {
				t47_party1.setValidate("0");
			} else {
				t47_party1.setValidate("1");
			}
			t47_partyList.add(t47_party1);
		}
		return t47_partyList;
	}

	public int getT47_party_ucListCount(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_party_ucListCount", t47_party);
		return iCount.intValue();
	}

	public T47_party getT47_party_ucByHostId(SqlMapClient sqlMap, String host_id)
			throws SQLException {
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getT47_party_ucByHostId", host_id);
		if (t47_party == null)
			t47_party = new T47_party();
		return t47_party;
	}

	public int saveModifyT47_partyUc(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {
		int row = 0;
		row = (int) sqlMap.update("saveModifyT47_partyUc_20091211",
				t47_party_uc);
		return row;
	}

	public int modifyT47_partyFromReport(SqlMapClient sqlMap,
			T47_party t47_party) throws SQLException {
		int i = sqlMap.update("modifyT47_partyFromReport", t47_party);
		return i;
	}

	public boolean isExist(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {

		boolean isexist = false;
		Integer i = (Integer) sqlMap.queryForObject("isExist_t47_party_uc",
				t47_party_uc);
		if (i.intValue() > 0) {
			isexist = true;
		}

		return isexist;
	}

	public int insertT47_party_uc(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {
		int i = sqlMap.update("insertT47_party_uc", t47_party_uc);
		return i;
	}
	
	public int insertT47_party_uc_tpla(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {
		int i = sqlMap.update("insertT47_party_uc_tpla", t47_party_uc);
		return i;
	}

	public int modifyT47_party_uc2(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {
		int i = sqlMap.update("modifyT47_party_uc2", t47_party_uc);
		return i;
	}

	public int modifyT47_party_uc1(SqlMapClient sqlMap, T47_party t47_party_uc)
			throws SQLException {
		int i = sqlMap.update("modifyT47_party_uc1", t47_party_uc);
		return i;
	}

	public T47_party getT47_partyDispR1(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getT47_partyDisp1", party_id);
		if (t47_party == null)
			t47_party = new T47_party();
		LinkedHashMap orgMap = cm.getMapFromCache("organ");

		if (t47_party.getOrgankey() != null
				&& !"".equals(t47_party.getOrgankey())) {
			t47_party
					.setOrganname((String) orgMap.get(t47_party.getOrgankey()));
		}
		return t47_party;
	}

	public T47_party getT47_partyDisp(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getT47_partyDisp", party_id);
		if (t47_party == null)
			t47_party = new T47_party();

		LinkedHashMap clientstatus = cm.getMapFromCache("clientstatus");// 客户状态
		LinkedHashMap card_type = cm.getMapFromCache("card_type");
		LinkedHashMap orgMap = cm.getMapFromCache("organ");// 机构
		LinkedHashMap countryMap = cm.getMapFromCache("country");// 国家
		if (t47_party.getOrgankey() != null
				&& !"".equals(t47_party.getOrgankey())) {
			t47_party.setOrgan_name((String) orgMap.get(t47_party.getOrgankey()));
		}
		if (t47_party.getCard_type() != null
				&& !"".equals(t47_party.getCard_type())) {
			t47_party.setCard_type_disp((String) card_type.get(t47_party
					.getCard_type()));
		}
		if (t47_party.getParty_status_cd() != null
				&& !"".equals(t47_party.getParty_status_cd())) {
			t47_party.setParty_status_cd_disp((String) clientstatus.get(t47_party
					.getParty_status_cd()));
		}
		if (t47_party.getCountry_cd() != null
				&& !"".equals(t47_party.getCountry_cd())) {
			t47_party.setCountry_cd_disp((String) countryMap.get(t47_party
					.getCountry_cd()));
		}
		return t47_party;
	}

	public ArrayList getT47_partyComm(SqlMapClient sqlMap, T47_party t47_party,
			int iStartRec, int iPageSize,ApplicationContext context) throws SQLException {
		ArrayList list=new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String dbtype = sysConfig.getProperty("database.dbtype");
		String conn_type = StringUtils.null2String(sysConfig.getProperty("database.conn_type"));      
	if(conn_type.equals("2")){
		try{
		String sql="	SELECT A.PARTY_ID,A.HOST_CUST_ID,A.PARTY_CLASS_CD,A.AML1_TYPE_CD,A.AML2_TYPE_CD,A.PARTY_CHN_NAME,ORGANKEY, "
		+" A.PARTY_ENG_NAME,A.CARD_TYPE,A.CARD_NO,A.BIRTH_DT,A.COUNTRY_RESIDENCE,A.COUNTRY_CD,"
		+" A.ADDR1,A.ADDR2,A.TEL_NO,A.CELL_NO,A.NET_ADDRESS,A.EMAIL_ADDR,A.CREATE_DT,A.LAST_UPD_DT,A.LAST_UPD_USER"
		+" FROM T47_PARTY A WHERE 1>0  ";
		if(t47_party.getParty_id()!=null && !t47_party.getParty_id().equals("")){
			sql=sql+" and A.PARTY_ID='"+t47_party.getParty_id()+"'";
		}
		if(t47_party.getParty_class_cd()!=null && !t47_party.getParty_class_cd().equals("")){
			sql=sql+" and A.party_class_cd='"+t47_party.getParty_class_cd()+"'";
		}
		if(t47_party.getParty_chn_name()!=null && !t47_party.getParty_chn_name().equals("")){
			sql=sql+" and A.party_chn_name like '%"+t47_party.getParty_chn_name()+"%'";
		}
		if(t47_party.getCard_no()!=null && !t47_party.getCard_no().equals("")){
			sql=sql+" and A.card_no='"+t47_party.getCard_no()+"'";
		}
		if(t47_party.getOrgankey()!=null && !t47_party.getOrgankey().equals("")){
			sql=sql+" and A.ORGANKEY IN  ("+t47_party.getOrgankey()+")";
		}
		sqlMap.endTransaction();
		sqlMap.startTransaction();
		Connection conn =sqlMap.getCurrentConnection();
		 if (conn == null) {
	      logger.error("无法得到 SQLMAP的数据库连接!");
	  }
	     sql=this.initSql(dbtype, sql, iStartRec, iPageSize);
		 list=com.ist.common.SQLExecute.executeQuery(conn, sql, null, t47_party);

		sqlMap.commitTransaction();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}else{
		 list = (ArrayList) sqlMap.queryForList("getT47_partyComm",
		t47_party, iStartRec, iPageSize);
	}
		
		return list;
	}

	public int getT47_partyCommCount(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_partyCommCount", t47_party);
		return iCount.intValue();
	}

	public ArrayList getT47_partyCommForCase(SqlMapClient sqlMap,
			T47_party t47_party, int iStartRec, int iPageSize)
			throws SQLException {
		String sqlstr = "getT47_partyCommForCList";
		if (t47_party.getParty_class_cd().equals("I")) {
			sqlstr = "getT47_partyCommForIList";
		}
		ArrayList list = (ArrayList) sqlMap.queryForList(sqlstr, t47_party,
				iStartRec, iPageSize);
		return list;
	}

	public int getT47_partyCommForCaseCount(SqlMapClient sqlMap,
			T47_party t47_party) throws SQLException {
		String sqlstr = "getT47_partyCommForCCount";
		if (t47_party.getParty_class_cd().equals("I")) {
			sqlstr = "getT47_partyCommForICount";
		}
		Integer iCount = (Integer) sqlMap.queryForObject(sqlstr, t47_party);
		return iCount.intValue();
	}

	/**
	 * @author lijie 取得所有客户列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT47_customerList(SqlMapClient sqlMap,
			T47_party t47_party, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_customerList",
				t47_party, iStartRec, iPageSize);
		ArrayList t47_partyList = new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap party_statusMap = cm.getMapFromCache("clientstatus");
		LinkedHashMap countryMap = cm.getMapFromCache("nationality");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_party t47_party1 = (T47_party) iter.next();
			// 把客户对象类型进行转换，以供显示
			if (t47_party1.getParty_class_cd() != null) {
				t47_party1.setParty_class_cd_disp((String) clienttypeMap
						.get(t47_party1.getParty_class_cd()));
			}
			if (t47_party1.getCard_type() != null
					&& !t47_party1.getCard_type().equals("")) {
				// 分割证件类型
				String card_type08 = t47_party1.getCard_type().substring(0, 2);
				String card_type_inf08 = t47_party1.getCard_type().substring(2);
				t47_party1.setCard_type(card_type08);
				t47_party1.setCard_type_inf(card_type_inf08);
				t47_party1.setCard_type_disp((String) card_typeMap
						.get(t47_party1.getCard_type()));
			}
			if (t47_party1.getParty_status_cd() != null) {
				t47_party1.setParty_status_cd_disp((String) party_statusMap
						.get(t47_party1.getParty_status_cd()));
			}
			if (t47_party1.getCountry_cd() != null) {
				t47_party1.setCountry_cd_disp((String) countryMap
						.get(t47_party1.getCountry_cd()));
			}
			// t07_mytrack_result.setTi_lasttradetime_disp(DateUtils
			// .dateToStringShort(t07_mytrack_result.getTi_lasttradetime()));
			t47_partyList.add(t47_party1);
		}
		return t47_partyList;
	}

	/**
	 * @author lijie 取得所有客户记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @throws SQLException
	 * @return int
	 */
	public int getT47_customerListCount(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_customerListCount", t47_party);
		return iCount.intValue();
	}

	/**
	 * 根据CARD_TYPE,CARD_NO对是否重复插入客户进行检验
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @throws SQLException
	 * @return int
	 */
	public int checkT47_party(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject("checkT47_party",
				t47_party);
		return iCount.intValue();
	}

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @throws SQLException
	 * @return int
	 */
	public int insertT47_party(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		int i = sqlMap.update("insertT47_party1", t47_party);
		return i;
	}

	/**
	 * 对公信息
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @throws SQLException
	 * @return int
	 */
	public T47_party getT47_corporationDisp(SqlMapClient sqlMap, String party_id)
			throws SQLException {

		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		// AML2对公客户类型
		LinkedHashMap pbc_cttp2Map = cm.getMapFromCache("pbc_cttp2");
		// 对公行业
		LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c");
		// 币种
		LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");
		// AML1对公客户类型
		LinkedHashMap aml1_corpMap = cm.getMapFromCache("aml1_corp");
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getCorporationDisp", party_id);
		if (t47_party == null) {
			t47_party = new T47_party();
		}
		if (t47_party.getCard_type() != null
				&& !t47_party.getCard_type().equals("")) {
			String card_type08 = t47_party.getCard_type().substring(0, 2);
			String card_type_inf08 = t47_party.getCard_type().substring(2);
			t47_party.setCard_type(card_type08);
			t47_party.setCard_type_inf(card_type_inf08);
		}
		if (t47_party.getLegal_card_type() != null
				&& !t47_party.getLegal_card_type().equals("")) {
			String legal_card_type08 = t47_party.getLegal_card_type()
					.substring(0, 2);
			String legal_card_type_inf08 = t47_party.getLegal_card_type()
					.substring(2);
			t47_party.setLegal_card_type(legal_card_type08);
			t47_party.setLegal_card_type_inf(legal_card_type_inf08);
		}
		if (t47_party == null)
			t47_party = new T47_party();

		// 把跟踪对象类型进行转换，以供显示
		if (t47_party.getCard_type() != null) {
			t47_party.setCard_type_disp((String) card_typeMap.get(t47_party
					.getCard_type()));
		}
		if (t47_party.getCountry_cd() != null) {
			t47_party.setCountry_cd_disp((String) countryMap.get(t47_party
					.getCountry_cd()));
		}
		if (t47_party.getAml2_type_cd() != null) {
			t47_party.setAml2_type_disp((String) pbc_cttp2Map.get(t47_party
					.getAml2_type_cd()));
		}
		if (t47_party.getEnrol_fund_currency_cd() != null) {
			t47_party.setEnrol_fund_currency_disp((String) pbc_currencyMap
					.get(t47_party.getEnrol_fund_currency_cd()));
		}
		if (t47_party.getIndustrykey() != null) {
			t47_party.setIndustrykey_disp((String) pbc_ctvc_cMap.get(t47_party
					.getIndustrykey()));
		}
		if (t47_party.getLegal_card_type() != null) {
			t47_party.setIndustrykey_disp((String) card_typeMap.get(t47_party
					.getLegal_card_type()));
		}
		if (t47_party.getAml1_type_cd() != null) {
			t47_party.setAml1_type_disp((String) aml1_corpMap.get(t47_party
					.getAml1_type_cd()));
		}
		if (t47_party.getOrgankey() != null) {
			t47_party.setOrganname((String) organMap.get(t47_party
					.getOrgankey()));
		}

		return t47_party;
	}

	/**
	 * 对私信息
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_party
	 *            T47_party
	 * @throws SQLException
	 * @return int
	 */
	public T47_party getT47_corporationDisp1(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		// AML2客户类型
		LinkedHashMap pbc_cttp1Map = cm.getMapFromCache("pbc_cttp1");
		// 对私客户职业
		LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i");
		// AML1对私客户类型
		LinkedHashMap aml1_indiMap = cm.getMapFromCache("aml1_indi");
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		T47_party t47_party = (T47_party) sqlMap.queryForObject(
				"getCorporationDisp1", party_id);
		if (t47_party == null)
			t47_party = new T47_party();

		// 把跟踪对象类型进行转换，以供显示
		if (t47_party.getCard_type() != null) {
			t47_party.setCard_type_disp((String) card_typeMap.get(t47_party
					.getCard_type()));
		}
		if (t47_party.getCountry_cd() != null) {
			t47_party.setCountry_cd_disp((String) countryMap.get(t47_party
					.getCountry_cd()));
		}
		if (t47_party.getAml2_type_cd() != null) {
			t47_party.setAml2_type_disp((String) pbc_cttp1Map.get(t47_party
					.getAml2_type_cd()));
		}
		if (t47_party.getOccupation() != null) {
			t47_party.setOccupation_disp((String) pbc_ctvc_iMap.get(t47_party
					.getOccupation()));
		}
		if (t47_party.getAml1_type_cd() != null) {
			t47_party.setAml1_type_disp((String) aml1_indiMap.get(t47_party
					.getAml1_type_cd()));
		}
		if (t47_party.getOrgankey() != null) {
			t47_party.setOrganname((String) organMap.get(t47_party
					.getOrgankey()));
		}
		return t47_party;
	}

	public int modifyT47_client(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		int i = sqlMap.update("modifyT47_client", t47_party);
		return i;
	}

	public int modifyT47_indi(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		int i = sqlMap.update("modifyT47_indi", t47_party);
		return i;
	}

	public int modifyT47_corp(SqlMapClient sqlMap, T47_party t47_party)
			throws SQLException {
		int i = sqlMap.update("modifyT47_corp", t47_party);
		return i;
	}

	public ArrayList getT07_modify_partyorganList(SqlMapClient sqlMap,
			T47_party t47_party, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_modify_partyorganList",
				t47_party, iStartRec, iPageSize);
		ArrayList t47_partyList = new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_party t47_party1 = (T47_party) iter.next();
			
			if (t47_party1.getParty_class_cd()!= null) {
				t47_party1.setOpp_pbc_party_class_cd_disp((String) clienttypeMap
								.get((t47_party1.getParty_class_cd())));
			}

			if (t47_party1.getOrgankey() != null) {
				t47_party1.setOrganname((String) organMap
						.get(t47_party1.getOrgankey()));
			}
			if (t47_party1.getOpp_organkey() != null) {
				t47_party1.setOpp_organname((String) organMap
						.get(t47_party1.getOpp_organkey()));
			}
			if (t47_party1.getCreate_dt() != null) {
				t47_party1.setCreate_dt_disp(DateUtils.dateToStringShort(t47_party1.getCreate_dt()));
			}


			t47_partyList.add(t47_party1);

		}
		return t47_partyList;
	}


	public int getT07_modify_partyorganCount(SqlMapClient sqlMap,
			T47_party t47_party) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_modify_partyorganCount", t47_party);
		return iCount.intValue();
	}

	public int modifyT47_party_organ(SqlMapClient sqlMap,T47_party t47_part) throws SQLException {
		int i = sqlMap.update("modifyT47_party_organ", t47_part);
		return i;
	}

	public int modifyT47_agreement_I(SqlMapClient sqlMap,T47_party t47_part) throws SQLException {
		int i = sqlMap.update("modifyT47_agreement_I", t47_part);
		return i;
	}

	public int modifyT47_agreement_C(SqlMapClient sqlMap,T47_party t47_part) throws SQLException {
		int i = sqlMap.update("modifyT47_agreement_C", t47_part);
		return i;
	}

	public int modifyT47_agreement_D(SqlMapClient sqlMap,T47_party t47_part) throws SQLException {
		int i = sqlMap.update("modifyT47_agreement_D", t47_part);
		return i;
	}

	public int insertT07_modify_partyorgan(SqlMapClient sqlMap,T47_party t47_part) throws SQLException {
		int i = sqlMap.update("insertT07_modify_partyorgan", t47_part);
		return i;
	}

	public ArrayList getT47_partyList_for_case(SqlMapClient sqlMap, T47_party t47Party) throws SQLException {
		
		String sqlstr = "getT47_partyList_for_caseC";
		if (t47Party.getParty_class_cd().equals("I")) {
			sqlstr = "getT47_partyList_for_caseI";
		}
		ArrayList list = (ArrayList) sqlMap.queryForList(sqlstr, t47Party);
		ArrayList t47_partyList = new ArrayList();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_party t47_party1 = (T47_party) iter.next();
			
			if(t47_party1.getEnrol_fund_amt()== null || (t47_party1.getEnrol_fund_amt()!= null&&"".equals(t47_party1.getEnrol_fund_amt()))) 
			{
				t47_party1.setEnrol_fund_amt("0");
			}

			t47_partyList.add(t47_party1);

		}
		return t47_partyList;
	}
	public void insertInnerDao(SqlMapClient sqlMap, ArrayList<InnerDao> in)throws SQLException {
		for (int i=0;i<in.size();i++){
		 sqlMap.insert("insertInnerDao", in.get(i));
		}
	}
	public void delInnerDao(SqlMapClient sqlMap, InnerDao in)throws SQLException {
		 sqlMap.update("delInnerDao", in);	
	}
	public void matchInnerDao(SqlMapClient sqlMap, InnerDao in)throws SQLException {
		 sqlMap.update("matchInnerDao", in);	
	}
	public ArrayList<OuterDao> getOuterDao(SqlMapClient sqlMap, InnerDao in)throws SQLException {
		ArrayList<OuterDao> od=(ArrayList<OuterDao>) sqlMap.queryForList("getOuterDao", in);
		return od;
	}
}