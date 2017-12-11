/**
 * 
 */
package com.ist.aml.offs_report.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

/**
 * @author Administrator
 *
 */
public class T07_user_identityActionForm extends ActionForm {
	
	/* 序号 */
	private String identitykey="";
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
	/* 排序 */
	private String orderby;
	private String order ="1";
	/* 查询时间 */
	private String startyear="";
	private String startseason="";
	private String endyear="";
	private String endseason="";
	/* 分页 */
	private String intPage="0";
	/* */
	private String[] identitykeys;
	//表头: 填报单位 年 季度
	
	private String status_cd="";
	/** 客户识别 */
	private String cp_total1="";
	private String cp_total2="";
	private String cp_total3="";
	private String cp_total4="";
	private String cp_proxy1="";
	private String cp_proxy2="";
	private String cp_proxy3="";
	private String cp_proxy4="";
	private String cp_thparty1="";
	private String cp_thparty2="";
	private String cp_thparty3="";
	private String cp_thparty4="";
	private String cp_disembark1="";
	private String cp_disembark2="";
	private String cp_disembark3="";
	private String cp_disembark4="";
	private String cp_benefit1="";
	private String cp_benefit2="";
	private String cp_benefit3="";
	private String cp_benefit4="";
	private String cp_questotal1="";
	private String cp_questotal2="";
	private String cp_questotal3="";
	private String cp_questotal4="";
	private String cp_anonymous1="";
	private String cp_anonymous2="";
	private String cp_anonymous3="";
	private String cp_anonymous4="";
	private String cp_falsecard1="";
	private String cp_falsecard2="";
	private String cp_falsecard3="";
	private String cp_falsecard4="";
	private String cp_failurecard1="";
	private String cp_failurecard2="";
	private String cp_failurecard3="";
	private String cp_failurecard4="";
	private String cp_otherscard1="";
	private String cp_otherscard2="";
	private String cp_otherscard3="";
	private String cp_otherscard4="";
	private String cp_suspects1="";
	private String cp_suspects2="";
	private String cp_suspects3="";
	private String cp_suspects4="";
	private String cp_othercase1="";
	private String cp_othercase2="";
	private String cp_othercase3="";
	private String cp_othercase4="";
	private String id_total1="";
	private String id_total2="";
	private String id_total3="";
	private String id_total4="";
	private String id_proxy1="";
	private String id_proxy2="";
	private String id_proxy3="";
	private String id_proxy4="";
	private String id_thparty1="";
	private String id_thparty2="";
	private String id_thparty3="";
	private String id_thparty4="";
	private String id_residents1="";
	private String id_residents2="";
	private String id_residents3="";
	private String id_residents4="";
	private String id_resiproxy1="";
	private String id_resiproxy2="";
	private String id_resiproxy3="";
	private String id_resiproxy4="";
	private String id_nonresidents1="";
	private String id_nonresidents2="";
	private String id_nonresidents3="";
	private String id_nonresidents4="";
	private String id_nonresiproxy1="";
	private String id_nonresiproxy2="";
	private String id_nonresiproxy3="";
	private String id_nonresiproxy4="";
	private String id_questotal1="";
	private String id_questotal2="";
	private String id_questotal3="";
	private String id_questotal4="";
	private String id_anonymous1="";
	private String id_anonymous2="";
	private String id_anonymous3="";
	private String id_anonymous4="";
	private String id_falsecard1="";
	private String id_falsecard2="";
	private String id_falsecard3="";
	private String id_falsecard4="";
	private String id_failurecard1="";
	private String id_failurecard2="";
	private String id_failurecard3="";
	private String id_failurecard4="";
	private String id_otherscard1="";
	private String id_otherscard2="";
	private String id_otherscard3="";
	private String id_otherscard4="";
	private String id_suspects1="";
	private String id_suspects2="";
	private String id_suspects3="";
	private String id_suspects4="";
	private String id_othercase1="";
	private String id_othercase2="";
	private String id_othercase3="";
	private String id_othercase4="";
	private String all_total1="";
	private String all_total2="";
	private String all_total3="";
	private String all_total4="";
		
	/** 重新识别客户 */
	private String changeinfo1="";
	private String changeinfo2="";
	private String changeinfo3="";
	private String changeinfo4="";
	private String changeinfo5="";
	private String info_verified1="";
	private String info_verified2="";
	private String info_verified3="";
	private String info_verified4="";
	private String info_verified5="";
	private String behavior1="";
	private String behavior2="";
	private String behavior3="";
	private String behavior4="";
	private String behavior5="";
	private String beha_verified1="";
	private String beha_verified2="";
	private String beha_verified3="";
	private String beha_verified4="";
	private String beha_verified5="";
	private String suspects1="";
	private String suspects2="";
	private String suspects3="";
	private String suspects4="";
	private String suspects5="";
	private String suspe_verified1="";
	private String suspe_verified2="";
	private String suspe_verified3="";
	private String suspe_verified4="";
	private String suspe_verified5="";
	private String suspicious1="";
	private String suspicious2="";
	private String suspicious3="";
	private String suspicious4="";
	private String suspicious5="";
	private String suspi_verified1="";
	private String suspi_verified2="";
	private String suspi_verified3="";
	private String suspi_verified4="";
	private String suspi_verified5="";
	private String othercase1="";
	private String othercase2="";
	private String othercase3="";
	private String othercase4="";
	private String othercase5="";
	private String other_verified1="";
	private String other_verified2="";
	private String other_verified3="";
	private String other_verified4="";
	private String other_verified5="";
	private String total1="";
	private String total2="";
	private String total3="";
	private String total4="";
	private String total5="";
	private String total_verified1="";
	private String total_verified2="";
	private String total_verified3="";
	private String total_verified4="";
	private String total_verified5="";
	private String failurecard1="";
	private String failurecard2="";
	private String failurecard3="";
	private String failurecard4="";
	private String failurecard5="";
	private String updatecard1="";
	private String updatecard2="";
	private String updatecard3="";
	private String updatecard4="";
	private String updatecard5="";
	
