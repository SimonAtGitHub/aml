package com.ist.aml.inves.dao;


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
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T47_corporation;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;


public class T47_corporationDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6540309551456783153L;
	private static Logger logger = LogUtils.getLogger(T47_corporationDAO.class
			.getName());

	/** 
	 * 构造函数 
	 */
	public T47_corporationDAO() {
	}


	/** 
	 * 取得记录总数 
	 * @param sqlMap SqlMapClient 
	 * @param t47_corporation T47_corporation 
	 * @throws SQLException   
	 * @return int  
	 */
	public int getT47_corporationListCount(SqlMapClient sqlMap,
			T47_corporation t47_corporation) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_corporationListCount", t47_corporation);
		return iCount.intValue();
	}

	/** 
	 * 取单条明细操作 
	 * @param sqlMap SqlMapClient 
	 * @param Party_id String  
	 * @throws SQLException   
	 * @return T47_corporation  
	 */
	public T47_corporation getT47_corporationDisp(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		T47_corporation t47_corporation = (T47_corporation) sqlMap
				.queryForObject("getT47_corporationDisp", party_id);
		if (t47_corporation == null){
			t47_corporation = new T47_corporation();
		}else{
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");//企业规模
			LinkedHashMap comptype = cm.getMapFromCache("comptype");//企业规模
			LinkedHashMap unclaimedtype = cm.getMapFromCache("unclaimedtype");//企业规模
			LinkedHashMap orgMap = cm.getMapFromCache("organ");//机构
			LinkedHashMap industrykeyMap = cm.getMapFromCache("pbc_ctvc");//对公所属行业
			LinkedHashMap depositer_tyMap = cm.getMapFromCache("depositer_ty");
			LinkedHashMap curr_cdMap = cm.getMapFromCache("currency"); //币种
			if (t47_corporation.getCompany_scope() != null
					&& !"".equals(t47_corporation.getCompany_scope())) {
				t47_corporation.setCompany_scope((String) comptype
						.get(t47_corporation.getCompany_scope()));
			}
			if (t47_corporation.getHaving_sys_form() != null
					&& !"".equals(t47_corporation.getHaving_sys_form())) {
				t47_corporation.setHaving_sys_form((String) unclaimedtype
						.get(t47_corporation.getHaving_sys_form()));
			}
			if (t47_corporation.getBase_bank_id() != null
					&& !"".equals(t47_corporation.getBase_bank_id())) {
				t47_corporation.setBase_bank_id((String) orgMap.get(t47_corporation
						.getBase_bank_id()));
			}
			if (t47_corporation.getCompany_type_cd() != null
					&& !"".equals(t47_corporation.getCompany_type_cd())) {
				t47_corporation.setCompany_type_cd_disp((String) unclaimedtype
						.get(t47_corporation.getCompany_type_cd()));
			}
			if (t47_corporation.getIndustrykey() != null
					&& !"".equals(t47_corporation.getIndustrykey())) {
				t47_corporation.setIndustrykey_disp((String) industrykeyMap
						.get(t47_corporation.getIndustrykey()));
			}
			if(t47_corporation.getLicence_end_dt()!=null){
				t47_corporation.setLicence_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getLicence_end_dt()));
			}
			if(t47_corporation.getDepositer_ty()!=null&&!"".equalsIgnoreCase(t47_corporation.getDepositer_ty())){
				t47_corporation.setDepositer_ty((String)depositer_tyMap.get(t47_corporation.getDepositer_ty()));
			}
			if(t47_corporation.getRegister_dt()!=null){
				t47_corporation.setRegister_dt_display(DateUtils.dateToStringShort(t47_corporation.getRegister_dt()));
			}
			if(t47_corporation.getEnrol_fund_currency_cd()!=null&&!"".equalsIgnoreCase(t47_corporation.getEnrol_fund_currency_cd())){
				t47_corporation.setEnrol_fund_currency_cd((String)curr_cdMap.get(t47_corporation.getEnrol_fund_currency_cd()));
			}
			if(t47_corporation.getBase_bank_org()!=null&&!"".equalsIgnoreCase(t47_corporation.getBase_bank_org())){
				t47_corporation.setBase_bank_org((String)orgMap.get(t47_corporation.getBase_bank_org()));
			}
			if(t47_corporation.getLegal_card_type()!=null&&!"".equalsIgnoreCase(t47_corporation.getLegal_card_type())){
				t47_corporation.setLegal_card_type((String)card_typeMap.get(t47_corporation.getLegal_card_type()));
			}
			if(t47_corporation.getStock_holder_card_type()!=null&&!"".equalsIgnoreCase(t47_corporation.getStock_holder_card_type())){
				t47_corporation.setStock_holder_card_type((String)card_typeMap.get(t47_corporation.getStock_holder_card_type()));
			}
			if(t47_corporation.getLegal_card_no_end_dt()!=null){
				t47_corporation.setLegal_card_no_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getLegal_card_no_end_dt()));
			}
			if(t47_corporation.getLocal_affair_end_dt()!=null){
				t47_corporation.setLocal_affair_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getLocal_affair_end_dt()));
			}
			if(t47_corporation.getNation_affair_end_dt()!=null){
				t47_corporation.setNation_affair_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getNation_affair_end_dt()));
			}
			if(t47_corporation.getStock_holder_card_no_end_dt()!=null){
				t47_corporation.setStock_holder_card_no_end_dt_display(DateUtils.dateToStringShort(t47_corporation.getStock_holder_card_no_end_dt()));
			}
			/*
			if(t47_corporation.getLicence_end_dt()!=null){
				t47_corporation.setLicence_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getStock_holder_card_no_end_dt()));
			}
			*/
			if(t47_corporation.getOrgan_code_end_dt()!=null){
				t47_corporation.setOrgan_code_end_dt_disp(DateUtils.dateToStringShort(t47_corporation.getOrgan_code_end_dt()));
			}
		}
		return t47_corporation;
	}

	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t47_corporation T47_corporation 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT47_corporation(SqlMapClient sqlMap,
			T47_corporation t47_corporation) throws SQLException {
		if (t47_corporation.getEnrol_fund_amt() == null
				|| "".equals(t47_corporation.getEnrol_fund_amt())) {
			t47_corporation.setEnrol_fund_amt("0");
		}
		int i = sqlMap.update("insertT47_corporation", t47_corporation);
		return i;
	}

	/** 
	 * 修改操作 
	 * @param sqlMap SqlMapClient 
	 * @param t47_corporation T47_corporation 
	 * @throws SQLException   
	 * @return int  
	 */
	public int modifyT47_corporation(SqlMapClient sqlMap,
			T47_corporation t47_corporation) throws SQLException {
		int i = sqlMap.update("modifyT47_corporation", t47_corporation);
		return i;
	}

	/** 
	 * 删除操作 
	 * @param sqlMap SqlMapClient 
	 * @param Party_id String  
	 * @throws SQLException   
	 * @return int  
	 */
	public int deleteT47_corporation(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		int i = sqlMap.update("deleteT47_corporation", party_id);
		return i;
	}

	public int modifyValidatedT47_corporation(SqlMapClient sqlMap,
			T47_party t47_party) throws SQLException {
		int i = sqlMap.update("modifyValidatedT47_corporation", t47_party);
		return i;
	}
}

