/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-29   青蛙		创建  
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
import java.util.LinkedHashMap;
import java.util.TreeMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.pbcreport.dao.T47_agreementDAO;
import com.ist.aml.pbcreport.dto.T47_agreement;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_trans_recordLog;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;
import com.ist.util.StringUtils;


public class T47_transactionDAO extends BaseDAO {
	

	/**
	 * 构造函数
	 */
	public T47_transactionDAO() {
	}

	//一补查询方法
	public ArrayList getT47_trade_transactionList_1b(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_trade_transactionList_1b", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
	

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			if (t47_transactionDTO.getDt_time() != null) {
				t47_transactionDTO.setDt_time_disp(DateUtils.dateToString(
						t47_transactionDTO.getDt_time()).substring(11, 19));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	//一补查询方法
	public int getT47_trade_transactionListCount_1b(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_trade_transactionListCount_1b", t47_transaction);
		return iCount.intValue();
	}
	
	public T47_transaction getT47_transactionFillDisp11(SqlMapClient sqlMap,
			String transactionkey, String tableName) throws SQLException {
		T47_transaction t47_transaction;
		if("t47_transaction_ub".equals(tableName)) {	// 针对一补t47_transaction_ub 
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ubDisp", transactionkey);
		} else if("t47_transaction_uc".equals(tableName)) {	// 针对二补t47_transaction_uc
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ucDisp", transactionkey);
		} else {
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transactionDisp", transactionkey);
		}
		if (t47_transaction == null) {
			t47_transaction = new T47_transaction();
		} else {
			LinkedHashMap opp_organ_typeMap = cm.getMapFromCache(
			"cfct_hash"); // 对手行行号类型

			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); //客户类型

			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type"); // 证件类型

			LinkedHashMap currencyMap = cm.getMapFromCache("currency");

			LinkedHashMap organMap = cm.getMapFromCache("organ");
			LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay"); //收付类型
			LinkedHashMap debit_creditMap = cm.getMapFromCache("trackflag"); //借贷类型
			LinkedHashMap areaidMap = cm.getMapFromCache("areaid"); //
			LinkedHashMap areaMap = cm.getMapFromCache("area23");

			//TreeMap  PBC_SWSZidMap=cm.getCodeTable2HashCatch("PBC_SWSZid",true); //境内外汇收支交易
			if (t47_transaction.getOpp_organ_type() != null) {
				String opp_organ_type = (String) opp_organ_typeMap
						.get(t47_transaction.getOpp_organ_type());
				t47_transaction.setOpp_organ_type_value(opp_organ_type);
			}
			if (t47_transaction.getOrgankey() != null
					&& !"".equals(t47_transaction.getOrgankey())) {
				String organname = (String) organMap.get(t47_transaction
						.getOrgankey());
				t47_transaction.setOrganName(organname);
			}
			if (t47_transaction.getOpp_area() != null
					&& !"".equals(t47_transaction.getOpp_area())
					&& !t47_transaction.getOpp_area().endsWith(
							Constans.AREAVALUE)) {

				String op_areaid = t47_transaction.getOpp_area();
				String op_areaupid = (String) areaidMap.get(op_areaid);
				String comstr = op_areaid.substring(op_areaid.length() - 2,
						op_areaid.length());
				String comstr1 = op_areaid.substring(op_areaid.length() - 4,
						op_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setOpp_area1(op_areaid);
					} else {
						t47_transaction.setOpp_area2(op_areaid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(op_areaid));
						t47_transaction.setOpp_area1(op_areaupid);
					}
				} else {
					t47_transaction.setOpp_areaName((String) areaMap
							.get(op_areaid));

					if (op_areaupid != null) {
						t47_transaction.setOpp_area2(op_areaupid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(op_areaupid));
						t47_transaction.setOpp_area1((String) areaidMap
								.get(op_areaupid));
					}
				}

			}
			if (t47_transaction.getTx_go_area() != null
					&& !t47_transaction.getTx_go_area().trim().equals("")
					&& !t47_transaction.getTx_go_area().equals(
							Constans.AREAVALUE)) {
				String go_areaid = t47_transaction.getTx_go_area();
				String go_areaupid = (String) areaidMap.get(go_areaid);
				String comstr = go_areaid.substring(go_areaid.length() - 2,
						go_areaid.length());
				String comstr1 = go_areaid.substring(go_areaid.length() - 4,
						go_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setTx_go_area1(go_areaid);
					} else {
						t47_transaction.setTx_go_area2(go_areaid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaid));
						t47_transaction.setTx_go_area1(go_areaupid);
					}
				} else {
					t47_transaction.setTx_go_areaname((String) areaMap
							.get(go_areaid));

					if (go_areaupid != null) {
						t47_transaction.setTx_go_area2(go_areaupid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaupid));
						t47_transaction.setTx_go_area1((String) areaidMap
								.get(go_areaupid));
					}
				}

			}
			if (t47_transaction.getTx_occur_area() != null
					&& !t47_transaction.getTx_occur_area().trim().equals("")
					&& !t47_transaction.getTx_occur_area().equals(
							Constans.AREAVALUE)) {
				String occr_areaid = t47_transaction.getTx_occur_area();
				//t47_transaction.setTx_occur_areaname((String)areaMap.get(occr_areaid));
				String occr_areaupid = (String) areaidMap.get(occr_areaid);
				String comstr = occr_areaid.substring(occr_areaid.length() - 2,
						occr_areaid.length());
				String comstr1 = occr_areaid.substring(
						occr_areaid.length() - 4, occr_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setTx_occur_area1(occr_areaid);
					} else {
						t47_transaction.setTx_occur_area2(occr_areaid);
						t47_transaction.setTx_occur_area2name((String) areaMap
								.get(occr_areaid));
						t47_transaction.setTx_occur_area1(occr_areaupid);
					}
				} else {
					if (occr_areaupid != null) {
						t47_transaction.setTx_occur_area2(occr_areaupid);
						t47_transaction.setTx_occur_area2name((String) areaMap
								.get(occr_areaupid));
						t47_transaction.setTx_occur_area1((String) areaidMap
								.get(occr_areaupid));
					}
				}

			}
			/*if(t47_transaction.getTsctkey()!=null&&!"".equals(t47_transaction.getTsctkey())){
				String tsctkey=t47_transaction.getTsctkey();
				t47_transaction.setTsctname((String)PBC_SWSZMap.get(t47_transaction.getTsctkey()));
				String tsctkey3=(String)PBC_SWSZidMap.get(tsctkey);
				if(tsctkey3!=null){
					t47_transaction.setTsctname3((String)PBC_SWSZMap.get(tsctkey3));
					t47_transaction.setTsctkey3(tsctkey3);
					String tsctkey2=(String)PBC_SWSZidMap.get(tsctkey3);
					if(tsctkey2!=null){
						t47_transaction.setTsctname2((String)PBC_SWSZMap.get(tsctkey2));
						t47_transaction.setTsctkey2(tsctkey2);
					}
					String tsctkey1=(String)PBC_SWSZidMap.get(tsctkey2);
					if(tsctkey1!=null){
						
						t47_transaction.setTsctkey1(tsctkey1);
					}
				}
			}*/
			if (t47_transaction.getReceive_pay_cd() != null
					&& !"".equals(t47_transaction.getReceive_pay_cd())) {
				String receive_pay = (String) receive_payMap
						.get(t47_transaction.getReceive_pay_cd());
				t47_transaction.setReceive_pay_cd_value(receive_pay);
			}
			if (t47_transaction.getDebit_credit() != null
					&& !"".equals(t47_transaction.getDebit_credit())) {
				String debit_credit = (String) debit_creditMap
						.get(t47_transaction.getDebit_credit());
				t47_transaction.setDebit_credit_disp(debit_credit);
			}
			if (t47_transaction.getTx_dt() != null) {
				t47_transaction.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transaction.getTx_dt()));
			}
			/*if(t47_transaction.getOpp_tx_dt()!=null){//对手交易日期
			t47_transaction.setOpp_tx_dt_disp(DateUtils.dateToStringShort(t47_transaction.getOpp_tx_dt()));
			}*/
			if (t47_transaction.getCard_type() != null
					&& !"".equals(t47_transaction.getCard_type())) {
				t47_transaction.setCard_type_disp((String) card_typeMap
						.get(t47_transaction.getCard_type()));
			}
			if (t47_transaction.getParty_class_cd() != null
					&& !"".equals(t47_transaction.getParty_class_cd())) {
				t47_transaction.setParty_class_cd_disp((String) clienttypeMap
						.get(t47_transaction.getParty_class_cd()));
			}
			if (t47_transaction.getOpp_card_type() != null
					&& !"".equals(t47_transaction.getOpp_card_type())) {
				t47_transaction.setOpp_card_type_disp((String) card_typeMap
						.get(t47_transaction.getOpp_card_type()));
			}
			if (t47_transaction.getOpp_party_class_cd() != null
					&& !"".equals(t47_transaction.getOpp_party_class_cd())) {
				t47_transaction
						.setOpp_party_class_cd_disp((String) clienttypeMap
								.get(t47_transaction.getOpp_party_class_cd()));
			}
			if (t47_transaction.getCurrency_cd() != null
					&& !"".equals(t47_transaction.getCurrency_cd())) {
				t47_transaction.setCurrency_cd_disp((String) currencyMap
						.get(t47_transaction.getCurrency_cd()));
			}

			t47_transaction.setParty_id1(t47_transaction.getParty_id());
			if (t47_transaction.getOpp_country() != null
					&& !"".equals(t47_transaction.getOpp_country())) {
				t47_transaction.setOpp_coutry(t47_transaction.getOpp_country());
			}

			MoneyUtils mUtils = new MoneyUtils();
			if (t47_transaction.getAmt() != null
					&& t47_transaction.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transaction.getAmt()
						.doubleValue());

				t47_transaction.setAmt_disp(money);
			}
			if (t47_transaction.getCny_amt() != null
					&& t47_transaction.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transaction.getCny_amt()
						.doubleValue());

				t47_transaction.setCny_amtDisp(money);
			}

		}

		return t47_transaction;
	}
	
	public int cqcmodifyT47_transaction(SqlMapClient sqlMap,
			T47_transaction t47_transaction, String flag, String tableName) throws SQLException {
		int i = 0;
		if("t47_transaction_ub".equals(tableName)) {	// 针对一补t47_transaction_ub 
			//modify by qiuyun 2011-07-03  修改是否已补录为1（已补录）
			t47_transaction.setAddtional("1");
			//end by qiuyun 
			i = sqlMap.update("cqcmodifyT47_transaction_ub", t47_transaction);
		} else if("t47_transaction_uc".equals(tableName)) {	// 针对二补t47_transaction_uc
			i = sqlMap.update("cqcmodifyT47_transaction_uc", t47_transaction);
		} else {
			i = sqlMap.update("cqcmodifyT47_transaction", t47_transaction);
		}

		return i;
	}
	
	//二补查询方法
	public ArrayList getT47_trade_transactionList_2b(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_trade_transactionList_2b", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
		

		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");

		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
	

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter
					.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	public int getT47_trade_transactionListCount_2b(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_trade_transactionListCount_2b", t47_transaction);
		return iCount.intValue();
	}
	public T47_transaction getModifySET47_transaction(SqlMapClient sqlMap,
			T47_transaction t47_transaction1,	T47_agreementDAO agreementDAO) throws SQLException {
		T47_transaction t47_transaction=null;
		if(org.apache.commons.lang.StringUtils.isEmpty(t47_transaction1.getTransactionkey()))
		{
			ArrayList<T47_transaction> tranList =  (ArrayList) sqlMap
			.queryForList("getT47_transaction_ucDisp_next", t47_transaction1,0,1);
			
			if(tranList.size()>0)
			{
				t47_transaction=tranList.get(0);
			}else
			{
				return new T47_transaction();
			}
			
		}else
		{
			 t47_transaction = (T47_transaction) sqlMap
				.queryForObject("getT47_transaction_ucDisp", t47_transaction1
						.getTransactionkey());
		}
		
		String validate = StringUtils.null2String(t47_transaction
				.getValidate_ind());
		String validate1 = StringUtils.null2String(t47_transaction
				.getValidate_ind2());
		String validateflag = "";
		if (validate.equals("0") || validate.equals("1")) {
			validateflag = "1";
			if (validate1.equals("0") || validate1.equals("1")) {
				validateflag = "3";
			}
		} else {
			validateflag = "2";
		}
		t47_transaction.setValidateflag(validateflag);
		
		//把货币转换成标准格式
		MoneyUtils mUtils = new MoneyUtils();

		if (t47_transaction.getAmt() != null) {
			String amt_money = mUtils.FormatMoney(t47_transaction.getAmt()
					.doubleValue());
			t47_transaction.setAmt_string(amt_money);
		}
		if(t47_transaction.getChannel()!=null&& !t47_transaction.getChannel().equals("")){
			LinkedHashMap channelMap = cm.getMapFromCache("channel");
			t47_transaction.setChannel((String)channelMap.get(t47_transaction.getChannel()));
		}
	
		/*if(t47_transaction.getCash_ind()!=null&& !t47_transaction.getCash_ind().equals("")){
			if(t47_transaction.getCash_ind().equals("01")){
				if(t47_transaction.getTx_go_country()==null ||t47_transaction.getTx_go_country().equals("")){
					t47_transaction.setTx_go_country("CHN");
				}
				
			}
		}*/

		/*	if(t47_transaction.getCny_amt()!=null)
			{
				String cnyamt_money=mUtils.FormatMoney(t47_transaction.getCny_amt().doubleValue());
				//System.out.println("=============================cnyamt_money::"+cnyamt_money);
				t47_transaction.setCny_amt_string(cnyamt_money);
			}*/
		/*if(t47_transaction.getUsd_amt()!=null)
		{
			String usdamt_money=mUtils.FormatMoney(t47_transaction.getUsd_amt().doubleValue());
			t47_transaction.setUsd_amt_string(usdamt_money);
		}*/

	

		//帐户
		T47_agreement agreement;
	
		String acct_num = t47_transaction.getAcct_num();
		if (acct_num != null && !"".equals(acct_num)) {
			agreement = agreementDAO.getT47_acct_ucDisp(sqlMap, acct_num);
			t47_transaction.setAcct_type(agreement.getAml_acct_type_cd());
			t47_transaction.setOpen_dt(agreement.getOpen_dt());
			t47_transaction.setOpen_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getOpen_dt()));
			t47_transaction.setClose_dt(agreement.getClose_dt());
			t47_transaction.setClose_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getClose_dt()));
		}
		if (validateflag.equals("1") || validateflag.equals("3")) {
			// 机构地区对应码
			LinkedHashMap union_organMap = cm.getMapFromCache("t87_union_organ");
			// 行政区划信息
			LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
          
			String organkey = t47_transaction.getOrgankey();

			//String party_id=t47_transaction.getParty_id();
			//机构信息
			if (organkey != null && !organkey.equals("")) {
			/*	T00_organ organ;
				T00_organDAO organDAO = new T00_organDAO();
				organ = organDAO.getT00_organDisp(sqlMap, organkey);*/
				LinkedHashMap organlMap = cm.getMapFromCache("organ");
				t47_transaction.setOrganname((String)organlMap.get(organkey));
				
				t47_transaction.setOrgan_code(organkey);
				t47_transaction.setOrgan_area((String) union_organMap
						.get(organkey));
				
				if (t47_transaction.getOrgan_area() != null
						&& !"".equals(t47_transaction.getOrgan_area()))
					t47_transaction.setOrgan_area_disp((String) pbcareaMap
							.get(t47_transaction.getOrgan_area()));
				
				/*XmlReader xmlReader = new XmlReader();
				String code_type = xmlReader
						.getProperty("business_config.reportOrgan.organtype");*/
				String code_type="00";
				t47_transaction.setOrgan_code_type(code_type);
				t47_transaction.setOrgan_code_type_disp(code_type);
			}
		}

		// 交易日期
		/*if(t47_transaction.getTx_dt()!=null&&!"".equals(t47_transaction.getTx_dt())){
		t47_transaction.setTx_dt_disp(DateUtils
				.dateToStringShort(t47_transaction.getTx_dt()));
		}*/
		// 交易时间
		//System.out.println("===========================t47_transaction.getDt_time()="+t47_transaction.getDt_time());
		if (t47_transaction.getDt_time() != null) {
			t47_transaction.setDt_time_disp(DateUtils
					.dateToStringShort(t47_transaction.getDt_time()));
		}
		/*if(validateflag.equals("2")||validateflag.equals("3")){
		//帐户
		String acct_num=t47_transaction.getAcct_num();
		T47_agreement agreement = new T47_agreement();
		T47_agreementDAO agreementDAO = new T47_agreementDAO();
		if (acct_num!=null&&!"".equals(acct_num)){
		agreement = agreementDAO.getT47_agreementDisp(sqlMap, acct_num);
		t47_transaction.setAcct_type(agreement.getAml_acct_type_cd());		
		t47_transaction.setOpen_dt(agreement.getOpen_dt());
		t47_transaction.setOpen_dt_disp(DateUtils.dateToStringShort(t47_transaction.getOpen_dt()));
		t47_transaction.setClose_dt(agreement.getClose_dt());
		t47_transaction.setClose_dt_disp(DateUtils.dateToStringShort(t47_transaction.getClose_dt()));
		 }
		}*/

		LinkedHashMap areaidMap = cm.getMapFromCache("areaid"); //
		LinkedHashMap areaMap = cm.getMapFromCache("area23");
		LinkedHashMap PBC_SWSZMap = cm.getMapFromCache("PBC_SWSZ"); //境内外汇收支交易
		LinkedHashMap PBC_SWSZidMap = cm.getMapFromCache("PBC_SWSZid"); //境内外汇收支交易
	
		if (validateflag.equals("2") || validateflag.equals("3")) {
			if (t47_transaction.getOpp_area() != null
					&& !t47_transaction.getOpp_area().trim().equals("")
					&& !t47_transaction.getOpp_area().endsWith(
							Constans.AREAVALUE)) {
				String opp_areaid = t47_transaction.getOpp_area();
				String opp_areaidupid = (String) areaidMap.get(opp_areaid);
				String comstr = opp_areaid.substring(opp_areaid.length() - 2,
						opp_areaid.length());
				String comstr1 = opp_areaid.substring(opp_areaid.length() - 4,
						opp_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setOpp_area1(opp_areaid);
						t47_transaction.setOpp_area("");
					} else {
						t47_transaction.setOpp_area2(opp_areaid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(opp_areaid));
						t47_transaction.setOpp_area1(opp_areaidupid);
						t47_transaction.setOpp_area("");
					}
				} else {
					t47_transaction.setOpp_areaName((String) areaMap
							.get(opp_areaid));

					if (opp_areaidupid != null) {
						t47_transaction.setOpp_area2(opp_areaidupid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(opp_areaidupid));
						t47_transaction.setOpp_area1((String) areaidMap
								.get(opp_areaidupid));
					}
				}

			}

		}
		if (validateflag.equals("1") || validateflag.equals("3")) {
			if (t47_transaction.getTx_go_area() != null
					&& !t47_transaction.getTx_go_area().trim().equals("")
					&& !t47_transaction.getTx_go_area().endsWith(
							Constans.AREAVALUE)) {
				String go_areaid = t47_transaction.getTx_go_area();
				String go_areaupid = (String) areaidMap.get(go_areaid);
				String comstr = go_areaid.substring(go_areaid.length() - 2,
						go_areaid.length());
				String comstr1 = go_areaid.substring(go_areaid.length() - 4,
						go_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setTx_go_area1(go_areaid);
					} else {
						t47_transaction.setTx_go_area2(go_areaid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaid));
						t47_transaction.setTx_go_area1(go_areaupid);
					}
				} else {
					t47_transaction.setTx_go_areaname((String) areaMap
							.get(go_areaid));

					if (go_areaupid != null) {
						t47_transaction.setTx_go_area2(go_areaupid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaupid));
						t47_transaction.setTx_go_area1((String) areaidMap
								.get(go_areaupid));
					}
				}

			}

		}
		if (t47_transaction.getTx_occur_area() != null
				&& !t47_transaction.getTx_occur_area().trim().equals("")
				&& !t47_transaction.getTx_occur_area().endsWith(
						Constans.AREAVALUE)) {
			String occr_areaid = t47_transaction.getTx_occur_area();
			//t47_transaction.setTx_occur_areaname((String)areaMap.get(occr_areaid));
			String occr_areaupid = (String) areaidMap.get(occr_areaid);
			String comstr = occr_areaid.substring(occr_areaid.length() - 2,
					occr_areaid.length());
			String comstr1 = occr_areaid.substring(occr_areaid.length() - 4,
					occr_areaid.length());
			if (comstr.equals("00")) {
				if (comstr1.equals("0000")) {
					t47_transaction.setTx_occur_area1(occr_areaid);
				} else {
					t47_transaction.setTx_occur_area2(occr_areaid);
					t47_transaction.setTx_occur_area2name((String) areaMap
							.get(occr_areaid));
					t47_transaction.setTx_occur_area1(occr_areaupid);
				}
			} else {
				if (occr_areaupid != null) {
					t47_transaction.setTx_occur_area2(occr_areaupid);
					t47_transaction.setTx_occur_area2name((String) areaMap
							.get(occr_areaupid));
					t47_transaction.setTx_occur_area1((String) areaidMap
							.get(occr_areaupid));
				}
			}

		}
		if (t47_transaction.getTsctkey() != null) {
			String tsctkey = t47_transaction.getTsctkey();
			t47_transaction.setTsctname((String) PBC_SWSZMap
					.get(t47_transaction.getTsctkey()));
			String tsctkey3 = (String) PBC_SWSZidMap.get(tsctkey);
			if (tsctkey3 != null) {
				t47_transaction
						.setTsctname3((String) PBC_SWSZMap.get(tsctkey3));
				t47_transaction.setTsctkey3(tsctkey3);
				String tsctkey2 = (String) PBC_SWSZidMap.get(tsctkey3);
				if (tsctkey2 != null) {
					t47_transaction.setTsctname2((String) PBC_SWSZMap
							.get(tsctkey2));
					t47_transaction.setTsctkey2(tsctkey2);
				}
			}
		}
		return t47_transaction;
	}
	
	public T47_transaction getModifyT47_transaction(SqlMapClient sqlMap,
			String transactionkey,	T47_agreementDAO agreementDAO) throws SQLException {
		T47_transaction t47_transaction=null;
		
			 t47_transaction = (T47_transaction) sqlMap
				.queryForObject("getT47_transactionDisp", transactionkey);

		
		String validate = StringUtils.null2String(t47_transaction
				.getValidate_ind());
		String validate1 = StringUtils.null2String(t47_transaction
				.getValidate_ind2());
		String validateflag = "3";
//		if (validate.equals("0") || validate.equals("1")) {
//			validateflag = "1";
//			if (validate1.equals("0") || validate1.equals("1")) {
//				validateflag = "3";
//			}
//		} else {
//			validateflag = "2";
//		}
		t47_transaction.setValidateflag(validateflag);
		
		//把货币转换成标准格式
		MoneyUtils mUtils = new MoneyUtils();

		if (t47_transaction.getAmt() != null) {
			String amt_money = mUtils.FormatMoney(t47_transaction.getAmt()
					.doubleValue());
			t47_transaction.setAmt_string(amt_money);
		}
		if(t47_transaction.getChannel()!=null&& !t47_transaction.getChannel().equals("")){
			LinkedHashMap channelMap = cm.getMapFromCache("channel");
			t47_transaction.setChannel((String)channelMap.get(t47_transaction.getChannel()));
		}
	
		/*if(t47_transaction.getCash_ind()!=null&& !t47_transaction.getCash_ind().equals("")){
			if(t47_transaction.getCash_ind().equals("01")){
				if(t47_transaction.getTx_go_country()==null ||t47_transaction.getTx_go_country().equals("")){
					t47_transaction.setTx_go_country("CHN");
				}
				
			}
		}*/

		/*	if(t47_transaction.getCny_amt()!=null)
			{
				String cnyamt_money=mUtils.FormatMoney(t47_transaction.getCny_amt().doubleValue());
				//System.out.println("=============================cnyamt_money::"+cnyamt_money);
				t47_transaction.setCny_amt_string(cnyamt_money);
			}*/
		/*if(t47_transaction.getUsd_amt()!=null)
		{
			String usdamt_money=mUtils.FormatMoney(t47_transaction.getUsd_amt().doubleValue());
			t47_transaction.setUsd_amt_string(usdamt_money);
		}*/

	

		//帐户
		T47_agreement agreement;
	
		String acct_num = t47_transaction.getAcct_num();
		if (acct_num != null && !"".equals(acct_num)) {
			agreement = agreementDAO.getT47_acct_ucDisp(sqlMap, acct_num);
			t47_transaction.setAcct_type(agreement.getAml_acct_type_cd());
			t47_transaction.setOpen_dt(agreement.getOpen_dt());
			t47_transaction.setOpen_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getOpen_dt()));
			t47_transaction.setClose_dt(agreement.getClose_dt());
			t47_transaction.setClose_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getClose_dt()));
		}
		if (validateflag.equals("1") || validateflag.equals("3")) {
			// 机构地区对应码
			LinkedHashMap union_organMap = cm.getMapFromCache("t87_union_organ");
			// 行政区划信息
			LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
          
			String organkey = t47_transaction.getOrgankey();

			//String party_id=t47_transaction.getParty_id();
			//机构信息
			if (organkey != null && !organkey.equals("")) {
			/*	T00_organ organ;
				T00_organDAO organDAO = new T00_organDAO();
				organ = organDAO.getT00_organDisp(sqlMap, organkey);*/
				LinkedHashMap organlMap = cm.getMapFromCache("organ");
				t47_transaction.setOrganname((String)organlMap.get(organkey));
				
				t47_transaction.setOrgan_code(organkey);
				t47_transaction.setOrgan_area((String) union_organMap
						.get(organkey));
				
				if (t47_transaction.getOrgan_area() != null
						&& !"".equals(t47_transaction.getOrgan_area()))
					t47_transaction.setOrgan_area_disp((String) pbcareaMap
							.get(t47_transaction.getOrgan_area()));
				
				/*XmlReader xmlReader = new XmlReader();
				String code_type = xmlReader
						.getProperty("business_config.reportOrgan.organtype");*/
				String code_type="00";
				t47_transaction.setOrgan_code_type(code_type);
				t47_transaction.setOrgan_code_type_disp(code_type);
			}
		}

		// 交易日期
		/*if(t47_transaction.getTx_dt()!=null&&!"".equals(t47_transaction.getTx_dt())){
		t47_transaction.setTx_dt_disp(DateUtils
				.dateToStringShort(t47_transaction.getTx_dt()));
		}*/
		// 交易时间
		//System.out.println("===========================t47_transaction.getDt_time()="+t47_transaction.getDt_time());
		if (t47_transaction.getDt_time() != null) {
			t47_transaction.setDt_time_disp(DateUtils
					.dateToStringShort(t47_transaction.getDt_time()));
		}
		/*if(validateflag.equals("2")||validateflag.equals("3")){
		//帐户
		String acct_num=t47_transaction.getAcct_num();
		T47_agreement agreement = new T47_agreement();
		T47_agreementDAO agreementDAO = new T47_agreementDAO();
		if (acct_num!=null&&!"".equals(acct_num)){
		agreement = agreementDAO.getT47_agreementDisp(sqlMap, acct_num);
		t47_transaction.setAcct_type(agreement.getAml_acct_type_cd());		
		t47_transaction.setOpen_dt(agreement.getOpen_dt());
		t47_transaction.setOpen_dt_disp(DateUtils.dateToStringShort(t47_transaction.getOpen_dt()));
		t47_transaction.setClose_dt(agreement.getClose_dt());
		t47_transaction.setClose_dt_disp(DateUtils.dateToStringShort(t47_transaction.getClose_dt()));
		 }
		}*/

		LinkedHashMap areaidMap = cm.getMapFromCache("areaid"); //
		LinkedHashMap areaMap = cm.getMapFromCache("area23");
		LinkedHashMap PBC_SWSZMap = cm.getMapFromCache("PBC_SWSZ"); //境内外汇收支交易
		LinkedHashMap PBC_SWSZidMap = cm.getMapFromCache("PBC_SWSZid"); //境内外汇收支交易
	
		if (validateflag.equals("2") || validateflag.equals("3")) {
			if (t47_transaction.getOpp_area() != null
					&& !t47_transaction.getOpp_area().trim().equals("")
					&& !t47_transaction.getOpp_area().endsWith(
							Constans.AREAVALUE)) {
				String opp_areaid = t47_transaction.getOpp_area();
				String opp_areaidupid = (String) areaidMap.get(opp_areaid);
				String comstr = opp_areaid.substring(opp_areaid.length() - 2,
						opp_areaid.length());
				String comstr1 = opp_areaid.substring(opp_areaid.length() - 4,
						opp_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setOpp_area1(opp_areaid);
						t47_transaction.setOpp_area("");
					} else {
						t47_transaction.setOpp_area2(opp_areaid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(opp_areaid));
						t47_transaction.setOpp_area1(opp_areaidupid);
						t47_transaction.setOpp_area("");
					}
				} else {
					t47_transaction.setOpp_areaName((String) areaMap
							.get(opp_areaid));

					if (opp_areaidupid != null) {
						t47_transaction.setOpp_area2(opp_areaidupid);
						t47_transaction.setOpp_area2Name((String) areaMap
								.get(opp_areaidupid));
						t47_transaction.setOpp_area1((String) areaidMap
								.get(opp_areaidupid));
					}
				}

			}

		}
		if (validateflag.equals("1") || validateflag.equals("3")) {
			if (t47_transaction.getTx_go_area() != null
					&& !t47_transaction.getTx_go_area().trim().equals("")
					&& !t47_transaction.getTx_go_area().endsWith(
							Constans.AREAVALUE)) {
				String go_areaid = t47_transaction.getTx_go_area();
				String go_areaupid = (String) areaidMap.get(go_areaid);
				String comstr = go_areaid.substring(go_areaid.length() - 2,
						go_areaid.length());
				String comstr1 = go_areaid.substring(go_areaid.length() - 4,
						go_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_transaction.setTx_go_area1(go_areaid);
					} else {
						t47_transaction.setTx_go_area2(go_areaid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaid));
						t47_transaction.setTx_go_area1(go_areaupid);
					}
				} else {
					t47_transaction.setTx_go_areaname((String) areaMap
							.get(go_areaid));

					if (go_areaupid != null) {
						t47_transaction.setTx_go_area2(go_areaupid);
						t47_transaction.setTx_go_area2name((String) areaMap
								.get(go_areaupid));
						t47_transaction.setTx_go_area1((String) areaidMap
								.get(go_areaupid));
					}
				}

			}

		}
		if (t47_transaction.getTx_occur_area() != null
				&& !t47_transaction.getTx_occur_area().trim().equals("")
				&& !t47_transaction.getTx_occur_area().endsWith(
						Constans.AREAVALUE)) {
			String occr_areaid = t47_transaction.getTx_occur_area();
			//t47_transaction.setTx_occur_areaname((String)areaMap.get(occr_areaid));
			String occr_areaupid = (String) areaidMap.get(occr_areaid);
			String comstr = occr_areaid.substring(occr_areaid.length() - 2,
					occr_areaid.length());
			String comstr1 = occr_areaid.substring(occr_areaid.length() - 4,
					occr_areaid.length());
			if (comstr.equals("00")) {
				if (comstr1.equals("0000")) {
					t47_transaction.setTx_occur_area1(occr_areaid);
				} else {
					t47_transaction.setTx_occur_area2(occr_areaid);
					t47_transaction.setTx_occur_area2name((String) areaMap
							.get(occr_areaid));
					t47_transaction.setTx_occur_area1(occr_areaupid);
				}
			} else {
				if (occr_areaupid != null) {
					t47_transaction.setTx_occur_area2(occr_areaupid);
					t47_transaction.setTx_occur_area2name((String) areaMap
							.get(occr_areaupid));
					t47_transaction.setTx_occur_area1((String) areaidMap
							.get(occr_areaupid));
				}
			}

		}
		if (t47_transaction.getTsctkey() != null) {
			String tsctkey = t47_transaction.getTsctkey();
			t47_transaction.setTsctname((String) PBC_SWSZMap
					.get(t47_transaction.getTsctkey()));
			String tsctkey3 = (String) PBC_SWSZidMap.get(tsctkey);
			if (tsctkey3 != null) {
				t47_transaction
						.setTsctname3((String) PBC_SWSZMap.get(tsctkey3));
				t47_transaction.setTsctkey3(tsctkey3);
				String tsctkey2 = (String) PBC_SWSZidMap.get(tsctkey3);
				if (tsctkey2 != null) {
					t47_transaction.setTsctname2((String) PBC_SWSZMap
							.get(tsctkey2));
					t47_transaction.setTsctkey2(tsctkey2);
				}
			}
		}
		return t47_transaction;
	}
	public int modifyT47_transactionDo(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {

		if (t47_transaction.getValidateflag().equals("1")) {
			t47_transaction.setValidate_ind("1");
		}
		if (t47_transaction.getValidateflag().equals("2")) {
			t47_transaction.setValidate_ind2("1");
		}
		if (t47_transaction.getValidateflag().equals("3")) {
			t47_transaction.setValidate_ind("1");
			t47_transaction.setValidate_ind2("1");
		}
		int i = sqlMap
				.update("saveValidatedSET47_transaction", t47_transaction);
		
		return i;
	}
	
	public int modifyT47_transaction(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = 0;
		// 交易方式分解成 curr_cd=#curr_cd#,cash_ind=#cash_ind#,settle_type_cd=#settle_type_cd#
		String tx = t47_transaction.getSettle_type_cd();

		if (tx.trim().length() == 6 || tx.trim().length() == 8) {
			t47_transaction.setSettle_type_cd_v(t47_transaction
					.getSettle_type_cd());
			if (tx.substring(0, 2).equals("00")) {
				t47_transaction.setCurr_cd("1");
		
				t47_transaction.setCash_ind(tx.substring(2, 4));
		
				t47_transaction.setSettle_type_cd(tx.substring(4));

			} else if (tx.substring(0, 2).equals("01")) {
				t47_transaction.setCurr_cd("2");
				t47_transaction.setCash_ind("");
	
				t47_transaction.setSettle_type_cd(tx.substring(2, 6));

			}
		}
		// 交易发生地分解成 tx_occur_country=#tx_occur_country#,tx_occur_area=#tx_occur_area#]
		String curr = t47_transaction.getTx_occur();
		if (curr.length() == 9) {
			t47_transaction.setTx_occur_v(t47_transaction.getTx_occur());
			t47_transaction.setTx_occur_country(curr.substring(0, 3));
			t47_transaction.setTx_occur_area(curr.substring(3, 9));

		}

		// 大额 交易去向分解成 tx_go_country=#tx_go_country#,tx_go_area=#tx_go_area#
		String to = t47_transaction.getTx_go();
		if (to.length() == 9) {
			t47_transaction.setTx_go_v(t47_transaction.getTx_go());

			t47_transaction.setTx_go_country(to.substring(0, 3));
			t47_transaction.setTx_go_area(to.substring(3, 9));

		}
		// 对方金融机构行政区划代码分解 opp_country=#opp_country#,opp_area=#opp_area#,
		String rc = t47_transaction.getOpp_area();
		if (rc.length() == 9) {
			t47_transaction.setOpp_area_v(t47_transaction.getOpp_area());
			t47_transaction.setOpp_country(rc.substring(0, 3));
			t47_transaction.setOpp_area(rc.substring(3, 9));
		}

		i = sqlMap.update("saveValidatedT47_transaction_notnull",
				t47_transaction);
	
		if (t47_transaction.getAlert_type_cd().equals("1")) {
			t47_transaction.setValidate_ind("1");
		}
		if (t47_transaction.getAlert_type_cd().equals("2")) {
			t47_transaction.setValidate_ind2("1");
		}
		if (t47_transaction.getAlert_type_cd().equals("3")) {
			t47_transaction.setValidate_ind("1");
			t47_transaction.setValidate_ind2("1");
		}
		
		return i;
	}
	
	public int getCase_trans_party_validate_uc1(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		int pass = 1;
		ArrayList t47_transaction = null;
		ArrayList t47_party_uc = null;
		t47_transaction = (ArrayList) sqlMap.queryForList("getT47_casetransaction_ucvalidate1", credittask);
		t47_party_uc = (ArrayList) sqlMap.queryForList("getT47_caseparty_ucValidate", credittask.getApplication_num());
		String case_type = credittask.getCast_type();
		for(int i =0; i < t47_transaction.size(); i++){
			T47_transaction t = (T47_transaction) t47_transaction.get(i);
	        if(case_type.equals("1")){
	        	if ("0".equals(t.getValidate_ind()) || 
						"2".equals(t.getValidate_ind()) ){
					//有验证没通过的，跳出循环
					pass = 0; 
					break;
				}         
	        }else{
	        	if ("0".equals(t.getValidate_ind2()) ||
						"2".equals(t.getValidate_ind2())){
					//有验证没通过的，跳出循环
					pass = 0; 
					break;
				}         
	        }
			      
		}
		for(int i = 0; i < t47_party_uc.size(); i++){
			T47_party p = (T47_party) t47_party_uc.get(i);
			if(case_type.equals("1")){
				if("0".equals(p.getValidate_ind()) || 
						"2".equals(p.getValidate_ind())){
					//验证没通过
					pass = 0;
					break;
				}
			}else{
				if("0".equals(p.getValidate_ind2()) ||
					"2".equals(p.getValidate_ind2())){
					//验证没通过
					pass = 0;
					break;
				}
			}
		}
		if (pass==1){//如果没有验证状态为否的 则更新案例验证状态为1(案例状态为通过)
			sqlMap.update("modifyT07_case_appvalidate_uc", credittask.getApplication_num());
		}
		return pass;
	}
	
	public int insertT47_transaction_all_field(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = sqlMap.update("insertT47_transaction_all_field", t47_transaction);
		return i;
	}
	
	public int insertT47_transaction_sel_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = sqlMap.update("insertT47_transaction_sel_tpla", t47_transaction);
		return i;
	}
	public int insertT07_case_transaction_ky_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_transaction_ky_tpla", t47_transaction);
		return i;
	}
	
	public int insertT07_case_stcr_ky_by_acct_num_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = sqlMap.update("insertT07_case_stcr_ky_by_acct_num_tpla", t47_transaction);
		return i;
	}
	
	public T47_transaction getT47_transaction_uc_from_key(SqlMapClient sqlMap,String  transactionkey)throws SQLException
	{
		T47_transaction temp=(T47_transaction)sqlMap.queryForObject("getT47_transaction_uc_from_key", transactionkey);
		
		return temp;
	}
	public int insertT47_acct_uc(SqlMapClient sqlMap,
			String acctnums) throws SQLException {
		int i = sqlMap.update("insertT47_acct_uc", acctnums);
		return i;
	}
	public int insertT47_acct_uc1(SqlMapClient sqlMap,
		 T47_transaction  t47_transaction) throws SQLException {
		int i = sqlMap.update("insertT47_acct_uc1", t47_transaction);
		return i;
	}
	
	public int updateT47_transaction_uc(SqlMapClient sqlMap,
			T47_transaction  t47_transaction) throws SQLException {
		int i = sqlMap.update("updateT47_transaction_uc", t47_transaction);
		return i;
	}
	
	public int insertT47_transaction_uc_all_field1(SqlMapClient sqlMap,
			String transactionkeys) throws SQLException {
		int i = sqlMap.update("insertT47_transaction_uc_all_field1", transactionkeys);
		return i;
	}
	public int updateT47_transaction_uc_2(SqlMapClient sqlMap,
			String transactionkeys) throws SQLException {
		int i = sqlMap.update("updateT47_transaction_uc_2", transactionkeys);
		return i;
	}
	public int updateT47_transaction_uc_1(SqlMapClient sqlMap,
			String transactionkeys) throws SQLException {
		int i = sqlMap.update("updateT47_transaction_uc_1", transactionkeys);
		return i;
	}
	public ArrayList getT47_transactionList_for_case(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_transactionList_for_case", t47_transaction);
		ArrayList t47_transactionList = new ArrayList();
		
		LinkedHashMap flagMap = cm.getMapFromCache("trackflag");		
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transaction1 = (T47_transaction) iter.next();
			
			if (t47_transaction1.getDebit_credit() != null
					&& !"".equals(t47_transaction1.getDebit_credit())) {
				t47_transaction1.setDebit_credit_disp((String) flagMap
						.get(t47_transaction1.getDebit_credit()));
			}
		
			if (t47_transaction1.getAmt() != null
					&& t47_transaction1.getAmt().doubleValue() >= 0) {
				MoneyUtils mUtils = new MoneyUtils();
				String money = mUtils.FormatMoney(t47_transaction1.getAmt()
						.doubleValue());
				t47_transaction1.setAmt_disp(money);
			}
			if (t47_transaction1.getCny_amt() != null
					&& t47_transaction1.getCny_amt().doubleValue() >= 0) {
				MoneyUtils mUtils = new MoneyUtils();
				String money = mUtils.FormatMoney(t47_transaction1.getCny_amt()
						.doubleValue());
				t47_transaction1.setCny_amtDisp(money);
			}
			if (t47_transaction1.getTx_dt() != null) {
				t47_transaction1.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transaction1.getTx_dt()));
			}
			if (t47_transaction1.getTx_type_cd() != null
					&& !"".equals(t47_transaction1.getTx_type_cd())) {
				t47_transaction1.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transaction1.getTx_type_cd()));
			}
			if (t47_transaction1.getCurrency_cd() != null
					&& !"".equals(t47_transaction1.getCurrency_cd())) {
				t47_transaction1.setCurrency_cd_disp((String) currencyMap
						.get(t47_transaction1.getCurrency_cd()));
			}
			if (t47_transaction1.getOrgankey() != null
					&& !"".equals(t47_transaction1.getOrgankey())) {
				t47_transaction1.setOrganName((String) organMap
						.get(t47_transaction1.getOrgankey().trim()));
			}
			t47_transactionList.add(t47_transaction1);
		}
		return t47_transactionList;
	}
	
	public ArrayList getT47_transaction_newList(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_transaction_newList", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
		
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			if (t47_transactionDTO.getDt_time() != null) {
				t47_transactionDTO.setDt_time_disp(DateUtils.dateToString(
						t47_transactionDTO.getDt_time()).substring(11, 19));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	public int getT47_transaction_newListCount(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_transaction_newListCount", t47_transaction);
		return iCount.intValue();
	}
	
	public ArrayList getT47_trade_transactionList1(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_trade_transactionList_1", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
	
	
		LinkedHashMap validateflagMap = cm.getMapFromCache("validate_flag");//筛选标志
		
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			if (t47_transactionDTO.getDt_time() != null) {
				t47_transactionDTO.setDt_time_disp(DateUtils.dateToString(
						t47_transactionDTO.getDt_time()).substring(11, 19));
			}
			if (t47_transactionDTO.getValidate_flag() != null
					&& !"".equals(t47_transactionDTO.getValidate_flag())) {
				t47_transactionDTO.setValidate_flag_disp((String) validateflagMap
						.get(t47_transactionDTO.getValidate_flag()));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	public ArrayList getT47_transactionUCList(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_transactionUCList", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
	
	
		LinkedHashMap validateflagMap = cm.getMapFromCache("validate_flag");//筛选标志
		
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			if (t47_transactionDTO.getDt_time() != null) {
				t47_transactionDTO.setDt_time_disp(DateUtils.dateToString(
						t47_transactionDTO.getDt_time()).substring(11, 19));
			}
			if (t47_transactionDTO.getValidate_flag() != null
					&& !"".equals(t47_transactionDTO.getValidate_flag())) {
				t47_transactionDTO.setValidate_flag_disp((String) validateflagMap
						.get(t47_transactionDTO.getValidate_flag()));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	public int getT47_transactionUCCount(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_transactionUCListCount", t47_transaction);
		return iCount.intValue();
	}
	public ArrayList getT47_transactionList_acct_num_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_transactionList_acct_num_tpla", t47_transaction);
		return list;
	}
	public ArrayList getT47_trade_transactionList_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_trade_transactionList_tpla", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
	
	
		LinkedHashMap validateflagMap = cm.getMapFromCache("validate_flag");//筛选标志
		
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");

		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction t47_transactionDTO = (T47_transaction) iter.next();
			if (t47_transactionDTO.getTx_type_cd() != null
					&& !"".equals(t47_transactionDTO.getTx_type_cd())) {
				t47_transactionDTO.setTx_type_cd_disp((String) tradetypeMap
						.get(t47_transactionDTO.getTx_type_cd()));
			}
			if (t47_transactionDTO.getOrgankey() != null
					&& !"".equals(t47_transactionDTO.getOrgankey())) {
				t47_transactionDTO.setOrganName((String) organlMap
						.get(t47_transactionDTO.getOrgankey()));
			}
			if (t47_transactionDTO.getDebit_credit() != null
					&& !"".equals(t47_transactionDTO.getDebit_credit())) {
				t47_transactionDTO.setDebit_credit_disp((String) trackflagMap
						.get(t47_transactionDTO.getDebit_credit()));
			}
			if (t47_transactionDTO.getCurrency_cd() != null
					&& !"".equals(t47_transactionDTO.getCurrency_cd())) {
				t47_transactionDTO.setCurrency_cd_disp((String) currencyMap
						.get(t47_transactionDTO.getCurrency_cd()));
			}
			if (t47_transactionDTO.getAmt() != null
					&& t47_transactionDTO.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO.getAmt()
						.doubleValue());
				t47_transactionDTO.setAmt_disp(money);
			}
			if (t47_transactionDTO.getCny_amt() != null
					&& t47_transactionDTO.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t47_transactionDTO
						.getCny_amt().doubleValue());
				t47_transactionDTO.setCny_amtDisp(money);
			}
			if (t47_transactionDTO.getCash_trans_flag() != null
					&& !"".equals(t47_transactionDTO.getCash_trans_flag())) {
				t47_transactionDTO.setCash_trans_flag_disp((String) goflagMap
						.get(t47_transactionDTO.getCash_trans_flag()));
			}
			if (t47_transactionDTO.getTx_dt() != null) {
				t47_transactionDTO.setTx_dt_disp(DateUtils
						.dateToStringShort(t47_transactionDTO.getTx_dt()));
			}
			if (t47_transactionDTO.getDt_time() != null) {
				t47_transactionDTO.setDt_time_disp(DateUtils.dateToString(
						t47_transactionDTO.getDt_time()).substring(11, 19));
			}
			if (t47_transactionDTO.getValidate_flag() != null
					&& !"".equals(t47_transactionDTO.getValidate_flag())) {
				t47_transactionDTO.setValidate_flag_disp((String) validateflagMap
						.get(t47_transactionDTO.getValidate_flag()));
			}
			t47_transactionList.add(t47_transactionDTO);
		}
		return t47_transactionList;
	}
	public int getT47_trade_transactionListCount_tpla(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_trade_transactionListCount_tpla", t47_transaction);
		return iCount.intValue();
	}
	/**
	 * add by houfengfeng
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_transaction
	 *            T47_transaction
	 * @throws SQLException
	 * @return int
	 */

	public int getT47_trade_transactionListCount1(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_trade_transactionListCount_1", t47_transaction);
		return iCount.intValue();
	}
/**
 * 新加lp
 * @param sqlMap
 * @param t47_transaction
 * @param iStartRec
 * @param iPageSize
 * @return
 * @throws SQLException
 */
	public ArrayList getT47_trade_transactionExcelList(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47_trade_transactionList_1", t47_transaction);

		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap organlMap = cm.getMapFromCache("organ");
		LinkedHashMap currencyMap = cm.getMapFromCache("currency");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		LinkedHashMap pbc_catpMap = cm.getMapFromCache("pbc_catp");
		LinkedHashMap pbc_cttpMap = cm.getMapFromCache("pbc_cttp");
		MoneyUtils mUtils = new MoneyUtils();
		Iterator iter = list.iterator();
		ArrayList rowsList = new ArrayList();
		while (iter.hasNext()) {
			ArrayList columnList = new ArrayList();
			T47_transaction t47_trans = (T47_transaction) iter.next();
			// 交易日期
			String tx_dt = "";
			if (t47_trans.getTx_dt() != null && !"".equals(t47_trans.getTx_dt())) {
				t47_trans.setTx_dt_disp(DateUtils.dateToStringShort(t47_trans.getTx_dt()));
			}
			// 交易机构
			if (t47_trans.getOrgankey() != null && !"".equals(t47_trans.getOrgankey())) {
					t47_trans.setOrgan_name((String) organlMap.get(t47_trans.getOrgankey()));
			}
			// 币种
			String currency_cd = "";
			if (t47_trans.getCurrency_cd() != null && !"".equals(t47_trans.getCurrency_cd())) {
				t47_trans.setCurrency_cd_disp((String) currencyMap.get(t47_trans.getCurrency_cd()));
			}
			// 交易金额
			String amt = "";
			if (t47_trans.getAmt().doubleValue() >= 0) {
				t47_trans.setAmt_disp(mUtils.FormatMoney(t47_trans.getAmt().doubleValue()));

			}
			// 借贷标志
			if (t47_trans.getDebit_credit() != null && !"".equals(t47_trans.getDebit_credit())) {
				t47_trans.setDebit_credit_disp((String) trackflagMap.get(t47_trans.getDebit_credit()));
			}

			// 现金标志
			if (t47_trans.getCash_trans_flag() != null && !"".equals(t47_trans.getCash_trans_flag())) {
				t47_trans.setCash_trans_flag_disp((String) goflagMap.get(t47_trans.getCash_trans_flag()));
			}

			// 交易类型
			if (t47_trans.getTx_type_cd() != null && !"".equals(t47_trans.getTx_type_cd())) {
				t47_trans.setTx_type_cd_disp((String) tradetypeMap.get(t47_trans.getTx_type_cd()));
			}
			
			// 对方客户类型
			if (t47_trans.getOpp_party_class_cd() != null) {
				t47_trans.setOpp_party_class_cd_disp((String) pbc_cttpMap.get(t47_trans.getOpp_party_class_cd()));
			}
			
			// 对方帐户类型
			if (t47_trans.getOpp_acct_type_cd() != null) {
				t47_trans.setOpp_acct_type_cd_string((String) pbc_catpMap.get(t47_trans.getOpp_acct_type_cd()));
			}
			// 对方机构类型
			if (t47_trans.getOpp_organ_type() != null) {
				t47_trans.setOpp_organ_type_value((String) organlMap.get(t47_trans.getOpp_organ_type()));
			}
			rowsList.add(t47_trans);

		}
		return rowsList;
	}
	
	/**
	 * modify by zhangyang 2007-01-09 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param tableName TODO
	 * @param Transactionkey
	 *            String
	 * @throws SQLException
	 * @return T47_transaction
	 */
	public T47_transaction getT47_transactionDisp(SqlMapClient sqlMap,
			String transactionkey, String tableName) throws SQLException {
		T47_transaction t47_transaction;
		if("t47_transaction_ub".equals(tableName)) {	// 针对一补t47_transaction_ub 
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ubDisp", transactionkey);
		} else if("t47_transaction_uc".equals(tableName)) {	// 针对二补t47_transaction_uc
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ucDisp", transactionkey);
		} else {
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transactionDisp", transactionkey);
		}
		if (t47_transaction == null)
			t47_transaction = new T47_transaction();

		//把货币转换成标准格式
		MoneyUtils mUtils = new MoneyUtils();

		if (t47_transaction.getAmt() != null) {
			String amt_money = mUtils.FormatMoney(t47_transaction.getAmt()
					.doubleValue());
			t47_transaction.setAmt_string(amt_money);
		}

		if (t47_transaction.getCny_amt() != null) {
			String cnyamt_money = mUtils.FormatMoney(t47_transaction
					.getCny_amt().doubleValue());
			t47_transaction.setCny_amt_string(cnyamt_money);
		}
		if (t47_transaction.getUsd_amt() != null) {
			String usdamt_money = mUtils.FormatMoney(t47_transaction
					.getUsd_amt().doubleValue());
			t47_transaction.setUsd_amt_string(usdamt_money);
		}

		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		//帐户类型
		LinkedHashMap acctypeMap = cm.getMapFromCache("pbc_catp");
		//现转标记

		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		//是否
		LinkedHashMap statusMap = cm.getMapFromCache("yesNo");
		//
		LinkedHashMap disposalstateMap = cm.getMapFromCache("disposalstate");
		//
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		//客户类型 对公 对私
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap remittypeMap = cm.getMapFromCache("remittype");
		//交易名称
		LinkedHashMap trannameMap = cm.getMapFromCache("tranname");
		//币种
		LinkedHashMap currcdMap = cm.getMapFromCache("currency");
		//国家
		LinkedHashMap countryMap = cm.getMapFromCache("country");
         //地区
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
		//柜员
		//		TreeMap tellerMap = cm.getCodeTable2HashCatch("teller", true);

		//抹帐标志
		LinkedHashMap cancelMap = cm.getMapFromCache("cancel_ind");
		//add by lkl 结算方式 pbc_gjfs  settle_type_cd
		LinkedHashMap settle_type_cdMap = cm.getMapFromCache("tstp_hash");
		String settle_type = t47_transaction.getSettle_type_cd();
		//System.out.println(settle_type+"<<<<<<<<<<<<<00");
		if (settle_type != null && !settle_type.equals("")) {
			t47_transaction.setSettle_type_cd((String) settle_type_cdMap
					.get(settle_type.trim()));
		}
		//		是否计算.
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		String cal_ind = t47_transaction.getCal_ind();
		if (cal_ind != null && !cal_ind.equals("")) {
			t47_transaction.setCal_ind_disp((String) cal_indMap.get(cal_ind
					.trim()));
		}
		//end

		String organkey = t47_transaction.getOrgankey();
		String acct_num = t47_transaction.getAcct_num();
		//String party_id=t47_transaction.getParty_id();
		//机构信息
		if (organkey != null && !organkey.equals("")) {
			t47_transaction.setOrganName((String) organMap.get(organkey));
		}
		 String opp_organarea="";
			if (t47_transaction.getOpp_country() != null) {
				opp_organarea=(String)countryMap.get(t47_transaction.getOpp_country());
			}
			if (t47_transaction.getOpp_area() != null) {
				opp_organarea=opp_organarea+(String)pbcareaMap.get(t47_transaction.getOpp_area());
			}
			t47_transaction.setOpp_area(opp_organarea);
//			 对方证件类型
			String opp_Card_type = t47_transaction.getOpp_card_type();
			if (opp_Card_type != null && !"".equals(opp_Card_type)) {

				t47_transaction.setOpp_Card_type_flag((String) card_typeMap
						.get(opp_Card_type));
			}
			 
			// 代办人证件类型
			String agent_card_type = t47_transaction.getAgent_card_type();
			if (agent_card_type != null && !"".equals(agent_card_type)) {

				t47_transaction.setAgent_card_type((String) card_typeMap
						.get(agent_card_type));
			}
			//		代办人国家
			String agent_country = t47_transaction.getAgent_country();
			if (agent_country != null && !agent_country.equals("")) {
				t47_transaction.setAgent_country((String)countryMap.get(agent_country));
			}


		// 交易日期
		if (t47_transaction.getTx_dt() != null) {
			t47_transaction.setTx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getTx_dt()));
		}
		String occurarea="";
		if (t47_transaction.getTx_occur_country() != null) {
			occurarea=(String)countryMap.get(t47_transaction.getTx_occur_country());
		}
		if (t47_transaction.getTx_occur_area() != null) {
			occurarea=occurarea+(String)pbcareaMap.get(t47_transaction.getTx_occur_area());
		}
		t47_transaction.setTx_occur_disp(occurarea);
		String goarea="";
		if (t47_transaction.getTx_go_country() != null) {
			goarea=(String)countryMap.get(t47_transaction.getTx_go_country());
		}
		if (t47_transaction.getTx_go_area() != null) {
			goarea=goarea+(String)pbcareaMap.get(t47_transaction.getTx_go_area());
		}
		t47_transaction.setTx_go_disp(goarea);
		//帐户类型
		if (acct_num != null && !acct_num.equals("")) {
			String acct_type = (String) sqlMap.queryForObject(
					"getT47_accttype", acct_num);
			if (acct_type != null && !acct_type.equals("")) {
				t47_transaction.setAcct_type_string((String) acctypeMap
						.get(acct_type));
			}

		}

		//		对方帐户类型
		String opp_acct_type = t47_transaction.getOpp_acct_type_cd();
		if (opp_acct_type != null && !opp_acct_type.equals("")) {
			t47_transaction.setOpp_acct_type_cd_string((String) acctypeMap
					.get(opp_acct_type));
		}

		//客户类型
		String party_class_cd = t47_transaction.getParty_class_cd();
		if (party_class_cd != null && !"".equals(party_class_cd)) {

			t47_transaction.setParty_class_cd_flag((String) clienttypeMap
					.get(party_class_cd));
		}
		//科目名称
		String subject_no = t47_transaction.getSubjectno();
		if (subject_no != null && !"".equals(subject_no)) {

			String subject_name = (String) sqlMap.queryForObject(
					"getT47_subjectname", subject_no);
			t47_transaction.setSubjectname(subject_name);
		}

		//收付标志
		String receive_pay_cd = t47_transaction.getReceive_pay_cd();
		LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay");
		if (receive_pay_cd != null && !"".equals(receive_pay_cd)) {

			t47_transaction.setReceive_pay_cd_flag((String) receive_payMap
					.get(receive_pay_cd));
		}

		//汇款标志
		String remit_type_cd = t47_transaction.getRemit_type_cd();
		if (remit_type_cd != null && !"".equals(remit_type_cd)) {

			t47_transaction.setRemit_type_cd_flag((String) remittypeMap
					.get(remit_type_cd));
		}

		//借贷标志
		String debit_credit = t47_transaction.getDebit_credit();
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		if (debit_credit != null && !"".equals(debit_credit)) {

			t47_transaction.setDebit_credit_disp((String) trackflagMap
					.get(debit_credit));
		}
		// 现转标志
		String cash_trans_flag = t47_transaction.getCash_trans_flag();
		if (cash_trans_flag != null && !"".equals(cash_trans_flag)) {

			t47_transaction.setCash_trans_flag_disp((String) goflagMap
					.get(cash_trans_flag));
		}
		//批量标志
		String batch = t47_transaction.getBatch_ind();
		if (batch != null && !batch.equals("")) {
			t47_transaction.setBatch_ind_flag((String) statusMap.get(batch));
		}

		//交易名称
		String tx_cd = t47_transaction.getCb_tx_cd();
		if (tx_cd != null && !tx_cd.equals("")) {
			t47_transaction.setCb_tx_cd_name((String) trannameMap.get(tx_cd));

		}
		//币种
		String currency_cd = t47_transaction.getCurrency_cd();
		if (currency_cd != null && !currency_cd.equals("")) {
			t47_transaction.setCurrency_cd_disp((String) currcdMap
					.get(currency_cd));
		}

		//柜员
		//		String teller_no=t47_transaction.getTeller();
		//		if(teller_no!=null && !teller_no.equals("") )
		//		{    String teller_no1=teller_no.trim();
		//		     String teller=(String)tellerMap.get(teller_no1);
		//			//String teller=(String)sqlMap.queryForObject("getT47_tellername",teller_no1);
		//			t47_transaction.setTeller_disp(teller);
		//		}

		// 是否跨境
		String overarea_ind = t47_transaction.getOverarea_ind();
		if (overarea_ind != null && !"".equals(overarea_ind)) {

			t47_transaction.setOverarea_ind_flag((String) statusMap
					.get(overarea_ind));
		}
		//抹帐标志
		String cancle_ind = t47_transaction.getCancel_ind();
		if (cancle_ind != null && !"".equals(cancle_ind)) {

			t47_transaction.setCancel_ind_disp((String) cancelMap
					.get(cancle_ind));
		}

		//对方是否我行帐户
		String opp_isparty = t47_transaction.getOpp_isparty();
		if (opp_isparty != null && !"".equals(opp_isparty)) {

			t47_transaction.setOpp_isparty_flag((String) statusMap
					.get(opp_isparty));
		}

		// 对方交易日期
		if (t47_transaction.getOpp_tx_dt() != null) {
			t47_transaction.setOpp_tx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getOpp_tx_dt()));
		}

		// 对方客户类型
		String clienttype = t47_transaction.getOpp_party_class_cd();
		if (clienttype != null && !"".equals(clienttype)) {

			t47_transaction.setOpp_party_class_cd_falg((String) clienttypeMap
					.get(clienttype));
		}

		// 对方行号类型
		LinkedHashMap opp_organ_typeMap = cm.getMapFromCache("cfct_hash");
		String opp_organ_type = t47_transaction.getOpp_organ_type();
		if (opp_organ_type != null && !"".equals(opp_organ_type)) {

			t47_transaction.setOpp_organ_type_flag((String) opp_organ_typeMap
					.get(opp_organ_type));
		}

		//		 处理状态
		String handle_status_cd = t47_transaction.getHandle_status_cd();

		if (handle_status_cd != null && (!"".equals(handle_status_cd))) {

			t47_transaction.setHandle_status_cd_flag((String) disposalstateMap
					.get(handle_status_cd));
		}
	
		 
	
		return t47_transaction;
	}
	/**
	 * 查询当前和历史交易详细信息
	 * @param sqlMap
	 * @param transactionkey
	 * @param tableName
	 * @param t47_transaction1
	 * @return
	 * @throws SQLException
	 */
	public T47_transaction getT47_transactionDisp1(SqlMapClient sqlMap,T47_transaction t47_transaction1) throws SQLException {
		T47_transaction t47_transaction;
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transactionDisp1", t47_transaction1);
		if (t47_transaction == null)
			t47_transaction = new T47_transaction();

		//把货币转换成标准格式
		MoneyUtils mUtils = new MoneyUtils();

		if (t47_transaction.getAmt() != null) {
			String amt_money = mUtils.FormatMoney(t47_transaction.getAmt()
					.doubleValue());
			t47_transaction.setAmt_string(amt_money);
		}

		if (t47_transaction.getCny_amt() != null) {
			String cnyamt_money = mUtils.FormatMoney(t47_transaction
					.getCny_amt().doubleValue());
			t47_transaction.setCny_amt_string(cnyamt_money);
		}
		if (t47_transaction.getUsd_amt() != null) {
			String usdamt_money = mUtils.FormatMoney(t47_transaction
					.getUsd_amt().doubleValue());
			t47_transaction.setUsd_amt_string(usdamt_money);
		}

		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		//帐户类型
		LinkedHashMap acctypeMap = cm.getMapFromCache("pbc_catp");
		//现转标记
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");

		//是否
		LinkedHashMap statusMap = cm.getMapFromCache("yesNo");
		//处理状态
		LinkedHashMap disposalstateMap = cm.getMapFromCache("disposalstate");
		//证件类型
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		//客户类型 对公 对私
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap remittypeMap = cm.getMapFromCache("remittype");
		//交易名称
		LinkedHashMap trannameMap = cm.getMapFromCache("tranname");
		//币种
		LinkedHashMap currcdMap = cm.getMapFromCache("currency");
//		国家
		LinkedHashMap countryMap = cm.getMapFromCache("country");
         //地区
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
		//柜员
		//		TreeMap tellerMap = cm.getCodeTable2HashCatch("teller", true);

		//抹帐标志
		LinkedHashMap cancelMap = cm.getMapFromCache("cancel_ind");
		//add by lkl 结算方式 pbc_gjfs  settle_type_cd
		LinkedHashMap settle_type_cdMap = cm.getMapFromCache("tstp_hash");
		String settle_type = t47_transaction.getSettle_type_cd();
		//System.out.println(settle_type+"<<<<<<<<<<<<<00");
		if (settle_type != null && !settle_type.equals("")) {
			t47_transaction.setSettle_type_cd((String) settle_type_cdMap
					.get(settle_type.trim()));
		}
		//		是否计算.
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		String cal_ind = t47_transaction.getCal_ind();
		if (cal_ind != null && !cal_ind.equals("")) {
			t47_transaction.setCal_ind_disp((String) cal_indMap.get(cal_ind
					.trim()));
		}
		//end

		String organkey = t47_transaction.getOrgankey();
		String acct_num = t47_transaction.getAcct_num();
		//String party_id=t47_transaction.getParty_id();
		//机构信息
		if (organkey != null && !organkey.equals("")) {
			t47_transaction.setOrganName((String) organMap.get(organkey));
		}
		
		 String opp_organarea="";
		 String opp_country = t47_transaction.getOpp_country();
			if (t47_transaction.getOpp_country() != null) {
				opp_organarea=(String)countryMap.get(t47_transaction.getOpp_country());
				if(opp_country.equals("CHN")||opp_country.equals("Z01")||opp_country.equals("Z02")||opp_country.equals("Z03"))
				{
					if (t47_transaction.getOpp_area() != null) {
						opp_organarea=opp_organarea+(String)pbcareaMap.get(t47_transaction.getOpp_area());
					}
				}
			}
			
			
			t47_transaction.setOpp_area(opp_organarea);
//			 对方证件类型
			String opp_Card_type = t47_transaction.getOpp_card_type();
			if (opp_Card_type != null && !"".equals(opp_Card_type)) {

				t47_transaction.setOpp_Card_type_flag((String) card_typeMap
						.get(opp_Card_type));
			}
			 
			// 代办人证件类型
			String agent_card_type = t47_transaction.getAgent_card_type();
			if (agent_card_type != null && !"".equals(agent_card_type)) {

				t47_transaction.setAgent_card_type((String) card_typeMap
						.get(agent_card_type));
			}
			//		代办人国家
			String agent_country = t47_transaction.getAgent_country();
			if (agent_country != null && !agent_country.equals("")) {
				t47_transaction.setAgent_country((String)countryMap.get(agent_country));
			}


		// 交易日期
		if (t47_transaction.getTx_dt() != null) {
			t47_transaction.setTx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getTx_dt()));
		}
		// 交易时间
		if (t47_transaction.getDt_time() != null) {
			t47_transaction.setDt_time_disp(DateUtils
					.dateToString(t47_transaction.getDt_time()));
		}
		String occurarea="";
		String occur_country = t47_transaction.getTx_occur_country();
		if (t47_transaction.getTx_occur_country() != null) {
			occurarea=(String)countryMap.get(t47_transaction.getTx_occur_country());
			if(occur_country.equals("CHN")||occur_country.equals("Z01")||occur_country.equals("Z02")||occur_country.equals("Z03"))
			{
				if (t47_transaction.getTx_occur_area() != null) {
					occurarea=occurarea+(String)pbcareaMap.get(t47_transaction.getTx_occur_area());
				}
			}
		}
		
		
		t47_transaction.setTx_occur_disp(occurarea);
		
		String goarea="";
		String go_country = t47_transaction.getTx_go_country();
		if (t47_transaction.getTx_go_country() != null) {
			goarea=(String)countryMap.get(t47_transaction.getTx_go_country());
			if(go_country.equals("CHN")||go_country.equals("Z01")||go_country.equals("Z02")||go_country.equals("Z03"))
			{
				if (t47_transaction.getTx_go_area() != null) {
					goarea=goarea+(String)pbcareaMap.get(t47_transaction.getTx_go_area());
				}
			}
		}
		
		t47_transaction.setTx_go_disp(goarea);
		
	
		//帐户类型
		if (acct_num != null && !acct_num.equals("")) {
			String acct_type = (String) sqlMap.queryForObject(
					"getT47_accttype", acct_num);
			if (acct_type != null && !acct_type.equals("")) {
				t47_transaction.setAcct_type_string((String) acctypeMap
						.get(acct_type));
			}

		}

		//		对方帐户类型
		String opp_acct_type = t47_transaction.getOpp_acct_type_cd();
		if (opp_acct_type != null && !opp_acct_type.equals("")) {
			t47_transaction.setOpp_acct_type_cd_string((String) acctypeMap
					.get(opp_acct_type));
		}

		//客户类型
		String party_class_cd = t47_transaction.getParty_class_cd();
		if (party_class_cd != null && !"".equals(party_class_cd)) {

			t47_transaction.setParty_class_cd_flag((String) clienttypeMap
					.get(party_class_cd));
		}
		//科目名称
		String subject_no = t47_transaction.getSubjectno();
		if (subject_no != null && !"".equals(subject_no)) {

			String subject_name = (String) sqlMap.queryForObject(
					"getT47_subjectname", subject_no);
			t47_transaction.setSubjectname(subject_name);
		}

		//收付标志
		String receive_pay_cd = t47_transaction.getReceive_pay_cd();
		LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay");
		if (receive_pay_cd != null && !"".equals(receive_pay_cd)) {

			t47_transaction.setReceive_pay_cd_flag((String) receive_payMap
					.get(receive_pay_cd));
		}

		//汇款标志
		String remit_type_cd = t47_transaction.getRemit_type_cd();
		if (remit_type_cd != null && !"".equals(remit_type_cd)) {

			t47_transaction.setRemit_type_cd_flag((String) remittypeMap
					.get(remit_type_cd));
		}

		//借贷标志
		String debit_credit = t47_transaction.getDebit_credit();
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		if (debit_credit != null && !"".equals(debit_credit)) {

			t47_transaction.setDebit_credit_disp((String) trackflagMap
					.get(debit_credit));
		}
		// 现转标志
		String cash_trans_flag = t47_transaction.getCash_trans_flag();
		if (cash_trans_flag != null && !"".equals(cash_trans_flag)) {

			t47_transaction.setCash_trans_flag_disp((String) goflagMap
					.get(cash_trans_flag));
		}
		//批量标志
		String batch = t47_transaction.getBatch_ind();
		if (batch != null && !batch.equals("")) {
			t47_transaction.setBatch_ind_flag((String) statusMap.get(batch));
		}

		//交易名称
		String tx_cd = t47_transaction.getCb_tx_cd();
		if (tx_cd != null && !tx_cd.equals("")) {
			t47_transaction.setCb_tx_cd_name((String) trannameMap.get(tx_cd));

		}
		//币种
		String currency_cd = t47_transaction.getCurrency_cd();
		if (currency_cd != null && !currency_cd.equals("")) {
			t47_transaction.setCurrency_cd_disp((String) currcdMap
					.get(currency_cd));
		}

		//柜员
		//		String teller_no=t47_transaction.getTeller();
		//		if(teller_no!=null && !teller_no.equals("") )
		//		{    String teller_no1=teller_no.trim();
		//		     String teller=(String)tellerMap.get(teller_no1);
		//			//String teller=(String)sqlMap.queryForObject("getT47_tellername",teller_no1);
		//			t47_transaction.setTeller_disp(teller);
		//		}

		// 是否跨境
		String overarea_ind = t47_transaction.getOverarea_ind();
		if (overarea_ind != null && !"".equals(overarea_ind)) {

			t47_transaction.setOverarea_ind_flag((String) statusMap
					.get(overarea_ind));
		}
		//抹帐标志
		String cancle_ind = t47_transaction.getCancel_ind();
		if (cancle_ind != null && !"".equals(cancle_ind)) {

			t47_transaction.setCancel_ind_disp((String) cancelMap
					.get(cancle_ind));
		}

		//对方是否我行帐户
		String opp_isparty = t47_transaction.getOpp_isparty();
		if (opp_isparty != null && !"".equals(opp_isparty)) {

			t47_transaction.setOpp_isparty_flag((String) statusMap
					.get(opp_isparty));
		}

		// 对方交易日期
		if (t47_transaction.getOpp_tx_dt() != null) {
			t47_transaction.setOpp_tx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getOpp_tx_dt()));
		}

		// 对方客户类型
		String clienttype = t47_transaction.getOpp_party_class_cd();
		if (clienttype != null && !"".equals(clienttype)) {

			t47_transaction.setOpp_party_class_cd_falg((String) clienttypeMap
					.get(clienttype));
		}

		// 对方行号类型
		LinkedHashMap opp_organ_typeMap = cm.getMapFromCache("cfct_hash");
		String opp_organ_type = t47_transaction.getOpp_organ_type();
		if (opp_organ_type != null && !"".equals(opp_organ_type)) {

			t47_transaction.setOpp_organ_type_flag((String) opp_organ_typeMap
					.get(opp_organ_type));
		}

		//		 处理状态
		String handle_status_cd = t47_transaction.getHandle_status_cd();

		if (handle_status_cd != null && (!"".equals(handle_status_cd))) {

			t47_transaction.setHandle_status_cd_flag((String) disposalstateMap
					.get(handle_status_cd));
		}
		
		
		return t47_transaction;
	}
	public ArrayList getT47M_transactionList(SqlMapClient sqlMap,
			T47_transaction t47_transaction, int iStartRec, int iPageSize)
			throws SQLException {
		t47_transaction.setOrder_name(t47_transaction.getOrder_name()
				.toUpperCase());
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT47M_transactionList", t47_transaction, iStartRec,
				iPageSize);
		ArrayList t47_transactionList = new ArrayList();
		MoneyUtils mUtils = new MoneyUtils();
	
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap trackflag = cm.getMapFromCache("trackflag");
		LinkedHashMap goflag = cm.getMapFromCache("goflag");
		LinkedHashMap currency = cm.getMapFromCache("currency");
		LinkedHashMap tradetype = cm.getMapFromCache("tradetype");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		//交易渠道
		LinkedHashMap channelMap = cm.getMapFromCache("channel");
		//结算方式
		LinkedHashMap jsMap = cm.getMapFromCache("tstp_hash");

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_transaction transaction1 = (T47_transaction) iter.next();
			if (transaction1.getCal_ind() != null
					&& !"".equals(transaction1.getCal_ind())) {
				transaction1.setCal_ind_disp((String) cal_indMap
						.get(transaction1.getCal_ind()));
			}
			if (transaction1.getOrgankey() != null
					&& !"".equals(transaction1.getOrgankey())) {
				transaction1.setOrgankey((String) organMap.get(transaction1
						.getOrgankey()));
			}
			if (transaction1.getAmt() != null) {
				String money = mUtils.FormatMoney(transaction1.getAmt()
						.doubleValue());
				transaction1.setAmt_disp(money);
			}
			if (transaction1.getCash_trans_flag() != null
					&& !"".equals(transaction1.getCash_trans_flag())) {
				transaction1.setCash_trans_flag((String) goflag
						.get(transaction1.getCash_trans_flag()));
			}
			if (transaction1.getDebit_credit() != null
					&& !"".equals(transaction1.getDebit_credit())) {
				transaction1.setDebit_credit((String) trackflag
						.get(transaction1.getDebit_credit()));
			}
			if (transaction1.getTx_dt() != null) {
				transaction1.setTx_dt_disp(DateUtils.dateToString(transaction1
						.getTx_dt()));
			}
			if (transaction1.getCurrency_cd() != null
					&& !"".equals(transaction1.getCurrency_cd())) {
				transaction1.setCurrency_cd((String) currency.get(transaction1
						.getCurrency_cd()));
			}
			if (transaction1.getTx_type_cd() != null
					&& !"".equals(transaction1.getTx_type_cd())) {
				transaction1.setTx_type_cd((String) tradetype.get(transaction1
						.getTx_type_cd()));
			}
			if (transaction1.getChannel()!= null
					&& !"".equals(transaction1.getChannel())) {
				transaction1.setChannel((String) channelMap.get(transaction1
						.getChannel()));
			}
			if (transaction1.getSettle_type_cd()!= null
					&& !"".equals(transaction1.getSettle_type_cd())) {
				transaction1.setSettle_type_cd((String) jsMap.get(transaction1
						.getSettle_type_cd()));
			}
	
			t47_transactionList.add(transaction1);
		}
		return t47_transactionList;
	}
	public int getT47M_transactionListCount(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47M_transactionListCount", t47_transaction);
		return iCount.intValue();
	}

	/**
	 * 取单条明细操作 add by dingke
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param tableName TODO
	 * @param Transactionkey
	 *            String
	 * @throws SQLException
	 * @return T47_transaction
	 */
	public T47_transaction getT47_transactionFillDisp(SqlMapClient sqlMap,
			String transactionkey, String tableName) throws SQLException {
		T47_transaction t47_transaction;
		if("t47_transaction_ub".equals(tableName)) {	// 针对一补t47_transaction_ub 
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ubFillDisp", transactionkey);
		} else if("t47_transaction_uc".equals(tableName)) {	// 针对二补t47_transaction_uc
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transaction_ucFillDisp", transactionkey);
		} else if("t47_transaction".equals(tableName)) {	// 通过transactionkey 查询t47_transaction的单条记录
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transactionDisp_for_key", transactionkey);
		} else {
			t47_transaction = (T47_transaction) sqlMap.queryForObject("getT47_transactionFillDisp", transactionkey);
		}
		MoneyUtils mUtils = new MoneyUtils();
		if (t47_transaction.getAmt() != null
				&& t47_transaction.getAmt().doubleValue() >= 0) {
			String money = mUtils.FormatMoney(t47_transaction.getAmt()
					.doubleValue(),"##0.00");
			Double money1 = null;
			money1 = Double.valueOf(money);
			t47_transaction.setAmt(money1);
			t47_transaction.setAmt_disp(money);
		}
		if (t47_transaction == null)
			t47_transaction = new T47_transaction();
		return t47_transaction;
	}

	
	/**
	 * 取单条明细操作 add by dingke
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Transactionkey
	 *            String
	 * @throws SQLException
	 * @return T47_transaction
	 */
	public T47_transaction getT47_transactionFillDisp1(SqlMapClient sqlMap,
			String transactionkey) throws SQLException {
		T47_transaction t47_transaction = (T47_transaction) sqlMap
				.queryForObject("getT47_transactionFillDisp1", transactionkey);
		if (t47_transaction == null)
			t47_transaction = new T47_transaction();
		return t47_transaction;
	}
	public int modifyT47_transactiondo(SqlMapClient sqlMap,
			T47_transaction t47_transaction) throws SQLException {
		int i = sqlMap.update("modifyT47_transactiondo", t47_transaction);

		return i;
	}

	/**
	 * 新增交易删除
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Transactionkey
	 *            String
	 * @throws SQLException
	 * @return T47_transaction
	 */
	public int deleteT47_transaction(SqlMapClient sqlMap, String trankey) throws SQLException {
		int i = sqlMap.update("deleteT47_transaction", trankey);
		return i;
	}
	public int insertT47_trans_recordLog(SqlMapClient sqlMap,
			T47_trans_recordLog t47_trans_recordLog) throws SQLException {
		int i = sqlMap.update("insertT47_trans_recordLog", t47_trans_recordLog);
		return i;
	}
	
	/**
	 * 交易补录信息查询函数
	 * @author caoxiang  2017/9/4
	 */
	public ArrayList getT47_trans_recordLogList(SqlMapClient sqlMap,
			T47_trans_recordLog t47_trans_recordLog, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_trans_recordLog_List",
				t47_trans_recordLog, iStartRec, iPageSize);
		
		return list;
	}
	
	
	public int getT47_trans_recordLog_ListCount(SqlMapClient sqlMap, T47_trans_recordLog t47_trans_recordLog)
			throws SQLException {
		Integer iCount = (Integer)sqlMap.queryForObject(
				"getT47_trans_recordLog_ListCount", t47_trans_recordLog);
		return iCount.intValue();
	}
}