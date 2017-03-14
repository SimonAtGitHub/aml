/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2014-02-10] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.inves.dao; 
  
/**
* <p>T07_INREP_FRDAO.java</p>
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
import com.ist.aml.inves.dto.*; 
import com.ibatis.sqlmap.client.SqlMapClient; 
  
public class T07_INREP_FRDAO  extends BaseDAO{
  
/** 
 * 构造函数 
 */ 
public T07_INREP_FRDAO() {  
} 
/** 
 * 取得列表（可分页）  
 * @param sqlMap SqlMapClient 
 * @param t07_inrep_fr T07_INREP_FR 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public List getT07_INREP_FRList(SqlMapClient sqlMap,T07_INREP_FR t07_inrep_fr,int iStartRec,int iPageSize) throws SQLException{ 
	 List list = sqlMap.queryForList("getT07_INREP_FRSumByOrgan",t07_inrep_fr,iStartRec,iPageSize);
	 LinkedHashMap organMap = cm.getMapFromCache("organ");
     Iterator iterator=list.iterator();
     while(iterator.hasNext()){
     	T07_INREP_FR item=(T07_INREP_FR)iterator.next();
     	if(item.getOrgankey()!=null){
     		item.setOrganname((String)organMap.get(item.getOrgankey()));
     	}
     }
	 return list;
}
public int getT07_INREP_FRListCount(SqlMapClient sqlMap,T07_INREP_FR t07_inrep_fr) throws SQLException{
	Integer count=(Integer)sqlMap.queryForObject("getT07_INREP_FRSumCountByOrgan",t07_inrep_fr);
	return count.intValue();
}
public List getT07_INREP_FRSumByOrgan(SqlMapClient sqlMap,T07_INREP_FR t07_inrep_fr) throws SQLException{ 
        List list = sqlMap.queryForList("getT07_INREP_FRSumByOrgan",t07_inrep_fr); 
        List list1= sqlMap.queryForList("getT07_INREP_FRSum",t07_inrep_fr);
        LinkedHashMap organMap = cm.getMapFromCache("organ");
        Iterator iterator=list.iterator();
        while(iterator.hasNext()){
        	T07_INREP_FR item=(T07_INREP_FR)iterator.next();
        	if(item.getOrgankey()!=null){
        		item.setOrganname((String)organMap.get(item.getOrgankey()));
        	}
        }
        Iterator iterator1 = list1.iterator();
        while(iterator1.hasNext()){
        	T07_INREP_FR item=(T07_INREP_FR)iterator1.next();
        	item.setOrganname("合计");
        	list.add(item);
        }
        return list;   
} 


}

