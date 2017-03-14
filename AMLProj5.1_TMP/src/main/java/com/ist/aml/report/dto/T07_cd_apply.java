package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

import com.ist.common.base.BaseDTO;

public class T07_cd_apply extends BaseDTO {
		private String	apply_no    ="";
		private String  rinm        ="";
		private String  ricd        ="";
		private String  msg_type    ="";//1:大额  2：可疑
		private String msg_type_disp ="";
		private String  apply_type  ="";//申请类型： C纠错  D 删除  W 无效  X 不限
		private String apply_type_disp = "";
		private int  trans_num      =0;
		private String  status_cd   ="";//1:已申请 2：已审核  3：退回 0：无效 4：已导出 5 已生成案例
		private String status_cd1="";
		private String status_cd_disp="";
		private String  create_user ="";
		private Date  create_dt     ;
		private String create_dt_disp="";
		private String  check_user  ="";
		private Date  check_dt      ;
		private Date start_dt;
		private Date end_dt;
		private String start_dt_disp="";
		private String end_dt_disp="";
		private String organkeyStr="";
		private String reportkey="";
		/** 报告查询分历史查询1和当前查询0 */
		private String casesearchtime = "";
		/** 业务标示号 */
		private String ticd = "";
		private String curr_cd="";
		private String party_id="";
		private String create_org="";
		private String apply_noStr="";
		private String reportkeyStr="";
		
		public String getStatus_cd1() {
			return status_cd1;
		}
		public void setStatus_cd1(String statusCd1) {
			status_cd1 = statusCd1;
		}
		public String getReportkeyStr() {
			return reportkeyStr;
		}
		public void setReportkeyStr(String reportkeyStr) {
			this.reportkeyStr = reportkeyStr;
		}
		public String getApply_noStr() {
			return apply_noStr;
		}
		public void setApply_noStr(String applyNoStr) {
			apply_noStr = applyNoStr;
		}
		public String getCreate_org() {
			return create_org;
		}
		public void setCreate_org(String createOrg) {
			create_org = createOrg;
		}
		public String getCurr_cd() {
			return curr_cd;
		}
		public void setCurr_cd(String currCd) {
			curr_cd = currCd;
		}
		public String getParty_id() {
			return party_id;
		}
		public void setParty_id(String partyId) {
			party_id = partyId;
		}
		public String getOrgankeyStr() {
			return organkeyStr;
		}
		public void setOrgankeyStr(String organkeyStr) {
			this.organkeyStr = organkeyStr;
		}
		public Date getStart_dt() {
			return start_dt;
		}
		public void setStart_dt(Date startDt) {
			start_dt = startDt;
		}
		public Date getEnd_dt() {
			return end_dt;
		}
		public void setEnd_dt(Date endDt) {
			end_dt = endDt;
		}
		public String getStart_dt_disp() {
			return start_dt_disp;
		}
		public void setStart_dt_disp(String startDtDisp) {
			start_dt_disp = startDtDisp;
		}
		public String getEnd_dt_disp() {
			return end_dt_disp;
		}
		public void setEnd_dt_disp(String endDtDisp) {
			end_dt_disp = endDtDisp;
		}
		public String getCreate_dt_disp() {
			return create_dt_disp;
		}
		public void setCreate_dt_disp(String createDtDisp) {
			create_dt_disp = createDtDisp;
		}
		public String getMsg_type_disp() {
			return msg_type_disp;
		}
		public void setMsg_type_disp(String msgTypeDisp) {
			msg_type_disp = msgTypeDisp;
		}
		public String getApply_type_disp() {
			return apply_type_disp;
		}
		public void setApply_type_disp(String applyTypeDisp) {
			apply_type_disp = applyTypeDisp;
		}
		public String getStatus_cd_disp() {
			return status_cd_disp;
		}
		public void setStatus_cd_disp(String statusCdDisp) {
			status_cd_disp = statusCdDisp;
		}
		public String getApply_no() {
			return apply_no;
		}
		public void setApply_no(String applyNo) {
			apply_no = applyNo;
		}
		public String getRinm() {
			return rinm;
		}
		public void setRinm(String rinm) {
			this.rinm = rinm;
		}
		public String getRicd() {
			return ricd;
		}
		public void setRicd(String ricd) {
			this.ricd = ricd;
		}
		public String getMsg_type() {
			return msg_type;
		}
		public void setMsg_type(String msgType) {
			msg_type = msgType;
		}
		public String getApply_type() {
			return apply_type;
		}
		public void setApply_type(String applyType) {
			apply_type = applyType;
		}
		public int getTrans_num() {
			return trans_num;
		}
		public void setTrans_num(int transNum) {
			trans_num = transNum;
		}
		public String getStatus_cd() {
			return status_cd;
		}
		public void setStatus_cd(String statusCd) {
			status_cd = statusCd;
		}
		public String getCreate_user() {
			return create_user;
		}
		public void setCreate_user(String createUser) {
			create_user = createUser;
		}
		public Date getCreate_dt() {
			return create_dt;
		}
		public void setCreate_dt(Date createDt) {
			create_dt = createDt;
		}
		public String getCheck_user() {
			return check_user;
		}
		public void setCheck_user(String checkUser) {
			check_user = checkUser;
		}
		public Date getCheck_dt() {
			return check_dt;
		}
		public void setCheck_dt(Date checkDt) {
			check_dt = checkDt;
		}
		public String getReportkey() {
			return reportkey;
		}
		public void setReportkey(String reportkey) {
			this.reportkey = reportkey;
		}
		public String getCasesearchtime() {
			return casesearchtime;
		}
		public void setCasesearchtime(String casesearchtime) {
			this.casesearchtime = casesearchtime;
		}
		public String getTicd() {
			return ticd;
		}
		public void setTicd(String ticd) {
			this.ticd = ticd;
		}
		
}
