package com.ist.aml.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.inves.dto.T47_cp_deposit;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T10_check_cust_card;
import com.ist.aml.report.dto.T10_check_cust_clue;
import com.ist.aml.report.dto.T10_check_cust_ke;
import com.ist.aml.report.dto.T10_check_cust_result;
import com.ist.aml.report.dto.T10_survey_cust;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;

public class T10_check_custDAO extends BaseDAO {

	public ArrayList getT10_survey_cust_list_typeList(SqlMapClient sqlMap, T10_survey_cust t10_survey_cust) throws SQLException {
		ArrayList t10_survey_custList = new ArrayList();
		t10_survey_custList = (ArrayList) sqlMap.queryForList("getT10_survey_cust_list_type_nsh", t10_survey_cust);

		ArrayList list_typeList = new ArrayList();

		LinkedHashMap list_typeMap = cm.getMapFromCache("list_type3");

		Iterator iter = t10_survey_custList.iterator();
		while (iter.hasNext()) {
			T10_survey_cust t10_survey_cust1 = (T10_survey_cust) iter.next();
			list_typeList.add((String) list_typeMap.get(t10_survey_cust1.getList_type()));
		}
		return list_typeList;
	}

	public T10_survey_cust getT10_survey_cust_info(SqlMapClient sqlMap, T10_survey_cust t10_survey_cust) throws SQLException {
		if (t10_survey_cust != null && "I".equalsIgnoreCase(t10_survey_cust.getParty_class_cd())) {
			t10_survey_cust = this.getT10_survey_i_cust(sqlMap, t10_survey_cust);
		}
		if (t10_survey_cust != null && "C".equalsIgnoreCase(t10_survey_cust.getParty_class_cd())) {
			t10_survey_cust = this.getT10_survey_c_cust(sqlMap, t10_survey_cust);
		}
		return t10_survey_cust;
	}

