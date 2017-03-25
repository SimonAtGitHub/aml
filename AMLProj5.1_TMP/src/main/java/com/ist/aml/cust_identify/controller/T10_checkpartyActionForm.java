/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ 
/*     */ public class T10_checkpartyActionForm extends ActionForm
/*     */ {
/*  18 */   private String party_id = "";
/*  19 */   private String party_chn_name = "";
/*     */ 
/*  21 */   private String host_cust_id = "";
/*     */ 
/*  23 */   private String party_class_cd = "";
/*  24 */   private String party_class_cd_disp = "";
/*     */ 
/*  26 */   private String card_no = "";
/*  27 */   private String card_type = "";
/*  28 */   private String card_type_disp = "";
/*     */ 
/*  30 */   private String organkey = "";
/*  31 */   private String organname = "";
/*     */ 
/*  33 */   private Date create_dt = new Date();
/*  34 */   private String create_dt_disp = "";
/*     */ 
/*  36 */   private String party_status_cd = "";
/*  37 */   private String party_status_cd_disp = "";
/*     */ 
/*  42 */   private String aml1_type_cd = "";
/*  43 */   private String aml1_type_disp = "";
/*     */ 
/*  48 */   private String check_type = "";
/*  49 */   private String check_type_disp = "";
/*     */ 
/*  51 */   private String recheck_type = "";
/*  52 */   private String recheck_type_disp = "";
/*     */ 
/*  54 */   private String risk_type_str = "";
/*     */ 
/*  56 */   private String check_result = "";
/*     */ 
/*  58 */   private String check_explain = "";
/*     */ 
/*  60 */   private String check_method = "";
/*     */ 
/*  62 */   private Date check_dt = new Date();
/*  63 */   private String check_dt_disp = "";
/*  64 */   private Date check_dt_start = new Date();
/*  65 */   private String check_dt_start_disp = "";
/*  66 */   private Date check_dt_end = new Date();
/*  67 */   private String check_dt_end_disp = "";
/*     */ 
/*  69 */   private Date valid_dt = new Date();
/*  70 */   private String valid_dt_disp = "";
/*  71 */   private Date valid_dt_start = new Date();
/*  72 */   private String valid_dt_start_disp = "";
/*  73 */   private Date valid_dt_end = new Date();
/*  74 */   private String valid_dt_end_disp = "";
/*     */ 
/*  76 */   private String checker = "";
/*     */ 
/*  78 */   private String checker_org = "";
/*  79 */   private String checker_orgname = "";
/*     */ 
/*  81 */   private String is_relaleder = "";
/*     */ 
/*  84 */   private String[] partyIds = new String[0];
/*     */ 
/*  86 */   private String check_reason = "";
/*     */ 
/*     */   public String getParty_id() {
/*  89 */     return this.party_id;
/*     */   }
/*     */   public void setParty_id(String partyId) {
/*  92 */     this.party_id = partyId;
/*     */   }
/*     */   public String getParty_chn_name() {
/*  95 */     return this.party_chn_name;
/*     */   }
/*     */   public void setParty_chn_name(String partyChnName) {
/*  98 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 101 */     return this.host_cust_id;
/*     */   }
/*     */   public void setHost_cust_id(String hostCustId) {
/* 104 */     this.host_cust_id = hostCustId;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 107 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 110 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 113 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 116 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */   public String getCard_no() {
/* 119 */     return this.card_no;
/*     */   }
/*     */   public void setCard_no(String cardNo) {
/* 122 */     this.card_no = cardNo;
/*     */   }
/*     */   public String getCard_type() {
/* 125 */     return this.card_type;
/*     */   }
/*     */   public void setCard_type(String cardType) {
/* 128 */     this.card_type = cardType;
/*     */   }
/*     */   public String getCard_type_disp() {
/* 131 */     return this.card_type_disp;
/*     */   }
/*     */   public void setCard_type_disp(String cardTypeDisp) {
/* 134 */     this.card_type_disp = cardTypeDisp;
/*     */   }
/*     */   public String getOrgankey() {
/* 137 */     return this.organkey;
/*     */   }
/*     */   public void setOrgankey(String organkey) {
/* 140 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public String getOrganname() {
/* 144 */     return this.organname;
/*     */   }
/*     */   public void setOrganname(String organname) {
/* 147 */     this.organname = organname;
/*     */   }
/*     */   public Date getCreate_dt() {
/* 150 */     return this.create_dt;
/*     */   }
/*     */   public void setCreate_dt(Date createDt) {
/* 153 */     this.create_dt = createDt;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 156 */     return this.create_dt_disp;
/*     */   }
/*     */   public void setCreate_dt_disp(String createDtDisp) {
/* 159 */     this.create_dt_disp = createDtDisp;
/*     */   }
/*     */   public String getParty_status_cd() {
/* 162 */     return this.party_status_cd;
/*     */   }
/*     */   public void setParty_status_cd(String partyStatusCd) {
/* 165 */     this.party_status_cd = partyStatusCd;
/*     */   }
/*     */   public String getParty_status_cd_disp() {
/* 168 */     return this.party_status_cd_disp;
/*     */   }
/*     */   public void setParty_status_cd_disp(String partyStatusCdDisp) {
/* 171 */     this.party_status_cd_disp = partyStatusCdDisp;
/*     */   }
/*     */   public String getAml1_type_cd() {
/* 174 */     return this.aml1_type_cd;
/*     */   }
/*     */   public void setAml1_type_cd(String aml1TypeCd) {
/* 177 */     this.aml1_type_cd = aml1TypeCd;
/*     */   }
/*     */   public String getAml1_type_disp() {
/* 180 */     return this.aml1_type_disp;
/*     */   }
/*     */   public void setAml1_type_disp(String aml1TypeDisp) {
/* 183 */     this.aml1_type_disp = aml1TypeDisp;
/*     */   }
/*     */   public String getCheck_type() {
/* 186 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 189 */     this.check_type = checkType;
/*     */   }
/*     */   public String getCheck_type_disp() {
/* 192 */     return this.check_type_disp;
/*     */   }
/*     */   public void setCheck_type_disp(String checkTypeDisp) {
/* 195 */     this.check_type_disp = checkTypeDisp;
/*     */   }
/*     */   public String getCheck_result() {
/* 198 */     return this.check_result;
/*     */   }
/*     */   public void setCheck_result(String checkResult) {
/* 201 */     this.check_result = checkResult;
/*     */   }
/*     */   public String getCheck_explain() {
/* 204 */     return this.check_explain;
/*     */   }
/*     */   public void setCheck_explain(String checkExplain) {
/* 207 */     this.check_explain = checkExplain;
/*     */   }
/*     */   public String getCheck_method() {
/* 210 */     return this.check_method;
/*     */   }
/*     */   public void setCheck_method(String checkMethod) {
/* 213 */     this.check_method = checkMethod;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 216 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 219 */     this.check_dt = checkDt;
/*     */   }
/*     */   public String getCheck_dt_disp() {
/* 222 */     return this.check_dt_disp;
/*     */   }
/*     */   public void setCheck_dt_disp(String checkDtDisp) {
/* 225 */     this.check_dt_disp = checkDtDisp;
/*     */   }
/*     */   public Date getCheck_dt_start() {
/* 228 */     return this.check_dt_start;
/*     */   }
/*     */   public void setCheck_dt_start(Date checkDtStart) {
/* 231 */     this.check_dt_start = checkDtStart;
/*     */   }
/*     */   public String getCheck_dt_start_disp() {
/* 234 */     return this.check_dt_start_disp;
/*     */   }
/*     */   public void setCheck_dt_start_disp(String checkDtStartDisp) {
/* 237 */     this.check_dt_start_disp = checkDtStartDisp;
/*     */   }
/*     */   public Date getCheck_dt_end() {
/* 240 */     return this.check_dt_end;
/*     */   }
/*     */   public void setCheck_dt_end(Date checkDtEnd) {
/* 243 */     this.check_dt_end = checkDtEnd;
/*     */   }
/*     */   public String getCheck_dt_end_disp() {
/* 246 */     return this.check_dt_end_disp;
/*     */   }
/*     */   public void setCheck_dt_end_disp(String checkDtEndDisp) {
/* 249 */     this.check_dt_end_disp = checkDtEndDisp;
/*     */   }
/*     */   public Date getValid_dt() {
/* 252 */     return this.valid_dt;
/*     */   }
/*     */   public void setValid_dt(Date validDt) {
/* 255 */     this.valid_dt = validDt;
/*     */   }
/*     */   public String getValid_dt_disp() {
/* 258 */     return this.valid_dt_disp;
/*     */   }
/*     */   public void setValid_dt_disp(String validDtDisp) {
/* 261 */     this.valid_dt_disp = validDtDisp;
/*     */   }
/*     */   public Date getValid_dt_start() {
/* 264 */     return this.valid_dt_start;
/*     */   }
/*     */   public void setValid_dt_start(Date validDtStart) {
/* 267 */     this.valid_dt_start = validDtStart;
/*     */   }
/*     */   public String getValid_dt_start_disp() {
/* 270 */     return this.valid_dt_start_disp;
/*     */   }
/*     */   public void setValid_dt_start_disp(String validDtStartDisp) {
/* 273 */     this.valid_dt_start_disp = validDtStartDisp;
/*     */   }
/*     */   public Date getValid_dt_end() {
/* 276 */     return this.valid_dt_end;
/*     */   }
/*     */   public void setValid_dt_end(Date validDtEnd) {
/* 279 */     this.valid_dt_end = validDtEnd;
/*     */   }
/*     */   public String getValid_dt_end_disp() {
/* 282 */     return this.valid_dt_end_disp;
/*     */   }
/*     */   public void setValid_dt_end_disp(String validDtEndDisp) {
/* 285 */     this.valid_dt_end_disp = validDtEndDisp;
/*     */   }
/*     */   public String getChecker() {
/* 288 */     return this.checker;
/*     */   }
/*     */   public void setChecker(String checker) {
/* 291 */     this.checker = checker;
/*     */   }
/*     */   public String getChecker_org() {
/* 294 */     return this.checker_org;
/*     */   }
/*     */   public void setChecker_org(String checkerOrg) {
/* 297 */     this.checker_org = checkerOrg;
/*     */   }
/*     */ 
/*     */   public String getChecker_orgname() {
/* 301 */     return this.checker_orgname;
/*     */   }
/*     */   public void setChecker_orgname(String checkerOrgname) {
/* 304 */     this.checker_orgname = checkerOrgname;
/*     */   }
/*     */   public String[] getPartyIds() {
/* 307 */     return this.partyIds;
/*     */   }
/*     */   public void setPartyIds(String[] partyIds) {
/* 310 */     this.partyIds = partyIds;
/*     */   }
/*     */ 
/*     */   public String getCheck_reason() {
/* 314 */     return this.check_reason;
/*     */   }
/*     */   public void setCheck_reason(String checkReason) {
/* 317 */     this.check_reason = checkReason;
/*     */   }
/*     */   public String getRisk_type_str() {
/* 320 */     return this.risk_type_str;
/*     */   }
/*     */   public void setRisk_type_str(String riskTypeStr) {
/* 323 */     this.risk_type_str = riskTypeStr;
/*     */   }
/*     */   public String getIs_relaleder() {
/* 326 */     return this.is_relaleder;
/*     */   }
/*     */   public void setIs_relaleder(String isRelaleder) {
/* 329 */     this.is_relaleder = isRelaleder;
/*     */   }
/*     */   public String getRecheck_type() {
/* 332 */     return this.recheck_type;
/*     */   }
/*     */   public void setRecheck_type(String recheckType) {
/* 335 */     this.recheck_type = recheckType;
/*     */   }
/*     */   public String getRecheck_type_disp() {
/* 338 */     return this.recheck_type_disp;
/*     */   }
/*     */   public void setRecheck_type_disp(String recheckTypeDisp) {
/* 341 */     this.recheck_type_disp = recheckTypeDisp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_checkpartyActionForm
 * JD-Core Version:    0.6.2
 */