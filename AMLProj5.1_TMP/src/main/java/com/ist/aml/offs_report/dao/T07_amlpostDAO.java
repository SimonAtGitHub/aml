/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2009-02-09] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.offs_report.dao; 
  
/**
* <p>T07_amlpostDAO.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.*; 
import java.sql.*;  

import org.apache.log4j.*;  
  
//import com.ist.common.util.*;  
import com.ist.common.*;  
import com.ist.common.base.*;  
import com.ist.common.jcs.CatchManager;
import com.ist.platform.dto.T00_user;
import com.ist.util.DateUtils;
import com.ist.aml.offs_report.dto.*; 
import com.ibatis.sqlmap.client.SqlMapClient; 
  
public class T07_amlpostDAO  extends BaseDAO{
  
/** 
 * 构造函数 
 */ 
public T07_amlpostDAO() {  
} 
/** 
 * 取得列表（可分页）  
 * @param sqlMap SqlMapClient 
 * @param t07_amlpost T07_amlpost 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public ArrayList getT07_amlpostList(SqlMapClient sqlMap,T07_amlpost t07_amlpost,int iStartRec,int iPageSize) throws SQLException{ 
        ArrayList list = (ArrayList)sqlMap.queryForList("getT07_amlpostList",t07_amlpost,iStartRec,iPageSize);        
		ArrayList t07_amlpostList = new ArrayList();
		
//		CatchManager cm = CatchManager.getInstance();	
//		TreeMap organ = cm.getCodeTable2HashCatch("organ",true);
//		t07_amlpost.setOrgankey((String)organ.get(t07_amlpost.getOrgankey()));
//		TreeMap postitle = cm.getColumnCatch("postitle", true);
//		t07_amlpost.setPostitle((String)postitle.get(t07_amlpost.getPostitle()));
//		TreeMap us_status = cm.getColumnCatch("us_status", true);
//		t07_amlpost.setUs_status((String)us_status.get(t07_amlpost.getUs_status()));
//		TreeMap organ = cm.getColumnCatch("organ",true);
		Iterator iter = list.iterator();
		while(iter.hasNext()){
			T07_amlpost amlpost = (T07_amlpost)iter.next();
			if(amlpost==null)continue;
//			if(amlpost.getPostitle()!=null){
//				amlpost.setPostitle((String)postitle.get(t07_amlpost.getPostitle()));
//			}
//			if(amlpost.getUs_status()!=null){
//				amlpost.setUs_status((String)us_status.get(t07_amlpost.getUs_status()));
//			}
			t07_amlpostList.add(amlpost);
		}
		return t07_amlpostList; 

} 
/** 
 * 取得列表（不分页）  
 * @param sqlMap SqlMapClient 
 * @param t07_amlpost T07_amlpost 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public ArrayList getT07_amlpostList(SqlMapClient sqlMap,T07_amlpost t07_amlpost) throws SQLException{ 
        ArrayList list = (ArrayList)sqlMap.queryForList("getT07_amlpostList",t07_amlpost);        
		ArrayList t07_amlpostList = new ArrayList();
		
//		CatchManager cm = CatchManager.getInstance();	
//		TreeMap organ = cm.getCodeTable2HashCatch("organ",true);
//		t07_amlpost.setOrgankey((String)organ.get(t07_amlpost.getOrgankey()));
//		TreeMap postitle = cm.getColumnCatch("postitle", true);
//		t07_amlpost.setPostitle((String)postitle.get(t07_amlpost.getPostitle()));
//		TreeMap us_status = cm.getColumnCatch("us_status", true);
//		t07_amlpost.setUs_status((String)us_status.get(t07_amlpost.getUs_status()));
//		TreeMap organ = cm.getColumnCatch("organ",true);
		Iterator iter = list.iterator();
		while(iter.hasNext()){
			T07_amlpost amlpost = (T07_amlpost)iter.next();
			if(amlpost==null)continue;
//			if(amlpost.getPostitle()!=null){
//				amlpost.setPostitle((String)postitle.get(t07_amlpost.getPostitle()));
//			}
//			if(amlpost.getUs_status()!=null){
//				amlpost.setUs_status((String)us_status.get(t07_amlpost.getUs_status()));
//			}
			t07_amlpostList.add(amlpost);
		}
		return t07_amlpostList; 
} 
/**
 * 取得记录总数
 * @param sqlMap SqlMapClient
 * @param t07_record t07_record
 * @throws SQLException
 * @return int
 */
public int getT07_amlpostListCount(SqlMapClient sqlMap,T07_amlpost t07_amlpost) throws SQLException {
    Integer iCount = (Integer) sqlMap.queryForObject("getT07_amlpostListCount",t07_amlpost);
    return iCount.intValue();
}

/** 
 * 取单条明细操作 
 * @param sqlMap SqlMapClient 
 * @param User_id String  
 * @throws SQLException   
 * @return T07_amlpost  
 */ 
public T07_amlpost getT07_amlpostDisp(SqlMapClient sqlMap,String user_id) throws SQLException{  
T07_amlpost t07_amlpost = (T07_amlpost)sqlMap.queryForObject("getT07_amlpostDisp",user_id);  
if(t07_amlpost==null ) t07_amlpost = new T07_amlpost(); 
return t07_amlpost;  
} 
  
/** 
 * 插入操作 
 * @param sqlMap SqlMapClient 
 * @param t07_amlpost T07_amlpost 
 * @throws SQLException   
 * @return int  
 */ 
public int insertT07_amlpost(SqlMapClient sqlMap,T07_amlpost t07_amlpost) throws SQLException{ 
int i = sqlMap.update("insertT07_amlpost",t07_amlpost);  
return i; 
} 
  
/** 
 * 修改操作 
 * @param sqlMap SqlMapClient 
 * @param t07_amlpost T07_amlpost 
 * @throws SQLException   
 * @return int  
 */ 
public int modifyT07_amlpost(SqlMapClient sqlMap,T07_amlpost t07_amlpost) throws SQLException{ 
int i = sqlMap.update("modifyT07_amlpost",t07_amlpost); 
return i; 
} 
  
/** 
 * 删除操作 
 * @param sqlMap SqlMapClient 
 * @param User_id String  
 * @throws SQLException   
 * @return int  
 */ 
public int deleteT07_amlpost(SqlMapClient sqlMap,String user_id) throws SQLException{ 
int i = sqlMap.update("deleteT07_amlpost",user_id);   
return i; 
} 
}

