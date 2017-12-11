/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-06-26] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.report.dao; 
  
/**
* <p>T07_report_organDAO.java</p>
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
import com.ist.aml.report.dto.*; 
import com.ibatis.sqlmap.client.SqlMapClient; 
  
public class T07_report_organDAO  extends BaseDAO{
  
/** 
 * 构造函数 
 */ 
public T07_report_organDAO() {  
} 
/** 
 * 取得列表（可分页）  
 * @param sqlMap SqlMapClient 
 * @param t07_report_organ T07_report_organ 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public List getT07_report_organList(SqlMapClient sqlMap,T07_report_organ t07_report_organ,int iStartRec,int iPageSize) throws SQLException{ 
    List list = sqlMap.queryForList("getT07_report_organList",t07_report_organ,iStartRec,iPageSize); 
    LinkedHashMap organMap = cm.getMapFromCache("organ");
    Iterator iter = list.iterator();
    ArrayList t07_report_organlist=new ArrayList();
    while(iter.hasNext()){
    	T07_report_organ report_organ=(T07_report_organ)iter.next();
    	if(report_organ.getInner_organkey()!=null){
    		report_organ.setInner_organkey((String)organMap.get(report_organ.getInner_organkey()));
    	}
    	t07_report_organlist.add(report_organ);
    }
return t07_report_organlist;  
} 
public int getT07_report_organListCount(SqlMapClient sqlMap,
		T07_report_organ t07_report_organ) throws SQLException {
	Integer iCount = (Integer)sqlMap.queryForObject("getT07_report_organListCount",t07_report_organ);
	if(iCount==null){
		return 0;
	}
	return iCount.intValue(); 
} 
public int getT07_report_organCount_BySeq_tablename(SqlMapClient sqlMap,
		String seq_tablename) throws SQLException {
	Integer iCount = (Integer)sqlMap.queryForObject("getT07_report_organCount_BySeq_tablename",seq_tablename);
	if(iCount==null){
		return 0;
	}
	return iCount.intValue(); 
} 
public List getT07_report_organ_mapList(SqlMapClient sqlMap,T07_report_organ t07_report_organ,int iStartRec,int iPageSize) throws SQLException{ 
    List list = sqlMap.queryForList("getT07_report_organ_mapList",t07_report_organ,iStartRec,iPageSize); 
    LinkedHashMap organMap = cm.getMapFromCache("organ");
    Iterator iter = list.iterator();
    ArrayList t07_report_organ_maplist=new ArrayList();
    while(iter.hasNext()){
    	T07_report_organ report_organ_map=(T07_report_organ)iter.next();
    	if(report_organ_map.getOrgankey()!=null){
    		report_organ_map.setOrganname((String)organMap.get(report_organ_map.getOrgankey()));
    	}
    	t07_report_organ_maplist.add(report_organ_map);
    }
return t07_report_organ_maplist;  
} 
public int getT07_report_organ_mapListCount(SqlMapClient sqlMap,
		T07_report_organ t07_report_organ) throws SQLException {
	Integer iCount = (Integer)sqlMap.queryForObject("getT07_report_organ_mapListCount",t07_report_organ);
	if(iCount==null){
		return 0;
	}
	return iCount.intValue(); 
} 
/** 
 * 取单条明细操作 
 * @param sqlMap SqlMapClient 
 * @param Inner_organkey String  
 * @throws SQLException   
 * @return T07_report_organ  
 */ 
public T07_report_organ getT07_report_organDisp(SqlMapClient sqlMap,String inner_organkey) throws SQLException{  
T07_report_organ t07_report_organ = (T07_report_organ)sqlMap.queryForObject("getT07_report_organDisp",inner_organkey);  
if(t07_report_organ==null ) t07_report_organ = new T07_report_organ(); 
return t07_report_organ;  
} 
public T07_report_organ getT07_report_organBySeq_tablename(SqlMapClient sqlMap,String seq_tablename) throws SQLException{  
	T07_report_organ t07_report_organ = (T07_report_organ)sqlMap.queryForObject("getT07_report_organBySeq_tablename",seq_tablename);  
	if(t07_report_organ==null ) t07_report_organ = new T07_report_organ(); 
	return t07_report_organ;  
	}   
/** 
 * 插入操作 
 * @param sqlMap SqlMapClient 
 * @param t07_report_organ T07_report_organ 
 * @throws SQLException   
 * @return int  
 */ 
public int insertT07_report_organ(SqlMapClient sqlMap,T07_report_organ t07_report_organ) throws SQLException{ 
int i = sqlMap.update("insertT07_report_organ",t07_report_organ);  
return i; 
} 
  
/** 
 * 修改操作 
 * @param sqlMap SqlMapClient 
 * @param t07_report_organ T07_report_organ 
 * @throws SQLException   
 * @return int  
 */ 
public int modifyT07_report_organ(SqlMapClient sqlMap,T07_report_organ t07_report_organ) throws SQLException{ 
int i = sqlMap.update("modifyT07_report_organ",t07_report_organ); 
return i; 
} 
  
/** 
 * 删除操作 
 * @param sqlMap SqlMapClient 
 * @param Inner_organkey String  
 * @throws SQLException   
 * @return int  
 */ 
public int deleteT07_report_organ(SqlMapClient sqlMap,String report_organkey) throws SQLException{ 
int i = sqlMap.update("deleteT07_report_organ",report_organkey);   
return i; 
} 

public int deleteT07_report_organ_map(SqlMapClient sqlMap,T07_report_organ t07_report_organ) throws SQLException{ 
	int i = sqlMap.update("deleteT07_report_organ_map",t07_report_organ);   
	return i; 
}
public int modifyT07_report_organ_map(SqlMapClient sqlMap,T07_report_organ t07_report_organ_map) throws SQLException{ 
	int i = sqlMap.update("modifyT07_report_organ_map",t07_report_organ_map); 
	return i; 
	} 
public int insertT07_report_organ_map(SqlMapClient sqlMap,T07_report_organ t07_report_organ_map) throws SQLException{ 
	int i = sqlMap.update("insertT07_report_organ_map",t07_report_organ_map);  
	return i; 
	} 

public T07_report_organ getT07_report_organ_mapDisp(SqlMapClient sqlMap,T07_report_organ t07_report_organ) throws SQLException{  
	T07_report_organ t07_report_organ_map = (T07_report_organ)sqlMap.queryForObject("getT07_report_organ_mapDisp",t07_report_organ);  
	if(t07_report_organ_map==null ) t07_report_organ_map = new T07_report_organ(); 
	return t07_report_organ_map;  
	} 

public int getT07_report_organ_mapListCountValue(SqlMapClient sqlMap,
		String organkey) throws SQLException {
	Integer iCount = (Integer)sqlMap.queryForObject("getT07_report_organ_mapListCountValue",organkey);
	if(iCount==null){
		return 0;
	}
	return iCount.intValue(); 
} 
}

