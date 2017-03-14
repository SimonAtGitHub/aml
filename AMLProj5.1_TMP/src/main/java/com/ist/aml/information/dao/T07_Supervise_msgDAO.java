/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2009/06/29 08:49:24 xzq Exp $
 * Created [2009-06-29] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.information.dao;

/**
 * <p>
 * T07_Supervise_msgDAO.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: xzq $
 * @version $Revision: 1.1.1.1 $ $Date: 2009/06/29 08:49:24 $
 */

import java.util.*;
import java.sql.*;

import org.apache.log4j.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.aml.information.dto.T00_NOTICE;
import com.ist.aml.information.dto.T07_Supervise_msg;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_Supervise_msgDAO extends BaseDAO {


	private static Logger logger = LogUtils.getLogger(T07_Supervise_msgDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T07_Supervise_msgDAO() {
	}

	/**
	 * 分行查询结果取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param T07_Supervise_msg
	 *            T07_Supervise_msg
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_Supervise_msgList(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_Supervise_msgList", t07_supervise_msg, iStartRec,
				iPageSize);
		ArrayList T07_Supervise_msgList = new ArrayList();
		
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap postMap = cm.getMapFromCache("subpost");
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");	
	      //客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");	
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_Supervise_msg T07_Supervise_msg = (T07_Supervise_msg) iter
					.next();
			T07_Supervise_msg.setMsg_org_name(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getOrgankey())));
			if(T07_Supervise_msg.getPost_id()!=null&& !T07_Supervise_msg.getPost_id().equals("")){
				//String postid="P010"+(Integer.parseInt(T07_Supervise_msg.getPost_id())+1);
				T07_Supervise_msg.setPost_id(StringUtils
						.null2String((String) postMap.get(T07_Supervise_msg.getPost_id())));
			}	
			String create_dt_disp="";
			if(T07_Supervise_msg.getDate_dt()!=null){
				create_dt_disp=DateUtils.dateToStringShort(T07_Supervise_msg.getDate_dt());
				T07_Supervise_msg.setCreate_dt_disp(create_dt_disp);	
			}
			if(t07_supervise_msg.getMsg_type().equals("2")){
				if(T07_Supervise_msg.getTx_dt()!=null){
					String tx_dt_disp=DateUtils.dateToStringShort(T07_Supervise_msg.getTx_dt());
				  T07_Supervise_msg.setTx_dt_disp(tx_dt_disp);
				  create_dt_disp=tx_dt_disp;
				}
				
			}
			if(T07_Supervise_msg.getValidate_dt()!=null){
				T07_Supervise_msg.setValidate_dt_disp(DateUtils.dateToStringShort(T07_Supervise_msg.getValidate_dt()));	
			}
			if(T07_Supervise_msg.getParty_class_cd()!=null)
				T07_Supervise_msg.setParty_class_cd_s(StringUtils
						.null2String((String) clienttypeMap.get(T07_Supervise_msg.getParty_class_cd())));
			if(T07_Supervise_msg.getCase_type()!=null)
			T07_Supervise_msg.setCase_type_s(StringUtils
					.null2String((String) casetypeMap.get(T07_Supervise_msg
							.getCase_type())));
			String str=T07_Supervise_msg.getOrgankey()+","+T07_Supervise_msg.getMsg_org_name()+","+create_dt_disp+
			","+StringUtils.null2String(T07_Supervise_msg.getCase_type())+" ,"+StringUtils.null2String(T07_Supervise_msg.getPost_id())+" ,"+T07_Supervise_msg.getNooper_num();
			str=str+","+StringUtils.null2String(T07_Supervise_msg.getParty_class_cd());
			T07_Supervise_msg.setMsg_content(str);
			T07_Supervise_msgList.add(T07_Supervise_msg);
		}
		return T07_Supervise_msgList;
	}

	/**
	 * 分行查询结果取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_bj_info
	 *            T07_BJ_info
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_Supervise_msgListCount(SqlMapClient sqlMap,
			T07_Supervise_msg t07_Supervise_msg) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_Supervise_msgListCount", t07_Supervise_msg);
		int count=0;
		if(iCount!=null){
			count=iCount.intValue();
		}
		return count;
	}

	/**
	 * 支行查询结果取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param T07_Supervise_msg
	 *            T07_Supervise_msg
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_Supervise_msgList_zh(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_Supervise_msgList_zh", t07_supervise_msg, iStartRec,
				iPageSize);
		ArrayList T07_Supervise_msgList = new ArrayList();
		
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		// 阅读状态
		LinkedHashMap notify_stateMap = cm.getMapFromCache("notify_state");
		// 督办类型
		LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");	
	      //客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");	
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_Supervise_msg T07_Supervise_msg = (T07_Supervise_msg) iter
					.next();
			T07_Supervise_msg.setMsg_state_disp((String) notify_stateMap
					.get(T07_Supervise_msg.getMsg_state()));
			T07_Supervise_msg.setReceipt_org(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getReceipt_org())));
			T07_Supervise_msg.setMsg_org_name(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getMsg_org())));
			T07_Supervise_msg.setMsg_type(StringUtils
					.null2String((String) msg_typeMap.get(T07_Supervise_msg
							.getMsg_type())));
			if(T07_Supervise_msg.getCase_type()!=null){
				T07_Supervise_msg.setCase_type_s((String)casetypeMap.get(T07_Supervise_msg.getCase_type()));
			}
			if(T07_Supervise_msg.getParty_class_cd()!=null){
				T07_Supervise_msg.setParty_class_cd_s((String)clienttypeMap.get(T07_Supervise_msg.getParty_class_cd()));
			}
			T07_Supervise_msgList.add(T07_Supervise_msg);
		}
		return T07_Supervise_msgList;
	}

	/**
	 * 支行查询结果取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_bj_info
	 *            T07_BJ_info
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_Supervise_msgListCount_zh(SqlMapClient sqlMap,
			T07_Supervise_msg t07_Supervise_msg) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_Supervise_msgListCount_zh", t07_Supervise_msg);
		return iCount.intValue();
	}

	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Msg_id
	 *            String
	 * @throws SQLException
	 * @return T07_Supervise_msg
	 */
	public T07_Supervise_msg getT07_Supervise_msgDisp(SqlMapClient sqlMap,
			String msg_id) throws SQLException {
		
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		// 督办类型
		LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");	
	      //客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");	
	
		T07_Supervise_msg T07_Supervise_msg = (T07_Supervise_msg) sqlMap
				.queryForObject("getT07_Supervise_msgDisp", msg_id);
		if (T07_Supervise_msg == null)
			T07_Supervise_msg = new T07_Supervise_msg();
		
		if(T07_Supervise_msg.getMsg_org()!=null)
		T07_Supervise_msg.setMsg_org(StringUtils.null2String((String) organMap
				.get(T07_Supervise_msg.getMsg_org())));
        if(T07_Supervise_msg.getMsg_type()!=null)
		T07_Supervise_msg.setMsg_type(StringUtils
				.null2String((String) msg_typeMap.get(T07_Supervise_msg
						.getMsg_type())));
        if(T07_Supervise_msg.getCase_type()!=null){
			T07_Supervise_msg.setCase_type_s((String)casetypeMap.get(T07_Supervise_msg.getCase_type()));
		}
		if(T07_Supervise_msg.getParty_class_cd()!=null){
			T07_Supervise_msg.setParty_class_cd_s((String)clienttypeMap.get(T07_Supervise_msg.getParty_class_cd()));
		}
		if(T07_Supervise_msg.getReceipt_org()!=null)
			T07_Supervise_msg.setReceipt_org(StringUtils.null2String((String) organMap
					.get(T07_Supervise_msg.getReceipt_org())));
	
		return T07_Supervise_msg;
	}

	/**
	 * 修改督办的状态
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Notify_name
	 *            String
	 * @throws SQLException
	 * @return T07_notify
	 */
	public int updateT07_Supervise_msgDisp(SqlMapClient sqlMap, String msg_id)
			throws SQLException {
		int iCount = sqlMap.update("updateT07_Supervise_msgDisp", msg_id);

		return iCount;
	}

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param T07_Supervise_msg
	 *            T07_Supervise_msg
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_Supervise_msg(SqlMapClient sqlMap,
			T07_Supervise_msg T07_Supervise_msg) throws SQLException {
		int i = sqlMap.update("insertT07_Supervise_msg", T07_Supervise_msg);
		return i;
	}

	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param T07_Supervise_msg
	 *            T07_Supervise_msg
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_Supervise_msg(SqlMapClient sqlMap,
			T07_Supervise_msg T07_Supervise_msg) throws SQLException {
		int i = sqlMap.update("modifyT07_Supervise_msg", T07_Supervise_msg);
		return i;
	}
	
	public int modifyT07_Supervise_msg1(SqlMapClient sqlMap,
			T07_Supervise_msg T07_Supervise_msg) throws SQLException {
		int i = sqlMap.update("modifyT07_Supervise_msg1", T07_Supervise_msg);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Msg_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_Supervise_msg(SqlMapClient sqlMap, String msg_id)
			throws SQLException {
		int i = sqlMap.update("deleteT07_Supervise_msg", msg_id);
		return i;
	}
	public ArrayList getT07_Supervise_msgList1(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_Supervise_msgList1", t07_supervise_msg, iStartRec,
				iPageSize);
		return list;
	}
	public HashMap getT07_Writeoper_totalList(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg1,ArrayList list)
			throws SQLException {
//		ArrayList list = (ArrayList) sqlMap.queryForList(
//				"getT07_Writeoper_totalList", organkeys);
		 
		HashMap map=new HashMap();
		for(int i=0;i<list.size();i++){
			T07_Supervise_msg t07_supervise_msg=(T07_Supervise_msg)list.get(i);
			String type=t07_supervise_msg.getMsg_type();
			String nooper_num=t07_supervise_msg.getNooper_num();
			if(nooper_num==null)nooper_num="0";
			if(!type.equals("7")&&!type.equals("8")){
				map.put(type, nooper_num);
			}else{
				String post_id=t07_supervise_msg.getPost_id();
				map.put(type+post_id, nooper_num);
			}
		}
		return map;
	}
	public ArrayList getT00_NoticeList(SqlMapClient sqlMap,
			T00_NOTICE t00_notice , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT00_NoticeList", t00_notice, iStartRec,
				iPageSize);
		return list;
	}
	public HashMap getT07_Sysdate(SqlMapClient sqlMap,
			ArrayList  list)
			throws SQLException {
		 list = (ArrayList) sqlMap.queryForList(
				"getT07_Sysdate", "");
		HashMap map=new HashMap();
		for(int i=0;i<list.size();i++){
			T07_Supervise_msg t07_supervise_msg=(T07_Supervise_msg)list.get(i);
			map.put(t07_supervise_msg.getSystem_key(), DateUtils.dateToStringShort(t07_supervise_msg.getSys_date()));
		}
		return map;
	}
	public String getT07_RiskAuditCount(SqlMapClient sqlMap,T07_Supervise_msg t07_Supervise_msg)
			throws SQLException {
		String  nooper="0";
	ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_RiskAuditCount", t07_Supervise_msg);
	for(int i=0;i<list.size();i++){
		T07_Supervise_msg t07_supervise_msg=(T07_Supervise_msg)list.get(i);
		nooper=t07_supervise_msg.getNooper_num();
	}
		return nooper;
	}
	public ArrayList getT07_Writeoper_DetailList(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg, int iStartRec, int iPageSize)
			throws SQLException {
		String sql="getT07_Writeoper_DetailList1";
//		if(t07_supervise_msg.getOrganlevel().equals("0")){
//			sql="getT07_Writeoper_DetailList2";
//		}
		ArrayList list = (ArrayList) sqlMap.queryForList(
				sql, t07_supervise_msg, iStartRec,
				iPageSize);
		ArrayList list1=new ArrayList();
		for(int i=0;i<list.size();i++){
			T07_Supervise_msg t07_supervise_msg1=(T07_Supervise_msg)list.get(i);
			t07_supervise_msg1.setCreate_dt(DateUtils.dateToStringShort(t07_supervise_msg1.getDate_dt()));
		    list1.add(t07_supervise_msg1);
		}
		return list1;
	}
	public int getT07_Writeoper_DetailListCount(SqlMapClient sqlMap,
			T07_Supervise_msg t07_Supervise_msg) throws SQLException {
		String sql="getT07_Writeoper_DetailListCount1";
		if(t07_Supervise_msg.getOrganlevel().equals("0")){
			sql="getT07_Writeoper_DetailListCount2";
		}
		Integer iCount = (Integer) sqlMap.queryForObject(
				sql, t07_Supervise_msg);
		return iCount.intValue();
	}
	
	public ArrayList getT07_Supervise_msgList_zh(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_Supervise_msgList_zh", t07_supervise_msg);
		ArrayList T07_Supervise_msgList = new ArrayList();
		
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		// 阅读状态
		LinkedHashMap notify_stateMap = cm.getMapFromCache("notify_state");
		// 督办类型
		LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");	
	      //客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");	
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_Supervise_msg T07_Supervise_msg = (T07_Supervise_msg) iter
					.next();
			T07_Supervise_msg.setMsg_state_disp((String) notify_stateMap
					.get(T07_Supervise_msg.getMsg_state()));
			T07_Supervise_msg.setReceipt_org(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getReceipt_org())));
			T07_Supervise_msg.setMsg_org_name(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getMsg_org())));
			T07_Supervise_msg.setMsg_type(StringUtils
					.null2String((String) msg_typeMap.get(T07_Supervise_msg
							.getMsg_type())));
			if(T07_Supervise_msg.getCase_type()!=null){
				T07_Supervise_msg.setCase_type_s((String)casetypeMap.get(T07_Supervise_msg.getCase_type()));
			}
			if(T07_Supervise_msg.getParty_class_cd()!=null){
				T07_Supervise_msg.setParty_class_cd_s((String)clienttypeMap.get(T07_Supervise_msg.getParty_class_cd()));
			}
			T07_Supervise_msgList.add(T07_Supervise_msg);
		}
		return T07_Supervise_msgList;
	}
	
	
	/**
	 * add by shichao 2011-8-25
	 * 增加工作督办中的导出
	 * 
	 * **/
	public ArrayList getT07_Supervise_msgList_do_zh(SqlMapClient sqlMap,
			T07_Supervise_msg t07_supervise_msg)
				throws SQLException{
		ArrayList list = (ArrayList)sqlMap.queryForList("getT07_Supervise_msgList",
				t07_supervise_msg);
		ArrayList T07_Supervise_msgList = new ArrayList();
		
		//机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		
		//数据类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		//客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		Iterator iter =list.iterator();
		while(iter.hasNext()){
			T07_Supervise_msg T07_Supervise_msg = (T07_Supervise_msg) iter
			.next();
			T07_Supervise_msg.setMsg_org_name(StringUtils
					.null2String((String) organMap.get(T07_Supervise_msg.getOrgankey())));
			String create_dt_disp="";
			if(T07_Supervise_msg.getDate_dt()!=null){
				create_dt_disp=DateUtils.dateToStringShort(T07_Supervise_msg.getDate_dt());
				T07_Supervise_msg.setCreate_dt_disp(create_dt_disp);	
			}
			if(t07_supervise_msg.getMsg_type().equals("2")){
				if(T07_Supervise_msg.getTx_dt()!=null){
					String tx_dt_disp=DateUtils.dateToStringShort(T07_Supervise_msg.getTx_dt());
				  T07_Supervise_msg.setTx_dt_disp(tx_dt_disp);
				  create_dt_disp=tx_dt_disp;
				}
				
			}
			if(T07_Supervise_msg.getValidate_dt()!=null){
				T07_Supervise_msg.setValidate_dt_disp(DateUtils.dateToStringShort(T07_Supervise_msg.getValidate_dt()));	
			}
			if(T07_Supervise_msg.getParty_class_cd()!=null)
				T07_Supervise_msg.setParty_class_cd_s(StringUtils
						.null2String((String) clienttypeMap.get(T07_Supervise_msg.getParty_class_cd())));
			if(T07_Supervise_msg.getCase_type()!=null)
			T07_Supervise_msg.setCase_type_s(StringUtils
					.null2String((String) casetypeMap.get(T07_Supervise_msg
							.getCase_type())));
			String str=T07_Supervise_msg.getOrgankey()+","+T07_Supervise_msg.getMsg_org_name()+","+create_dt_disp+
			","+StringUtils.null2String(T07_Supervise_msg.getCase_type())+" ,"+StringUtils.null2String(T07_Supervise_msg.getPost_id())+" ,"+T07_Supervise_msg.getNooper_num();
			str=str+","+StringUtils.null2String(T07_Supervise_msg.getParty_class_cd());
			T07_Supervise_msg.setMsg_content(str);
			T07_Supervise_msgList.add(T07_Supervise_msg);
		}
		return T07_Supervise_msgList;
}
	/**
	 * added by shane at 140904 for 查询未协查案例信息
	 * @param sqlMap
	 * @param organkeys
	 * @return
	 * @throws SQLException
	 * @author shane
	 */
	public int getT07_case_assistCount(SqlMapClient sqlMap, String organkeys) throws SQLException {
		Integer i = (Integer) sqlMap.queryForObject("getT07_case_assistCount",organkeys);
		if(i==null)
			return 0;
		return i.intValue();
	}
	
}
