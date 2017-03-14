package com.ist.aml.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.report.dto.T10_capital_chain;
import com.ist.aml.report.dto.T10_trans_analysis;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.MoneyUtils;
import com.ist.util.DateUtils;
public class T10_trans_analysisDAO extends BaseDAO{

	//查询一个客户的交易量
	public int getCustTransCountById(SqlMapClient sqlMap, T10_trans_analysis t10_trans_analysis) throws SQLException {
		Integer rows = (Integer)sqlMap.queryForObject("getT10_transcount_by_partyid", t10_trans_analysis);
		if(rows==null){
			return 0;
		}
		return rows.intValue();
	}
	//查询一个客户的交易总金额
	public double getCustTransSumAmtById(SqlMapClient sqlMap, T10_trans_analysis t10_trans_analysis) throws SQLException {
		Double amt = (Double)sqlMap.queryForObject("getT10_transsumamt_by_partyid", t10_trans_analysis);
		if(amt==null){
			return 0;
		}
		return amt.doubleValue();
	}
	//按交易渠道分组查询一个客户下面的交易情况
	public ArrayList getCustTransGroupByChannel(SqlMapClient sqlMap,
			T10_trans_analysis t10_trans_analysis) throws SQLException {
		ArrayList result = new ArrayList();
		T10_trans_analysis t10_temp =new T10_trans_analysis();
		LinkedHashMap channelMap = cm.getMapFromCache("channel");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCustTransGroupByChannel", t10_trans_analysis);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			if(t10_temp.getPattern()!=null&&!"".equals(t10_temp.getPattern())){
				t10_temp.setPattern((String)channelMap.get(t10_temp.getPattern()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按交易机构分组查询一个客户的交易情况
	public ArrayList getCustTransGroupByOrgankey(SqlMapClient sqlMap,
			T10_trans_analysis t10_trans_analysis) throws SQLException {
		ArrayList result = new ArrayList();
		T10_trans_analysis t10_temp =new T10_trans_analysis();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCustTransGroupByOrgankey", t10_trans_analysis);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			if(t10_temp.getPattern()!=null&&!"".equals(t10_temp.getPattern())){
				t10_temp.setPattern((String)organMap.get(t10_temp.getPattern()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按交易去向分组查询一个客户的交易情况
	public ArrayList getCustTransGroupByTxgoarea(SqlMapClient sqlMap,
			T10_trans_analysis t10_trans_analysis)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis t10_temp =new T10_trans_analysis();
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCustTransGroupByTxgoarea", t10_trans_analysis);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			if(t10_temp.getPattern()!=null&&!"".equals(t10_temp.getPattern())){
				t10_temp.setPattern((String)pbcareaMap.get(t10_temp.getPattern()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按结算方式分组查询一个客户下面的交易情况
	public ArrayList getCustTransGroupBySettletype(SqlMapClient sqlMap,
			T10_trans_analysis t10_trans_analysis)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis t10_temp =new T10_trans_analysis();
		LinkedHashMap jsMap = cm.getMapFromCache("tstp_hash");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCustTransGroupBySettletype", t10_trans_analysis);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			if(t10_temp.getPattern()!=null&&!"".equals(t10_temp.getPattern())){
				t10_temp.setPattern((String)jsMap.get(t10_temp.getPattern()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按交易对手分组查询一个客户下面的交易情况
	public ArrayList getCustTransGroupByOppname(SqlMapClient sqlMap,
			T10_trans_analysis t10_trans_analysis)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis t10_temp =new T10_trans_analysis();
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCustTransGroupByOppname", t10_trans_analysis);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按客户号查询客户的资金流入情况
	public ArrayList getInCustCapitalChain(SqlMapClient sqlMap,
			T10_capital_chain t10_capital_chain,String analy_from, int iStartRec, int iPageSize) throws SQLException {
		ArrayList result = new ArrayList();
		T10_capital_chain t10_temp = new T10_capital_chain();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap curr_map = cm.getMapFromCache("currency");
		LinkedHashMap area_map = cm.getMapFromCache("pbcarea");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		String sql="getInCustCapitalChain";
		if(analy_from.equals("2")){
			sql="getInCustCapitalChain1";
		}
		ArrayList temp= (ArrayList) sqlMap.queryForList(sql, t10_capital_chain, iStartRec, iPageSize);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_capital_chain)iter.next();
			if(t10_temp.getOrgankey()!=null&&!"".equals(t10_temp.getOrgankey())){
				t10_temp.setOrganName((String)organMap.get(t10_temp.getOrgankey()));
			}
			if(t10_temp.getCurrency_cd()!=null&&!"".equals(t10_temp.getCurrency_cd())){
				t10_temp.setCurrency_cd((String)curr_map.get(t10_temp.getCurrency_cd()));
			}
			if(t10_temp.getTx_occur_area()!=null&&!"".equals(t10_temp.getTx_occur_area())){
				t10_temp.setTx_occur_area((String)area_map.get(t10_temp.getTx_occur_area()));
			}
			if(t10_temp.getTx_dt()!=null){
				t10_temp.setTx_dt_display(DateUtils.dateToStringShort(t10_temp.getTx_dt()));
			}
			if(t10_temp.getAmt()!=null&&!"".equals(t10_temp.getAmt())){
				t10_temp.setAmt(MoneyUtils.formatToMoney(t10_temp.getAmt()));
			}
			if(t10_temp.getCash_trans_flag()!=null&&!"".equals(t10_temp.getCash_trans_flag())){
				t10_temp.setTx_type((String)goflagMap.get(t10_temp.getCash_trans_flag()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按客户号查询客户资金流入交易的交易量
	public Integer getInCustCapitalChainTransCount(SqlMapClient sqlMap,
			T10_capital_chain t10_capital_chain,String analy_from)throws SQLException  {
		String sql="getInCustCapitalChainTransCount";
		if(analy_from.equals("2")){
			sql="getInCustCapitalChainTransCount1";
		}
		Integer rows = (Integer)sqlMap.queryForObject(sql, t10_capital_chain);
		if(rows==null){
			return new Integer(0);
		}
		return rows;
	}
	//按客户号查询客户流入资金交易的交易总金额
	public Double getInCustCapitalChainAmt(SqlMapClient sqlMap,
			T10_capital_chain t10_capital_chain,String analy_from) throws SQLException {
		String sql="getInCustCapitalChainAmt";
		if(analy_from.equals("2")){
			sql="getInCustCapitalChainAmt1";
		}
		Double sum_amt = (Double)sqlMap.queryForObject(sql, t10_capital_chain);
		if(sum_amt==null){
			return new Double(0);
		}
		return sum_amt;
	}
	

	//按客户号查询客户的资金流出情况
	public ArrayList getOutCustCapitalChain(SqlMapClient sqlMap,
			T10_capital_chain t10_capital_chain,String analy_from, int iStartRec, int iPageSize) throws SQLException {
		String sql="getOutCustCapitalChain";
		if(analy_from.equals("2")){
			sql="getOutCustCapitalChain1";
		}
		ArrayList result = new ArrayList();
		T10_capital_chain t10_temp = new T10_capital_chain();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap curr_map = cm.getMapFromCache("currency");
		LinkedHashMap area_map = cm.getMapFromCache("pbcarea");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		ArrayList temp= (ArrayList) sqlMap.queryForList(sql, t10_capital_chain, iStartRec, iPageSize);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_capital_chain)iter.next();
			if(t10_temp.getOrgankey()!=null&&!"".equals(t10_temp.getOrgankey())){
				t10_temp.setOrganName((String)organMap.get(t10_temp.getOrgankey()));
			}
			if(t10_temp.getCurrency_cd()!=null&&!"".equals(t10_temp.getCurrency_cd())){
				t10_temp.setCurrency_cd((String)curr_map.get(t10_temp.getCurrency_cd()));
			}
			if(t10_temp.getTx_occur_area()!=null&&!"".equals(t10_temp.getTx_occur_area())){
				t10_temp.setTx_occur_area((String)area_map.get(t10_temp.getTx_occur_area()));
			}
			if(t10_temp.getTx_dt()!=null){
				t10_temp.setTx_dt_display(DateUtils.dateToStringShort(t10_temp.getTx_dt()));
			}
			if(t10_temp.getAmt()!=null&&!"".equals(t10_temp.getAmt())){
				t10_temp.setAmt(MoneyUtils.formatToMoney(t10_temp.getAmt()));
			}
			if(t10_temp.getCash_trans_flag()!=null&&!"".equals(t10_temp.getCash_trans_flag())){
				t10_temp.setTx_type((String)goflagMap.get(t10_temp.getCash_trans_flag()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	//按客户号查询客户资金流出交易的交易量
	public Integer getOutCustCapitalChainTransCount(SqlMapClient sqlMap,
			T10_capital_chain t10_capital_chain,String analy_from) throws SQLException {
		String sql="getOutCustCapitalChainTransCount";
		if(analy_from.equals("2")){
			sql="getOutCustCapitalChainTransCount1";
		}
		Integer rows = (Integer)sqlMap.queryForObject(sql, t10_capital_chain);
		if(rows==null){
			return new Integer(0);
		}
		return rows;
	}
	//按客户号查询客户资金流出交易的交易总金额
	public Double getOutCustCapitalChainAmt(SqlMapClient sqlMap,T10_capital_chain t10_capital_chain,String analy_from) throws SQLException {
		String sql="getOutCustCapitalChainAmt";
		if(analy_from.equals("2")){
			sql="getOutCustCapitalChainAmt1";
		}
		Double sum_amt = (Double)sqlMap.queryForObject(sql, t10_capital_chain);
		if(sum_amt==null){
			return new Double(0);
		}
		return sum_amt;
	}
	
}
