/*     */ package com.ist.aml.cust_identify.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T10_checkparty
/*     */   implements Serializable
/*     */ {
/*     */   private static final long serialVersionUID = -6913057206663340540L;
/*  26 */   private String party_id = "";
/*  27 */   private String party_chn_name = "";
/*     */ 
/*  29 */   private String host_cust_id = "";
/*     */ 
/*  31 */   private String party_class_cd = "";
/*  32 */   private String party_class_cd_disp = "";
/*     */ 
/*  34 */   private String risk_type_str = "";
/*     */ 
/*  36 */   private String card_no = "";
/*  37 */   private String card_type = "";
/*  38 */   private String card_type_disp = "";
/*     */ 
/*  40 */   private String organkey = "";
/*  41 */   private String organname = "";
/*     */ 
/*  43 */   private Date create_dt = new Date();
/*  44 */   private String create_dt_disp = "";
/*     */ 
/*  46 */   private String party_status_cd = "";
/*  47 */   private String party_status_cd_disp = "";
/*     */ 
/*  52 */   private String aml1_type_cd = "";
/*  53 */   private String aml1_type_disp = "";
/*     */ 
/*  58 */   private String check_type = "";
/*  59 */   private String check_type_disp = "";
/*     */ 
/*  61 */   private String recheck_type = "";
/*  62 */   private String recheck_type_disp = "";
/*     */ 	
			private String expire_period = ""; ////已到期期限
/*  64 */   private String check_result = "";
/*  65 */   private String check_result_disp = "";
/*     */ 
/*  67 */   private String check_explain = "";
/*     */ 
/*  69 */   private String check_method = "";
/*     */ 
/*  71 */   private Date check_dt = new Date();
/*  72 */   private String check_dt_disp = "";
/*  73 */   private Date check_dt_start = new Date();
/*  74 */   private String check_dt_start_disp = "";
/*  75 */   private Date check_dt_end = new Date();
/*  76 */   private String check_dt_end_disp = "";
/*     */ 
/*  78 */   private Date valid_dt = new Date();
/*  79 */   private String valid_dt_disp = "";
/*  80 */   private Date valid_dt_start = new Date();
/*  81 */   private String valid_dt_start_disp = "";
/*  82 */   private Date valid_dt_end = new Date();
/*  83 */   private String valid_dt_end_disp = "";
/*     */ 	private Date current_date = new Date();
/*  85 */   private String checker = "";
/*     */ 
/*  87 */   private String checker_org = "";
/*  88 */   private String checker_orgname = "";
/*     */ 
/*  90 */   private String is_relaleder = "";
/*  91 */   private String check_status = "";
/*     */ 
/*  93 */   private String organStr = "";
/*  94 */   private ArrayList list = new ArrayList();
/*     */ 
/*  96 */   private String[] partyIds = new String[0];
/*     */ 
/*  98 */   private String check_reason = "";
/*     */ 
/*     */   public String getParty_id()
/*     */   {
/* 108 */     return this.party_id;
/*     */   }
/*     */   public void setParty_id(String partyId) {
/* 111 */     this.party_id = partyId;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 114 */     return this.party_chn_name;
/*     */   }
/*     */   public void setParty_chn_name(String partyChnName) {
/* 117 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 120 */     return this.host_cust_id;
/*     */   }
/*     */   public void setHost_cust_id(String hostCustId) {
/* 123 */     this.host_cust_id = hostCustId;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 126 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 129 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 132 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 135 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */   public String getCard_no() {
/* 138 */     return this.card_no;
/*     */   }
/*     */   public void setCard_no(String cardNo) {
/* 141 */     this.card_no = cardNo;
/*     */   }
/*     */   public String getCard_type() {
/* 144 */     return this.card_type;
/*     */   }
/*     */   public void setCard_type(String cardType) {
/* 147 */     this.card_type = cardType;
/*     */   }
/*     */   public String getCard_type_disp() {
/* 150 */     return this.card_type_disp;
/*     */   }
/*     */   public void setCard_type_disp(String cardTypeDisp) {
/* 153 */     this.card_type_disp = cardTypeDisp;
/*     */   }
/*     */   public String getOrgankey() {
/* 156 */     return this.organkey;
/*     */   }
/*     */   public void setOrgankey(String organkey) {
/* 159 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public String getOrganname() {
/* 163 */     return this.organname;
/*     */   }
/*     */ 
/*     */   public void setOrganname(String organname) {
/* 167 */     this.organname = organname;
/*     */   }
/*     */ 
/*     */   public Date getCreate_dt() {
/* 171 */     return this.create_dt;
/*     */   }
/*     */   public void setCreate_dt(Date createDt) {
/* 174 */     this.create_dt = createDt;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 177 */     return this.create_dt_disp;
/*     */   }
/*     */   public void setCreate_dt_disp(String createDtDisp) {
/* 180 */     this.create_dt_disp = createDtDisp;
/*     */   }
/*     */   public String getParty_status_cd() {
/* 183 */     return this.party_status_cd;
/*     */   }
/*     */   public void setParty_status_cd(String partyStatusCd) {
/* 186 */     this.party_status_cd = partyStatusCd;
/*     */   }
/*     */   public String getParty_status_cd_disp() {
/* 189 */     return this.party_status_cd_disp;
/*     */   }
/*     */   public void setParty_status_cd_disp(String partyStatusCdDisp) {
/* 192 */     this.party_status_cd_disp = partyStatusCdDisp;
/*     */   }
/*     */   public String getAml1_type_cd() {
/* 195 */     return this.aml1_type_cd;
/*     */   }
/*     */   public void setAml1_type_cd(String aml1TypeCd) {
/* 198 */     this.aml1_type_cd = aml1TypeCd;
/*     */   }
/*     */   public String getAml1_type_disp() {
/* 201 */     return this.aml1_type_disp;
/*     */   }
/*     */   public void setAml1_type_disp(String aml1TypeDisp) {
/* 204 */     this.aml1_type_disp = aml1TypeDisp;
/*     */   }
/*     */   public String getCheck_type() {
/* 207 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 210 */     this.check_type = checkType;
/*     */   }
/*     */   public String getCheck_type_disp() {
/* 213 */     return this.check_type_disp;
/*     */   }
/*     */   public void setCheck_type_disp(String checkTypeDisp) {
/* 216 */     this.check_type_disp = checkTypeDisp;
/*     */   }
/*     */   public String getCheck_result() {
/* 219 */     return this.check_result;
/*     */   }
/*     */   public void setCheck_result(String checkResult) {
/* 222 */     this.check_result = checkResult;
/*     */   }
/*     */ 
/*     */   public String getCheck_result_disp() {
/* 226 */     return this.check_result_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_result_disp(String checkResultDisp) {
/* 230 */     this.check_result_disp = checkResultDisp;
/*     */   }
/*     */ 
/*     */   public String getCheck_explain() {
/* 234 */     return this.check_explain;
/*     */   }
/*     */   public void setCheck_explain(String checkExplain) {
/* 237 */     this.check_explain = checkExplain;
/*     */   }
/*     */   public String getCheck_method() {
/* 240 */     return this.check_method;
/*     */   }
/*     */   public void setCheck_method(String checkMethod) {
/* 243 */     this.check_method = checkMethod;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 246 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 249 */     this.check_dt = checkDt;
/*     */   }
/*     */   public String getCheck_dt_disp() {
/* 252 */     return this.check_dt_disp;
/*     */   }
/*     */   public void setCheck_dt_disp(String checkDtDisp) {
/* 255 */     this.check_dt_disp = checkDtDisp;
/*     */   }
/*     */   public Date getCheck_dt_start() {
/* 258 */     return this.check_dt_start;
/*     */   }
/*     */   public void setCheck_dt_start(Date checkDtStart) {
/* 261 */     this.check_dt_start = checkDtStart;
/*     */   }
/*     */   public String getCheck_dt_start_disp() {
/* 264 */     return this.check_dt_start_disp;
/*     */   }
/*     */   public void setCheck_dt_start_disp(String checkDtStartDisp) {
/* 267 */     this.check_dt_start_disp = checkDtStartDisp;
/*     */   }
/*     */   public Date getCheck_dt_end() {
/* 270 */     return this.check_dt_end;
/*     */   }
/*     */   public void setCheck_dt_end(Date checkDtEnd) {
/* 273 */     this.check_dt_end = checkDtEnd;
/*     */   }
/*     */   public String getCheck_dt_end_disp() {
/* 276 */     return this.check_dt_end_disp;
/*     */   }
/*     */   public void setCheck_dt_end_disp(String checkDtEndDisp) {
/* 279 */     this.check_dt_end_disp = checkDtEndDisp;
/*     */   }
/*     */   public Date getValid_dt() {
/* 282 */     return this.valid_dt;
/*     */   }
/*     */   public void setValid_dt(Date validDt) {
/* 285 */     this.valid_dt = validDt;
/*     */   }
/*     */   public String getValid_dt_disp() {
/* 288 */     return this.valid_dt_disp;
/*     */   }
/*     */   public void setValid_dt_disp(String validDtDisp) {
/* 291 */     this.valid_dt_disp = validDtDisp;
/*     */   }
/*     */   public Date getValid_dt_start() {
/* 294 */     return this.valid_dt_start;
/*     */   }
/*     */   public void setValid_dt_start(Date validDtStart) {
/* 297 */     this.valid_dt_start = validDtStart;
/*     */   }
/*     */   public String getValid_dt_start_disp() {
/* 300 */     return this.valid_dt_start_disp;
/*     */   }
/*     */   public void setValid_dt_start_disp(String validDtStartDisp) {
/* 303 */     this.valid_dt_start_disp = validDtStartDisp;
/*     */   }
/*     */   public Date getValid_dt_end() {
/* 306 */     return this.valid_dt_end;
/*     */   }
/*     */   public void setValid_dt_end(Date validDtEnd) {
/* 309 */     this.valid_dt_end = validDtEnd;
/*     */   }
/*     */   public String getValid_dt_end_disp() {
/* 312 */     return this.valid_dt_end_disp;
/*     */   }
/*     */   public void setValid_dt_end_disp(String validDtEndDisp) {
/* 315 */     this.valid_dt_end_disp = validDtEndDisp;
/*     */   }
/*     */   public String getChecker() {
/* 318 */     return this.checker;
/*     */   }
/*     */   public void setChecker(String checker) {
/* 321 */     this.checker = checker;
/*     */   }
/*     */   public String getChecker_org() {
/* 324 */     return this.checker_org;
/*     */   }
/*     */   public void setChecker_org(String checkerOrg) {
/* 327 */     this.checker_org = checkerOrg;
/*     */   }
/*     */ 
/*     */   public String getChecker_orgname()
/*     */   {
/* 332 */     return this.checker_orgname;
/*     */   }
/*     */ 
/*     */   public void setChecker_orgname(String checkerOrgname) {
/* 336 */     this.checker_orgname = checkerOrgname;
/*     */   }
/*     */ 
/*     */   public String getOrganStr() {
/* 340 */     return this.organStr;
/*     */   }
/*     */ 
/*     */   public void setOrganStr(String organStr) {
/* 344 */     this.organStr = organStr;
/*     */   }
/*     */ 
/*     */   public ArrayList getList() {
/* 348 */     return this.list;
/*     */   }
/*     */ 
/*     */   public void setList(ArrayList list) {
/* 352 */     this.list = list;
/*     */   }
/*     */ 
/*     */   public String[] getPartyIds()
/*     */   {
/* 357 */     return this.partyIds;
/*     */   }
/*     */ 
/*     */   public void setPartyIds(String[] partyIds) {
/* 361 */     this.partyIds = partyIds;
/*     */   }
/*     */ 
/*     */   public String getCheck_reason() {
/* 365 */     return this.check_reason;
/*     */   }
/*     */ 
/*     */   public void setCheck_reason(String checkReason) {
/* 369 */     this.check_reason = checkReason;
/*     */   }
/*     */ 
/*     */   public String getRecheck_type() {
/* 373 */     return this.recheck_type;
/*     */   }
/*     */ 
/*     */   public void setRecheck_type(String recheckType) {
/* 377 */     this.recheck_type = recheckType;
/*     */   }
/*     */ 
/*     */   public String getRecheck_type_disp() {
/* 381 */     return this.recheck_type_disp;
/*     */   }
/*     */ 
/*     */   public void setRecheck_type_disp(String recheckTypeDisp) {
/* 385 */     this.recheck_type_disp = recheckTypeDisp;
/*     */   }
/*     */ 
/*     */   public String getRisk_type_str() {
/* 389 */     return this.risk_type_str;
/*     */   }
/*     */ 
/*     */   public void setRisk_type_str(String riskTypeStr) {
/* 393 */     this.risk_type_str = riskTypeStr;
/*     */   }
/*     */ 
/*     */   public String getIs_relaleder() {
/* 397 */     return this.is_relaleder;
/*     */   }
/*     */ 
/*     */   public void setIs_relaleder(String isRelaleder) {
/* 401 */     this.is_relaleder = isRelaleder;
/*     */   }
/*     */ 
/*     */   public String getCheck_status() {
/* 405 */     return this.check_status;
/*     */   }
/*     */ 
/*     */   public void setCheck_status(String checkStatus) {
/* 409 */     this.check_status = checkStatus;
/*     */   }
			public String getExpire_period() {
				return expire_period;
			}
			public void setExpire_period(String expire_period) {
				this.expire_period = expire_period;
			}
			public Date getCurrent_date() {
				return current_date;
			}
			public void setCurrent_date(Date current_date) {
				this.current_date = current_date;
			}
			
/*     */ }

/* Location:           C:\Users\alca\Desktop\闆呭畨寮�鍙戠▼搴廫istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dto.T10_checkparty
 * JD-Core Version:    0.6.2
 */