/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2014-01-21] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.report.dao;

/**
 * <p>T07_ATTENTION_libDAO.java</p>
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

public class T07_ATTENTION_libDAO extends BaseDAO {

	/**
	 * 构造函数
	 */
	public T07_ATTENTION_libDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_attention_lib
	 *            T07_ATTENTION_lib
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public List getT07_ATTENTION_libList(SqlMapClient sqlMap,
			T07_ATTENTION_lib t07_attention_lib, int iStartRec, int iPageSize)
			throws SQLException {
		 List list = sqlMap.queryForList("getT07_ATTENTION_libList",
				t07_attention_lib, iStartRec, iPageSize);
		 ArrayList  list2=new ArrayList();
		 //客户类型
		 LinkedHashMap<String,String> party_class_cdMap = cm.getMapFromCache("clienttype");
		 //关注类型
		 LinkedHashMap<String,String> atten_typeMap =cm.getMapFromCache("atten_type");
		 //关注状态
		 LinkedHashMap<String,String> statusMap =cm.getMapFromCache("atten_status");
			
		 //关注来源
		 LinkedHashMap<String,String> atten_sourceMap =cm.getMapFromCache("atten_source");
		 //机构
		 LinkedHashMap<String,String> organMap =cm.getMapFromCache("organ");
		 
		 Iterator iter = list.iterator();
		 while(iter.hasNext()){
		 T07_ATTENTION_lib temp = (T07_ATTENTION_lib)iter.next();
		 temp.setParty_class_cd_disp(party_class_cdMap.get(temp.getParty_class_cd()));
		 temp.setAtten_type_disp(atten_typeMap.get(temp.getAtten_type()));
		 temp.setOrganname(organMap.get(temp.getOrgankey()));
		 temp.setStatus_disp(statusMap.get(temp.getStatus()));
		 temp.setAtten_source_disp(atten_sourceMap.get(temp.getAtten_source()));
		 list2.add(temp);
		 }
		return list2;
	}

	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Atten_id
	 *            String
	 * @throws SQLException
	 * @return T07_ATTENTION_lib
	 */
	public T07_ATTENTION_lib getT07_ATTENTION_libDisp(SqlMapClient sqlMap,
			T07_ATTENTION_lib attention_lib) throws SQLException {
		T07_ATTENTION_lib t07_attention_lib = (T07_ATTENTION_lib) sqlMap
				.queryForObject("getT07_ATTENTION_libDisp", attention_lib);		
		if (t07_attention_lib == null)
			t07_attention_lib = new T07_ATTENTION_lib();
		 //客户类型
		 LinkedHashMap<String,String> party_class_cdMap = cm.getMapFromCache("clienttype");
		 //关注类型
		 LinkedHashMap<String,String> atten_typeMap =cm.getMapFromCache("atten_type");
		 //关注状态
		 LinkedHashMap<String,String> statusMap =cm.getMapFromCache("atten_status");
		//机构名称
		LinkedHashMap<String,String> organMap =cm.getMapFromCache("organ");
		//证件类型
		LinkedHashMap<String,String> card_typeMap =cm.getMapFromCache("card_type");
		//关注来源
		LinkedHashMap<String,String> atten_sourceMap =cm.getMapFromCache("atten_source");
		t07_attention_lib.setOrganname(organMap.get(t07_attention_lib.getOrgankey()));
		t07_attention_lib.setParty_class_cd_disp(party_class_cdMap.get(t07_attention_lib.getParty_class_cd()));
		t07_attention_lib.setAtten_type_disp(atten_typeMap.get(t07_attention_lib.getAtten_type()));
		t07_attention_lib.setStatus_disp(statusMap.get(t07_attention_lib.getStatus()));
		t07_attention_lib.setCard_type_disp(card_typeMap.get(t07_attention_lib.getCard_type()));
		t07_attention_lib.setAtten_source_disp(atten_sourceMap.get(t07_attention_lib.getAtten_source()));
		
		return t07_attention_lib;
	}
	
	
	
	public List getT07_ATTENTION_logList(SqlMapClient sqlMap,
			String atten_id)
			throws SQLException {
		
		
		 List<T07_ATTENTION_log> list = sqlMap.queryForList("getT07_ATTENTION_logList", atten_id);
		 
		 LinkedHashMap<String, String > op_nameMap=cm.getMapFromCache("op_name");
		 Iterator<T07_ATTENTION_log> iter=list.iterator();
		 
		 while(iter.hasNext())
		 {
			 T07_ATTENTION_log temp =iter.next();
			 temp.setOp_name(op_nameMap.get(temp.getOp_type()));
			 
		 }
		 
		return list;
	}
	/**
	 * 取得操作原因
	 * @param sqlMap
	 * @param atten_id
	 * @return
	 * @throws SQLException
	 */
	public T07_ATTENTION_log getOp_reason(SqlMapClient sqlMap,
			T07_ATTENTION_log t07_attention_log) throws SQLException {
		
		ArrayList<T07_ATTENTION_log>  list =  (ArrayList<T07_ATTENTION_log>) sqlMap.queryForList("getOp_reason", t07_attention_log);	
		
		return list.get(0);
	}
	

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_attention_lib
	 *            T07_ATTENTION_lib
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_ATTENTION_lib(SqlMapClient sqlMap,
			T07_ATTENTION_lib t07_attention_lib) throws SQLException {
		int i = sqlMap.update("insertT07_ATTENTION_lib", t07_attention_lib);
		return i;
	}
	
	public int insertT07_ATTENTION_lib_from_case(SqlMapClient sqlMap,
			T07_ATTENTION_lib t07_attention_lib) throws SQLException {
		int i = sqlMap.update("insertT07_ATTENTION_lib_from_case", t07_attention_lib);
		return i;
	}
	public int 	insertT07_ATTENTION_lib_uh(SqlMapClient sqlMap,
			T07_ATTENTION_lib t07_attention_lib) throws SQLException {
		int i = sqlMap.update("insertT07_ATTENTION_lib_uh", t07_attention_lib);
		return i;
	}
	
	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_attention_lib
	 *            T07_ATTENTION_lib
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_ATTENTION_lib(SqlMapClient sqlMap,
			T07_ATTENTION_lib t07_attention_lib) throws SQLException {
		int i = sqlMap.update("modifyT07_ATTENTION_lib", t07_attention_lib);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Atten_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_ATTENTION_lib(SqlMapClient sqlMap, String atten_id)
			throws SQLException {
		int i = sqlMap.update("deleteT07_ATTENTION_lib", atten_id);
		return i;
	}
	

	/**
	 * 修改状态和岗位
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Atten_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_ATTENTION_lib_status(SqlMapClient sqlMap, T07_ATTENTION_lib T07_ATTENTION_lib)
			throws SQLException {
		int i = sqlMap.update("modifyT07_ATTENTION_lib_status", T07_ATTENTION_lib);
		return i;
	}
	
	/**
	 * 插入操作日志
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_attention_lib
	 *            T07_ATTENTION_lib
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_ATTENTION_log(SqlMapClient sqlMap,
			T07_ATTENTION_log t07_attention_log) throws SQLException {
		int i = sqlMap.update("insertT07_ATTENTION_log", t07_attention_log);
		return i;
	}
	
	
	public boolean isExistParty_id(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		boolean isExist=false;
		int i = (Integer)sqlMap.queryForObject("isExistParty_id", party_id);
		if(i>0)
		{
			isExist=true;
		}
		return isExist;
	}
	

	
	
}
