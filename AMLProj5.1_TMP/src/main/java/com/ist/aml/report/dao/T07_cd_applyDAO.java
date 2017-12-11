package com.ist.aml.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import com.ist.aml.pbcreport.dto.T07_nbs_rbif;
import com.ist.util.DateUtils;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.pbcreport.dto.T07_nbh_tsdt;
import com.ist.aml.pbcreport.dto.T07_nbs_atif;
import com.ist.aml.pbcreport.dto.T07_nbs_ctif;
import com.ist.aml.pbcreport.dto.T07_nbs_rpdi;
import com.ist.aml.report.dto.T07_bh_tsdt_p;
import com.ist.aml.report.dto.T07_bs_report_p;
import com.ist.aml.report.dto.T07_cd_apply;
import com.ist.common.base.BaseDAO;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;

public class T07_cd_applyDAO extends BaseDAO {

	public ArrayList getT07_cd_applyList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply,
			int intPage,int pageSize)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_applyList", t07_cd_apply,intPage,pageSize);
		LinkedHashMap msg_typeMap = cm .getMapFromCache("cd_msg_type");
		LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
		LinkedHashMap status_cdMap = cm.getMapFromCache("cd_status_cd");
		for(int i=0;i<list.size();i++){
			t07_cd_apply=(T07_cd_apply) list.get(i);
			if(t07_cd_apply.getMsg_type()!=null){
				t07_cd_apply.setMsg_type_disp((String)msg_typeMap.get(t07_cd_apply.getMsg_type()));
			}
			if(t07_cd_apply.getApply_type()!=null){
				t07_cd_apply.setApply_type_disp((String)apply_typeMap.get(t07_cd_apply.getApply_type()));
			}
			if(t07_cd_apply.getStatus_cd()!=null){
				t07_cd_apply.setStatus_cd_disp((String)status_cdMap.get(t07_cd_apply.getStatus_cd()));
			}
			if(t07_cd_apply.getCreate_dt()!=null){
				t07_cd_apply.setCreate_dt_disp(DateUtils.dateToStringShort(t07_cd_apply.getCreate_dt()));
			}
		}
		return list;
	}
	
	public ArrayList getT07_cd_apply_reportList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply,
			int intPage,int pageSize)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_reportList",t07_cd_apply,intPage,pageSize);
		for(int i=0;i<list.size();i++){
			T07_nbs_rbif rbif=(T07_nbs_rbif) list.get(i);
			if(rbif.getRpdt()!=null){
				rbif.setRpdt_disp(DateUtils.dateToStringShort(rbif.getRpdt()));
			}
		}
		return list;
	}
	
	public T07_cd_apply getT07_cd_applyDisp(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		T07_cd_apply apply=new T07_cd_apply();
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_applyList", t07_cd_apply);
		if(list.size()>0){
			apply=(T07_cd_apply) list.get(0);
			LinkedHashMap msg_typeMap = cm .getMapFromCache("cd_msg_type");
			LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
			LinkedHashMap status_cdMap = cm.getMapFromCache("cd_status_cd");
			if(apply.getMsg_type()!=null){
				apply.setMsg_type_disp((String)msg_typeMap.get(apply.getMsg_type()));
			}
			if(apply.getApply_type()!=null){
				apply.setApply_type_disp((String)apply_typeMap.get(apply.getApply_type()));
			}
			if(apply.getStatus_cd()!=null){
				apply.setStatus_cd_disp((String)status_cdMap.get(apply.getStatus_cd()));
			}
			if(apply.getCreate_dt()!=null){
				apply.setCreate_dt_disp(DateUtils.dateToStringShort(apply.getCreate_dt()));
			}
		}
		return apply;
	}
	
	public ArrayList getT07_cd_apply_reportList1(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_reportList",t07_cd_apply);
		for(int i=0;i<list.size();i++){
			T07_nbs_rbif rbif=(T07_nbs_rbif) list.get(i);
			if(rbif.getRpdt()!=null){
				rbif.setRpdt_disp(DateUtils.dateToStringShort(rbif.getRpdt()));
			}
		}
		return list;
	}
	
	public ArrayList getT07_cd_apply_transList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply,
			int intPage,int pageSize)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_transList",t07_cd_apply);
		for(int i=0;i<list.size();i++){
			T07_nbh_tsdt tsdt=(T07_nbh_tsdt) list.get(i);
			if(tsdt.getTstm()!=null){
				tsdt.setTstm_disp(DateUtils.dateToStringShort(tsdt.getTstm()));
			}
		}
		return list;
	}
	
	public void insertT07_cd_apply(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.insert("insertT07_cd_apply", t07_cd_apply);
	}
	
	public void insertT07_bs_report_p(SqlMapClient sqlMap,T07_bs_report_p t07_bs_report_p)throws SQLException{
		sqlMap.insert("insertT07_bs_report_p",t07_bs_report_p);
	}
	
	public void insertT07_bh_tsdt_p(SqlMapClient sqlMap,T07_bh_tsdt_p t07_bh_tsdt_p)throws SQLException{
		sqlMap.insert("insertT07_bh_tsdt_p",t07_bh_tsdt_p);
	}
	
	public void updateT07_cd_apply(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.update("updateT07_cd_apply",t07_cd_apply);
	}
	
	public void deleteT07_cd_apply(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.delete("deleteT07_cd_apply",t07_cd_apply);
	}
	
	public void deleteT07_bs_report_p(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.delete("deleteT07_bs_report_p",t07_cd_apply);
	}
	
	public void deleteT07_bh_tsdt_p(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.delete("deleteT07_bh_tsdt_p",t07_cd_apply);
	}
	
	public void updateT07_reportStatus(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply)throws SQLException{
		sqlMap.update("updateT07_reportStatus",t07_cd_apply);
	}
	
	public ArrayList getT07_cd_apply_transListByApply_no(SqlMapClient sqlMap,String apply_no)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_transListByApply_no",apply_no);
		for(int i=0;i<list.size();i++){
			T07_nbh_tsdt tsdt=(T07_nbh_tsdt) list.get(i);
			if(tsdt.getTstm()!=null){
				tsdt.setTstm_disp(DateUtils.dateToStringShort(tsdt.getTstm()));
			}
		}
		return list;
	}
	
	public ArrayList getT07_cd_apply_transListByApply(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply) throws SQLException {
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_transListByApply",t07_cd_apply);
		return list;
	}
	
	public ArrayList getT07_cd_apply_reportListByApply_no(SqlMapClient sqlMap,String apply_no)throws SQLException{
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_cd_apply_reportListByApply_no",apply_no);
		for(int i=0;i<list.size();i++){
			T07_nbs_rbif rbif=(T07_nbs_rbif) list.get(i);
			if(rbif.getRpdt()!=null){
				rbif.setRpdt_disp(DateUtils.dateToStringShort(rbif.getRpdt()));
			}
		}
		return list;
	}

	/**获得历史或当前报告详情
	 * @author Lee
	 * @param sqlMap
	 * @param t07CdApply
	 * @return
	 * @throws SQLException
	 */
	public T07_nbs_rbif getT07_reportDetail(SqlMapClient sqlMap, T07_cd_apply t07CdApply) throws SQLException {
		LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");// 可疑程度
		LinkedHashMap organMap = cm.getMapFromCache("organ");//报送机构
		LinkedHashMap pbc_msg_typeMap = cm.getMapFromCache("pbc_msg_type_cd_n");//报文类型
		T07_nbs_rbif t07_report = (T07_nbs_rbif) sqlMap.queryForObject("getT07_reportDetail", t07CdApply);
		if (t07_report == null)
			t07_report = new T07_nbs_rbif();
		if (t07_report.getRpdt() != null)
			t07_report.setRpdt_disp(DateUtils.dateToStringShort(t07_report.getRpdt()));
		if (t07_report.getSsdg() != null)
			t07_report.setSsdg_disp((String) ssdgMap.get((t07_report.getSsdg()).trim()));
		if (t07_report.getCreate_org() != null)
			t07_report.setCreate_org_name((String) organMap.get((t07_report.getCreate_org()).trim()));
		if (t07_report.getPbc_msg_type_cd() != null)
			t07_report.setPbc_msg_type_cd((String) pbc_msg_typeMap.get((t07_report.getPbc_msg_type_cd()).trim()));
		if ("1".equals(t07_report.getValidate_ind()))
			t07_report.setValidate_ind_disp("通过");
		else
			t07_report.setValidate_ind_disp("未通过");
		
		return t07_report;
	}

	/**获得历史或当前报告客户详情
	 * @author Lee
	 * @param sqlMap
	 * @param t07_cd_apply
	 * @param startRec
	 * @param intPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_report_partyList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap pbc_cttpMap = cm.getMapFromCache("pbc_cttp");//客户类型
		
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_report_partyList", t07_cd_apply,startRec,intPageSize);
		ArrayList t07_report_partyList = new ArrayList();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_nbs_ctif temp = (T07_nbs_ctif)iter.next();
			if (temp.getCttp() != null)
				temp.setCttp_disp((String) pbc_cttpMap.get(temp.getCttp()));
			
			if ("1".equals(temp.getValidate_ind()))
				temp.setValidate_ind_disp("通过");
			else
				temp.setValidate_ind_disp("<font color=red>未通过</font>");
			
			t07_report_partyList.add(temp);
		}
		return t07_report_partyList;
	}
	
	/**获得历史或当前报告交易详情
	 * @author Lee
	 * @param sqlMap
	 * @param t07_cd_apply
	 * @param startRec
	 * @param intPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_report_transList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply, int startRec, int intPageSize) throws SQLException {
		
		MoneyUtils mUtils = new MoneyUtils();
		LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");// 币种
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_report_transList", t07_cd_apply,startRec,intPageSize);
		ArrayList t07_report_transList = new ArrayList();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_nbs_rpdi temp = (T07_nbs_rpdi)iter.next();
			if (temp.getTstm() != null)
				temp.setTstm_disp(DateUtils.dateToStringShort(temp.getTstm()));
			if(temp.getCrat() != null && temp.getCrat().doubleValue() >= 0)
				temp.setCrat_disp(mUtils.FormatMoney(temp.getCrat().doubleValue()));
			if (temp.getCrtp() != null)
				temp.setCrtp_disp((String) pbc_currencyMap.get((temp.getCrtp()).trim()));
			if ("1".equals(temp.getValidate_ind()))
				temp.setValidate_ind_disp("通过");
			else
				temp.setValidate_ind_disp("<font color=red>未通过</font>");
			
			t07_report_transList.add(temp);
		}
		return t07_report_transList;
	}
	
	/**获得历史或当前报告账户详情
	 * @author Lee
	 * @param sqlMap
	 * @param t07_cd_apply
	 * @param startRec
	 * @param intPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_report_acctList(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply, int startRec, int intPageSize) throws SQLException {
		/** 账号类型 */
		LinkedHashMap catpMap = cm.getMapFromCache("pbc_catp");
		
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_report_acctList", t07_cd_apply,startRec,intPageSize);
		ArrayList t07_report_acctList = new ArrayList();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_nbs_atif temp = (T07_nbs_atif)iter.next();
			 if(temp.getCatp()!=null&&!"".equals(temp.getCatp())&&!temp.getCatp().startsWith("@"))
				 temp.setCatp_disp((String)catpMap.get(temp.getCatp()));
			 if ("1".equals(temp.getValidate_ind()))
					temp.setValidate_ind_disp("通过");
				else
					temp.setValidate_ind_disp("<font color=red>未通过</font>");
			 
			t07_report_acctList.add(temp);
		}
		return t07_report_acctList;
	}

	/**获得申请详情
	 * @author Lee
	 * @param sqlMap
	 * @param apply_no
	 * @return
	 * @throws SQLException
	 */
	public T07_cd_apply getT07_cd_applypDetail(SqlMapClient sqlMap,String apply_no) throws SQLException {
		LinkedHashMap msg_typeMap = cm .getMapFromCache("cd_msg_type");
		LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
		LinkedHashMap status_cdMap = cm.getMapFromCache("cd_status_cd");
		T07_cd_apply temp = (T07_cd_apply) sqlMap.queryForObject("getT07_cd_applypDetail", apply_no);
		
		if (temp == null)
			temp = new T07_cd_apply();
		
		if(temp.getMsg_type()!=null){
			temp.setMsg_type_disp((String)msg_typeMap.get(temp.getMsg_type()));
		}
		if(temp.getApply_type()!=null){
			temp.setApply_type_disp((String)apply_typeMap.get(temp.getApply_type()));
		}
		if(temp.getStatus_cd()!=null){
			temp.setStatus_cd_disp((String)status_cdMap.get(temp.getStatus_cd()));
		}
		if(temp.getCreate_dt()!=null){
			temp.setCreate_dt_disp(DateUtils.dateToStringShort(temp.getCreate_dt()));
		}
		
		
		return temp;
	}
	/**获得可疑交易纠错申请报告列表
	 * @author Lee
	 * @param sqlMap
	 * @param T07_cd_apply
	 * @param startRec
	 * @param intPageSize
	 * @return 
	 * @throws SQLException
	 */
	public ArrayList getT07_bs_reportList(SqlMapClient sqlMap, T07_cd_apply t07_cd_apply, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
		
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_bs_reportList",t07_cd_apply,startRec,intPageSize);
		ArrayList t07_bs_reportList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T07_bs_report_p temp = (T07_bs_report_p)list.get(i);
			if(temp.getApply_type()!=null && !"".equals(temp.getApply_type())){
				temp.setApply_type_disp((String)apply_typeMap.get(temp.getApply_type()));
			}
			temp.setSerial(i);
			t07_bs_reportList.add(temp);
		}
		return t07_bs_reportList;
	}
	/**获得大额交易纠错或删除申请交易列表
	 * @author Lee
	 * @param sqlMap
	 * @param T07_cd_apply
	 * @param startRec
	 * @param intPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_bh_tsdtList(SqlMapClient sqlMap, T07_cd_apply t07_cd_apply, int startRec, int intPageSize) throws SQLException {
		LinkedHashMap apply_typeMap = cm .getMapFromCache("cd_apply_type");
		
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_bh_tsdtList", t07_cd_apply,startRec,intPageSize);
		ArrayList t07_bh_tsdtList = new ArrayList();
		for(int i=0;i<list.size();i++){
			T07_bh_tsdt_p temp = (T07_bh_tsdt_p)list.get(i);
			temp.setSerial(i);
			if(temp.getApply_type()!=null){
				temp.setApply_type_disp((String)apply_typeMap.get(temp.getApply_type()));
			}
			if(temp.getTx_dt()!=null){
				temp.setTx_dt_disp(DateUtils.dateToStringShort(temp.getTx_dt()));
			}
			t07_bh_tsdtList.add(temp);
		}
		return t07_bh_tsdtList;
	}

	/**纠错交易详情(未生成案例)和删除交易详情，当前或历史表
	 * @author Lee
	 * @param sqlMap
	 * @param t07NbhTsdt
	 * @return
	 * @throws SQLException
	 */
	public T07_nbh_tsdt getT07_nbh_tsdtDetail(SqlMapClient sqlMap, T07_nbh_tsdt t07NbhTsdt) throws SQLException {
		T07_nbh_tsdt t07_nbh_tsdt = (T07_nbh_tsdt) sqlMap.queryForObject("getT07_nbh_tsdtDetail", t07NbhTsdt);
		if (t07_nbh_tsdt == null)
			t07_nbh_tsdt = new T07_nbh_tsdt();
		
		return t07_nbh_tsdt;
	}

	/**查询T07_nbh_tsdt的当前表,获得计数
	 * @author Lee
	 * @param sqlMap
	 * @param t07NbhTsdt
	 * @return
	 * @throws SQLException
	 */
	public int getT07_nbh_tsdtCount(SqlMapClient sqlMap, T07_nbh_tsdt t07NbhTsdt) throws SQLException {
		Integer iCount = (Integer)sqlMap.queryForObject("getT07_nbh_tsdtCount",t07NbhTsdt);
		if(iCount==null){
			return 0;
		}
		return iCount.intValue(); 
	}

	/**查询T07_report的当前表,获得计数
	 * @author Lee
	 * @param sqlMap
	 * @param reportkey
	 * @return
	 * @throws SQLException
	 */
	public int getT07_reportCount(SqlMapClient sqlMap, String reportkey) throws SQLException {
		Integer iCount = (Integer)sqlMap.queryForObject("getT07_reportCountForApply",reportkey);
		if(iCount==null){
			return 0;
		}
		return iCount.intValue(); 
	}
	
	public ArrayList getT07_bs_reportList1(SqlMapClient sqlMap,T07_cd_apply t07_cd_apply) throws SQLException {
		ArrayList list=(ArrayList) sqlMap.queryForList("getT07_bs_reportList",t07_cd_apply);
		return list;
	}
	
}