	/** 涉及可疑交易识别情况 */
	//新建业务可疑数
	private String business_alert="";
	//限额以上一次性服务可疑数
	private String service_alert="";
	//客户身份可疑数
	private String degree_alert="";
	//客户交易行为可疑数
	private String trade_alert="";
	
	/** 可疑报告信息统计 */
	//OLD FRAME
	private String cp_report1="";
	private String cp_report2="";
	private String id_report1="";
	private String id_report2="";
	private String cpl_report1="";//Locale
	private String cpl_report2="";
	private String idl_report1="";
	private String idl_report2="";
	private String des1="";
	private String des2="";
	//NEW FRAME
	private String cp_reportNum1="";
	private String cp_reportAmt1="";
	private String id_reportNum1="";
	private String id_reportAmt1="";
	private String cpl_reportNum1="";//Locale
	private String cpl_reportAmt1="";
	private String idl_reportNum1="";
	private String idl_reportAmt1="";
	private String cp_reportNum2="";
	private String cp_reportAmt2="";
	private String id_reportNum2="";
	private String id_reportAmt2="";
	private String cpl_reportNum2="";//Locale
	private String cpl_reportAmt2="";
	private String idl_reportNum2="";
	private String idl_reportAmt2="";
	
	//add by lixx 2010.10.27 向当地人民银行报送信息
	private String cp_reportNum3="";//人民币重点可疑交易报告份数
	private String cp_reportAmt3="";//人民币重点可疑交易报告金额
	private String id_reportNum3="";//外币重点可疑交易报告份数
	private String id_reportAmt3="";//外币重点可疑交易报告金额
	//end add
	
	private String phone="";
	private String updateUser="";
	
	
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

	public String getCp_report1() {
		return cp_report1;
	}

	public void setCp_report1(String cp_report1) {
		this.cp_report1 = cp_report1;
	}

	public String getCp_report2() {
		return cp_report2;
	}

	public void setCp_report2(String cp_report2) {
		this.cp_report2 = cp_report2;
	}

	public String getCpl_report1() {
		return cpl_report1;
	}

	public void setCpl_report1(String cpl_report1) {
		this.cpl_report1 = cpl_report1;
	}

	public String getCpl_report2() {
		return cpl_report2;
	}

	public void setCpl_report2(String cpl_report2) {
		this.cpl_report2 = cpl_report2;
	}

	public String getDes1() {
		return des1;
	}

	public void setDes1(String des1) {
		this.des1 = des1;
	}

	public String getDes2() {
		return des2;
	}

	public void setDes2(String des2) {
		this.des2 = des2;
	}

	public String getId_report1() {
		return id_report1;
	}

	public void setId_report1(String id_report1) {
		this.id_report1 = id_report1;
	}

	public String getId_report2() {
		return id_report2;
	}

	public void setId_report2(String id_report2) {
		this.id_report2 = id_report2;
	}

	public String getIdl_report1() {
		return idl_report1;
	}

	public void setIdl_report1(String idl_report1) {
		this.idl_report1 = idl_report1;
	}

	public String getIdl_report2() {
		return idl_report2;
	}

	public void setIdl_report2(String idl_report2) {
		this.idl_report2 = idl_report2;
	}

	public String getIdentitykey() {
		return identitykey;
	}

	public String[] getIdentitykeys() {
		return identitykeys;
	}

