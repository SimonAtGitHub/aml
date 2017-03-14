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
* <p>T07_INREP_BH_sum_staDAO.java</p>
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
  
public class T07_INREP_BH_sum_staDAO  extends BaseDAO{
  
/** 
 * 构造函数 
 */ 
public T07_INREP_BH_sum_staDAO() {  
} 
/** 
 * 取得列表（可分页）  
 * @param sqlMap SqlMapClient 
 * @param t07_inrep_bh_sum_sta T07_INREP_BH_sum_sta 
 * @param iStartRec int   
 * @param iPageSize int   
 * @throws SQLException   
 * @return ArrayList 
 */ 
public List getT07_INREP_BH_sum_staList(SqlMapClient sqlMap,T07_INREP_BH_sum_sta t07_inrep_bh_sum_sta,
		int iStartRec,int iPageSize) throws SQLException{ 
        List list = sqlMap.queryForList("getT07_INREP_BH_sum_staSumByOrgan",t07_inrep_bh_sum_sta,iStartRec,iPageSize); 
        LinkedHashMap organMap = cm.getMapFromCache("organ");
        Iterator iterator=list.iterator();
        while(iterator.hasNext()){
        	T07_INREP_BH_sum_sta item=(T07_INREP_BH_sum_sta)iterator.next();
        	if(item.getOrgankey()!=null){
        		item.setOrganname((String)organMap.get(item.getOrgankey()));
        	}
        }
        return list;  
} 
 public int getT07_INREP_BH_sum_staListCount(SqlMapClient sqlMap,T07_INREP_BH_sum_sta t07_inrep_bh_sum_sta) throws SQLException{ 
	 Integer count=(Integer)sqlMap.queryForObject("getT07_INREP_BH_sum_staSumCountByOrgan", t07_inrep_bh_sum_sta);
	 return count.intValue();
 }
 public List getT07_INREP_BH_sum_staSumByOrgan(SqlMapClient sqlMap,T07_INREP_BH_sum_sta t07_inrep_bh_sum_sta
			) throws SQLException{ 
        List list = sqlMap.queryForList("getT07_INREP_BH_sum_staSumByOrgan",t07_inrep_bh_sum_sta); 
        List list1 = sqlMap.queryForList("getT07_INREP_BH_sum_staSum",t07_inrep_bh_sum_sta);
        LinkedHashMap organMap = cm.getMapFromCache("organ");
        Iterator iterator=list.iterator();
        while(iterator.hasNext()){
        	T07_INREP_BH_sum_sta item=(T07_INREP_BH_sum_sta)iterator.next();
        	if(item.getOrgankey()!=null){
        		item.setOrganname((String)organMap.get(item.getOrgankey()));
        	}
        }
        Iterator iterator1 = list1.iterator();
        while(iterator1.hasNext()){
        	T07_INREP_BH_sum_sta item=(T07_INREP_BH_sum_sta)iterator1.next();
        	item.setOrganname("合计");
        	list.add(item);
        }
        return list;  
        
} 
}

