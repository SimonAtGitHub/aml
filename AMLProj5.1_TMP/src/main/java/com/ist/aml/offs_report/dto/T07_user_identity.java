/**
 * 
 */
package com.ist.aml.offs_report.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author Administrator
 *
 */
public class T07_user_identity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7931408893125901485L;
	/**
	 * 
	 */
	/* 序号 */
	private String identitykey="";
	private ArrayList identitykeyList=new ArrayList();
	/* 统计时间 */
	private int statisticdate=0;
	private String statisticdate_disp="";
	/* 报表类型 */
	private String identitytype="";
	private String identitytype_disp="";
	/* 统计机构 */
	private String organkey="";
	private String organName="";
	/* 更新时间 */
	private Date updatetime;
	private String updatetime_disp="";
	/* 查询时间 */
	private int startdate;
	private int enddate;
	private Date startdate_str=null;
	private Date enddate_str=null;
	private String startyear="";
	private String startseason="";
	private String endyear="";
	private String endseason="";
	/* 排序 */
	private String orderby;
	private String order ="1";
	/* 查询机构 */
	private ArrayList organList=new ArrayList();
	/* 分页 */
	private String intPage="0";
	/* 数据库表 */
	private String tableName="";
	/* 报表状态 */
	private String status_cd="";
	/* 多状态报表查询 */
	private ArrayList status_arrayList = new ArrayList();
	
	/** 客户识别 T07_USER_IDENTITY */
	private String identityflag="";// 1 新客户  2 一次性交易   3 跨境汇兑  4 其他情形 
	private String cp_total="";
	private String cp_proxy="";
	private String cp_thparty="";
	private String cp_disembark="";
	private String cp_benefit="";
	private String cp_questotal="";
	private String cp_anonymous="";
	private String cp_falsecard="";
	private String cp_failurecard="";
	private String cp_otherscard="";
	private String cp_suspects="";
	private String cp_othercase="";
	private String id_total="";
	private String id_proxy="";
	private String id_thparty="";
	private String id_residents="";
	private String id_resiproxy="";
	private String id_nonresidents="";
	private String id_nonresiproxy="";
	private String id_questotal="";
	private String id_anonymous="";
	private String id_falsecard="";
	private String id_failurecard="";
	private String id_otherscard="";
	private String id_suspects="";
	private String id_othercase="";
	private String all_total="";
		
	/** 重新识别客户 T07_USER_REIDENTITY */
	private String reidentityflag="";//1 对公客户总数  2 对公客户涉及受益人的  3 对私客户总数  4 对私客户居民  5 对私客户非居民 
	private String changeinfo="";
	private String info_verified="";
	private String behavior="";
	private String beha_verified="";
	private String suspects="";
	private String suspe_verified="";
	private String suspicious="";
	private String suspi_verified="";
	private String othercase="";
	private String other_verified="";
	private String total="";
	private String total_verified="";
	private String failurecard="";
	private String updatecard="";
	
	/** 涉及可疑交易识别情况 T07_DUBIETY_IDENTITY */
	//新建业务可疑数
	private String business_alert="";
	//限额以上一次性服务可疑数
	private String service_alert="";
	//客户身份可疑数
	private String degree_alert="";
	//客户交易行为可疑数
	private String trade_alert="";
	

	
	/** 可疑报告信息统计 */
	
	private String cp_reportNum="";
	private String cp_reportAmt="";
	private String id_reportNum="";
	private String id_reportAmt="";
	private String cpl_reportNum="";//Locale
	private String cpl_reportAmt="";
	private String idl_reportNum="";
	private String idl_reportAmt="";
	private String des="";
	
	private String cp_report="";
	private String id_report="";
	private String cpl_report="";//Locale
	private String idl_report="";
	private String currflag="";
	
	private String phone="";
	private String updateUser="";
	//统计结果
	private String party_class_cd="";//客户类型 I 对私 C对公
	private String curr_cd="";//币种 1 本币 2 外币
	private String count="";//份数
	private String amt="";//金额和
	