	public void setIdentitykeys(String[] identitykeys) {
		this.identitykeys = identitykeys;
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
	public String getBusiness_alert() {
		return business_alert;
	}
	public void setBusiness_alert(String business_alert) {
		this.business_alert = business_alert;
	}
	public String getDegree_alert() {
		return degree_alert;
	}
	public void setDegree_alert(String degree_alert) {
		this.degree_alert = degree_alert;
	}
	public String getService_alert() {
		return service_alert;
	}
	public void setService_alert(String service_alert) {
		this.service_alert = service_alert;
	}
	public String getTrade_alert() {
		return trade_alert;
	}
	public void setTrade_alert(String trade_alert) {
		this.trade_alert = trade_alert;
	}
	public String getAll_total1() {
		return all_total1;
	}
	public void setAll_total1(String all_total1) {
		this.all_total1 = all_total1;
	}
	public String getAll_total2() {
		return all_total2;
	}
	public void setAll_total2(String all_total2) {
		this.all_total2 = all_total2;
	}
	public String getAll_total3() {
		return all_total3;
	}
	public void setAll_total3(String all_total3) {
		this.all_total3 = all_total3;
	}
	public String getAll_total4() {
		return all_total4;
	}
	public void setAll_total4(String all_total4) {
		this.all_total4 = all_total4;
	}
	public String getBeha_verified1() {
		return beha_verified1;
	}
	public void setBeha_verified1(String beha_verified1) {
		this.beha_verified1 = beha_verified1;
	}
	public String getBeha_verified2() {
		return beha_verified2;
	}
	public void setBeha_verified2(String beha_verified2) {
		this.beha_verified2 = beha_verified2;
	}
	public String getBeha_verified3() {
		return beha_verified3;
	}
	public void setBeha_verified3(String beha_verified3) {
		this.beha_verified3 = beha_verified3;
	}
	public String getBeha_verified4() {
		return beha_verified4;
	}
	public void setBeha_verified4(String beha_verified4) {
		this.beha_verified4 = beha_verified4;
	}
	public String getBeha_verified5() {
		return beha_verified5;
	}
	public void setBeha_verified5(String beha_verified5) {
		this.beha_verified5 = beha_verified5;
	}
	public String getBehavior1() {
		return behavior1;
	}
	public void setBehavior1(String behavior1) {
		this.behavior1 = behavior1;
	}
	public String getBehavior2() {
		return behavior2;
	}
	public void setBehavior2(String behavior2) {
		this.behavior2 = behavior2;
	}
	public String getBehavior3() {
		return behavior3;
	}
	public void setBehavior3(String behavior3) {
		this.behavior3 = behavior3;
	}
	public String getBehavior4() {
		return behavior4;
	}
	public void setBehavior4(String behavior4) {
		this.behavior4 = behavior4;
	}
	public String getBehavior5() {
		return behavior5;
	}
	public void setBehavior5(String behavior5) {
		this.behavior5 = behavior5;
	}
	public String getChangeinfo1() {
		return changeinfo1;
	}
	public void setChangeinfo1(String changeinfo1) {
		this.changeinfo1 = changeinfo1;
	}
	public String getChangeinfo2() {
		return changeinfo2;
	}
	public void setChangeinfo2(String changeinfo2) {
		this.changeinfo2 = changeinfo2;
	}
	public String getChangeinfo3() {
		return changeinfo3;
	}
	public void setChangeinfo3(String changeinfo3) {
		this.changeinfo3 = changeinfo3;
	}
	public String getChangeinfo4() {
		return changeinfo4;
	}
	public void setChangeinfo4(String changeinfo4) {
		this.changeinfo4 = changeinfo4;
	}
	public String getChangeinfo5() {
		return changeinfo5;
	}
	public void setChangeinfo5(String changeinfo5) {
		this.changeinfo5 = changeinfo5;
	}
	public String getCp_anonymous1() {
		return cp_anonymous1;
	}
	public void setCp_anonymous1(String cp_anonymous1) {
		this.cp_anonymous1 = cp_anonymous1;
	}
	public String getCp_anonymous2() {
		return cp_anonymous2;
	}
	public void setCp_anonymous2(String cp_anonymous2) {
		this.cp_anonymous2 = cp_anonymous2;
	}
	public String getCp_anonymous3() {
		return cp_anonymous3;
	}
	public void setCp_anonymous3(String cp_anonymous3) {
		this.cp_anonymous3 = cp_anonymous3;
	}
	public String getCp_anonymous4() {
		return cp_anonymous4;
	}
	public void setCp_anonymous4(String cp_anonymous4) {
		this.cp_anonymous4 = cp_anonymous4;
	}
	public String getCp_benefit1() {
		return cp_benefit1;
	}
	public void setCp_benefit1(String cp_benefit1) {
		this.cp_benefit1 = cp_benefit1;
	}
	public String getCp_benefit2() {
		return cp_benefit2;
	}
	public void setCp_benefit2(String cp_benefit2) {
		this.cp_benefit2 = cp_benefit2;
	}
	public String getCp_benefit3() {
		return cp_benefit3;
	}
	public void setCp_benefit3(String cp_benefit3) {
		this.cp_benefit3 = cp_benefit3;
	}
	public String getCp_benefit4() {
		return cp_benefit4;
	}
	public void setCp_benefit4(String cp_benefit4) {
		this.cp_benefit4 = cp_benefit4;
	}
	public String getCp_disembark1() {
		return cp_disembark1;
	}
	public void setCp_disembark1(String cp_disembark1) {
		this.cp_disembark1 = cp_disembark1;
	}
	public String getCp_disembark2() {
		return cp_disembark2;
	}
	public void setCp_disembark2(String cp_disembark2) {
		this.cp_disembark2 = cp_disembark2;
	}
	public String getCp_disembark3() {
		return cp_disembark3;
	}
	public void setCp_disembark3(String cp_disembark3) {
		this.cp_disembark3 = cp_disembark3;
	}
	public String getCp_disembark4() {
		return cp_disembark4;
	}
	public void setCp_disembark4(String cp_disembark4) {
		this.cp_disembark4 = cp_disembark4;
	}
	public String getCp_failurecard1() {
		return cp_failurecard1;
	}
	public void setCp_failurecard1(String cp_failurecard1) {
		this.cp_failurecard1 = cp_failurecard1;
	}
	public String getCp_failurecard2() {
		return cp_failurecard2;
	}
	public void setCp_failurecard2(String cp_failurecard2) {
		this.cp_failurecard2 = cp_failurecard2;
	}
	public String getCp_failurecard3() {
		return cp_failurecard3;
	}
	public void setCp_failurecard3(String cp_failurecard3) {
		this.cp_failurecard3 = cp_failurecard3;
	}
	public String getCp_failurecard4() {
		return cp_failurecard4;
	}
	public void setCp_failurecard4(String cp_failurecard4) {
		this.cp_failurecard4 = cp_failurecard4;
	}
	public String getCp_falsecard1() {
		return cp_falsecard1;
	}
	public void setCp_falsecard1(String cp_falsecard1) {
		this.cp_falsecard1 = cp_falsecard1;
	}
	public String getCp_falsecard2() {
		return cp_falsecard2;
	}
	public void setCp_falsecard2(String cp_falsecard2) {
		this.cp_falsecard2 = cp_falsecard2;
	}
	public String getCp_falsecard3() {
		return cp_falsecard3;
	}
	public void setCp_falsecard3(String cp_falsecard3) {
		this.cp_falsecard3 = cp_falsecard3;
	}
	public String getCp_falsecard4() {
		return cp_falsecard4;
	}
	public void setCp_falsecard4(String cp_falsecard4) {
		this.cp_falsecard4 = cp_falsecard4;
	}
	public String getCp_othercase1() {
		return cp_othercase1;
	}
	public void setCp_othercase1(String cp_othercase1) {
		this.cp_othercase1 = cp_othercase1;
	}
	public String getCp_othercase2() {
		return cp_othercase2;
	}
	public void setCp_othercase2(String cp_othercase2) {
		this.cp_othercase2 = cp_othercase2;
	}
	public String getCp_othercase3() {
		return cp_othercase3;
	}
	public void setCp_othercase3(String cp_othercase3) {
		this.cp_othercase3 = cp_othercase3;
	}
	public String getCp_othercase4() {
		return cp_othercase4;
	}
	public void setCp_othercase4(String cp_othercase4) {
		this.cp_othercase4 = cp_othercase4;
	}
	public String getCp_otherscard1() {
		return cp_otherscard1;
	}
	public void setCp_otherscard1(String cp_otherscard1) {
		this.cp_otherscard1 = cp_otherscard1;
	}
	public String getCp_otherscard2() {
		return cp_otherscard2;
	}
	public void setCp_otherscard2(String cp_otherscard2) {
		this.cp_otherscard2 = cp_otherscard2;
	}
	public String getCp_otherscard3() {
		return cp_otherscard3;
	}
	public void setCp_otherscard3(String cp_otherscard3) {
		this.cp_otherscard3 = cp_otherscard3;
	}
	public String getCp_otherscard4() {
		return cp_otherscard4;
	}
	public void setCp_otherscard4(String cp_otherscard4) {
		this.cp_otherscard4 = cp_otherscard4;
	}
	public String getCp_proxy1() {
		return cp_proxy1;
	}
	public void setCp_proxy1(String cp_proxy1) {
		this.cp_proxy1 = cp_proxy1;
	}
	public String getCp_proxy2() {
		return cp_proxy2;
	}
	public void setCp_proxy2(String cp_proxy2) {
		this.cp_proxy2 = cp_proxy2;
	}
	public String getCp_proxy3() {
		return cp_proxy3;
	}
	public void setCp_proxy3(String cp_proxy3) {
		this.cp_proxy3 = cp_proxy3;
	}
	public String getCp_proxy4() {
		return cp_proxy4;
	}
	public void setCp_proxy4(String cp_proxy4) {
		this.cp_proxy4 = cp_proxy4;
	}
	public String getCp_questotal1() {
		return cp_questotal1;
	}
	public void setCp_questotal1(String cp_questotal1) {
		this.cp_questotal1 = cp_questotal1;
	}
	public String getCp_questotal2() {
		return cp_questotal2;
	}
	public void setCp_questotal2(String cp_questotal2) {
		this.cp_questotal2 = cp_questotal2;
	}
	public String getCp_questotal3() {
		return cp_questotal3;
	}
	public void setCp_questotal3(String cp_questotal3) {
		this.cp_questotal3 = cp_questotal3;
	}
	public String getCp_questotal4() {
		return cp_questotal4;
	}
	public void setCp_questotal4(String cp_questotal4) {
		this.cp_questotal4 = cp_questotal4;
	}
	public String getCp_suspects1() {
		return cp_suspects1;
	}
	public void setCp_suspects1(String cp_suspects1) {
		this.cp_suspects1 = cp_suspects1;
	}
	public String getCp_suspects2() {
		return cp_suspects2;
	}
	public void setCp_suspects2(String cp_suspects2) {
		this.cp_suspects2 = cp_suspects2;
	}
	public String getCp_suspects3() {
		return cp_suspects3;
	}
	public void setCp_suspects3(String cp_suspects3) {
		this.cp_suspects3 = cp_suspects3;
	}
	public String getCp_suspects4() {
		return cp_suspects4;
	}
	public void setCp_suspects4(String cp_suspects4) {
		this.cp_suspects4 = cp_suspects4;
	}
	public String getCp_thparty1() {
		return cp_thparty1;
	}
	public void setCp_thparty1(String cp_thparty1) {
		this.cp_thparty1 = cp_thparty1;
	}
	public String getCp_thparty2() {
		return cp_thparty2;
	}
	public void setCp_thparty2(String cp_thparty2) {
		this.cp_thparty2 = cp_thparty2;
	}
	public String getCp_thparty3() {
		return cp_thparty3;
	}
	public void setCp_thparty3(String cp_thparty3) {
		this.cp_thparty3 = cp_thparty3;
	}
	public String getCp_thparty4() {
		return cp_thparty4;
	}
	public void setCp_thparty4(String cp_thparty4) {
		this.cp_thparty4 = cp_thparty4;
	}
	public String getCp_total1() {
		return cp_total1;
	}
	public void setCp_total1(String cp_total1) {
		this.cp_total1 = cp_total1;
	}
	public String getCp_total2() {
		return cp_total2;
	}
	public void setCp_total2(String cp_total2) {
		this.cp_total2 = cp_total2;
	}
	public String getCp_total3() {
		return cp_total3;
	}
	public void setCp_total3(String cp_total3) {
		this.cp_total3 = cp_total3;
	}
	public String getCp_total4() {
		return cp_total4;
	}
	public void setCp_total4(String cp_total4) {
		this.cp_total4 = cp_total4;
	}
	public String getFailurecard1() {
		return failurecard1;
	}
	public void setFailurecard1(String failurecard1) {
		this.failurecard1 = failurecard1;
	}
	public String getFailurecard2() {
		return failurecard2;
	}
	public void setFailurecard2(String failurecard2) {
		this.failurecard2 = failurecard2;
	}
	public String getFailurecard3() {
		return failurecard3;
	}
	public void setFailurecard3(String failurecard3) {
		this.failurecard3 = failurecard3;
	}
	public String getFailurecard4() {
		return failurecard4;
	}
	public void setFailurecard4(String failurecard4) {
		this.failurecard4 = failurecard4;
	}
	public String getFailurecard5() {
		return failurecard5;
	}
	public void setFailurecard5(String failurecard5) {
		this.failurecard5 = failurecard5;
	}
	public String getId_anonymous1() {
		return id_anonymous1;
	}
	public void setId_anonymous1(String id_anonymous1) {
		this.id_anonymous1 = id_anonymous1;
	}
	public String getId_anonymous2() {
		return id_anonymous2;
	}
	public void setId_anonymous2(String id_anonymous2) {
		this.id_anonymous2 = id_anonymous2;
	}
	public String getId_anonymous3() {
		return id_anonymous3;
	}
	public void setId_anonymous3(String id_anonymous3) {
		this.id_anonymous3 = id_anonymous3;
	}
	public String getId_anonymous4() {
		return id_anonymous4;
	}
	public void setId_anonymous4(String id_anonymous4) {
		this.id_anonymous4 = id_anonymous4;
	}
	public String getId_failurecard1() {
		return id_failurecard1;
	}
	public void setId_failurecard1(String id_failurecard1) {
		this.id_failurecard1 = id_failurecard1;
	}
	public String getId_failurecard2() {
		return id_failurecard2;
	}
	public void setId_failurecard2(String id_failurecard2) {
		this.id_failurecard2 = id_failurecard2;
	}
	public String getId_failurecard3() {
		return id_failurecard3;
	}
	public void setId_failurecard3(String id_failurecard3) {
		this.id_failurecard3 = id_failurecard3;
	}
	public String getId_failurecard4() {
		return id_failurecard4;
	}
	public void setId_failurecard4(String id_failurecard4) {
		this.id_failurecard4 = id_failurecard4;
	}
	public String getId_falsecard1() {
		return id_falsecard1;
	}
	public void setId_falsecard1(String id_falsecard1) {
		this.id_falsecard1 = id_falsecard1;
	}
	public String getId_falsecard2() {
		return id_falsecard2;
	}
	public void setId_falsecard2(String id_falsecard2) {
		this.id_falsecard2 = id_falsecard2;
	}
	public String getId_falsecard3() {
		return id_falsecard3;
	}
	public void setId_falsecard3(String id_falsecard3) {
		this.id_falsecard3 = id_falsecard3;
	}
	public String getId_falsecard4() {
		return id_falsecard4;
	}
	public void setId_falsecard4(String id_falsecard4) {
		this.id_falsecard4 = id_falsecard4;
	}
	public String getId_nonresidents1() {
		return id_nonresidents1;
	}
	public void setId_nonresidents1(String id_nonresidents1) {
		this.id_nonresidents1 = id_nonresidents1;
	}
	public String getId_nonresidents2() {
		return id_nonresidents2;
	}
	public void setId_nonresidents2(String id_nonresidents2) {
		this.id_nonresidents2 = id_nonresidents2;
	}
	public String getId_nonresidents3() {
		return id_nonresidents3;
	}
	public void setId_nonresidents3(String id_nonresidents3) {
		this.id_nonresidents3 = id_nonresidents3;
	}
	public String getId_nonresidents4() {
		return id_nonresidents4;
	}
	public void setId_nonresidents4(String id_nonresidents4) {
		this.id_nonresidents4 = id_nonresidents4;
	}
	public String getId_nonresiproxy1() {
		return id_nonresiproxy1;
	}
	public void setId_nonresiproxy1(String id_nonresiproxy1) {
		this.id_nonresiproxy1 = id_nonresiproxy1;
	}
	public String getId_nonresiproxy2() {
		return id_nonresiproxy2;
	}
	public void setId_nonresiproxy2(String id_nonresiproxy2) {
		this.id_nonresiproxy2 = id_nonresiproxy2;
	}
	public String getId_nonresiproxy3() {
		return id_nonresiproxy3;
	}
	public void setId_nonresiproxy3(String id_nonresiproxy3) {
		this.id_nonresiproxy3 = id_nonresiproxy3;
	}
	public String getId_nonresiproxy4() {
		return id_nonresiproxy4;
	}
	public void setId_nonresiproxy4(String id_nonresiproxy4) {
		this.id_nonresiproxy4 = id_nonresiproxy4;
	}
	public String getId_othercase1() {
		return id_othercase1;
	}
	public void setId_othercase1(String id_othercase1) {
		this.id_othercase1 = id_othercase1;
	}
	public String getId_othercase2() {
		return id_othercase2;
	}
	public void setId_othercase2(String id_othercase2) {
		this.id_othercase2 = id_othercase2;
	}
	public String getId_othercase3() {
		return id_othercase3;
	}
	public void setId_othercase3(String id_othercase3) {
		this.id_othercase3 = id_othercase3;
	}
	public String getId_othercase4() {
		return id_othercase4;
	}
	public void setId_othercase4(String id_othercase4) {
		this.id_othercase4 = id_othercase4;
	}
	public String getId_otherscard1() {
		return id_otherscard1;
	}
	public void setId_otherscard1(String id_otherscard1) {
		this.id_otherscard1 = id_otherscard1;
	}
	public String getId_otherscard2() {
		return id_otherscard2;
	}
	public void setId_otherscard2(String id_otherscard2) {
		this.id_otherscard2 = id_otherscard2;
	}
	public String getId_otherscard3() {
		return id_otherscard3;
	}
	public void setId_otherscard3(String id_otherscard3) {
		this.id_otherscard3 = id_otherscard3;
	}
	public String getId_otherscard4() {
		return id_otherscard4;
	}
	public void setId_otherscard4(String id_otherscard4) {
		this.id_otherscard4 = id_otherscard4;
	}
	public String getId_proxy1() {
		return id_proxy1;
	}
	public void setId_proxy1(String id_proxy1) {
		this.id_proxy1 = id_proxy1;
	}
	public String getId_proxy2() {
		return id_proxy2;
	}
	public void setId_proxy2(String id_proxy2) {
		this.id_proxy2 = id_proxy2;
	}
	public String getId_proxy3() {
		return id_proxy3;
	}
	public void setId_proxy3(String id_proxy3) {
		this.id_proxy3 = id_proxy3;
	}
	public String getId_proxy4() {
		return id_proxy4;
	}
	public void setId_proxy4(String id_proxy4) {
		this.id_proxy4 = id_proxy4;
	}
	public String getId_questotal1() {
		return id_questotal1;
	}
	public void setId_questotal1(String id_questotal1) {
		this.id_questotal1 = id_questotal1;
	}
	public String getId_questotal2() {
		return id_questotal2;
	}
	public void setId_questotal2(String id_questotal2) {
		this.id_questotal2 = id_questotal2;
	}
	public String getId_questotal3() {
		return id_questotal3;
	}
	public void setId_questotal3(String id_questotal3) {
		this.id_questotal3 = id_questotal3;
	}
	public String getId_questotal4() {
		return id_questotal4;
	}
	public void setId_questotal4(String id_questotal4) {
		this.id_questotal4 = id_questotal4;
	}
	public String getId_residents1() {
		return id_residents1;
	}
	public void setId_residents1(String id_residents1) {
		this.id_residents1 = id_residents1;
	}
	public String getId_residents2() {
		return id_residents2;
	}
	public void setId_residents2(String id_residents2) {
		this.id_residents2 = id_residents2;
	}
	public String getId_residents3() {
		return id_residents3;
	}
	public void setId_residents3(String id_residents3) {
		this.id_residents3 = id_residents3;
	}
	public String getId_residents4() {
		return id_residents4;
	}
	public void setId_residents4(String id_residents4) {
		this.id_residents4 = id_residents4;
	}
	public String getId_resiproxy1() {
		return id_resiproxy1;
	}
	public void setId_resiproxy1(String id_resiproxy1) {
		this.id_resiproxy1 = id_resiproxy1;
	}
	public String getId_resiproxy2() {
		return id_resiproxy2;
	}
	public void setId_resiproxy2(String id_resiproxy2) {
		this.id_resiproxy2 = id_resiproxy2;
	}
	public String getId_resiproxy3() {
		return id_resiproxy3;
	}
	public void setId_resiproxy3(String id_resiproxy3) {
		this.id_resiproxy3 = id_resiproxy3;
	}
	public String getId_resiproxy4() {
		return id_resiproxy4;
	}
	public void setId_resiproxy4(String id_resiproxy4) {
		this.id_resiproxy4 = id_resiproxy4;
	}
	public String getId_suspects1() {
		return id_suspects1;
	}
	public void setId_suspects1(String id_suspects1) {
		this.id_suspects1 = id_suspects1;
	}
	public String getId_suspects2() {
		return id_suspects2;
	}
	public void setId_suspects2(String id_suspects2) {
		this.id_suspects2 = id_suspects2;
	}
	public String getId_suspects3() {
		return id_suspects3;
	}
	public void setId_suspects3(String id_suspects3) {
		this.id_suspects3 = id_suspects3;
	}
	public String getId_suspects4() {
		return id_suspects4;
	}
	public void setId_suspects4(String id_suspects4) {
		this.id_suspects4 = id_suspects4;
	}
	public String getId_thparty1() {
		return id_thparty1;
	}
	public void setId_thparty1(String id_thparty1) {
		this.id_thparty1 = id_thparty1;
	}
	public String getId_thparty2() {
		return id_thparty2;
	}
	public void setId_thparty2(String id_thparty2) {
		this.id_thparty2 = id_thparty2;
	}
	public String getId_thparty3() {
		return id_thparty3;
	}
	public void setId_thparty3(String id_thparty3) {
		this.id_thparty3 = id_thparty3;
	}
	public String getId_thparty4() {
		return id_thparty4;
	}
	public void setId_thparty4(String id_thparty4) {
		this.id_thparty4 = id_thparty4;
	}
	public String getId_total1() {
		return id_total1;
	}
	public void setId_total1(String id_total1) {
		this.id_total1 = id_total1;
	}
	public String getId_total2() {
		return id_total2;
	}
	public void setId_total2(String id_total2) {
		this.id_total2 = id_total2;
	}
	public String getId_total3() {
		return id_total3;
	}
	public void setId_total3(String id_total3) {
		this.id_total3 = id_total3;
	}
	public String getId_total4() {
		return id_total4;
	}
	public void setId_total4(String id_total4) {
		this.id_total4 = id_total4;
	}
	public String getInfo_verified1() {
		return info_verified1;
	}
	public void setInfo_verified1(String info_verified1) {
		this.info_verified1 = info_verified1;
	}
	public String getInfo_verified2() {
		return info_verified2;
	}
	public void setInfo_verified2(String info_verified2) {
		this.info_verified2 = info_verified2;
	}
	public String getInfo_verified3() {
		return info_verified3;
	}
	public void setInfo_verified3(String info_verified3) {
		this.info_verified3 = info_verified3;
	}
	public String getInfo_verified4() {
		return info_verified4;
	}
	public void setInfo_verified4(String info_verified4) {
		this.info_verified4 = info_verified4;
	}
	public String getInfo_verified5() {
		return info_verified5;
	}
	public void setInfo_verified5(String info_verified5) {
		this.info_verified5 = info_verified5;
	}
	public String getOther_verified1() {
		return other_verified1;
	}
	public void setOther_verified1(String other_verified1) {
		this.other_verified1 = other_verified1;
	}
	public String getOther_verified2() {
		return other_verified2;
	}
	public void setOther_verified2(String other_verified2) {
		this.other_verified2 = other_verified2;
	}
	public String getOther_verified3() {
		return other_verified3;
	}
	public void setOther_verified3(String other_verified3) {
		this.other_verified3 = other_verified3;
	}
	public String getOther_verified4() {
		return other_verified4;
	}
	public void setOther_verified4(String other_verified4) {
		this.other_verified4 = other_verified4;
	}
	public String getOther_verified5() {
		return other_verified5;
	}
	public void setOther_verified5(String other_verified5) {
		this.other_verified5 = other_verified5;
	}
	public String getOthercase1() {
		return othercase1;
	}
	public void setOthercase1(String othercase1) {
		this.othercase1 = othercase1;
	}
	public String getOthercase2() {
		return othercase2;
	}
	public void setOthercase2(String othercase2) {
		this.othercase2 = othercase2;
	}
	public String getOthercase3() {
		return othercase3;
	}
	public void setOthercase3(String othercase3) {
		this.othercase3 = othercase3;
	}
	public String getOthercase4() {
		return othercase4;
	}
	public void setOthercase4(String othercase4) {
		this.othercase4 = othercase4;
	}
	public String getOthercase5() {
		return othercase5;
	}
	public void setOthercase5(String othercase5) {
		this.othercase5 = othercase5;
	}
	public String getSuspe_verified1() {
		return suspe_verified1;
	}
	public void setSuspe_verified1(String suspe_verified1) {
		this.suspe_verified1 = suspe_verified1;
	}
	public String getSuspe_verified2() {
		return suspe_verified2;
	}
	public void setSuspe_verified2(String suspe_verified2) {
		this.suspe_verified2 = suspe_verified2;
	}
	public String getSuspe_verified3() {
		return suspe_verified3;
	}
	public void setSuspe_verified3(String suspe_verified3) {
		this.suspe_verified3 = suspe_verified3;
	}
	public String getSuspe_verified4() {
		return suspe_verified4;
	}
	public void setSuspe_verified4(String suspe_verified4) {
		this.suspe_verified4 = suspe_verified4;
	}
	public String getSuspe_verified5() {
		return suspe_verified5;
	}
	public void setSuspe_verified5(String suspe_verified5) {
		this.suspe_verified5 = suspe_verified5;
	}
	public String getSuspects1() {
		return suspects1;
	}
	public void setSuspects1(String suspects1) {
		this.suspects1 = suspects1;
	}
	public String getSuspects2() {
		return suspects2;
	}
	public void setSuspects2(String suspects2) {
		this.suspects2 = suspects2;
	}
	public String getSuspects3() {
		return suspects3;
	}
	public void setSuspects3(String suspects3) {
		this.suspects3 = suspects3;
	}
	public String getSuspects4() {
		return suspects4;
	}
	public void setSuspects4(String suspects4) {
		this.suspects4 = suspects4;
	}
	public String getSuspects5() {
		return suspects5;
	}
	public void setSuspects5(String suspects5) {
		this.suspects5 = suspects5;
	}
	public String getSuspi_verified1() {
		return suspi_verified1;
	}
	public void setSuspi_verified1(String suspi_verified1) {
		this.suspi_verified1 = suspi_verified1;
	}
	public String getSuspi_verified2() {
		return suspi_verified2;
	}
	public void setSuspi_verified2(String suspi_verified2) {
		this.suspi_verified2 = suspi_verified2;
	}
	public String getSuspi_verified3() {
		return suspi_verified3;
	}
	public void setSuspi_verified3(String suspi_verified3) {
		this.suspi_verified3 = suspi_verified3;
	}
	public String getSuspi_verified4() {
		return suspi_verified4;
	}
	public void setSuspi_verified4(String suspi_verified4) {
		this.suspi_verified4 = suspi_verified4;
	}
	public String getSuspi_verified5() {
		return suspi_verified5;
	}
	public void setSuspi_verified5(String suspi_verified5) {
		this.suspi_verified5 = suspi_verified5;
	}
	public String getSuspicious1() {
		return suspicious1;
	}
	public void setSuspicious1(String suspicious1) {
		this.suspicious1 = suspicious1;
	}
	public String getSuspicious2() {
		return suspicious2;
	}
	public void setSuspicious2(String suspicious2) {
		this.suspicious2 = suspicious2;
	}
	public String getSuspicious3() {
		return suspicious3;
	}
	public void setSuspicious3(String suspicious3) {
		this.suspicious3 = suspicious3;
	}
	public String getSuspicious4() {
		return suspicious4;
	}
	public void setSuspicious4(String suspicious4) {
		this.suspicious4 = suspicious4;
	}
	public String getSuspicious5() {
		return suspicious5;
	}
	public void setSuspicious5(String suspicious5) {
		this.suspicious5 = suspicious5;
	}
	public String getTotal_verified1() {
		return total_verified1;
	}
	public void setTotal_verified1(String total_verified1) {
		this.total_verified1 = total_verified1;
	}
	public String getTotal_verified2() {
		return total_verified2;
	}
	public void setTotal_verified2(String total_verified2) {
		this.total_verified2 = total_verified2;
	}
	public String getTotal_verified3() {
		return total_verified3;
	}
	public void setTotal_verified3(String total_verified3) {
		this.total_verified3 = total_verified3;
	}
	public String getTotal_verified4() {
		return total_verified4;
	}
	public void setTotal_verified4(String total_verified4) {
		this.total_verified4 = total_verified4;
	}
	public String getTotal_verified5() {
		return total_verified5;
	}
	public void setTotal_verified5(String total_verified5) {
		this.total_verified5 = total_verified5;
	}
	public String getTotal1() {
		return total1;
	}
	public void setTotal1(String total1) {
		this.total1 = total1;
	}
	public String getTotal2() {
		return total2;
	}
	public void setTotal2(String total2) {
		this.total2 = total2;
	}
	public String getTotal3() {
		return total3;
	}
	public void setTotal3(String total3) {
		this.total3 = total3;
	}
	public String getTotal4() {
		return total4;
	}
	public void setTotal4(String total4) {
		this.total4 = total4;
	}
	public String getTotal5() {
		return total5;
	}
	public void setTotal5(String total5) {
		this.total5 = total5;
	}
	public String getUpdatecard1() {
		return updatecard1;
	}
	public void setUpdatecard1(String updatecard1) {
		this.updatecard1 = updatecard1;
	}
	public String getUpdatecard2() {
		return updatecard2;
	}
	public void setUpdatecard2(String updatecard2) {
		this.updatecard2 = updatecard2;
	}
	public String getUpdatecard3() {
		return updatecard3;
	}
	public void setUpdatecard3(String updatecard3) {
		this.updatecard3 = updatecard3;
	}
	public String getUpdatecard4() {
		return updatecard4;
	}
	public void setUpdatecard4(String updatecard4) {
		this.updatecard4 = updatecard4;
	}
	public String getUpdatecard5() {
		return updatecard5;
	}
	public void setUpdatecard5(String updatecard5) {
		this.updatecard5 = updatecard5;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public String getCp_reportNum1() {
		return cp_reportNum1;
	}

	public void setCp_reportNum1(String cp_reportNum1) {
		this.cp_reportNum1 = cp_reportNum1;
	}

	public String getCp_reportAmt1() {
		return cp_reportAmt1;
	}

	public void setCp_reportAmt1(String cp_reportAmt1) {
		this.cp_reportAmt1 = cp_reportAmt1;
	}

	public String getId_reportNum1() {
		return id_reportNum1;
	}

	public void setId_reportNum1(String id_reportNum1) {
		this.id_reportNum1 = id_reportNum1;
	}

	public String getId_reportAmt1() {
		return id_reportAmt1;
	}

	public void setId_reportAmt1(String id_reportAmt1) {
		this.id_reportAmt1 = id_reportAmt1;
	}

	public String getCpl_reportNum1() {
		return cpl_reportNum1;
	}

	public void setCpl_reportNum1(String cpl_reportNum1) {
		this.cpl_reportNum1 = cpl_reportNum1;
	}

	public String getCpl_reportAmt1() {
		return cpl_reportAmt1;
	}

	public void setCpl_reportAmt1(String cpl_reportAmt1) {
		this.cpl_reportAmt1 = cpl_reportAmt1;
	}

	public String getIdl_reportNum1() {
		return idl_reportNum1;
	}

	public void setIdl_reportNum1(String idl_reportNum1) {
		this.idl_reportNum1 = idl_reportNum1;
	}

	public String getIdl_reportAmt1() {
		return idl_reportAmt1;
	}

	public void setIdl_reportAmt1(String idl_reportAmt1) {
		this.idl_reportAmt1 = idl_reportAmt1;
	}

	public String getCp_reportNum2() {
		return cp_reportNum2;
	}

	public void setCp_reportNum2(String cp_reportNum2) {
		this.cp_reportNum2 = cp_reportNum2;
	}

	public String getCp_reportAmt2() {
		return cp_reportAmt2;
	}

	public void setCp_reportAmt2(String cp_reportAmt2) {
		this.cp_reportAmt2 = cp_reportAmt2;
	}

	public String getId_reportNum2() {
		return id_reportNum2;
	}

	public void setId_reportNum2(String id_reportNum2) {
		this.id_reportNum2 = id_reportNum2;
	}

	public String getId_reportAmt2() {
		return id_reportAmt2;
	}

	public void setId_reportAmt2(String id_reportAmt2) {
		this.id_reportAmt2 = id_reportAmt2;
	}

	public String getCpl_reportNum2() {
		return cpl_reportNum2;
	}

	public void setCpl_reportNum2(String cpl_reportNum2) {
		this.cpl_reportNum2 = cpl_reportNum2;
	}

	public String getCpl_reportAmt2() {
		return cpl_reportAmt2;
	}

	public void setCpl_reportAmt2(String cpl_reportAmt2) {
		this.cpl_reportAmt2 = cpl_reportAmt2;
	}

	public String getIdl_reportNum2() {
		return idl_reportNum2;
	}

	public void setIdl_reportNum2(String idl_reportNum2) {
		this.idl_reportNum2 = idl_reportNum2;
	}

	public String getIdl_reportAmt2() {
		return idl_reportAmt2;
	}

	public void setIdl_reportAmt2(String idl_reportAmt2) {
		this.idl_reportAmt2 = idl_reportAmt2;
	}
	
    //add by lixx 2010.10.27 向当地人民银行报送信息
	public String getCp_reportNum3() {
		return cp_reportNum3;
	}

	public void setCp_reportNum3(String cp_reportNum3) {
		this.cp_reportNum3 = cp_reportNum3;
	}

	public String getCp_reportAmt3() {
		return cp_reportAmt3;
	}

	public void setCp_reportAmt3(String cp_reportAmt3) {
		this.cp_reportAmt3 = cp_reportAmt3;
	}

	public String getId_reportNum3() {
		return id_reportNum3;
	}

	public void setId_reportNum3(String id_reportNum3) {
		this.id_reportNum3 = id_reportNum3;
	}

	public String getId_reportAmt3() {
		return id_reportAmt3;
	}

	public void setId_reportAmt3(String id_reportAmt3) {
		this.id_reportAmt3 = id_reportAmt3;
	}
	//end add
	
}
