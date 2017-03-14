package com.ist.aml.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T10_survey_cust;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.*;
public class T10_survey_custDAO extends BaseDAO{

	
	
	

	
	public ArrayList getT10_survey_cust_list_typeList(SqlMapClient sqlMap,
			T10_survey_cust t10_survey_cust) throws SQLException {  
		ArrayList t10_survey_custList = new ArrayList();
		t10_survey_custList = (ArrayList) sqlMap.queryForList("getT10_survey_cust_list_type",t10_survey_cust);
		
		ArrayList list_typeList = new ArrayList();
		
		LinkedHashMap list_typeMap = cm.getMapFromCache("list_type3");
		
		Iterator iter = t10_survey_custList.iterator();
		while (iter.hasNext()) {
			T10_survey_cust t10_survey_cust1 = (T10_survey_cust) iter.next();
			list_typeList.add((String)list_typeMap.get(t10_survey_cust1.getList_type()));
		}	
		return list_typeList;  
	}
	
}
