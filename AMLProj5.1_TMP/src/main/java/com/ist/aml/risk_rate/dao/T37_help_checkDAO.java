package com.ist.aml.risk_rate.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;

import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.risk_rate.dto.T37_help_check;
import com.ist.aml.risk_rate.dto.T37_helpcheck_attach;
import com.ist.common.base.BaseDAO;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;

public class T37_help_checkDAO extends BaseDAO{

	public ArrayList getT37_help_checkList(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap statusMap = cm.getMapFromCache("helpcheckstatus");
		
		ArrayList t37_help_checkList = null;
		
		t37_help_checkList = (ArrayList) sqlMap.queryForList("getT37_help_checkList", t37HelpCheck,	startRec, intPageSize);
		
		ArrayList<T37_help_check> list = new ArrayList<T37_help_check>();
		
		Iterator iter = t37_help_checkList.iterator();
		while(iter.hasNext()){
			T37_help_check thc = (T37_help_check) iter.next();
			if(null != thc.getSend_date()){
				thc.setSend_date_disp(DateUtils.dateToStringShort(thc.getSend_date()));
			}
			if(null != thc.getStatus_cd() && !"".equals(thc.getStatus_cd())){
				thc.setStatus_cd_disp((String) statusMap.get(thc.getStatus_cd()));
			}
			list.add(thc);
		}
		
		return list;
	}
	
	public ArrayList getT37_help_check_dispList(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap statusMap = cm.getMapFromCache("helpcheckstatus");
		
		ArrayList t37_help_checkList = null;
		
		t37_help_checkList = (ArrayList) sqlMap.queryForList("getT37_help_check_dispList", t37HelpCheck,	startRec, intPageSize);
		
		ArrayList<T37_help_check> list = new ArrayList<T37_help_check>();
		
		Iterator iter = t37_help_checkList.iterator();
		while(iter.hasNext()){
			T37_help_check thc = (T37_help_check) iter.next();
			if(null != thc.getSend_date()){
				thc.setSend_date_disp(DateUtils.dateToStringShort(thc.getSend_date()));
			}
			if(null != thc.getStatus_cd() && !"".equals(thc.getStatus_cd())){
				thc.setStatus_cd_disp((String) statusMap.get(thc.getStatus_cd()));
			}
			list.add(thc);
		}
		
		return list;
	}
	public ArrayList getT37_help_recheckList(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap statusMap = cm.getMapFromCache("helpcheckstatus");
		
		ArrayList t37_help_checkList = null;
		
		t37_help_checkList = (ArrayList) sqlMap.queryForList("getT37_help_recheckList", t37HelpCheck,startRec, intPageSize);
		
		ArrayList<T37_help_check> list = new ArrayList<T37_help_check>();
		
		Iterator iter = t37_help_checkList.iterator();
		while(iter.hasNext()){
			T37_help_check thc = (T37_help_check) iter.next();
			if(null != thc.getSend_date()){
				thc.setSend_date_disp(DateUtils.dateToStringShort(thc.getSend_date()));
			}
			if(null != thc.getStatus_cd() && !"".equals(thc.getStatus_cd())){
				thc.setStatus_cd_disp((String) statusMap.get(thc.getStatus_cd()));
			}
			list.add(thc);
		}
		
		return list;
	}

	public int getT37_help_checkListCount(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck) throws SQLException {
		Integer iCount;
		if(!"".equals(t37HelpCheck.getStatus_cd()) && t37HelpCheck.getStatus_cd() != null && "2".equals(t37HelpCheck.getStatus_cd())){
			iCount = (Integer) sqlMap.queryForObject("getT37_help_recheckListCount", t37HelpCheck);
		}else{
			iCount = (Integer) sqlMap.queryForObject(
					"getT37_help_checkListCount", t37HelpCheck);
		}
		return iCount.intValue();
	}
	public int getT37_help_check_dispListCount(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck) throws SQLException {
		Integer iCount;
		if(!"".equals(t37HelpCheck.getStatus_cd()) && t37HelpCheck.getStatus_cd() != null && "2".equals(t37HelpCheck.getStatus_cd())){
			iCount = (Integer) sqlMap.queryForObject("getT37_help_check_dispListCount", t37HelpCheck);
		}else{
			iCount = (Integer) sqlMap.queryForObject(
					"getT37_help_checkListCount", t37HelpCheck);
		}
		return iCount.intValue();
	}

