/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-08-30] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.risk_rate.dao; 
  
/**
* <p>T37_party_resultDAO.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.*; 
import java.sql.*;  

import org.apache.log4j.*;  
  
import com.ist.common.util.*;  
import com.ist.common.*;  
import com.ist.common.base.*;  

import com.ist.util.DateUtils;
import com.ist.aml.newrisk.dto.T31_def_element;
import com.ist.aml.newrisk.dto.T31_risk_level;
import com.ist.aml.risk_rate.dto.T31_n_move;
import com.ist.aml.risk_rate.dto.T37_appr_bas_rslt;
import com.ist.aml.risk_rate.dto.T37_level_audit;
import com.ist.aml.risk_rate.dto.T37_party_result;

import com.ibatis.sqlmap.client.SqlMapClient; 
  
public class T37_party_resultDAO  extends BaseDAO{
  
/** 
 * 构造函数 
 */ 
public T37_party_resultDAO() {  
} 
/** 
 * 取得列表（可分页）  
 * @param sqlMap SqlMapClient 
 * @param t37_party_result T37_party_result 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public List getT37_party_resultList(SqlMapClient sqlMap,T37_party_result t37_party_result,int iStartRec,int iPageSize) throws SQLException{ 
        List list = sqlMap.queryForList("getT37_party_result_rateList",t37_party_result,iStartRec,iPageSize); 
        ArrayList t37_party_resultList = new ArrayList();
		LinkedHashMap risk_levelMap = cm.getMapFromCache("t31_risk_level");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap hcheck_statusMap = cm.getMapFromCache("helpcheckstatus");//协查状态
		LinkedHashMap rate_status_cdMap = cm.getMapFromCache("new_status_cd");//新开存量客户审查状态/评级结果状态
		ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_levelList");
		for(int i=0;i<list.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)list.get(i);
			if(t37_pt_result.getStatus_cd()!= null &&!"".equals(t37_pt_result.getStatus_cd())){
				t37_pt_result.setStatus_cd_disp((String)rate_status_cdMap.get(t37_pt_result.getStatus_cd()));
			}
			if(t37_pt_result.getHcheck_status()!=null && !"".equals(t37_pt_result.getHcheck_status())){
				t37_pt_result.setHcheck_status_disp((String) hcheck_statusMap.get(t37_pt_result.getHcheck_status()));
			}
			if(t37_pt_result.getOrgankey()!=null&&!"".equals(t37_pt_result.getOrgankey())){
				t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
			}
			if(t37_pt_result.getFristappralevel()!=null&&!"".equals(t37_pt_result.getFristappralevel())){
				t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
			}
			if(t37_pt_result.getEmendationlevel()!=null&&!"".equals(t37_pt_result.getEmendationlevel())){
				t37_pt_result.setEmendationlevel_disp((String)risk_levelMap.get(t37_pt_result.getEmendationlevel()));
			}
			t37_pt_result.setHigherlevel(maojorLevel(sqlMap,t31_risk_levelList,t37_pt_result.getFristappralevel(),t37_pt_result.getEmendationlevel()));
			if(t37_pt_result.getLastlevelkey()!=null && !"".equals(t37_pt_result.getLastlevelkey())){
				t37_pt_result.setLastlevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLastlevelkey()));
			}
			if(t37_pt_result.getStatistic_dt()!=null){
				t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
			}
			if(t37_pt_result.getCreate_dt()!=null){
				t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
			}
			t37_party_resultList.add(t37_pt_result);
		}

      return t37_party_resultList;  
} 

    private String maojorLevel(SqlMapClient sqlMap,ArrayList t31_risk_levelList,String fristappralevel,String emendationlevel) throws SQLException{
    		
    	LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
    	String levelkey="";
    	if(t87_sysparaMap.get("705")!=null && t87_sysparaMap.get("705").equals("1")){
    		double e=0.0;
    		double f=0.0;
    		if(t31_risk_levelList != null && t31_risk_levelList.size() > 0){
    			for(int i=0;i<t31_risk_levelList.size();i++){
    				T31_risk_level t31_risk_level=(T31_risk_level)t31_risk_levelList.get(i);
    				if(t31_risk_level.getLevelkey().equals(emendationlevel)){
    					 e=t31_risk_level.getLevelmin_d();
    				}else if(t31_risk_level.getLevelkey().equals(fristappralevel)){
    					 f=t31_risk_level.getLevelmin_d();
    				}
    			}
    		}
    		
    		//判断初评与调整等级高低
    		if(f > e){
    			levelkey=fristappralevel;
    		}else{
    			levelkey=emendationlevel;
    		}
    	}else{
    		levelkey=emendationlevel;
    	}
    	
    	return levelkey;
    }
	public int getT37_party_resultListCount(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_party_result_rateListCount", t37_party_result);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	public List getT37_party_result_checkList(SqlMapClient sqlMap,T37_party_result t37_party_result,int iStartRec,int iPageSize) throws SQLException{ 
        List list = sqlMap.queryForList("getT37_party_result_checkRateList",t37_party_result,iStartRec,iPageSize); 
        ArrayList t37_party_resultList = new ArrayList();
		LinkedHashMap risk_levelMap = cm.getMapFromCache("t31_risk_level");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap rate_status_cdMap = cm.getMapFromCache("rate_status_cd");//评级结果状态
		ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_levelList");
		for(int i=0;i<list.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)list.get(i);
			
			if(t37_pt_result.getOrgankey()!=null&&!"".equals(t37_pt_result.getOrgankey())){
				t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
			}
			if(t37_pt_result.getFristappralevel()!=null&&!"".equals(t37_pt_result.getFristappralevel())){
				t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
			}
			if(t37_pt_result.getEmendationlevel()!=null&&!"".equals(t37_pt_result.getEmendationlevel())){
				t37_pt_result.setEmendationlevel_disp((String)risk_levelMap.get(t37_pt_result.getEmendationlevel()));
			}
			if(t37_pt_result.getLastlevelkey()!=null && !"".equals(t37_pt_result.getLastlevelkey())){
				t37_pt_result.setLastlevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLastlevelkey()));
			}
			t37_pt_result.setHigherlevel(maojorLevel(sqlMap,t31_risk_levelList,t37_pt_result.getFristappralevel(),t37_pt_result.getEmendationlevel()));
			if(t37_pt_result.getStatistic_dt()!=null){
				t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
			}
			
			if(t37_pt_result.getCreate_dt()!=null){
				t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
			}
			if(t37_pt_result.getModifydate()!=null){
				t37_pt_result.setModifydate_disp(DateUtils.dateToStringShort(t37_pt_result.getModifydate()));
			}
			if(t37_pt_result.getStatus_cd() != null && !"".equals(t37_pt_result.getStatus_cd())){
				t37_pt_result.setStatus_cd_disp((String)rate_status_cdMap.get(t37_pt_result.getStatus_cd()));
			}
			t37_party_resultList.add(t37_pt_result);
		}

      return t37_party_resultList;  
} 
	public int getT37_party_result_checkListCount(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_party_result_checkRateListCount", t37_party_result);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	public List getT37_party_result_uhList(SqlMapClient sqlMap,T37_party_result t37_party_result,int iStartRec,int iPageSize) throws SQLException{ 
        List list = sqlMap.queryForList("getT37_party_result_uh_rateList",t37_party_result,iStartRec,iPageSize); 
        ArrayList t37_party_resultList = new ArrayList();
		LinkedHashMap risk_levelMap = cm.getMapFromCache("t31_risk_level");
		LinkedHashMap temp_type_map = cm.getMapFromCache("temp_type");
		LinkedHashMap granularitymap = cm.getMapFromCache("granularity");
		for(int i=0;i<list.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)list.get(i);
			if(t37_pt_result.getTemptype()!=null&&!"".equals(t37_pt_result.getTemptype())){
				t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
			}
			if(t37_pt_result.getFristappralevel()!=null&&!"".equals(t37_pt_result.getFristappralevel())){
				t37_pt_result.setFristappralevel((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
			}
			if(t37_pt_result.getEmendationlevel()!=null&&!"".equals(t37_pt_result.getEmendationlevel())){
				t37_pt_result.setEmendationlevel_disp((String)risk_levelMap.get(t37_pt_result.getEmendationlevel()));
			}
			if(t37_pt_result.getStatistic_dt()!=null){
				t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
			}
            if(t37_pt_result.getGranularity()!=null&&!"".equals(t37_pt_result.getGranularity())){
            	t37_pt_result.setGranularity((String)granularitymap.get(t37_pt_result.getGranularity()));
            }
            if(t37_pt_result.getLevelkey()!=null&&!"".equals(t37_pt_result.getLevelkey())){
            	t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
            }
			t37_party_resultList.add(t37_pt_result);
		}

      return t37_party_resultList;  
} 


	public int getT37_party_result_uhListCount(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_party_result_uh_rateListCount", t37_party_result);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	public ArrayList getT37_appr_bas_rsltList(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_bas_rslt_rateList",
				t37_appr_bas_rslt);
		ArrayList t37_appr_elem_rsltList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T37_appr_bas_rslt t37_appr_bas=(T37_appr_bas_rslt)list.get(i);
			if(t37_appr_bas.getOld_score()==null){
				t37_appr_bas.setOld_score("0");
			}
			if(t37_appr_bas.getScore()==null || t37_appr_bas.getScore().equals("")){
				t37_appr_bas.setScore(t37_appr_bas.getOld_score());
			}
			if(t37_appr_bas.getOld_score()!=null && t37_appr_bas.getOld_score().indexOf(".")==0){
				t37_appr_bas.setOld_score("0"+t37_appr_bas.getOld_score());
			}
			if(t37_appr_bas.getScore()!=null && t37_appr_bas.getScore().indexOf(".")==0){
				t37_appr_bas.setScore("0"+t37_appr_bas.getScore());
			}
			t37_appr_elem_rsltList.add(t37_appr_bas);
		}
		
		return t37_appr_elem_rsltList;
	}
	
	public ArrayList getT37_appr_bas_rsltList1(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
         HashMap map=new HashMap();
		ArrayList list = (ArrayList) sqlMap.queryForList("getrisk_rateReCalList1",
				t37_appr_bas_rslt);
		ArrayList t37_appr_elem_rsltList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T37_appr_bas_rslt t37_appr_bas=(T37_appr_bas_rslt)list.get(i);
			if(t37_appr_bas.getScore()==null || "".equals(t37_appr_bas.getScore())){
				t37_appr_bas.setScore_d(Double.parseDouble(t37_appr_bas.getOld_score()));
			}else{
				t37_appr_bas.setScore_d(Double.parseDouble(t37_appr_bas.getScore()));
			}
			t37_appr_elem_rsltList.add(t37_appr_bas);
		}
		
		return list;
	}
	public ArrayList getT37_appr_bas_rslt_uhList(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_bas_rslt_uhList",
				t37_appr_bas_rslt);
		return list;
	}
	public ArrayList getT37_appr_elem_rsltList(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_elem_rslt_rateList",
				t37_appr_bas_rslt);
		return list;
	}
	public ArrayList getT37_appr_elem_rslt_dispList(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_elem_rslt_dispList",
				t37_appr_bas_rslt);
		return list;
	}
	public ArrayList getT37_appr_bas_rslt_dispList(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_bas_rslt_dispList",
				t37_appr_bas_rslt);
		ArrayList t37_appr_elem_rsltList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T37_appr_bas_rslt t37_appr_bas=(T37_appr_bas_rslt)list.get(i);
			t37_appr_bas.setElement_score(t37_appr_bas.getScore_d());
			t37_appr_elem_rsltList.add(t37_appr_bas);
		}
		return t37_appr_elem_rsltList;
	}
	public ArrayList getT37_appr_elem_rsltList1(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
		LinkedHashMap newrisk_jf_js_type_map = cm.getMapFromCache("newrisk_jf_js_type");
		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_appr_elem_rslt_rateList1",
				t37_appr_bas_rslt);
		ArrayList t37_appr_elem_rsltList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T37_appr_bas_rslt t37_appr_bas=(T37_appr_bas_rslt)list.get(i);
			t37_appr_bas.setJs_type_disp((String)newrisk_jf_js_type_map.get(t37_appr_bas.getJs_type()));
			if(t37_appr_bas.getScore()==null){
				t37_appr_bas.setScore("");
			}
			if(t37_appr_bas.getBase_occ().equals("0.00")){
				t37_appr_bas.setBase_occ("");
			}
			t37_appr_elem_rsltList.add(t37_appr_bas);
		}
		return t37_appr_elem_rsltList;
	}
	
	public int getMaxTreeLaye(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getMaxTreeLayeRisk_rate", t37_appr_bas_rslt);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue()-1;
	}
	
	public ArrayList getT31_n_moveopRiskList(SqlMapClient sqlMap, String node_id)
			throws SQLException {
		ArrayList t31_n_moveList = cm.getListFromCache("t31_n_move_rateList");
		ArrayList list = new ArrayList();
		for (int i = 0; i < t31_n_moveList.size(); i++) {
			T31_n_move t31_n_move = (T31_n_move) t31_n_moveList.get(i);
			if (t31_n_move.getNode_id().equals(node_id)) {
				list.add(t31_n_move);
			}
		}
		return list;
	}
	public ArrayList getT37_level_auditList1(SqlMapClient sqlMap,T37_party_result t37_party_result_temp)throws SQLException{
		List t37_level_auditList = sqlMap.queryForList("getT37_level_auditList1", t37_party_result_temp);
		LinkedHashMap postid2name = cm.getMapFromCache("t31_node");
		LinkedHashMap riskLevelMap = cm.getMapFromCache("t31_risk_level");
		ArrayList list = new ArrayList();
		for(int i=0;i<t37_level_auditList.size();i++){
			T37_level_audit t37_level_audit=(T37_level_audit)t37_level_auditList.get(i);
			if(t37_level_audit.getLevel_before_adjust()!=null&&!"".equals(t37_level_audit.getLevel_before_adjust())){
				t37_level_audit.setLevel_before_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_before_adjust()));
			}
			if(t37_level_audit.getLevel_after_adjust()!=null&&!"".equals(t37_level_audit.getLevel_after_adjust())){
				t37_level_audit.setLevel_after_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_after_adjust()));
			}
			if(t37_level_audit.getLast_upd_dt()!=null){
				t37_level_audit.setLast_upd_dt_disp(DateUtils.dateToStringShort(t37_level_audit.getLast_upd_dt()));
			}
			if(t37_level_audit.getRes_post_id()!=null&&!"".equals(t37_level_audit.getRes_post_id())){
				t37_level_audit.setRes_post_id((String)postid2name.get(t37_level_audit.getRes_post_id()));
			}
			
			if(t37_level_audit.getPost_id()!=null&&!"".equals(t37_level_audit.getPost_id())){
				t37_level_audit.setPost_id((String)postid2name.get(t37_level_audit.getPost_id()));
			}
			list.add(t37_level_audit);
		}
		return list;
	}
	public ArrayList getT37_level_auditList(SqlMapClient sqlMap, T37_party_result t37_party_result,int iStartRec,int iPageSize)
			throws SQLException {
		List t37_level_auditList = sqlMap.queryForList("getT37_level_audit_rateList", t37_party_result,iStartRec,iPageSize);
		LinkedHashMap postid2name = cm.getMapFromCache("t31_node");
		LinkedHashMap riskLevelMap = cm.getMapFromCache("t31_risk_level");
		ArrayList list = new ArrayList();
		for(int i=0;i<t37_level_auditList.size();i++){
			T37_level_audit t37_level_audit=(T37_level_audit)t37_level_auditList.get(i);
			if(t37_level_audit.getLevel_before_adjust()!=null&&!"".equals(t37_level_audit.getLevel_before_adjust())){
				t37_level_audit.setLevel_before_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_before_adjust()));
			}
			if(t37_level_audit.getLevel_after_adjust()!=null&&!"".equals(t37_level_audit.getLevel_after_adjust())){
				t37_level_audit.setLevel_after_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_after_adjust()));
			}
			if(t37_level_audit.getLast_upd_dt()!=null){
				t37_level_audit.setLast_upd_dt_disp(DateUtils.dateToStringShort(t37_level_audit.getLast_upd_dt()));
			}
			if(t37_level_audit.getRes_post_id()!=null&&!"".equals(t37_level_audit.getRes_post_id())){
				t37_level_audit.setRes_post_id((String)postid2name.get(t37_level_audit.getRes_post_id()));
			}
			
			if(t37_level_audit.getPost_id()!=null&&!"".equals(t37_level_audit.getPost_id())){
				t37_level_audit.setPost_id((String)postid2name.get(t37_level_audit.getPost_id()));
			}
			list.add(t37_level_audit);
		}
		return list;
	}
	public int getT37_level_auditListCount(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_level_auditListCount", t37_party_result);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	public ArrayList getT37_level_audit_uhList(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		List t37_level_auditList = sqlMap.queryForList(
				"getT37_level_audit_uhList", t37_party_result);
		LinkedHashMap postid2name = cm.getMapFromCache("t31_node");
		LinkedHashMap riskLevelMap = cm.getMapFromCache("t31_risk_level");
		ArrayList list = new ArrayList();
		for (int i = 0; i < t37_level_auditList.size(); i++) {
			T37_level_audit t37_level_audit = (T37_level_audit) t37_level_auditList
					.get(i);
			if (t37_level_audit.getLevel_before_adjust() != null
					&& !"".equals(t37_level_audit.getLevel_before_adjust())) {
				t37_level_audit.setLevel_before_adjust((String) riskLevelMap
						.get(t37_level_audit.getLevel_before_adjust()));
			}
			if (t37_level_audit.getLevel_after_adjust() != null
					&& !"".equals(t37_level_audit.getLevel_after_adjust())) {
				t37_level_audit.setLevel_after_adjust((String) riskLevelMap
						.get(t37_level_audit.getLevel_after_adjust()));
			}
			if (t37_level_audit.getLast_upd_dt() != null) {
				t37_level_audit.setLast_upd_dt_disp(DateUtils
						.dateToStringShort(t37_level_audit.getLast_upd_dt()));
			}
			if (t37_level_audit.getRes_post_id() != null
					&& !"".equals(t37_level_audit.getRes_post_id())) {
				t37_level_audit.setRes_post_id((String) postid2name
						.get(t37_level_audit.getRes_post_id()));
			}

			if (t37_level_audit.getPost_id() != null
					&& !"".equals(t37_level_audit.getPost_id())) {
				t37_level_audit.setPost_id((String) postid2name
						.get(t37_level_audit.getPost_id()));
			}
			list.add(t37_level_audit);
		}
		return list;
	}

	public int modifyT37_appr_bas_rslt(SqlMapClient sqlMap, String sql)
			throws SQLException {
		int i = sqlMap.update("modifyT37_appr_bas_rslt_modi", sql);
		return i;

}

	public int insertT37_appr_bas_rslt_modi(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt)
			throws SQLException {
		int i = sqlMap.update("insertT37_appr_bas_rslt_modi", t37_appr_bas_rslt);
		return i;

	}

	public int insertT37_party_result_currToAudit(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		int i = sqlMap
				.update("insertT37_party_result_currToAudit", t37_party_result);
		return i;

	}

	public int insertT37_appr_bas_rslt_currToAudit(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
		int i = sqlMap
				.update("insertT37_appr_bas_rslt_currToAudit", t37_appr_bas_rslt);
		return i;

	}
	public int insertT37_gs_indic_val_currToAudit(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
		int i = sqlMap
				.update("insertT37_gs_indic_val_currToAudit", t37_appr_bas_rslt);
		return i;

	}
	public int insertT37_level_audit_currToAudit(SqlMapClient sqlMap,
			T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
		int i = sqlMap
				.update("insertT37_level_audit_currToAudit", t37_appr_bas_rslt);
		return i;

	}
	public int deleteT37_party_result_audit(SqlMapClient sqlMap,
			T37_party_result t37_party_result) throws SQLException {
		int i = sqlMap.update("deleteT37_party_result_audit", t37_party_result);
		//评级再调整删除时，根据RESULTKEY删除额外的三个表(t37_appr_bas_rslt_audit、t37_gs_indic_val_audit、t37_level_audit_re)
		sqlMap.update("deleteT37_appr_bas_rslt_audit",t37_party_result);
		sqlMap.update("deleteT37_gs_indic_val_audit",t37_party_result);
		sqlMap.update("deleteT37_level_audit_re",t37_party_result);
		
		return i;

	}
/** 
 * 取单条明细操作 
 * @param sqlMap SqlMapClient 
 * @param Create_dt String  
 * @throws SQLException   
 * @return T37_party_result  
 */ 

	public T37_party_result getT37_party_resultDisp(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_rateDisp", t37_party_result_temp);
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		LinkedHashMap risk_gsrmMap = cm.getMapFromCache("risk_gsrm");
		LinkedHashMap risk_templateMap = cm.getMapFromCache("risk_template_name");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
		LinkedHashMap yesnoMap = cm.getMapFromCache("yesNo");
		
		if(t37_party_result!=null){
			if(t37_party_result.getParty_class_cd()!=null&&!"".equals(t37_party_result.getParty_class_cd())){
				t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
			}
			if(t37_party_result.getFristappralevel()!=null&&!"".equals(t37_party_result.getFristappralevel())){
				t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
			}
			if(t37_party_result.getEmendationlevel()!=null&&!"".equals(t37_party_result.getEmendationlevel())){
				t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
			}
			if(t37_party_result.getLevelkey()!=null&&!"".equals(t37_party_result.getLevelkey())){
				t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
			}
			if(t37_party_result.getGskey()!=null&&!"".equals(t37_party_result.getGskey())){
				t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
				t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
			}
			if(t37_party_result.getTemplatekey()!=null&&!"".equals(t37_party_result.getTemplatekey())){
				t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
			}
			if(t37_party_result.getStatistic_dt()!=null){
				t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
			}
			if(t37_party_result.getModify_cd()!=null){
				t37_party_result.setModify_cd_disp((String)yesnoMap.get(t37_party_result.getModify_cd()));
			}
			if(t37_party_result.getLastscore()==null || t37_party_result.getLastscore().equals("")){
				t37_party_result.setLastscore(t37_party_result.getScore());
			}
		}else{
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}
	
	public T37_party_result getT37_party_resultDisp1(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_rateDisp1", t37_party_result_temp);
			
		if(t37_party_result!=null){
			
		}else{
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}
	
	/*历史单条明细信息*/
	public T37_party_result getT37_party_result_uhDisp(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_uhDisp1", t37_party_result_temp);
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		LinkedHashMap risk_gsrmMap = cm.getMapFromCache("risk_gsrm");
		LinkedHashMap risk_templateMap = cm.getMapFromCache("risk_template_name");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
		
		if(t37_party_result!=null){
			if(t37_party_result.getParty_class_cd()!=null&&!"".equals(t37_party_result.getParty_class_cd())){
				t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
			}
			if(t37_party_result.getFristappralevel()!=null&&!"".equals(t37_party_result.getFristappralevel())){
				t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
			}
			if(t37_party_result.getEmendationlevel()!=null&&!"".equals(t37_party_result.getEmendationlevel())){
				t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
			}
			if(t37_party_result.getLevelkey()!=null&&!"".equals(t37_party_result.getLevelkey())){
				t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
			}
			if(t37_party_result.getGskey()!=null&&!"".equals(t37_party_result.getGskey())){
				t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
				t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
			}
			if(t37_party_result.getTemplatekey()!=null&&!"".equals(t37_party_result.getTemplatekey())){
				t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
			}
			if(t37_party_result.getStatistic_dt()!=null){
				t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
			}
		}else{
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}

	/**
	 * 得分转化为风险等级用
	 */
	public T37_party_result getT37_party_result_jfDisp(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_rateDisp", t37_party_result_temp);
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		LinkedHashMap risk_gsrmMap = cm.getMapFromCache("risk_gsrm");
		LinkedHashMap risk_templateMap = cm.getMapFromCache("risk_template_name");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
		
		if(t37_party_result!=null){
			if(t37_party_result.getParty_class_cd()!=null&&!"".equals(t37_party_result.getParty_class_cd())){
				t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
			}
			if(t37_party_result.getFristappralevel()!=null&&!"".equals(t37_party_result.getFristappralevel())){
				t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
			}
			t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
			if(t37_party_result.getEmendationlevel()!=null&&!"".equals(t37_party_result.getEmendationlevel())){
				t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
			}
			if(t37_party_result.getLevelkey()!=null&&!"".equals(t37_party_result.getLevelkey())){
				t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
			}
			if(t37_party_result.getGskey()!=null&&!"".equals(t37_party_result.getGskey())){
				t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
				t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
			}
			if(t37_party_result.getTemplatekey()!=null&&!"".equals(t37_party_result.getTemplatekey())){
				t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
			}
			if(t37_party_result.getStatistic_dt()!=null){
				t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
			}
			if(t37_party_result.getLastscore()==null || t37_party_result.getLastscore().equals("")){
				t37_party_result.setLastscore(t37_party_result.getScore());
			}
			if(t37_party_result.getTemptype().equals("1")){
				T31_risk_level t31_risk_level_temp=new T31_risk_level();
				ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_level_rateList");
				if(t37_party_result.getLastscore()!=null&&!"".equals(t37_party_result.getLastscore())){
					for(int i=0;i<t31_risk_levelList.size();i++){
						com.ist.aml.risk_rate.dto.T31_risk_level t31_risk_level=(com.ist.aml.risk_rate.dto.T31_risk_level)t31_risk_levelList.get(i);
						double min=t31_risk_level.getLevelmin_d();
						double max=t31_risk_level.getLevelmax_d();
						double score=Double.parseDouble(String.valueOf(t37_party_result.getLastscore()));
						if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("0")){
							if(min < score && score < max){
								t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
								t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
							}
						}
						if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("1")){
							if(min <= score && score <= max){
								t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
								t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
							}
						}
						if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("1")){
							if(min < score && score <= max){
								t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
								t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
							}
						}
						if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("0")){
							if(min <= score && score < max){
								t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
								t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
							}
						}
					}
				}
			}
			
		}else{
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}
	/**
	 * 得分转化为风险等级用_new 根据岗位判断是否更改风险等级
	 */
	public T37_party_result getT37_party_result_jfDisp_new(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp,String post_id) throws SQLException {
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_rateDisp", t37_party_result_temp);
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		LinkedHashMap risk_gsrmMap = cm.getMapFromCache("risk_gsrm");
		LinkedHashMap risk_templateMap = cm.getMapFromCache("risk_template_name");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
		
		if(t37_party_result!=null){
			if(t37_party_result.getParty_class_cd()!=null&&!"".equals(t37_party_result.getParty_class_cd())){
				t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
			}
			if(t37_party_result.getFristappralevel()!=null&&!"".equals(t37_party_result.getFristappralevel())){
				t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
			}
			t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
			if(t37_party_result.getEmendationlevel()!=null&&!"".equals(t37_party_result.getEmendationlevel())){
				t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
			}
			if(t37_party_result.getLevelkey()!=null&&!"".equals(t37_party_result.getLevelkey())){
				t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
			}
			if(t37_party_result.getGskey()!=null&&!"".equals(t37_party_result.getGskey())){
				t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
				t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
			}
			if(t37_party_result.getTemplatekey()!=null&&!"".equals(t37_party_result.getTemplatekey())){
				t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
			}
			if(t37_party_result.getStatistic_dt()!=null){
				t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
			}
			if(t37_party_result.getLastscore()==null || t37_party_result.getLastscore().equals("")){
				t37_party_result.setLastscore(t37_party_result.getScore());
			}
			if(post_id.equals("P2001")){//如果是客户评级编辑岗
				if(t37_party_result.getTemptype().equals("1")){
					T31_risk_level t31_risk_level_temp=new T31_risk_level();
					ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_level_rateList");
					if(t37_party_result.getLastscore()!=null&&!"".equals(t37_party_result.getLastscore())){
						for(int i=0;i<t31_risk_levelList.size();i++){
							com.ist.aml.risk_rate.dto.T31_risk_level t31_risk_level=(com.ist.aml.risk_rate.dto.T31_risk_level)t31_risk_levelList.get(i);
							double min=t31_risk_level.getLevelmin_d();
							double max=t31_risk_level.getLevelmax_d();
							double score=Double.parseDouble(String.valueOf(t37_party_result.getLastscore()));
							if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("0")){
								if(min < score && score < max){
									t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
									t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
								}
							}
							if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("1")){
								if(min <= score && score <= max){
									t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
									t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
								}
							}
							if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("1")){
								if(min < score && score <= max){
									t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
									t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
								}
							}
							if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("0")){
								if(min <= score && score < max){
									t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
									t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
								}
							}
						}
					}
				}
			}
		}else{
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}
	public ArrayList getT37_gs_indicValList(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		List t37_gs_indicValList = sqlMap.queryForList("getT37_gs_indicValList", t37_party_result_temp);
		ArrayList list = new ArrayList();
		LinkedHashMap indic_nameMap = cm.getMapFromCache("t21_indic_name");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		for(int i=0;i<t37_gs_indicValList.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)t37_gs_indicValList.get(i);
			if(t37_pt_result.getIndickey()!=null&&!"".equals(t37_pt_result.getIndickey())){
				t37_pt_result.setIndicname((String)indic_nameMap.get(t37_pt_result.getIndickey()));
			}
			if(t37_pt_result.getGskey()!=null&&!"".equals(t37_pt_result.getGskey())){
				t37_pt_result.setGsname((String)risk_gsnameMap.get(t37_pt_result.getGskey()));
			}
			list.add(t37_pt_result);
		}
		return list;
	}
	public ArrayList getT37_gs_indicVal_rateList(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		List t37_gs_indicValList = sqlMap.queryForList("getT37_gs_indicVal_rateList", t37_party_result_temp);
		ArrayList list = new ArrayList();
		LinkedHashMap indic_nameMap = cm.getMapFromCache("t21_indic_name");
		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");
		for(int i=0;i<t37_gs_indicValList.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)t37_gs_indicValList.get(i);
			if(t37_pt_result.getIndickey()!=null&&!"".equals(t37_pt_result.getIndickey())){
				t37_pt_result.setIndicname((String)indic_nameMap.get(t37_pt_result.getIndickey()));
			}
			if(t37_pt_result.getGskey()!=null&&!"".equals(t37_pt_result.getGskey())){
				t37_pt_result.setGsname((String)risk_gsnameMap.get(t37_pt_result.getGskey()));
			}
			list.add(t37_pt_result);
		}
		return list;
	}