	public ArrayList get_check_cust_appList(SqlMapClient sqlMap, T07_case_application t07_case_app, int startRec, int intPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_check_caselist_nsh", t07_case_app, startRec, intPageSize);

		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");

		// 案例种类
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casetype");

		LinkedHashMap userMap = cm.getMapFromCache("t00_user");
		// 币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");// 币种
		LinkedHashMap alert_leverMap = cm.getMapFromCache("alert_lever");// 可疑级别
		MoneyUtils mUtils = new MoneyUtils();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				T07_case_application caseapp = (T07_case_application) list.get(i);
				if (caseapp.getApp_dt() != null) {
					caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp.getApp_dt()));
				}
				if (caseapp.getLast_upd_dt() != null) {
					caseapp.setLast_upd_dt_disp(DateUtils.dateToStringShort(caseapp.getLast_upd_dt()));
				}
				if (caseapp.getLast_upd_user() != null) {
					caseapp.setLast_upd_user((String) userMap.get(caseapp.getLast_upd_user()));
				}
				if (caseapp.getCast_type() != null && !"".equals(caseapp.getCast_type())) {
					caseapp.setCast_type_disp((String) casecagetoryMap.get(caseapp.getCast_type()));
				}
				if (caseapp.getApp_state_cd() != null && !"".equals(caseapp.getApp_state_cd())) {
					caseapp.setApp_state_cd_s((String) casestatusMap.get(caseapp.getApp_state_cd()));
				}

				if (caseapp.getAlert_level() != null && !"".equals(caseapp.getAlert_level())) {
					caseapp.setAlert_level_disp((String) alert_leverMap.get(caseapp.getAlert_level()));
				}
				if (caseapp.getTran_amt() != null) {

					String money = mUtils.FormatMoney(caseapp.getTran_amt().toString());
					caseapp.setTrans_amt(money);
				}
				if (caseapp.getCase_date() != null) {
					caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp.getCase_date()));
				}
			}
		}
		return list;
	}

	public int get_check_cust_appsCount(SqlMapClient sqlMap, T07_case_application t07_case_app) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject("getT10_check_caselistCount_nsh", t07_case_app);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}

	public ArrayList getT10_check_acctList(SqlMapClient sqlMap, T47_cp_deposit t47_cp_deposit, int startRec, int intPageSize)
			throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_check_acctlist_nsh", t47_cp_deposit, startRec, intPageSize);
		ArrayList t47_cp_depositList = new ArrayList();
		LinkedHashMap organ = cm.getMapFromCache("organ");
		LinkedHashMap acctypecdmap = cm.getMapFromCache("pbc_catp");// 账户类型
		LinkedHashMap acctstatuscdMap = cm.getMapFromCache("acctstatuscdmap");// 帐户状态
		Iterator iter = list.iterator();
		MoneyUtils moneyUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T47_cp_deposit t47_cp_deposit1 = (T47_cp_deposit) iter.next();
			if (t47_cp_deposit1.getOrgankey() != null && !"".equals(t47_cp_deposit1.getOrgankey())) {
				t47_cp_deposit1.setOrgankey((String) organ.get(t47_cp_deposit1.getOrgankey()));
			}
			if (t47_cp_deposit1.getAml_acct_type_cd() != null && !"".equals(t47_cp_deposit1.getAml_acct_type_cd())) {
				t47_cp_deposit1.setAcct_type_cd_disp((String) acctypecdmap.get(t47_cp_deposit1.getAml_acct_type_cd()));
			}
			if (t47_cp_deposit1.getAcct_status_cd() != null && !"".equals(t47_cp_deposit1.getAcct_status_cd())) {
				t47_cp_deposit1.setAcct_status_cd_flag_disp((String) acctstatuscdMap
						.get(t47_cp_deposit1.getAcct_status_cd_flag()));
			}
			if (t47_cp_deposit1.getOpen_dt() != null) {
				t47_cp_deposit1.setOpen_dt_disp(DateUtils.dateToStringShort(t47_cp_deposit1.getOpen_dt()));
			}
			if (t47_cp_deposit1.getClose_dt() != null) {
				t47_cp_deposit1.setClose_dt_disp(DateUtils.dateToStringShort(t47_cp_deposit1.getClose_dt()));
			}
			if (t47_cp_deposit1.getLast_occur_dt() != null) {
				t47_cp_deposit1.setLast_occur_dt_disp(DateUtils.dateToStringShort(t47_cp_deposit1.getLast_occur_dt()));
			}
			if (t47_cp_deposit1.getAmt_val() != null) {
				t47_cp_deposit1.setAmt_val(moneyUtils.FormatMoney(t47_cp_deposit1.getAmt_val()));
			}
			t47_cp_depositList.add(t47_cp_deposit1);
		}
		return t47_cp_depositList;
	}

	public int getT10_check_acctListCount(SqlMapClient sqlMap, T47_cp_deposit t47_cp_deposit) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject("getT10_check_acctlistCount_nsh", t47_cp_deposit);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}

	private T10_survey_cust getT10_survey_c_cust(SqlMapClient sqlMap, T10_survey_cust t10_survey_cust) throws SQLException {
		t10_survey_cust = (T10_survey_cust) sqlMap.queryForObject("getT10_survey_c_cust_info_nsh", t10_survey_cust);
		if (t10_survey_cust != null && t10_survey_cust.getOrg_credit_vt() != null) {
			t10_survey_cust.setOrg_credit_vt_disp(DateUtils.dateToStringShort(t10_survey_cust.getOrg_credit_vt()));
		}
		if (t10_survey_cust == null)
			t10_survey_cust = new T10_survey_cust();
		t10_survey_cust = handlerDisplayInfo(t10_survey_cust);
		return t10_survey_cust;
	}

	private T10_survey_cust getT10_survey_i_cust(SqlMapClient sqlMap, T10_survey_cust t10_survey_cust) throws SQLException {
		t10_survey_cust = (T10_survey_cust) sqlMap.queryForObject("getT10_survey_i_cust_info_nsh", t10_survey_cust);
		if (t10_survey_cust == null)
			t10_survey_cust = new T10_survey_cust();
		t10_survey_cust = handlerDisplayInfo(t10_survey_cust);
		return t10_survey_cust;
	}

	private T10_survey_cust handlerDisplayInfo(T10_survey_cust t10_survey_cust) {
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		LinkedHashMap ctvcMap = cm.getMapFromCache("pbc_ctvc");
		LinkedHashMap clientstaMap = cm.getMapFromCache("clientstatus");
		LinkedHashMap sexMap = cm.getMapFromCache("sex");
		LinkedHashMap usedMap = cm.getMapFromCache("isuse_type");
		LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");
		if (t10_survey_cust.getLicence_end_dt() != null) {
			t10_survey_cust.setLicence_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getLicence_end_dt()));
		}
		if (t10_survey_cust.getOrgan_code_end_dt() != null) {
			t10_survey_cust.setOrgan_code_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getOrgan_code_end_dt()));
		}
		if (t10_survey_cust.getNation_affair_end_dt() != null) {
			t10_survey_cust.setNation_affair_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getNation_affair_end_dt()));
		}
		if (t10_survey_cust.getLocal_affair_end_dt() != null) {
			t10_survey_cust.setLocal_affair_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getLocal_affair_end_dt()));
		}
		if (t10_survey_cust.getEnrol_fund_amt() != null && !"".equals(t10_survey_cust.getEnrol_fund_amt())) {
			t10_survey_cust.setEnrol_fund_amt(MoneyUtils.formatToMoney(t10_survey_cust.getEnrol_fund_amt()));
		}
		if (t10_survey_cust.getEnrol_fund_currency_cd() != null && !"".equals(t10_survey_cust.getEnrol_fund_currency_cd())) {
			t10_survey_cust.setEnrol_fund_currency_cd((String) pbc_currencyMap.get(t10_survey_cust.getEnrol_fund_currency_cd()));
		}
		if (t10_survey_cust.getBase_bank_id() != null && !"".equals(t10_survey_cust.getBase_bank_id())) {
			t10_survey_cust.setBase_bank_id((String) organMap.get(t10_survey_cust.getBase_bank_id()));
		}
		if (t10_survey_cust.getBase_bank_org() != null && !"".equals(t10_survey_cust.getBase_bank_org())) {
			t10_survey_cust.setBase_bank_org((String) organMap.get(t10_survey_cust.getBase_bank_org()));
		}
		if (t10_survey_cust.getIndustrykey() != null && !"".equals(t10_survey_cust.getIndustrykey())) {
			t10_survey_cust.setIndustrykey((String) ctvcMap.get(t10_survey_cust.getIndustrykey()));
		}
		if (t10_survey_cust.getLegal_card_type() != null && !"".equals(t10_survey_cust.getLegal_card_type())) {
			t10_survey_cust.setLegal_card_type((String) card_typeMap.get(t10_survey_cust.getLegal_card_type()));
		}
		if (t10_survey_cust.getLegal_card_no_end_dt() != null) {
			t10_survey_cust.setLegal_card_no_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getLegal_card_no_end_dt()));
		}
		if (t10_survey_cust.getFlag() != null && !"".equals(t10_survey_cust.getFlag())) {
			t10_survey_cust.setFlag((String) usedMap.get(t10_survey_cust.getFlag()));
		}
		if (t10_survey_cust.getOrgankey() != null && !"".equals(t10_survey_cust.getOrgankey())) {
			t10_survey_cust.setOrganname((String) organMap.get(t10_survey_cust.getOrgankey()));
		}
		if (t10_survey_cust.getCard_type() != null && !"".equals(t10_survey_cust.getCard_type())) {
			t10_survey_cust.setCard_type((String) card_typeMap.get(t10_survey_cust.getCard_type()));
		}
		if (t10_survey_cust.getCard_end_dt() != null) {
			t10_survey_cust.setCard_end_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getCard_end_dt()));
		}
		if (t10_survey_cust.getCountry_cd() != null && !"".equals(t10_survey_cust.getCountry_cd())) {
			t10_survey_cust.setCountry_cd((String) countryMap.get(t10_survey_cust.getCountry_cd()));
		}
		if (t10_survey_cust.getOccupation() != null && !"".equals(t10_survey_cust.getOccupation())) {
			t10_survey_cust.setOccupation((String) ctvcMap.get(t10_survey_cust.getOccupation()));
		}
		if (t10_survey_cust.getParty_status_cd() != null && !"".equals(t10_survey_cust.getParty_status_cd())) {
			t10_survey_cust.setParty_status_cd((String) clientstaMap.get(t10_survey_cust.getParty_status_cd()));
		}
		if (t10_survey_cust.getGender() != null && !"".equals(t10_survey_cust.getGender())) {
			t10_survey_cust.setGender((String) sexMap.get(t10_survey_cust.getGender()));
		}
		if (t10_survey_cust.getLast_upd_dt() != null) {
			t10_survey_cust.setLast_upd_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getLast_upd_dt()));
		}
		if(t10_survey_cust.getCreate_dt()!=null){
			t10_survey_cust.setCreate_dt_disp(DateUtils.dateToStringShort(t10_survey_cust.getCreate_dt()));
		}
		return t10_survey_cust;
	}

	public ArrayList getT10_check_custkeList(SqlMapClient sqlMap, T10_check_cust_ke t10_check_cust_ke, int startRec,
			int intPageSize) throws SQLException {
		ArrayList result = new ArrayList();
		T10_check_cust_ke t10_temp = new T10_check_cust_ke();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype"); // 客户类型
		LinkedHashMap risk_levelMap = cm.getMapFromCache("risk_level"); // 评级结果
		ArrayList temp = (ArrayList) sqlMap
				.queryForList("getT10_check_custkeAlertList", t10_check_cust_ke, startRec, intPageSize);
		Iterator iter = temp.iterator();
		while (iter.hasNext()) {
			t10_temp = (T10_check_cust_ke) iter.next();
			if (t10_temp.getOrgankey() != null && !"".equals(t10_temp.getOrgankey())) {
				t10_temp.setOrganName((String) organMap.get(t10_temp.getOrgankey()));
			}
			if (t10_temp.getParty_class_cd() != null && !"".equals(t10_temp.getParty_class_cd())) {
				t10_temp.setParty_class_cd_display((String) party_class_cdMap.get(t10_temp.getParty_class_cd()));
			}
			if (t10_temp.getLevelkey() != null && !"".equals(t10_temp.getLevelkey())) {
				t10_temp.setLevel_disp((String) risk_levelMap.get(t10_temp.getLevelkey()));
			}
			result.add(t10_temp);
		}
		return result;
	}

	public int getT10_check_custkeListCount(SqlMapClient sqlMap, T10_check_cust_ke t10_check_cust_ke) throws SQLException {
		Integer rows = (Integer) sqlMap.queryForObject("getT10_check_custkeAlertListCount", t10_check_cust_ke);
		if (rows == null) {
			return 0;
		}
		return rows.intValue();
	}

	public T10_check_cust_clue getT47_clientDisp(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		if (T47_client != null && T47_client.getParty_class_cd() != null
				&& T47_client.getParty_class_cd().trim().equalsIgnoreCase("I")) {
			T47_client = this.getT47_i_clientDisp(sqlMap, T47_client);
		} else {
			T47_client = this.getT47_c_clientDisp(sqlMap, T47_client);
		}
		return T47_client;
	}

	public T10_check_cust_clue getT47_i_clientDisp(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		T47_client = (T10_check_cust_clue) sqlMap.queryForObject("getT47_i_clientDisp", T47_client);
		if (T47_client == null)
			T47_client = new T10_check_cust_clue();
		return T47_client;
	}

	public T10_check_cust_clue getT47_c_clientDisp(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		T10_check_cust_clue t47_client = (T10_check_cust_clue) sqlMap.queryForObject("getT47_c_clientDisp", T47_client);

		if (T47_client == null)
			t47_client = new T10_check_cust_clue();
		return t47_client;
	}

	public ArrayList getT10_BUSINESSINFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_BUSINESSINFO", T47_client);
		return list;
	}

	public ArrayList getT10_ECONOMYINFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_ECONOMYINFO", T47_client);
		return list;
	}

	public ArrayList getT10_CONTROLLERINFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_CONTROLLERINFO", T47_client);

		LinkedHashMap card_typeMap2 = cm.getMapFromCache("card_type");
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				T10_check_cust_clue clue = (T10_check_cust_clue) list.get(i);
				if (clue.getCard_due_dt() != null) {
					clue.setCard_due_dt_disp(DateUtils.dateToStringShort(clue.getCard_due_dt()));
				}
				if (!"".equals(clue.getAmt())) {
					MoneyUtils mUtils = new MoneyUtils();
					if (clue.getAmt() != null) {
						String money = mUtils.FormatMoney(new Double(clue.getAmt()).doubleValue());
						clue.setAmt(money);
					}

				}
				if (clue.getCard_type() != null) {
					clue.setCard_type((String) card_typeMap2.get(clue.getCard_type()));
				}
			}
		}
		return list;
	}

	public ArrayList getT10_DAIBANPERINFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_DAIBANPERINFO", T47_client);
		LinkedHashMap card_typeMap2 = cm.getMapFromCache("card_type");
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				T10_check_cust_clue clue = (T10_check_cust_clue) list.get(i);
				if (clue.getCard_due_dt() != null) {
					clue.setCard_due_dt_disp(DateUtils.dateToStringShort(clue.getCard_due_dt()));
				}
				if (clue.getCard_type() != null) {
					clue.setCard_type((String) card_typeMap2.get(clue.getCard_type()));
				}
			}
		}
		return list;
	}

	public ArrayList getT10_OPPCUSTINFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_OPPCUSTINFO", T47_client);
		LinkedHashMap card_typeMap2 = cm.getMapFromCache("card_type");
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				T10_check_cust_clue clue = (T10_check_cust_clue) list.get(i);
				if (clue.getParty_class_cd() != null) {
					if ("C".equals(clue.getParty_class_cd())) {
						clue.setParty_class_cd_disp("对公客户");
					} else {
						clue.setParty_class_cd_disp("对私客户");
					}
				}
				if (clue.getCard_type() != null) {
					clue.setCard_type((String) card_typeMap2.get(clue.getCard_type()));
				}
			}
		}
		return list;
	}

	public int modifyT47_client(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		int i = sqlMap.update("modifyT47_party1", T47_client);
		return i;
	}

	public int modifyT47_client2(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		int i = sqlMap.update("modifyT47_client2", T47_client);
		return i;
	}

	public int insert_cust_table(SqlMapClient sqlMap, T10_check_cust_clue T47_client, String tablename) throws SQLException {
		int i = 0;
		int count = 0;
		Object obj = null;
		if ("T10_BUSINESS_INFO".equals(tablename)) {
			obj = sqlMap.queryForObject("getT10_BUSINESSINFOCount", T47_client);
			if (obj == null) {
				obj = 0;
			}
			count = (Integer) obj;
			T47_client.setNum(count + 1);
			i = sqlMap.update("insert_cust_tableT10_BUSINESS_INFO", T47_client);
		} else if ("T10_ECONOMY_INFO".equals(tablename)) {
			obj = sqlMap.queryForObject("get_cust_tableT10_ECONOMY_INFOCount", T47_client);
			if (obj == null) {
				obj = 0;
			}
			count = (Integer) obj;
			T47_client.setNum(count + 1);
			i = sqlMap.update("insert_cust_tableT10_ECONOMY_INFO", T47_client);
		} else if ("T10_OPP_CUST_INFO".equals(tablename)) {
			obj = sqlMap.queryForObject("get_cust_tableT10_OPP_CUST_INFOCount", T47_client);
			if (obj == null) {
				obj = 0;
			}
			count = (Integer) obj;
			T47_client.setNum(count + 1);
			i = sqlMap.update("insert_cust_tableT10_OPP_CUST_INFO", T47_client);
		} else if ("T10_AGENT_INFO".equals(tablename)) {
			obj = sqlMap.queryForObject("get_cust_tableT10_AGENT_INFOCount", T47_client);
			if (obj == null) {
				obj = 0;
			}
			count = (Integer) obj;
			T47_client.setNum(count + 1);
			i = sqlMap.update("insert_cust_tableT10_AGENT_INFO", T47_client);
		} else if ("T10_CONTROLLERINFO".equals(tablename)) {
			obj = sqlMap.queryForObject("get_cust_tableT10_CONTROLLERINFOCount", T47_client);
			if (obj == null) {
				obj = 0;
			}
			count = (Integer) obj;
			T47_client.setNum(count + 1);
			i = sqlMap.update("insert_cust_tableT10_CONTROLLERINFO", T47_client);
		}
		return i;
	}

	public T10_check_cust_clue getT10_CHECK_CUST_RESULT(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		T10_check_cust_clue t47_client = (T10_check_cust_clue) sqlMap.queryForObject("getT10_CHECK_CUST_RESULT", T47_client);
		LinkedHashMap check_result_map = cm.getMapFromCache("check_result");
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		ArrayList t10_check_resultList = new ArrayList();

		if (t47_client != null) {
			if (t47_client.getValid_dt() != null) {
				t47_client.setValid_dt_disp(DateUtils.dateToStringShort(t47_client.getValid_dt()));

			}
			if (t47_client.getCheck_dt() != null) {
				t47_client.setValidate_dt_new_disp(DateUtils.dateToStringShort(t47_client.getCheck_dt()));

			}
			if (t47_client.getCheck_result() != null) {
				t47_client.setClue_desc((String) check_result_map.get(t47_client.getCheck_result()));
			}
			if (t47_client.getChecker_org() != null) {
				t47_client.setChecker_org((String) organMap.get(t47_client.getChecker_org()));
			}
			if ("1".equals(t47_client.getCheck_type())) {
				t47_client.setCheck_type("可疑客户");
			} else if ("2".equals(t47_client.getCheck_type())) {
				t47_client.setCheck_type("证件到期客户");
			}
		}
		if (T47_client == null)
			t47_client = new T10_check_cust_clue();
		return t47_client;
	}

	public T47_party getT47_partyDisp(SqlMapClient sqlMap, String party_id) throws SQLException {
		T47_party t47_party = (T47_party) sqlMap.queryForObject("getT47_partyDisp", party_id);
		if (t47_party == null)
			t47_party = new T47_party();
		return t47_party;
	}

	public int dmlT10_CHECK_CUST_RESULT(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		int i = sqlMap.update("insert_T10_CHECK_CUST_RESULT_HIS", T47_client);
		sqlMap.update("delete_T10_CHECK_CUST_RESULT", T47_client);
		sqlMap.update("insert_T10_CHECK_CUST_RESULT", T47_client);
		return i;
	}

	public T10_check_cust_clue getnametablebyPartyid(SqlMapClient sqlMap, T10_check_cust_clue T47_client, String tablename)
			throws SQLException {
		T10_check_cust_clue t47_client = null;
		if ("T07_WHITELIST_INFO".equals(tablename)) {
			t47_client = (T10_check_cust_clue) sqlMap.queryForObject("getnametablebyPartyid", T47_client);

		} else if ("T07_BLACKLIST".equals(tablename)) {
			t47_client = (T10_check_cust_clue) sqlMap.queryForObject("getblacknametablebyPartyid", T47_client);

		}

		if (t47_client != null && t47_client.getValidate_dt_new() != null) {
			t47_client.setValidate_dt_new_disp(DateUtils.dateToStringShort(t47_client.getValidate_dt_new()));
		}
		if (t47_client != null && t47_client.getInvalidate_dt_new() != null) {
			t47_client.setInvalidate_dt_new_disp(DateUtils.dateToStringShort(t47_client.getInvalidate_dt_new()));
		}
		return t47_client;
	}

	public int insertT07_WHITELIST_INFO(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		int i = sqlMap.update("insertT07_WHITELIST_INFO", T47_client);

		return i;
	}

	public int insertT07_BLACKLIST(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {

		int i = sqlMap.update("insertT07_BLACKLIST", T47_client);

		return i;
	}

	public ArrayList getT10_check_custcardList(SqlMapClient sqlMap, T10_check_cust_card t10_check_cust_card, int startRec,
			int intPageSize) throws SQLException {
		ArrayList result = new ArrayList();
		T10_check_cust_card t10_temp = new T10_check_cust_card();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap cardMap = cm.getMapFromCache("card_type");
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		ArrayList temp = (ArrayList) sqlMap.queryForList("getT10_check_custcardList", t10_check_cust_card, startRec, intPageSize);
		Iterator iter = temp.iterator();
		while (iter.hasNext()) {
			t10_temp = (T10_check_cust_card) iter.next();
			if (t10_temp.getOrgankey() != null && !"".equals(t10_temp.getOrgankey())) {
				t10_temp.setOrgan_display((String) organMap.get(t10_temp.getOrgankey()));
			}
			if (t10_temp.getParty_class_cd() != null && !"".equals(t10_temp.getParty_class_cd())) {
				t10_temp.setParty_class_cd_display((String) party_class_cdMap.get(t10_temp.getParty_class_cd()));
			}
			if (t10_temp.getCard_type() != null && !"".equals(t10_temp.getCard_type())) {
				t10_temp.setCard_type_display((String) cardMap.get(t10_temp.getCard_type()));
			}
			if (t10_temp.getCard_due_dt() != null) {
				t10_temp.setCard_due_dt_display(DateUtils.dateToStringShort(t10_temp.getCard_due_dt()));
			}
			result.add(t10_temp);
		}
		return result;
	}

	/**
	 * 查询证件到期客户数量
	 * 
	 * @param sqlMap
	 * @param t10_check_cust_card
	 * @return
	 * @throws SQLException
	 */
	public int getT10_check_custcardListCount(SqlMapClient sqlMap, T10_check_cust_card t10_check_cust_card) throws SQLException {
		Integer rows = (Integer) sqlMap.queryForObject("getT10_check_custcardListCount", t10_check_cust_card);
		if (rows == null) {
			return 0;
		}
		return rows.intValue();
	}

	public ArrayList getT10_check_resultList(SqlMapClient sqlMap, T10_check_cust_result t10_check_cust_result, int startRec,
			int intPageSize) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_check_resultList", t10_check_cust_result, startRec, intPageSize);

		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		LinkedHashMap check_result_map = cm.getMapFromCache("check_result");
		ArrayList t10_check_resultList = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T10_check_cust_result cust_result = (T10_check_cust_result) iter.next();
			if (cust_result != null && cust_result.getParty_class_cd() != null) {
				cust_result.setParty_class_cd_display((String) party_class_cdMap.get(cust_result.getParty_class_cd()));
			}
			if (cust_result.getCheck_result() != null) {
				cust_result.setCheck_result_display((String) check_result_map.get(cust_result.getCheck_result()));
			}
			if (cust_result.getCheck_dt() != null) {
				cust_result.setCheck_dt_display(DateUtils.dateToStringShort(cust_result.getCheck_dt()));
			}
			if (cust_result.getValid_dt() != null) {
				cust_result.setValid_dt_display(DateUtils.dateToStringShort(cust_result.getValid_dt()));
			}
			if (cust_result.getOrgankey() != null) {
				cust_result.setOrganName((String) organMap.get(cust_result.getOrgankey()));
			}

			t10_check_resultList.add(cust_result);
		}
		return t10_check_resultList;
	}

	public int getT10_check_resultListCount(SqlMapClient sqlMap, T10_check_cust_result t10_check_cust_result) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject("getT10_check_resultListCount", t10_check_cust_result);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}

	// 通过客户号查询客户调查结论
	public T10_check_cust_result getCheckCustResult(SqlMapClient sqlMap, String party_id) throws SQLException {

		LinkedHashMap check_type_map = cm.getMapFromCache("check_type");// 调查类型
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		LinkedHashMap check_result_map = cm.getMapFromCache("check_result");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		T10_check_cust_result cust_result = (T10_check_cust_result) sqlMap.queryForObject("get_cust_survey_result", party_id);
		if (cust_result == null) {
			return new T10_check_cust_result();
		}
		if (cust_result != null && cust_result.getParty_class_cd() != null) {
			cust_result.setParty_class_cd_display((String) party_class_cdMap.get(cust_result.getParty_class_cd()));
		}
		if (cust_result.getCheck_result() != null) {
			cust_result.setCheck_result_display((String) check_result_map.get(cust_result.getCheck_result()));
		}
		if (cust_result.getCheck_dt() != null) {
			cust_result.setCheck_dt_display(DateUtils.dateToStringShort(cust_result.getCheck_dt()));
		}
		if (cust_result.getValid_dt() != null) {
			cust_result.setValid_dt_display(DateUtils.dateToStringShort(cust_result.getValid_dt()));
		}
		if (cust_result.getOrgankey() != null) {
			cust_result.setOrganName((String) organMap.get(cust_result.getOrgankey()));
		}
		if (cust_result.getCheck_type() != null && !"".equals(cust_result.getCheck_type())) {
			cust_result.setCheck_type((String) check_type_map.get(cust_result.getCheck_type()));
		}
		if (cust_result.getChecker_org() != null && !"".equals(cust_result.getChecker_org())) {
			cust_result.setChecker_org((String) organMap.get(cust_result.getChecker_org()));
		}
		return cust_result;
	}

	public ArrayList getT10_CHECK_CUST_RESULT_his(SqlMapClient sqlMap, T10_check_cust_clue T47_client) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_CHECK_CUST_RESULT_his", T47_client);

		// LinkedHashMap userMap = cm.getMapFromCache("t00_user");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap check_resultMap = cm.getMapFromCache("check_result");

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				T10_check_cust_clue client = (T10_check_cust_clue) list.get(i);
				if (client.getValid_dt() != null) {
					client.setValid_dt_disp(DateUtils.dateToStringShort(client.getValid_dt()));
				}
				if (client.getCheck_dt() != null) {
					client.setCard_due_dt_disp(DateUtils.dateToStringShort(client.getCheck_dt()));
				}
				if ("1".equals(client.getCheck_type())) {
					client.setCheck_type("可疑客户");
				} else if ("2".equals(client.getCheck_type())) {
					client.setCheck_type("证件到期客户");
				}
				if (client.getChecker_org() != null) {
					client.setChecker_org((String) organMap.get(client.getChecker_org()));
				}
				if (client.getCheck_result() != null) {
					client.setCheck_result((String) check_resultMap.get(client.getCheck_result()));
				}
				// if(client.getChecker()!=null){
				// client.setChecker((String)userMap.get(client.getChecker())) ;
				// }
			}

		}

		return list;
	}

	public ArrayList getT10_check_custkeList(SqlMapClient sqlMap, T10_check_cust_ke t10_check_cust_ke) throws SQLException {
		ArrayList result = new ArrayList();
		T10_check_cust_ke t10_temp = new T10_check_cust_ke();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype"); // 客户类型
		ArrayList temp = (ArrayList) sqlMap.queryForList("getT10_check_custkeAlertList", t10_check_cust_ke);
		Iterator iter = temp.iterator();
		while (iter.hasNext()) {
			t10_temp = (T10_check_cust_ke) iter.next();
			if (t10_temp.getOrgankey() != null && !"".equals(t10_temp.getOrgankey())) {
				t10_temp.setOrganName((String) organMap.get(t10_temp.getOrgankey()));
			}
			if (t10_temp.getParty_class_cd() != null && !"".equals(t10_temp.getParty_class_cd())) {
				t10_temp.setParty_class_cd_display((String) party_class_cdMap.get(t10_temp.getParty_class_cd()));
			}
			if (t10_temp.getCheck_result() != null) {
				t10_temp.setCheck_result((String) party_class_cdMap.get(t10_temp.getCheck_result()));
			}
			result.add(t10_temp);
		}
		return result;
	}

	public ArrayList getT10_check_custcardList(SqlMapClient sqlMap, T10_check_cust_card t10_check_cust_card) throws SQLException {
		ArrayList result = new ArrayList();
		T10_check_cust_card t10_temp = new T10_check_cust_card();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap cardMap = cm.getMapFromCache("card_type");
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		ArrayList temp = (ArrayList) sqlMap.queryForList("getT10_check_custcardList", t10_check_cust_card);
		Iterator iter = temp.iterator();
		while (iter.hasNext()) {
			t10_temp = (T10_check_cust_card) iter.next();
			if (t10_temp.getOrgankey() != null && !"".equals(t10_temp.getOrgankey())) {
				t10_temp.setOrgan_display((String) organMap.get(t10_temp.getOrgankey()));
			}
			if (t10_temp.getParty_class_cd() != null && !"".equals(t10_temp.getParty_class_cd())) {
				t10_temp.setParty_class_cd_display((String) party_class_cdMap.get(t10_temp.getParty_class_cd()));
			}
			if (t10_temp.getCard_type() != null && !"".equals(t10_temp.getCard_type())) {
				t10_temp.setCard_type_display((String) cardMap.get(t10_temp.getCard_type()));
			}
			if (t10_temp.getCard_due_dt() != null) {
				t10_temp.setCard_due_dt_display(DateUtils.dateToStringShort(t10_temp.getCard_due_dt()));
			}
			result.add(t10_temp);
		}

		return result;
	}

	public ArrayList getT10_check_resultList(SqlMapClient sqlMap, T10_check_cust_result t10_check_cust_result)
			throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT10_check_resultList", t10_check_cust_result);
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		LinkedHashMap check_result_map = cm.getMapFromCache("check_result");
		ArrayList t10_check_resultList = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T10_check_cust_result cust_result = (T10_check_cust_result) iter.next();
			if (cust_result != null && cust_result.getParty_class_cd() != null) {
				cust_result.setParty_class_cd_display((String) party_class_cdMap.get(cust_result.getParty_class_cd()));
			}
			if (cust_result.getCheck_result() != null) {
				cust_result.setCheck_result_display((String) check_result_map.get(cust_result.getCheck_result()));
			}
			if (cust_result.getCheck_dt() != null) {
				cust_result.setCheck_dt_display(DateUtils.dateToStringShort(cust_result.getCheck_dt()));
			}
			if (cust_result.getValid_dt() != null) {
				cust_result.setValid_dt_display(DateUtils.dateToStringShort(cust_result.getValid_dt()));
			}
			if (cust_result.getOrgankey() != null) {
				cust_result.setOrganName((String) organMap.get(cust_result.getOrgankey()));
			}
			if (cust_result.getChecker_org() != null) {
				cust_result.setChecker_org((String) organMap.get(cust_result.getChecker_org()));
			}
			if (cust_result.getCheck_result() != null) {
				cust_result.setCheck_result((String) check_result_map.get(cust_result.getCheck_result()));
			}
			t10_check_resultList.add(cust_result);
		}
		return t10_check_resultList;
	}

	public T47_cp_deposit getacctinfobyaccnum(SqlMapClient sqlMap, T47_cp_deposit T47_client) throws SQLException {
		T47_cp_deposit t47_client = null;

		LinkedHashMap organ = cm.getMapFromCache("organ");
		LinkedHashMap acctypecdmap = cm.getMapFromCache("acctypecdmap");// 账户类型
		LinkedHashMap acctstatuscdMap = cm.getMapFromCache("acctstatuscdmap");// 帐户状态
		LinkedHashMap acct_property_cdMap = cm.getMapFromCache("acct_property_cd_bh");// 结算户性质
		MoneyUtils moneyUtils = new MoneyUtils();

		t47_client = (T47_cp_deposit) sqlMap.queryForObject("getacctinfobyaccnum_nsh", T47_client);

		if (t47_client != null) {

			if (t47_client.getAcct_type_cd() != null) {
				t47_client.setAcct_type_cd_disp((String) acct_property_cdMap.get(t47_client.getOrgankey()));
			}
			if (t47_client.getOrgankey() != null) {
				t47_client.setOrgankey((String) organ.get(t47_client.getOrgankey()));
			}
			if (t47_client.getOpen_dt() != null) {
				t47_client.setOpen_dt_disp(DateUtils.dateToStringShort(t47_client.getOpen_dt()));
			}
			if (t47_client.getAcct_processing_dt() != null) {
				t47_client.setAcct_processing_dt_disp(DateUtils.dateToStringShort(t47_client.getAcct_processing_dt()));
			}
			if (t47_client.getMature_dt() != null) {
				t47_client.setMature_dt_disp(DateUtils.dateToStringShort(t47_client.getMature_dt()));
			}
			if (t47_client.getLast_occur_dt() != null) {
				t47_client.setLast_occur_dt_disp(DateUtils.dateToStringShort(t47_client.getLast_occur_dt()));
			}
			if (t47_client.getClose_dt() != null) {
				t47_client.setClose_dt_disp(DateUtils.dateToStringShort(t47_client.getClose_dt()));
			}
			if (t47_client.getAmt_val() != null) {
				t47_client.setAmt_val(moneyUtils.FormatMoney(t47_client.getAmt_val()));
			}
			if (t47_client.getAcct_status_cd() != null) {
				t47_client.setAcct_status_cd((String) acctstatuscdMap.get(t47_client.getAcct_status_cd()));
			}

		} else {
			t47_client = new T47_cp_deposit();
		}
		return t47_client;
	}

	/**
	 * 根据传入的索引删除对应的表数据
	 * @param sqlMap
	 * @param checkCustClue
	 * @param index
	 * @throws SQLException
	 */
	public void delete(SqlMapClient sqlMap, T10_check_cust_clue checkCustClue, int index) throws SQLException {
		if (index == 1) {
			sqlMap.delete("delT10_BUSINESSINFO", checkCustClue);
		} else if (index == 2) {
			sqlMap.delete("delT10_ECONOMYINFO", checkCustClue);
		} else if (index == 3) {
			sqlMap.delete("delT10_CONTROLLERINFO", checkCustClue);
		} else if (index == 4) {
			sqlMap.delete("delT10_DAIBANPERINFO", checkCustClue);
		} else if (index == 5) {
			sqlMap.delete("delT10_OPPCUSTINFO", checkCustClue);
		}
	}

}
