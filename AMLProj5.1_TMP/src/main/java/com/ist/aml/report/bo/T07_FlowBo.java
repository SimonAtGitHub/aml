package com.ist.aml.report.bo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;





import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_app_achieve;
import com.ist.aml.report.dto.T07_app_movefate;
import com.ist.aml.report.dto.T07_n_move;
import com.ist.aml.report.dto.T07_n_task;
import com.ist.aml.report.dto.T07_node;
import com.ist.aml.report.dto.T07_swith;
import com.ist.aml.report.dto.WorkBench;

import com.ist.common.Authorization;
import com.ist.common.base.BaseBO;


import com.ist.platform.dto.T07_WORKDATE;

import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_FlowBo extends BaseBO {

	
	
	public T07_swith getT07_swithDisp(SqlMapClient sqlMap, String oper_id,
			String flow_id) throws SQLException {
		T07_swith t07_swithsearch = new T07_swith(); 
		ArrayList list = cm.getListFromCache("getT07_swithDisp");
		for (int i = 0; i < list.size(); i++) {
			T07_swith t07_swith = (T07_swith) list.get(i);
			if (oper_id == null || "".equals(oper_id)) {
				if (t07_swith.getFlow_id().equals(flow_id)
						&& (StringUtils.null2String(t07_swith.getOper_id()) == null || ""
								.equals(StringUtils.null2String(t07_swith
										.getOper_id())))) {
					t07_swithsearch = t07_swith;
					return t07_swithsearch;
				}
			} else {
				if (t07_swith.getFlow_id().equals(flow_id)
						&& oper_id.equals(StringUtils.null2String(t07_swith
								.getOper_id()))) {
					t07_swithsearch = t07_swith;
					return t07_swithsearch;
				}
			}
		}

		if (t07_swithsearch == null)
			t07_swithsearch = new T07_swith();
		return t07_swithsearch;
	}

	

	
	/**
	 * 取得当前节点的详细信息
	 * 
	 * @param authorization
	 *            用户权限认证
	 * @param node_id
	 *            节点代码
	 * @return 节点实体
	 */

	public WorkBench getWorkBenchDisp(WorkBench workbench,SqlMapClient sqlMap) {
		String node_id = workbench.getNode_id();
		
		try {
			// --1.取得节点的基本信息
			T07_node rm_node = this.getT07_nodeDisp(sqlMap, node_id);
			// --2.取得操作id信息
			ArrayList operlist = getT07_n_moveopList(sqlMap, node_id);
			// --3.取得需完成工作信息
			ArrayList worklist = getT07_n_taskList(sqlMap, node_id);
			
			workbench.setRm_node(rm_node);
			workbench.setOperlist(operlist);
			workbench.setWorklist(worklist);
		} catch (Exception e) {
			logger.error("数据库异常！");
			e.printStackTrace();
			logger.error(e);
		}
		return workbench;
	}
	public T07_node getT07_nodeDisp(SqlMapClient sqlMap, String node_id)
	throws SQLException { 
   T07_node t07_node = new T07_node();
ArrayList nodelist = cm.getListFromCache("getT07_nodeDispAll");
for (int i = 0; i < nodelist.size(); i++) {
	T07_node t07_node1 = (T07_node) nodelist.get(i);
	if (t07_node1.getNode_id().equals(node_id)) {
		t07_node = t07_node1;
		return t07_node;
	}
}
if (t07_node == null)
	t07_node = new T07_node();
return t07_node;
}
	public ArrayList getT07_n_moveopList(SqlMapClient sqlMap, String node_id)
	throws SQLException {

ArrayList t07_n_moveList = cm.getListFromCache("getT07_n_moveopListAll");
ArrayList list = new ArrayList();
for (int i = 0; i < t07_n_moveList.size(); i++) {
	T07_n_move t07_n_move1 = (T07_n_move) t07_n_moveList.get(i);
	if (t07_n_move1.getNode_id().equals(node_id)) {
		list.add(t07_n_move1);
	}
}

return list;
}
	
	public ArrayList getT07_n_taskList(SqlMapClient sqlMap, String node_id)
	throws SQLException {

ArrayList list = new ArrayList(); 
ArrayList t07_n_taskList = cm.getListFromCache("getT07_n_taskListAll");
for (int i = 0; i < t07_n_taskList.size(); i++) {
	T07_n_task t07_n_task = (T07_n_task) t07_n_taskList.get(i);
	if (t07_n_task.getNode_id().equals(node_id)) {
		list.add(t07_n_task);
	}
}

return list;
}
	public boolean initAcceptTask(Authorization authorization,
			CreditTask credittask,SqlMapClient sqlMap) throws Exception {
		boolean isSucc = false;

		T07_app_achieve rm_app_achieve = new T07_app_achieve();

		try {
			// --1.取得需完成的工作
			ArrayList worklist = getT07_n_taskList(sqlMap,credittask.getNode_id());
			Iterator iter = worklist.iterator();
			// --2.写任务完成
			while (iter.hasNext()) {
				T07_n_task rm_n_task = (T07_n_task) iter.next();

				rm_app_achieve.setApplication_num(credittask
						.getApplication_num());// 任务编号
				rm_app_achieve.setFlow_id(credittask.getFlow_id()); // 流程代码
				rm_app_achieve.setRecheck_num(credittask.getRecheck_num()); // 复议次数
				rm_app_achieve.setSeq_num(credittask.getSeq_num()); // 流程序号
				rm_app_achieve.setNode_id(rm_n_task.getNode_id()); // 节点
				rm_app_achieve.setTask_id(rm_n_task.getTask_id());// 工作代码
				if ("1".equals(credittask.getValidate_ind())
						&& ("T010203".equals(rm_app_achieve.getTask_id()) || "T020203"
								.equals(rm_app_achieve.getTask_id())))
					rm_app_achieve.setTask_status_cd("2");
				else
					rm_app_achieve.setTask_status_cd("0");// 工作状态 未处理
				rm_app_achieve.setCreate_dt(DateUtils
						.stringToDateShort(DateUtils.getCurrTime()));
				rm_app_achieve.setLast_upd_dt(DateUtils
						.stringToDateShort(DateUtils.getCurrTime()));
				rm_app_achieve.setLast_upd_user(authorization.getT00_user()
						.getUsername());
				int num = insertT07_app_achieve(sqlMap,
						rm_app_achieve);
				if (num <= 0) {
					throw new Exception("初始化工作台工作完成记录表失败！");
				} else {
					isSucc = true;
				}
			}

			// --3.更新任务流转表中的状态
			T07_app_movefate rm_app_movefact = new T07_app_movefate();
			rm_app_movefact.setApplication_num(credittask.getApplication_num());
			rm_app_movefact.setRecheck_num(credittask.getRecheck_num());
			rm_app_movefact.setSeq_num(credittask.getSeq_num());
			rm_app_movefact.setLast_upd_dt(DateUtils
					.stringToDateShort(DateUtils.getCurrTime()));
			rm_app_movefact.setLast_upd_user(authorization.getT00_user()
					.getUsername());
			rm_app_movefact.setStatus_cd("Y");
			rm_app_movefact.setCurrent_ind(credittask.getCurrent_ind());

			int n = this.modifyT07_app_movefate(sqlMap,rm_app_movefact);
			if(n<=0) isSucc=false;
			if (!isSucc) {
				throw new Exception("更新接受任务状态失败！");
			} else {
				isSucc = true;
			}
		} catch (Exception e) {
			isSucc = false;
			e.getMessage();
			logger.debug(e.getMessage());
		}
		return isSucc;
	}
	

	
	public int modifyT07_app_movefate(SqlMapClient sqlMap,
			T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("modifyT07_app_movefate", t07_app_movefate);
		return i;
	}
	
	public int insertT07_app_achieve(SqlMapClient sqlMap,
			T07_app_achieve t07_app_achieve) throws SQLException {
		int i = sqlMap.update("insertT07_app_achieve", t07_app_achieve);
		return i;
	}
	
	public T07_n_move getRM_n_move(SqlMapClient sqlMap,
			CreditTask credittask) throws Exception {
		T07_n_move rm_n_move = new T07_n_move();
		
		try {
			rm_n_move = getT07_n_moveDisp(sqlMap, credittask
					.getNode_id(), credittask.getOper_id());

		} catch (Exception e) {
			logger.error("数据库异常！");
			e.printStackTrace();
			logger.error(e);
		}
		return rm_n_move;
	}
	
	public T07_n_move getT07_n_moveDisp(SqlMapClient sqlMap, String node_id,
			String oper_id) throws SQLException {
		T07_n_move t07_n_moves = new T07_n_move();
		t07_n_moves.setNode_id(node_id);
		t07_n_moves.setOper_id(oper_id);
		T07_n_move t07_n_move = (T07_n_move) sqlMap.queryForObject(
				"getT07_n_moveDisp", t07_n_moves);
		if (t07_n_move == null)
			t07_n_move = new T07_n_move();
		return t07_n_move;
	}
	
	public boolean updRM_appMovefact2(Authorization authorization,
			CreditTask creditTask,SqlMapClient sqlMap,T07_case_applicationDAO t07_case_applicationDAO ) throws Exception {
		boolean isSucc = false;
		T07_app_movefate t07_app_movefate = new T07_app_movefate();
	
		try {

			//当前登录用户
			String userName = authorization.getT00_user().getUsername();
			t07_app_movefate.setLast_upd_user(userName);
			t07_app_movefate.setLast_upd_dt(DateUtils.getCurrDateTime());
			t07_app_movefate.setCreate_dt(DateUtils.getCurrDateTime());
			t07_app_movefate.setCurrent_ind("0");
			t07_app_movefate.setCurr_operator(userName);
			String application_num = creditTask.getApplication_num();
			String post_id = creditTask.getPost_id();
			String node_id = creditTask.getNode_id();
			String flow_id = creditTask.getFlow_id();
			String curr_org = creditTask.getApp_org_id();
			String oper_id = creditTask.getOper_id();
			Long seq_num = this.getNex_seqNumValue(creditTask,sqlMap);
			t07_app_movefate.setApplication_num(application_num);
			t07_app_movefate.setCurr_node(node_id);
			t07_app_movefate.setCurr_post(post_id);
			t07_app_movefate.setFlow_id(flow_id);
			t07_app_movefate.setSeq_num(seq_num); // 流程序号
			t07_app_movefate.setCurr_org(curr_org); // 当前机构
			t07_app_movefate.setRecheck_num(Long.valueOf("0")); 
			t07_app_movefate.setCurr_oper_id(oper_id); 
			ArrayList t07_app_movefateList = t07_case_applicationDAO.getCase_advi(sqlMap, t07_app_movefate);
			if (t07_app_movefateList != null && t07_app_movefateList.size() > 0) {
				int rows = t07_case_applicationDAO.modifyApp_movefate(sqlMap,t07_app_movefate);
				if(rows > 0){
					isSucc = true;
				}
			} else {
				int rows = t07_case_applicationDAO.insertApp_movefate(sqlMap,t07_app_movefate);
				if(rows > 0){
					isSucc = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSucc;
	}

	public Long getNex_seqNumValue(CreditTask credittask,SqlMapClient sqlMap) {
		int num = 0;
		try {
			Integer iCount = (Integer) sqlMap.queryForObject(
					"getT07_app_moveftSeqNum", credittask);
			num=iCount.intValue();
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		}
		return Long.valueOf(Integer.toString(num));
	}
	public String getNode_id(SqlMapClient sqlMap, T07_node t07_node)
	throws SQLException {
String  node_id = (String) sqlMap.queryForObject(
		"getNode_id", t07_node);
return node_id;
}
	
	public HashMap getRM_n_taskHash(ArrayList list) {
		HashMap hash = new HashMap();
		try {
			for (int i = 0; i < list.size(); i++) {
				T07_n_task rm_n_task;
				rm_n_task = (T07_n_task) list.get(i);
				String key = rm_n_task.getTask_id();
				hash.put(key, rm_n_task);
			}

		} catch (Exception e) {
			logger.error("数据库异常！");
			e.printStackTrace();
			logger.error(e);
		}
		return hash;
	}
	
	public String getWorkDate(SqlMapClient sqlMap,Date startdate, String number, String tabletype)throws Exception {
		String beginDate = "";
		String tablename = "";
		if (tabletype != null && tabletype.equals("C")) {
			tablename = "T07_CP_WORKDATE";
		} else {
			tablename = "T07_ID_WORKDATE";
		}
		
		
			beginDate = this.getT07_WORKDATE(sqlMap, startdate,
					number, tablename);
		
		return beginDate;
	}
	
	public String getT07_WORKDATE(SqlMapClient sqlMap, Date startdate,
			String num, String tablename) throws SQLException {
		String workdate = "";
		tablename = tablename.toUpperCase();
		T07_WORKDATE t07_workdate = new T07_WORKDATE();
		t07_workdate.setDaykey(startdate);
		t07_workdate.setRow_id(num);
		t07_workdate.setTablename(tablename);
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_WORKDATE",
				t07_workdate);
		int i = 0, j = 0;
		for(int n=0;n<list.size();n++){
			T07_WORKDATE t07_workdate1=(T07_WORKDATE)list.get(n);
			String isholiday =t07_workdate1.getIsholiday();
			String date = DateUtils.dateToStringShort(t07_workdate1.getDaykey());
			j++;
			if (!isholiday.equals("1"))
				i++;
			if (i > Math.abs(Integer.parseInt(num)) - 1) {
				workdate = date; //实际的起始时间
				break;
			}	
		}
		
		return workdate;
	}
	
	
	public ArrayList t07_caseValidate(ArrayList list,String organstr)
	throws Exception {


// 1 清理案例验证中间表【大额案例】
String sql = "delete from T07_CASE_VALIDATE";
list.add(sql);

// 2 将需要验证的大额案例编号写入t07_case_validate,验证状态为0或者2【大额案例】
sql = "INSERT INTO T07_CASE_VALIDATE (APPLICATION_NUM,TRAN_COUNT,CASE_TYPE,VALIDATE_IND,VALIDATE_IND2) "
	+ "   SELECT T.APPLICATION_NUM,T.TRAN_COUNT,T.CAST_TYPE,'1','1' "
	+ "    FROM T07_CASE_APPLICATION T "
	+ "   WHERE T.CAST_TYPE = '1' "
	//+ "     AND T.APP_STATE_CD = '"+Constants.CHECK_STATE_CD+"'"
	+ "     AND T.CASE_KIND IN ('N','A') "
	+ "     AND (T.VALIDATE_IND = '0' OR T.VALIDATE_IND = '2')";
if(!organstr.equals("")){
	 sql=sql+ "AND T.APP_ORG_ID IN ("+organstr+")";
}
list.add(sql);

sql = "delete from T07_CASE_VALIDATE_TEMP";
list.add(sql);

sql = " INSERT INTO T07_CASE_VALIDATE_TEMP(APPLICATION_NUM,CASE_TYPE,VALTYPE,VALIDATE_IND)"
	 +" SELECT  distinct A.APPLICATION_NUM,'1','1',  '0' "
	+ "                                              FROM T07_CASE_TRANSACTION_DE A,T47_TRANSACTION_UC B "
	+ "                                              WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY  "
	+ "                                                AND (B.VALIDATE_IND = '0' "
	+ "                                                 OR B.VALIDATE_IND = '2' "
	+ "                                                 OR B.VALIDATE_IND IS NULL )";

	sql=sql+" and exists(select 'x' from T07_CASE_VALIDATE c where c.APPLICATION_NUM=a.APPLICATION_NUM) ";

list.add(sql);

// 3 根据交易验证状态更新validate_ind【大额案例】
sql = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT VALIDATE_IND FROM T07_CASE_VALIDATE_TEMP A"
	+ "                                              WHERE  A.APPLICATION_NUM=T.APPLICATION_NUM  AND CASE_TYPE='1' AND VALTYPE='1' )"
	+ " WHERE T.CASE_TYPE='1' AND T.TRAN_COUNT>0  AND EXISTS(SELECT 'X' FROM  T07_CASE_VALIDATE_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM AND B.CASE_TYPE='1' AND B.VALTYPE='1')";
list.add(sql);

sql = " INSERT INTO T07_CASE_VALIDATE_TEMP(APPLICATION_NUM,CASE_TYPE,VALTYPE,VALIDATE_IND)"
	 +" SELECT distinct A.APPLICATION_NUM,'1','2',  '0'"
	+ "                                              FROM T07_CASE_STCR_DE A,T47_PARTY_UC B "
	+ "                                             WHERE A.PARTY_ID=B.PARTY_ID "
	+ "                                                AND (B.VALIDATE_IND = '0' "
	+ "                                                 OR B.VALIDATE_IND = '2' "
	+ "                                                 OR B.VALIDATE_IND IS NULL )  ";

	sql=sql+" and exists(select 'x' from T07_CASE_VALIDATE c where c.APPLICATION_NUM=a.APPLICATION_NUM) ";

list.add(sql);

// 4 根据客户验证状态更新validate_ind2【大额案例】
sql = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT VALIDATE_IND FROM T07_CASE_VALIDATE_TEMP A"
	+ "                                              WHERE  A.APPLICATION_NUM=T.APPLICATION_NUM  AND CASE_TYPE='1' AND VALTYPE='2' )"
	+ " WHERE T.CASE_TYPE='1' AND EXISTS(SELECT 'X' FROM  T07_CASE_VALIDATE_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM AND B.CASE_TYPE='1' AND B.VALTYPE='2')";
list.add(sql);

// 5 根据validate_ind和validate_ind2更新t07_case_application【大额案例】
sql = "UPDATE T07_CASE_APPLICATION T SET T.VALIDATE_IND='1' "
	+ "  WHERE EXISTS (SELECT 'A' FROM T07_CASE_VALIDATE B "
	+ "                 WHERE T.APPLICATION_NUM=B.APPLICATION_NUM " 
	+"              AND B.VALIDATE_IND='1'  AND B.VALIDATE_IND2='1'" 
	+"              ) ";
list.add(sql);



// 可疑案例验证
// 1 清理案例验证中间表【可疑案例】
sql=" delete from T07_CASE_VALIDATE";
list.add(sql);



// 2 将需要验证的可疑案例编号写入t07_case_validate,验证状态为0或者2，状态为2已审批【可疑案例】
sql = "INSERT INTO T07_CASE_VALIDATE (APPLICATION_NUM,TRAN_COUNT,ACCT_COUNT,CASE_TYPE,VALIDATE_IND,VALIDATE_IND2) "
	+ "   SELECT T.APPLICATION_NUM,T.TRAN_COUNT,T.ACCT_COUNT,T.CAST_TYPE,'1','1' "
	+ "    FROM T07_CASE_APPLICATION T "
	+ "   WHERE T.CAST_TYPE = '2' "
	//+ "     AND T.APP_STATE_CD = '"+Constants.CHECK_STATE_CD+"'"
	+ "     AND T.CASE_KIND IN ('N','A') "
	+ "     AND (T.VALIDATE_IND = '0' OR T.VALIDATE_IND = '2')";
if(!organstr.equals("")){
	 sql=sql+ "AND T.APP_ORG_ID IN ("+organstr+")";
}
list.add(sql);

sql = " INSERT INTO T07_CASE_VALIDATE_TEMP(APPLICATION_NUM,CASE_TYPE,VALTYPE,VALIDATE_IND)"
	 +" SELECT  distinct A.APPLICATION_NUM,'2','1',  '0' "
	+ "                                              FROM T07_CASE_TRANSACTION_KY A,T47_TRANSACTION_UC B "
	+ "                                              WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY  "
	+ "                                                AND A.STATUS_CD!='4'" //已排除预警包含的交易
	+ "                                                AND (B.VALIDATE_IND2 = '0' "
	+ "                                                 OR B.VALIDATE_IND2 = '2' "
	+ "                                                 OR B.VALIDATE_IND2 IS NULL  ) ";

	sql=sql+" and exists(select 'x' from T07_CASE_VALIDATE c where c.APPLICATION_NUM=a.APPLICATION_NUM) ";

list.add(sql);


//7 根据交易验证状态更新validate_ind【可疑案例】
sql = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT VALIDATE_IND FROM T07_CASE_VALIDATE_TEMP A"
	+ "                                              WHERE  A.APPLICATION_NUM=T.APPLICATION_NUM  AND CASE_TYPE='2' AND VALTYPE='1'  ) "
	+ " WHERE T.CASE_TYPE = '2' AND T.TRAN_COUNT>0 AND EXISTS(SELECT 'X' FROM  T07_CASE_VALIDATE_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM AND B.CASE_TYPE='2' AND B.VALTYPE='1')";
list.add(sql);

sql = " INSERT INTO T07_CASE_VALIDATE_TEMP(APPLICATION_NUM,CASE_TYPE,VALTYPE,VALIDATE_IND)"
	 +" SELECT  distinct A.APPLICATION_NUM,'2','3',   '0' "
	+ "                                              FROM T07_CASE_STCR_KY A,T47_ACCT_UC B  "
	+ "                                              WHERE A.ACCT_NUM=B.ACCT_NUM  and a.ACCT_STATUS!='4' "
	+ "                                                AND (B.VALIDATE_IND2 = '0' "
	+ "                                                 OR B.VALIDATE_IND2 = '2' )";

	sql=sql+" and exists(select 'x' from T07_CASE_VALIDATE c where c.APPLICATION_NUM=a.APPLICATION_NUM) ";

list.add(sql);


sql = "UPDATE T07_CASE_VALIDATE T SET T.VALIDATE_IND=(SELECT VALIDATE_IND FROM T07_CASE_VALIDATE_TEMP A"
	+ "                                              WHERE  A.APPLICATION_NUM=T.APPLICATION_NUM  AND CASE_TYPE='2' AND VALTYPE='3'  ) "
	+ " WHERE T.CASE_TYPE = '2' AND T.ACCT_COUNT>0  AND T.VALIDATE_IND='1' AND EXISTS(SELECT 'X' FROM  T07_CASE_VALIDATE_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM AND B.CASE_TYPE='2' AND B.VALTYPE='3')";
list.add(sql);

sql = " INSERT INTO T07_CASE_VALIDATE_TEMP(APPLICATION_NUM,CASE_TYPE,VALTYPE,VALIDATE_IND)"
	 +" SELECT distinct A.APPLICATION_NUM,'2','2',  '0' "
	+ "                                              FROM T07_CASE_STCR_KY A,T47_PARTY_UC B"
	+ "                                              WHERE A.PARTY_ID=B.PARTY_ID   and a.PARTY_STATUS!='4' "
	+ "                                                  AND (B.VALIDATE_IND2 = '0' "
	+ "                                                   OR B.VALIDATE_IND2 = '2' "
	+ "                                                   OR B.VALIDATE_IND2 IS NULL  )  ";

	sql=sql+" and exists(select 'x' from T07_CASE_VALIDATE c where c.APPLICATION_NUM=a.APPLICATION_NUM) ";

list.add(sql);


//8 根据客户验证状态更新validate_ind2【可疑案例】
sql = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT VALIDATE_IND FROM T07_CASE_VALIDATE_TEMP A"
	+ "                                              WHERE  A.APPLICATION_NUM=T.APPLICATION_NUM  AND CASE_TYPE='2' AND VALTYPE='2'  ) "
	+ " WHERE T.CASE_TYPE = '2' AND EXISTS(SELECT 'X' FROM  T07_CASE_VALIDATE_TEMP B WHERE B.APPLICATION_NUM=T.APPLICATION_NUM AND B.CASE_TYPE='2' AND B.VALTYPE='2')";
list.add(sql);

//9 根据validate_ind和validate_ind2更新t07_case_application【可疑案例】
sql = "UPDATE T07_CASE_APPLICATION T SET T.VALIDATE_IND='1' "
	+ "  WHERE EXISTS (SELECT 'A' FROM T07_CASE_VALIDATE B "
	+ "                 WHERE T.APPLICATION_NUM=B.APPLICATION_NUM AND B.VALIDATE_IND='1'  AND B.VALIDATE_IND2='1') ";
list.add(sql);

return list;
}
	

	
}