//	private String cp_reportNum3="";//人民币重点可疑交易报告份数
//	private String cp_reportAmt3="";//人民币重点可疑交易报告金额
//	private String id_reportNum3="";//外币重点可疑交易报告份数
//	private String id_reportAmt3="";//外币重点可疑交易报告金额
//	
//	public String getCp_reportNum3() {
//		return cp_reportNum3;
//	}
//	public void setCp_reportNum3(String cpReportNum3) {
//		cp_reportNum3 = cpReportNum3;
//	}
//	public String getCp_reportAmt3() {
//		return cp_reportAmt3;
//	}
//	public void setCp_reportAmt3(String cpReportAmt3) {
//		cp_reportAmt3 = cpReportAmt3;
//	}
//	public String getId_reportNum3() {
//		return id_reportNum3;
//	}
//	public void setId_reportNum3(String idReportNum3) {
//		id_reportNum3 = idReportNum3;
//	}
//	public String getId_reportAmt3() {
//		return id_reportAmt3;
//	}
//	public void setId_reportAmt3(String idReportAmt3) {
//		id_reportAmt3 = idReportAmt3;
//	}
	public void initReport(){
		String[] strs;
		if(cp_report!=null){
			strs=cp_report.split("/");
			if(strs.length==2){
				cp_reportNum=strs[0];
				cp_reportAmt=strs[1];
			}
		}
		if(id_report!=null){
			strs=id_report.split("/");
			if(strs.length==2){
				id_reportNum=strs[0];
				id_reportAmt=strs[1];
			}
		}
		if(cpl_report!=null){
			strs=cpl_report.split("/");
			if(strs.length==2){
				cpl_reportNum=strs[0];
				cpl_reportAmt=strs[1];
			}
		}
		if(idl_report!=null){
			strs=idl_report.split("/");
			if(strs.length==2){
				idl_reportNum=strs[0];
				idl_reportAmt=strs[1];
			}
		}
	}
	public void initform(){
		if(cp_reportNum!="" && cp_reportNum!=null){
			cp_report=cp_reportNum+"/"+cp_reportAmt;
		}
		if(id_reportNum!="" && id_reportNum!=null){
			id_report=id_reportNum+"/"+id_reportAmt;
		}
		if(cpl_reportNum!="" && cpl_reportNum!=null){
			cpl_report=cpl_reportNum+"/"+cpl_reportAmt;
		}
		if(idl_reportNum!="" && idl_reportNum!=null){
			idl_report=idl_reportNum+"/"+idl_reportAmt;
		}
	}

	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCurr_cd() {
		return curr_cd;
	}
	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getCurrflag() {
		return currflag;
	}

	public void setCurrflag(String currflag) {
		this.currflag = currflag;
	}

	public String getCp_report() {
		return cp_report;
	}
	public void setCp_report(String cp_report) {
		this.cp_report = cp_report;
	}
	public String getCpl_report() {
		return cpl_report;
	}
	public void setCpl_report(String cpl_report) {
		this.cpl_report = cpl_report;
	}
	public String getId_report() {
		return id_report;
	}
	public void setId_report(String id_report) {
		this.id_report = id_report;
	}
	public String getIdl_report() {
		return idl_report;
	}
	public void setIdl_report(String idl_report) {
		this.idl_report = idl_report;
	}
	public String getCp_reportAmt() {
		return cp_reportAmt;
	}
	public void setCp_reportAmt(String cp_reportAmt) {
		if("".equals(cp_reportAmt))
			this.cp_reportAmt = "0";
		else
		this.cp_reportAmt = cp_reportAmt;
	}
	public String getCp_reportNum() {
		return cp_reportNum;
	}
	public void setCp_reportNum(String cp_reportNum) {
		if("".equals(cp_reportNum))
			this.cp_reportNum = "0";
		else
		this.cp_reportNum = cp_reportNum;
	}
	public String getCpl_reportAmt() {
		return cpl_reportAmt;
	}
	public void setCpl_reportAmt(String cpl_reportAmt) {
		if("".equals(cpl_reportAmt))
			this.cpl_reportAmt = "0";
		else
		this.cpl_reportAmt = cpl_reportAmt;
	}
	public String getCpl_reportNum() {
		return cpl_reportNum;
	}
	public void setCpl_reportNum(String cpl_reportNum) {
		if("".equals(cpl_reportNum))
			this.cpl_reportNum = "0";
		else
		this.cpl_reportNum = cpl_reportNum;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getId_reportAmt() {
		return id_reportAmt;
	}
	public void setId_reportAmt(String id_reportAmt) {
		if("".equals(id_reportAmt))
			this.id_reportAmt = "0";
		else
		this.id_reportAmt = id_reportAmt;
	}
	public String getId_reportNum() {
		return id_reportNum;
	}
	public void setId_reportNum(String id_reportNum) {
		if("".equals(id_reportNum))
			this.id_reportNum = "0";
		else
		this.id_reportNum = id_reportNum;
	}
	public String getIdl_reportAmt() {
		return idl_reportAmt;
	}
	public void setIdl_reportAmt(String idl_reportAmt) {
		if("".equals(idl_reportAmt))
			this.idl_reportAmt = "0";
		else
		this.idl_reportAmt = idl_reportAmt;
	}
	public String getIdl_reportNum() {
		return idl_reportNum;
	}
	public void setIdl_reportNum(String idl_reportNum) {
		if("".equals(idl_reportNum))
			this.idl_reportNum = "0";
		else
		this.idl_reportNum = idl_reportNum;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getIdentityflag() {
		return identityflag;
	}
	public void setIdentityflag(String identityflag) {
		this.identityflag = identityflag;
	}
	public String getReidentityflag() {
		return reidentityflag;
	}
	public void setReidentityflag(String reidentityflag) {
		this.reidentityflag = reidentityflag;
	}
	public String getIdentitykey() {
		return identitykey;
	}
	public void setIdentitykey(String identitykey) {
		this.identitykey = identitykey;
	}
	public String getIdentitytype() {
		return identitytype;
	}
	public void setIdentitytype(String identitytype) {
		this.identitytype = identitytype;
	}
	public String getIdentitytype_disp() {
		return identitytype_disp;
	}
	public void setIdentitytype_disp(String identitytype_disp) {
		this.identitytype_disp = identitytype_disp;
	}
	public ArrayList getOrganList() {
		return organList;
	}
	public void setOrganList(ArrayList organList) {
		this.organList = organList;
	}
	public String getIntPage() {
		return intPage;
	}
	public void setIntPage(String intPage) {
		this.intPage = intPage;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public int getEnddate() {
		return enddate;
	}
	public void setEnddate(int enddate) {
		this.enddate = enddate;
	}
	public String getEndseason() {
		return endseason;
	}
	public void setEndseason(String endseason) {
		this.endseason = endseason;
	}
	public String getEndyear() {
		return endyear;
	}
	public void setEndyear(String endyear) {
		this.endyear = endyear;
	}
	public int getStartdate() {
		return startdate;
	}
	public void setStartdate(int startdate) {
		this.startdate = startdate;
	}
	public String getStartseason() {
		return startseason;
	}
	public void setStartseason(String startseason) {
		this.startseason = startseason;
	}
	public String getStartyear() {
		return startyear;
	}
	public void setStartyear(String startyear) {
		this.startyear = startyear;
	}
	public int getStatisticdate() {
		return statisticdate;
	}
	public void setStatisticdate(int statisticdate) {
		this.statisticdate = statisticdate;
	}
	public String getStatisticdate_disp() {
		return statisticdate_disp;
	}
	public void setStatisticdate_disp(String statisticdate_disp) {
		this.statisticdate_disp = statisticdate_disp;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getUpdatetime_disp() {
		return updatetime_disp;
	}
	public void setUpdatetime_disp(String updatetime_disp) {
		this.updatetime_disp = updatetime_disp;
	}
	public String getAll_total() {
		return all_total;
	}
	public void setAll_total(String all_total) {
		if("".equals(all_total))
			this.all_total = "0";
		else
		this.all_total = all_total;
	}
	public String getBeha_verified() {
		return beha_verified;
	}
	public void setBeha_verified(String beha_verified) {
		if ("".equals(beha_verified))
			this.beha_verified = "0";
		else
			this.beha_verified = beha_verified;
	}
	public String getBehavior() {
		return behavior;
	}
	public void setBehavior(String behavior) {
		if ("".equals(behavior))
			this.behavior = "0";
		else
			this.behavior = behavior;
	}
	
	public String getChangeinfo() {
		return changeinfo;
	}
	public void setChangeinfo(String changeinfo) {
		if ("".equals(changeinfo))
			this.changeinfo = "0";
		else
			this.changeinfo = changeinfo;
	}
	public String getCp_anonymous() {
		return cp_anonymous;
	}
	public void setCp_anonymous(String cp_anonymous) {
		if("".equals(cp_anonymous))
			this.cp_anonymous = "0";
		else
		this.cp_anonymous = cp_anonymous;
	}
	public String getCp_benefit() {
		return cp_benefit;
	}
	public void setCp_benefit(String cp_benefit) {
		if("".equals(cp_benefit))
			this.cp_benefit = "0";
		else
		this.cp_benefit = cp_benefit;
	}
	public String getCp_disembark() {
		return cp_disembark;
	}
	public void setCp_disembark(String cp_disembark) {
		if("".equals(cp_disembark))
			this.cp_disembark = "0";
		else
		this.cp_disembark = cp_disembark;
	}
	public String getCp_failurecard() {
		return cp_failurecard;
	}
	public void setCp_failurecard(String cp_failurecard) {
		if("".equals(cp_failurecard))
			this.cp_failurecard = "0";
		else
		this.cp_failurecard = cp_failurecard;
	}
	public String getCp_falsecard() {
		return cp_falsecard;
	}
	public void setCp_falsecard(String cp_falsecard) {
		if("".equals(cp_falsecard))
			this.cp_falsecard = "0";
		else
		this.cp_falsecard = cp_falsecard;
	}
	public String getCp_othercase() {
		return cp_othercase;
	}
	public void setCp_othercase(String cp_othercase) {
		if("".equals(cp_othercase))
			this.cp_othercase = "0";
		else
		this.cp_othercase = cp_othercase;
	}
	public String getCp_otherscard() {
		return cp_otherscard;
	}
	public void setCp_otherscard(String cp_otherscard) {
		if("".equals(cp_otherscard))
			this.cp_otherscard = "0";
		else
		this.cp_otherscard = cp_otherscard;
	}
	public String getCp_proxy() {
		return cp_proxy;
	}
	public void setCp_proxy(String cp_proxy) {
		if("".equals(cp_proxy))
			this.cp_proxy = "0";
		else
		this.cp_proxy = cp_proxy;
	}
	public String getCp_questotal() {
		return cp_questotal;
	}
	public void setCp_questotal(String cp_questotal) {
		if("".equals(cp_questotal))
			this.cp_questotal = "0";
		else
		this.cp_questotal = cp_questotal;
	}
	public String getCp_suspects() {
		return cp_suspects;
	}
	public void setCp_suspects(String cp_suspects) {
		if("".equals(cp_suspects))
			this.cp_suspects = "0";
		else
		this.cp_suspects = cp_suspects;
	}
	public String getCp_thparty() {
		return cp_thparty;
	}
	public void setCp_thparty(String cp_thparty) {
		if("".equals(cp_thparty))
			this.cp_thparty = "0";
		else
		this.cp_thparty = cp_thparty;
	}
	public String getCp_total() {
		return cp_total;
	}
	public void setCp_total(String cp_total) {
		if ("".equals(cp_total))
			this.cp_total = "0";
		else
			this.cp_total = cp_total;
	}
	
	public String getFailurecard() {
		return failurecard;
	}
	public void setFailurecard(String failurecard) {
		if ("".equals(failurecard))
			this.failurecard = "0";
		else
			this.failurecard = failurecard;
	}
	public String getId_anonymous() {
		return id_anonymous;
	}
	public void setId_anonymous(String id_anonymous) {
		if ("".equals(id_anonymous))
			this.id_anonymous = "0";
		else
			this.id_anonymous = id_anonymous;
	}
	public String getId_failurecard() {
		return id_failurecard;
	}
	public void setId_failurecard(String id_failurecard) {
		if ("".equals(id_failurecard))
			this.id_failurecard = "0";
		else
			this.id_failurecard = id_failurecard;
	}
	public String getId_falsecard() {
		return id_falsecard;
	}
	public void setId_falsecard(String id_falsecard) {
		if ("".equals(id_falsecard))
			this.id_falsecard = "0";
		else
			this.id_falsecard = id_falsecard;
	}
	public String getId_nonresidents() {
		return id_nonresidents;
	}
	public void setId_nonresidents(String id_nonresidents) {
		if ("".equals(id_nonresidents))
			this.id_nonresidents = "0";
		else
			this.id_nonresidents = id_nonresidents;
	}
	public String getId_nonresiproxy() {
		return id_nonresiproxy;
	}
	public void setId_nonresiproxy(String id_nonresiproxy) {
		if ("".equals(id_nonresiproxy))
			this.id_nonresiproxy = "0";
		else
			this.id_nonresiproxy = id_nonresiproxy;
	}
	public String getId_othercase() {
		return id_othercase;
	}
	public void setId_othercase(String id_othercase) {
		if ("".equals(id_othercase))
			this.id_othercase = "0";
		else
			this.id_othercase = id_othercase;
	}
	public String getId_otherscard() {
		return id_otherscard;
	}
	public void setId_otherscard(String id_otherscard) {
		if ("".equals(id_otherscard))
			this.id_otherscard = "0";
		else
			this.id_otherscard = id_otherscard;
	}
	public String getId_proxy() {
		return id_proxy;
	}
	public void setId_proxy(String id_proxy) {
		if ("".equals(id_proxy))
			this.id_proxy = "0";
		else
			this.id_proxy = id_proxy;
	}
	public String getId_questotal() {
		return id_questotal;
	}
	public void setId_questotal(String id_questotal) {
		if ("".equals(id_questotal))
			this.id_questotal = "0";
		else
			this.id_questotal = id_questotal;
	}
	public String getId_residents() {
		return id_residents;
	}
	public void setId_residents(String id_residents) {
		if ("".equals(id_residents))
			this.id_residents = "0";
		else
			this.id_residents = id_residents;
	}
	public String getId_resiproxy() {
		return id_resiproxy;
	}
	public void setId_resiproxy(String id_resiproxy) {
		if ("".equals(id_resiproxy))
			this.id_resiproxy = "0";
		else
			this.id_resiproxy = id_resiproxy;
	}
	public String getId_suspects() {
		return id_suspects;
	}
	public void setId_suspects(String id_suspects) {
		if ("".equals(id_suspects))
			this.id_suspects = "0";
		else
			this.id_suspects = id_suspects;
	}
	public String getId_thparty() {
		return id_thparty;
	}
	public void setId_thparty(String id_thparty) {
		if ("".equals(id_thparty))
			this.id_thparty = "0";
		else
			this.id_thparty = id_thparty;
	}
	public String getId_total() {
		return id_total;
	}
	public void setId_total(String id_total) {
		if ("".equals(id_total))
			this.id_total = "0";
		else
			this.id_total = id_total;
	}
	public String getInfo_verified() {
		return info_verified;
	}
	public void setInfo_verified(String info_verified) {
		if ("".equals(info_verified))
			this.info_verified = "0";
		else
			this.info_verified = info_verified;
	}
	public String getOther_verified() {
		return other_verified;
	}
	public void setOther_verified(String other_verified) {
		if ("".equals(other_verified))
			this.other_verified = "0";
		else
			this.other_verified = other_verified;
	}
	public String getOthercase() {
		return othercase;
	}
	public void setOthercase(String othercase) {
		if ("".equals(othercase))
			this.othercase = "0";
		else
		    this.othercase = othercase;
	}
	
	public String getSuspe_verified() {
		return suspe_verified;
	}
	public void setSuspe_verified(String suspe_verified) {
		if ("".equals(suspe_verified))
			this.suspe_verified = "0";
		else
			this.suspe_verified = suspe_verified;
	}
	public String getSuspects() {
		return suspects;
	}
	public void setSuspects(String suspects) {
		if ("".equals(suspects))
			this.suspects = "0";
		else
			this.suspects = suspects;
	}
	public String getSuspi_verified() {
		return suspi_verified;
	}
	public void setSuspi_verified(String suspi_verified) {
		if ("".equals(suspi_verified))
			this.suspi_verified = "0";
		else
			this.suspi_verified = suspi_verified;
	}
	public String getSuspicious() {
		return suspicious;
	}
	public void setSuspicious(String suspicious) {
		if ("".equals(suspicious))
			this.suspicious = "0";
		else
			this.suspicious = suspicious;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		if ("".equals(total))
			this.total = "0";
		else
			this.total = total;
	}
	public String getTotal_verified() {
		return total_verified;
	}
	public void setTotal_verified(String total_verified) {
		if ("".equals(total_verified))
			this.total_verified = "0";
		else
			this.total_verified = total_verified;
	}
	
	public String getUpdatecard() {
		return updatecard;
	}
	public void setUpdatecard(String updatecard) {
		if ("".equals(updatecard))
			this.updatecard = "0";
		else
			this.updatecard = updatecard;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public ArrayList getStatus_arrayList() {
		return status_arrayList;
	}
	public void setStatus_arrayList(ArrayList status_arrayList) {
		this.status_arrayList = status_arrayList;
	}
	public ArrayList getIdentitykeyList() {
		return identitykeyList;
	}
	public void setIdentitykeyList(ArrayList identitykeyList) {
		this.identitykeyList = identitykeyList;
	}
	public Date getEnddate_str() {
		return enddate_str;
	}
	public void setEnddate_str(Date enddate_str) {
		this.enddate_str = enddate_str;
	}
	public Date getStartdate_str() {
		return startdate_str;
	}
	public void setStartdate_str(Date startdate_str) {
		this.startdate_str = startdate_str;
	}	
	
	public String getBusiness_alert() {
		return business_alert;
	}
	public void setBusiness_alert(String business_alert) {
		if ("".equals(business_alert))
			this.business_alert = "0";
		else
			this.business_alert = business_alert;
	}
	public String getDegree_alert() {
		return degree_alert;
	}
	public void setDegree_alert(String degree_alert) {
		if ("".equals(degree_alert))
			this.degree_alert = "0";
		else
			this.degree_alert = degree_alert;
	}
	public String getService_alert() {
		return service_alert;
	}
	public void setService_alert(String service_alert) {
		if ("".equals(service_alert))
			this.service_alert = "0";
		else
			this.service_alert = service_alert;
	}
	public String getTrade_alert() {
		return trade_alert;
	}
	public void setTrade_alert(String trade_alert) {
		if ("".equals(trade_alert))
			this.trade_alert = "0";
		else
			this.trade_alert = trade_alert;
	}
	
}