public int modifyT37_party_resultStatusForReport(SqlMapClient sqlMap,
		T37_party_result t37_party_result) throws SQLException {
	int i = sqlMap.update("modifyT37_party_resultOper", t37_party_result);
	return i;
}
public int batchT37_party_resultStatusForReport(SqlMapClient sqlMap,
		T37_party_result t37_party_result) throws SQLException {
	int i = sqlMap.update("batchT37_party_resultOper", t37_party_result);
	return i;
}
public int modifyT37_party_resultLastScore(SqlMapClient sqlMap,
		T37_party_result t37_party_result) throws SQLException {
	int i = sqlMap.update("modifyT37_party_result_riskRateLastScore", t37_party_result);
	return i;
}
public int modifyT37_party_resultLastHcheckStatus(SqlMapClient sqlMap,
		T37_party_result t37_party_result) throws SQLException {
	int i = sqlMap.update("modifyT37_party_resultHcheck_status", t37_party_result);
	return i;
}
public int insertT37_level_audit(SqlMapClient sqlMap,
		T37_level_audit t37_level_audit) throws SQLException {
	int i = sqlMap.update("insertT37_level_audit_rate", t37_level_audit);
	return i;
}

	
	public List<T37_appr_bas_rslt> getReCalList(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException {
	
		return sqlMap.queryForList("getrisk_rateReCalList",t37_party_result);
	}
	
	public T37_party_result getT37_party_resultDispBy_party_id(SqlMapClient sqlMap,
			T37_party_result t37_party_result_temp) throws SQLException {
		T37_party_result t37_party_result = (T37_party_result) sqlMap.queryForObject("getT37_party_result_DispBy_party_id", t37_party_result_temp);
		if(t37_party_result == null){
			t37_party_result = new T37_party_result();
		}
		return t37_party_result;
	}
	/**
	 * 取当前评级结果列表
	 * @param sqlMap
	 * @param t37PartyResult
	 * @param startRec
	 * @param intPageSize
	 * @return
	 * @throws SQLException
	 */
	public List getT37_curr_rate_resultList(SqlMapClient sqlMap,
			T37_party_result t37PartyResult, int startRec, int intPageSize) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_curr_result_rateList",t37PartyResult,startRec,intPageSize); 
        ArrayList t37_party_resultList = new ArrayList();
        //风险级别
		LinkedHashMap risk_levelMap = cm.getMapFromCache("t31_risk_level");
		//机构信息
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		//协查状态
		LinkedHashMap statusMap = cm.getMapFromCache("helpcheckstatus");
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		for(int i=0;i<list.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)list.get(i);
			if(t37_pt_result.getParty_class_cd()!=null&&!"".equals(t37_pt_result.getParty_class_cd())){
				t37_pt_result.setParty_class_cd_disp((String)clienttypeMap.get(t37_pt_result.getParty_class_cd()));
			}
			//归属机构
			if(t37_pt_result.getOrgankey()!=null&&!"".equals(t37_pt_result.getOrgankey())){
				t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
			}
			//系统评级
			if(t37_pt_result.getFristappralevel()!=null&&!"".equals(t37_pt_result.getFristappralevel())){
				t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
			}
			//当前评级
			if(t37_pt_result.getLevelkey()!=null && !"".equals(t37_pt_result.getLevelkey())){
				t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
			}
			//协查状态
			if(t37_pt_result.getHcheck_status()!=null && !"".equals(t37_pt_result.getHcheck_status())){
				t37_pt_result.setHcheck_status_disp((String)statusMap.get(t37_pt_result.getHcheck_status()));
			}
			//系统评级日期
			if(t37_pt_result.getStatistic_dt()!=null){
				t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
			}
			//当前评级日期（使用审批日期）
			if(t37_pt_result.getRcheck_dt()!=null){
				t37_pt_result.setRcheck_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getRcheck_dt()));
			}
			//开户日期
			if(t37_pt_result.getCreate_dt()!=null){
				t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
			}
			//下次评级日期
			if(t37_pt_result.getNextstatistic_dt()!=null){
				t37_pt_result.setNextstatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getNextstatistic_dt()));
			}
			t37_party_resultList.add(t37_pt_result);
		}

      return t37_party_resultList;  
	}
	/**
	 * 取当前评级结果记录数
	 * @param sqlMap
	 * @param t37PartyResult
	 * @return
	 * @throws SQLException
	 */
	public int getT37_curr_rate_resultListCount(SqlMapClient sqlMap,
			T37_party_result t37PartyResult) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_curr_result_rateListCount", t37PartyResult);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	/**
	 * 导出风险评级结果
	 * @param sqlMap
	 * @param t37_party_result_temp
	 * @param exportType 
	 * @param organKeyList 
	 * @param resultKeyList 
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT37_export_curr_rate_resultDisp(SqlMapClient sqlMap,T37_party_result t37_party_result_temp)throws SQLException {
		
		ArrayList t37_party_resultList = (ArrayList) sqlMap.queryForList("getT37_export_curr_rate_resultDisp", t37_party_result_temp);
		
//		LinkedHashMap risk_gsnameMap = cm.getMapFromCache("risk_gs_name");//公式名称
//		LinkedHashMap risk_gsrmMap = cm.getMapFromCache("risk_gsrm");//计算公式
//		LinkedHashMap risk_templateMap = cm.getMapFromCache("risk_template_name");//积分模版名称
		//机构信息
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		//客户类型：对公C 对私I
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		//是否人工调整 否0 是1
		LinkedHashMap modify_cdMap = cm.getMapFromCache("yesNo");
		//风险级别
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
		//模板类型 积分1 公式2
		LinkedHashMap temptypeMap = cm.getMapFromCache("temp_type");
		if(t37_party_resultList!=null){
			int j = t37_party_resultList.size();
			T37_party_result t37_party_result = new T37_party_result();
			for (int i = 0; i < j; i++) {
				t37_party_result = (T37_party_result) t37_party_resultList.get(i);
				//归属机构
				if(t37_party_result.getOrgankey()!= null && !"".equals(t37_party_result.getOrgankey())){
					t37_party_result.setOrgan_name((String)organMap.get(t37_party_result.getOrgankey()));
				}
				//客户类型
				if(t37_party_result.getParty_class_cd()!=null&&!"".equals(t37_party_result.getParty_class_cd())){
					t37_party_result.setParty_class_cd_disp((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
				}
				//系统评级
				if(t37_party_result.getFristappralevel()!=null&&!"".equals(t37_party_result.getFristappralevel())){
					t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
				}
				//当前评级
				if(t37_party_result.getLevelkey()!=null&&!"".equals(t37_party_result.getLevelkey())){
					t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
				}
				//是否人工调整
				if(t37_party_result.getModify_cd()!=null && !"".equals(t37_party_result.getModify_cd())){
					t37_party_result.setModify_cd_disp((String)modify_cdMap.get(t37_party_result.getModify_cd()));
				}
				//模板类型
				if(t37_party_result.getTemptype()!= null && !"".equals(t37_party_result.getTemptype())){
					t37_party_result.setTemptype_disp((String)temptypeMap.get(t37_party_result.getTemptype()));
				}
				//系统评级日期
				if(t37_party_result.getStatistic_dt()!=null){
					t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
				}
				//开户日期
				if(t37_party_result.getCreate_dt()!=null){
					t37_party_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_party_result.getCreate_dt()));
				}
//			if(t37_party_result.getGskey()!=null&&!"".equals(t37_party_result.getGskey())){
//				t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
//				t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
//			}
//			if(t37_party_result.getTemplatekey()!=null&&!"".equals(t37_party_result.getTemplatekey())){
//				t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
//			}
			}
		}else{
			return new ArrayList();
		}
		return t37_party_resultList;
	}
	
	/**
	 * 等级调整进度列表查询(默认while newsearchflag=0)
	 * @param sqlMap
	 * @param t37PartyResult
	 * @return
	 * @throws SQLException 
	 */
	public List getT37_level_adjust_progressList(SqlMapClient sqlMap,
			T37_party_result t37PartyResult, int startRec, int intPageSize) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT37_level_adjust_progressList",t37PartyResult,startRec,intPageSize); 
		
        ArrayList t37_party_resultList = new ArrayList();
        //风险级别
		LinkedHashMap risk_levelMap = cm.getMapFromCache("t31_risk_level");
		//机构信息
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		//评级结果状态
		LinkedHashMap statusMap = cm.getMapFromCache("rate_status_cd");
		//模板类型 1积分 2公式
		LinkedHashMap temp_type_map = cm.getMapFromCache("temp_type");
		for(int i=0;i<list.size();i++){
			T37_party_result t37_pt_result=(T37_party_result)list.get(i);
			//归属机构
			if(t37_pt_result.getOrgankey()!=null&&!"".equals(t37_pt_result.getOrgankey())){
				t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
			}
			//系统评级
			if(t37_pt_result.getFristappralevel()!=null&&!"".equals(t37_pt_result.getFristappralevel())){
				t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
			}
			//当前评级
			if(t37_pt_result.getLevelkey()!=null && !"".equals(t37_pt_result.getLevelkey())){
				t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
			}
			//评级结果状态
			if(t37_pt_result.getStatus_cd()!=null && !"".equals(t37_pt_result.getStatus_cd())){
				t37_pt_result.setStatus_cd_disp((String)statusMap.get(t37_pt_result.getStatus_cd()));
			}
			//模板类型
			if(t37_pt_result.getTemptype()!=null && !"".equals(t37_pt_result.getTemptype())){
				t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
			}
			//系统评级日期
			if(t37_pt_result.getStatistic_dt()!=null){
				t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
			}
			//当前评级日期（使用审批日期）
			if(t37_pt_result.getRcheck_dt()!=null){
				t37_pt_result.setRcheck_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getRcheck_dt()));
			}
			//开户日期
			if(t37_pt_result.getCreate_dt()!=null){
				t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
			}
			t37_party_resultList.add(t37_pt_result);
		}

      return t37_party_resultList;
	}
	/**
	 * 等级调整进度条目数查询
	 * @param sqlMap
	 * @param t37PartyResult
	 * @return
	 * @throws SQLException 
	 */
	public int getT37_level_adjust_progressListCount(SqlMapClient sqlMap,
			T37_party_result t37PartyResult) throws SQLException {
		 Integer iCount = (Integer) sqlMap.queryForObject("getT37_level_adjust_progressListCount", t37PartyResult);
		if (iCount == null) {
			return 0;
		}
		return iCount.intValue();
	}
	
	public ArrayList getT31_def_elem_List(SqlMapClient sqlMap,
			T31_def_element t31_def_element) throws SQLException {

		ArrayList list = (ArrayList) sqlMap.queryForList("getT31_def_elementList1",t31_def_element);
		return list;
	}
	
	
}

