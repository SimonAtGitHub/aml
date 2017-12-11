package com.ist.aml.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T10_trans_analysis_case;
import com.ist.common.base.BaseDAO;
import com.ist.util.MoneyUtils;
public class T10_trans_analysis_caseDAO extends BaseDAO{

	//查询一个案例的交易量
	public int getCaseTransCountById(SqlMapClient sqlMap, T10_trans_analysis_case t10_trans_analysis_case) throws SQLException {
		Integer rows = (Integer)sqlMap.queryForObject("getT10_transcount_by_caseid", t10_trans_analysis_case);
		if(rows==null){
			return 0;
		}
		return rows.intValue();
	}
	
	//查询一个案例的交易总金额
	public double getCaseTransSumAmtById(SqlMapClient sqlMap, T10_trans_analysis_case t10_trans_analysis_case) throws SQLException {
		Double amt = (Double)sqlMap.queryForObject("getT10_transsumamt_by_caseid", t10_trans_analysis_case);
		if(amt==null){
			return 0;
		}
		return amt.doubleValue();
	}
	
	//按交易渠道分组查询一个案例下面的交易情况
	public ArrayList getCaseTransGroupByChannel(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case) throws SQLException {
		ArrayList result = new ArrayList();
		T10_trans_analysis_case t10_temp =new T10_trans_analysis_case();
		LinkedHashMap channelMap = cm.getMapFromCache("channel");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCaseTransGroupByChannel", t10_trans_analysis_case);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis_case)iter.next();
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
	
	//按交易机构分组查询一个案例的交易情况
	public ArrayList getCaseTransGroupByOrgankey(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case) throws SQLException {
		ArrayList result = new ArrayList();
		T10_trans_analysis_case t10_temp =new T10_trans_analysis_case();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCaseTransGroupByOrgankey", t10_trans_analysis_case);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis_case)iter.next();
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
	
	//按交易去向分组查询一个案例的交易情况
	public ArrayList getCaseTransGroupByTxgoarea(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis_case t10_temp =new T10_trans_analysis_case();
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCaseTransGroupByTxgoarea", t10_trans_analysis_case);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis_case)iter.next();
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
	
	//按结算方式分组查询一个案例下面的交易情况
	public ArrayList getCaseTransGroupBySettletype(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis_case t10_temp =new T10_trans_analysis_case();
		LinkedHashMap jsMap = cm.getMapFromCache("tstp_hash");
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCaseTransGroupBySettletype", t10_trans_analysis_case);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis_case)iter.next();
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
	
	//按交易对手分组查询一个案例下面的交易情况
	public ArrayList getCaseTransGroupByOppname(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case,int startRec, int intPageSize)throws SQLException  {
		ArrayList result = new ArrayList();
		T10_trans_analysis_case t10_temp =new T10_trans_analysis_case();
		ArrayList temp= (ArrayList) sqlMap.queryForList("getCaseTransGroupByOppname", t10_trans_analysis_case);
		if(temp==null){
			return result;
		}
		Iterator iter = temp.iterator();
		while(iter.hasNext()){
			t10_temp = (T10_trans_analysis_case)iter.next();
			if(t10_temp.getT_amt()!=null&&!"".equals(t10_temp.getT_amt())){
				t10_temp.setT_amt(MoneyUtils.formatToMoney(t10_temp.getT_amt()));
			}
			result.add(t10_temp);
		}
		return result;
	}
	public int getCaseTransGroupByOppnameCount(SqlMapClient sqlMap,
			T10_trans_analysis_case t10_trans_analysis_case) throws SQLException {
		Integer iCount = (Integer)sqlMap.queryForObject("getCaseTransGroupByOppnameCount",t10_trans_analysis_case);
		if(iCount==null){
			return 0;
		}
		return iCount.intValue(); 
	}
}
