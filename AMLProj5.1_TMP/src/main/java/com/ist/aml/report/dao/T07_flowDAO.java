/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-27   青蛙		创建  
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
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_flow;
import com.ist.aml.report.dto.T07_node;
import com.ist.aml.report.dto.T07_post_operator;
import com.ist.aml.report.dto.T07_swith;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.platform.dto.T07_WORKDATE;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_flowDAO extends BaseDAO {


	/**
	 * 构造函数
	 */
	public T07_flowDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_flow
	 *            T07_flow
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_flowList(SqlMapClient sqlMap,
			T07_post_operator t07_flow, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_flowList",
				t07_flow, iStartRec, iPageSize);
		ArrayList t07_flowList = new ArrayList();
	
		LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");// 案例种类
		LinkedHashMap  casetypeMap = cm.getMapFromCache("casetype");//案例类型
		LinkedHashMap statusMap = cm.getMapFromCache("yesNo");// 是否
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");// 币种
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");//案例状态
		LinkedHashMap datestatusMap = cm.getMapFromCache("date_status");//数据性质
		LinkedHashMap organMap = cm.getMapFromCache("organ");//数据性质
		LinkedHashMap postMap = cm.getMapFromCache("post");
		LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");
		Date currdate=DateUtils.stringToDateShort(DateUtils.getCurrTime());
		Iterator iter = list.iterator();
		String compareDate="";
		int n=0;
		ArrayList dateList=new ArrayList();
		while (iter.hasNext()) {
			CreditTask credittask = (CreditTask) iter.next();
			if (credittask.getCurr_post() != null) {
				credittask.setCurr_post_disp((String) postMap
						.get(credittask.getCurr_post()));
			}
			if (credittask.getCase_kind() != null) {
				credittask.setCase_kind_disp((String) casecagetoryMap
						.get(credittask.getCase_kind()));
			}

			if (credittask.getCase_date() != null) {
				credittask.setCase_date_disp(DateUtils
						.dateToStringShort(credittask.getCase_date()));
			}
			if(credittask.getApp_org_id()!=null){
				credittask.setApp_org_id_disp((String)organMap.get(credittask.getApp_org_id()));
			}
			if(credittask.getCast_type()!=null){
				credittask.setCast_type_disp((String)casetypeMap.get(credittask.getCast_type()));
			}
			if(credittask.getCurr_cd()!=null){
				credittask.setCurr_cd_disp((String)curr_cdMap.get(credittask.getCurr_cd()));
			
			}
			if(credittask.getApp_state_cd()!=null){
				credittask.setApp_state_cd_disp((String)casestatusMap.get(credittask.getApp_state_cd()));
			}
			credittask.setApp_dt_disp(DateUtils.dateToString(
					credittask.getApp_dt()).substring(0, 10));
			credittask.setCase_end_date_disp(DateUtils
					.dateToStringShort(credittask.getCase_end_date()));
			if(credittask.getDate_status_cd()!=null){
				credittask.setDate_status_cd((String) datestatusMap.get(credittask.getDate_status_cd()));
			}
			if(credittask.getIs_menu()!=null){
				credittask.setIs_menu_disp((String) statusMap.get(credittask.getIs_menu()));
			}
			if(credittask.getAlert_level()!=null){
				credittask.setAlert_level_disp((String)ssdgMap.get(credittask.getAlert_level()));
			}
			String flag= StringUtils.null2String((String)sysparaMap.get("503"));
		if(flag.equals("1")){
			String bpost="";
			String hpost="";
			String ppost="";
			if(credittask.getCast_type().equals("2")){
				bpost= StringUtils.null2String((String)sysparaMap.get("409"));
				hpost= StringUtils.null2String((String)sysparaMap.get("410"));
				ppost= StringUtils.null2String((String)sysparaMap.get("411"));
			}else{
				bpost= StringUtils.null2String((String)sysparaMap.get("412"));
				hpost= StringUtils.null2String((String)sysparaMap.get("413"));
				ppost= StringUtils.null2String((String)sysparaMap.get("414"));
			}
			String caseenddate=credittask.getCase_end_date_disp();
			if(n==0){
				compareDate=caseenddate;
				
			}
		    if(!caseenddate.equals(compareDate)||n==0){
			  dateList=this.getCaseValidate(sqlMap, caseenddate,Integer.parseInt("-"+hpost)+Integer.parseInt("-"+ppost), "C");
		    }
			if(!bpost.equals("")){
			    String  bdate=this.getBeginDate(caseenddate, dateList, Integer.parseInt("-"+hpost)+Integer.parseInt("-"+ppost)-1);
				Date bpostDate=DateUtils.stringToDateShort(bdate);
				if(bpostDate.getTime()<currdate.getTime()&&(credittask.getCurr_post().equals("P0102")||credittask.getPost_id().equals("P0302"))){
					credittask.setColorflag("#0000FF");	
				}
				
			}
			
			if(!hpost.equals("")){
				String hdate=this.getBeginDate(caseenddate, dateList, Integer.parseInt("-"+ppost)-1);
				Date bpostDate=DateUtils.stringToDateShort(hdate);
				if(bpostDate.getTime()<currdate.getTime()&&(credittask.getCurr_post().equals("P0103")||credittask.getPost_id().equals("P0303"))){
					credittask.setColorflag("#FF9933");	
				}
				
			}
			if(!ppost.equals("")){
				String pdate=this.getBeginDate(caseenddate, dateList, -2);
				Date bpostDate=DateUtils.stringToDateShort(pdate);
				if(bpostDate.getTime()<currdate.getTime()&&(credittask.getCurr_post().equals("P0104")||credittask.getPost_id().equals("P0304"))){
					credittask.setColorflag("#FF0000");	
				}
				
			}
			
		    
			compareDate=caseenddate;
			n=n+1;
		}
			t07_flowList.add(credittask);
		}
		return t07_flowList;
	}
	

	public ArrayList getCaseValidate(SqlMapClient sqlMap, String statistic_dt,
			int index, String party_cd) throws SQLException {
		
		String begin = "";

		String table = "";
		String compare = "";
		String order = "";

		if (party_cd.equals("C")) {
			table = "T07_CP_WORKDATE";
		} else {
			table = "T07_ID_WORKDATE";
		}
		//后移
		if (index > 0) {
			compare = ">";
			order = "ASC";
			//前移	
		} else if (index < 0) {
			compare = "<=";
			order = "DESC";
		} else if (index == 0) {
			compare = "=";
		}
		ArrayList list=new ArrayList();
		try {
			T07_WORKDATE t07_workdate=new T07_WORKDATE();
			t07_workdate.setDaykey(DateUtils.stringToSqlDateShort(statistic_dt));
			t07_workdate.setDaykey_disp(statistic_dt);
			t07_workdate.setTablename(table);
			t07_workdate.setCompare(compare);
			t07_workdate.setOrder(order);
			 list=(ArrayList)sqlMap.queryForList("getT07_WORKDATEList", t07_workdate);	
		
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			throw sqle;
		}

		return list;
	}

	public String getBeginDate(String begin,ArrayList list,int index){
		int i = 0, j = 0;
		for(int k=0;k<list.size();k++){
			T07_WORKDATE t07_workdate1=(T07_WORKDATE)list.get(k);
			String isholiday =t07_workdate1.getIsholiday();
			String date = DateUtils.dateToStringShort(t07_workdate1.getDaykey());
			j++;
			if (!isholiday.equals("1"))
				i++;
			if (i >= Math.abs(index) - 1) {
				begin = date; //实际的起始时间
				if (index <= 0)
					j = -j; //j = j*(index/(i+1));
				else
					j = index;
				System.out.println("put{" + j + "}" + begin);
				
				break;
			}

		}
		
		return begin;
		
	}
	public CreditTask getT07_FlowCaseDisp(SqlMapClient sqlMap,
			T07_post_operator t07_flow) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_flowCaseDisp",
				t07_flow);
	
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");// 案例种类
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");// 案例类型
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");// 案例状态
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");// 币种
		LinkedHashMap orgMap = cm.getMapFromCache("organ");// 案例排序
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");// 可疑级别
		LinkedHashMap datestatusMap = cm.getMapFromCache("date_status");//数据性质
		CreditTask credittask = new CreditTask();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			credittask = (CreditTask) iter.next();
			if (credittask.getCase_kind() != null) {
				credittask.setCase_kind_disp((String) casecagetoryMap
						.get(credittask.getCase_kind()));
			}
			if (credittask.getAlert_level() != null) {
				credittask.setAlert_level_disp((String) alert_leverMap
						.get(credittask.getAlert_level()));
			}
			if (credittask.getCase_date() != null) {
				credittask.setCase_date_disp(DateUtils
						.dateToStringShort(credittask.getCase_date()));
			}
			if (credittask.getApp_state_cd() != null) {
				credittask.setApp_state_cd_disp((String) casestatusMap
						.get(credittask.getApp_state_cd()));
			}
			if (credittask.getApp_org_id() != null) {
				credittask.setApp_org_id_disp((String) orgMap.get(credittask
						.getApp_org_id()));
			}
			credittask.setApp_dt_disp(DateUtils.dateToString(
					credittask.getApp_dt()).substring(0, 10));
			credittask.setCase_end_date_disp(DateUtils
					.dateToStringShort(credittask.getCase_end_date()));
			if (credittask.getCast_type() != null) {
				credittask.setCast_type_disp((String) casetypeMap
						.get(credittask.getCast_type()));
			}
			if (credittask.getCurr_cd() != null) {
				credittask.setCurr_cd_disp((String) curr_cdMap.get(credittask
						.getCurr_cd()));
			}
			if(credittask.getDate_status_cd()!=null){
				credittask.setDate_status_cd((String) datestatusMap.get(credittask.getDate_status_cd()));    
			}
	
		}
		return credittask;
	}

	/**
	 * 
	 * @param sqlMap
	 * @param t07_flow
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_flowListAll(SqlMapClient sqlMap,
			T07_post_operator t07_flow) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_flowList",
				t07_flow);
		return list;
	}
	public ArrayList getT07_flowListcheckAll(SqlMapClient sqlMap,
			T07_post_operator t07_flow) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_flowcheckList",
				t07_flow,0,900);
		return list;
	}

	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_flow
	 *            T07_flow
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_flowListCount(SqlMapClient sqlMap,
			T07_post_operator t07_flow) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_flowListCount", t07_flow);
		return iCount.intValue();
	}

	public ArrayList getT07_post_operatorList1(SqlMapClient sqlMap,
			T07_post_operator t07_post_operator)throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_post_operatorList1", t07_post_operator);
		return list;
	}
	
	
	
	
}