	public T37_help_check getT37_help_checkDisp(SqlMapClient sqlMap,
			String check_no) throws SQLException {
		T37_help_check thc = (T37_help_check) sqlMap.queryForObject("getT37_help_check", check_no);
		LinkedHashMap statusMap = cm.getMapFromCache("helpcheckstatus");
		//机构信息
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if(null != thc.getStatus_cd()){
			thc.setStatus_cd_disp((String) statusMap.get(thc.getStatus_cd()));
		}
		if(null != thc.getSend_date()){
			thc.setSend_date_disp(DateUtils.dateToStringShort(thc.getSend_date()));
		}
		if(null != thc.getSend_org() && !"".equals(thc.getSend_org())){
			thc.setSend_org_disp((String) organMap.get(thc.getSend_org()));
		}
		if(null!= thc.getCheck_org() && !"".equals(thc.getCheck_org())){
			thc.setCheck_org_disp((String)organMap.get(thc.getCheck_org()));
		}
		if(null == thc){
			thc = new T37_help_check();
		}
		return thc;
	}

	public int updateT37_help_check_case(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck) throws SQLException {
		int i = sqlMap.update("updateT37_help_check_case", t37HelpCheck);
		return i;
	}

	public T37_help_check getT37_help_check_reasonDisp(SqlMapClient sqlMap,
			String check_no) throws SQLException {
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		T37_help_check thc = (T37_help_check) sqlMap.queryForObject("getT37_help_check_reason", check_no);
		if(null != thc.getSend_date()){
			thc.setSend_date_disp(DateUtils.dateToStringShort(thc.getSend_date()));
		}
		if(null == thc){
			thc = new T37_help_check();
		}
		if(thc.getCheck_org()!=null && !"".equals(thc.getCheck_org())){
			thc.setCheck_org_disp((String) organMap.get(thc.getCheck_org()));
		}
		if(thc.getSend_org()!=null && !"".equals(thc.getSend_org())){
			thc.setSend_org_disp((String) organMap.get(thc.getSend_org()));
		}
		return thc;
	}

	public ArrayList getT37_help_check_attachList(SqlMapClient sqlMap,
			T37_helpcheck_attach t37HelpcheckAttach, int startRec,
			int intPageSize, ApplicationContext context) throws SQLException {
		ArrayList t37_help_checkAttachList = (ArrayList) sqlMap.queryForList("getT37_help_check_attachList", 
				t37HelpcheckAttach, startRec, intPageSize);
		ArrayList<T37_helpcheck_attach> list = new ArrayList<T37_helpcheck_attach>();
		
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String rootPath =sysConfig.getProperty("data.import");
		
		Iterator iter = t37_help_checkAttachList.iterator();
		while(iter.hasNext()){
			T37_helpcheck_attach tha = (T37_helpcheck_attach) iter.next();
			if(!"".equals(tha.getLoad_date()) && tha.getLoad_date()!=null){
				tha.setLoad_date_disp(DateUtils.dateToStringShort(tha.getLoad_date()));
			}
			//给附件名称（地址）的前面加上上传的系统路径
			tha.setAttach_name(rootPath + tha.getAttach_name());
			
			list.add(tha);
		}
		return list;
	}

	public int getT37_help_check_attachListCount(SqlMapClient sqlMap,
			T37_helpcheck_attach tha) throws SQLException {
		Integer i = (Integer) sqlMap.queryForObject("getT37_help_check_attachListCount", tha);
		return i;
	}

	public int deleteT37_help_check_attach(SqlMapClient sqlMap, String attachKey) throws SQLException {
		Integer i = sqlMap.update("deleteT37_help_check_attach", attachKey);
		return i;
	}

	public T37_help_check getT37_help_check_statusDisp(SqlMapClient sqlMap,
			String checkNo) throws SQLException {
		T37_help_check thc = (T37_help_check) sqlMap.queryForObject("getT37_help_check_status", checkNo);
		if(null != thc.getReturn_dt() && !"".equals(thc.getReturn_dt())){
			thc.setReturn_dt_disp(DateUtils.dateToStringShort(thc.getReturn_dt()));
		}
		if(null == thc){
			thc = new T37_help_check();
		}
		return thc;
	}

	public int insertT37_risk_attach(SqlMapClient sqlMap,
			T37_helpcheck_attach tha) throws SQLException {
		int i = sqlMap.update("insertT37_helpcheck_attach", tha);
		return i;
	}
	public int updateT37_help_recheck(SqlMapClient sqlMap, T37_help_check thc) throws SQLException {
		Integer i = sqlMap.update("updateT37_help_recheck", thc);
		return i.intValue();
	}

	public int updateUntreadT37_help_check_recheck(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck) throws SQLException {
		Integer i = -100;
		if(t37HelpCheck != null){
			t37HelpCheck.setReturn_dt(new Date());
			i = sqlMap.update("updateUntreadT37_help_check_recheck", t37HelpCheck);
		}
		return i.intValue();
		
	}
//lzb start
	public ArrayList getRisk_party_acctOrganList(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		ArrayList list = (ArrayList)sqlMap.queryForList("getRisk_party_acctOrganList", party_id);
    	return list;	
	}
	public int insertT37_help_check(SqlMapClient sqlMap,
			T37_help_check t37HelpCheck) throws SQLException {
		int i = sqlMap.update("insertT37_help_check", t37HelpCheck);
		return i;
	}
 // lzb end	
}
