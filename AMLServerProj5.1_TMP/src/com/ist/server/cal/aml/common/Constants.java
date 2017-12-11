package com.ist.server.cal.aml.common;

public final class Constants {

	public static final String SYSINDICFLAG = "JC";
	public static final String SXINDICFLAG = "SX";
	/** 公司标志 */
	public static final String CORPTATION = "C";
	/** 个人标志 */
	public static final String INDIVIDIUAL = "I";
	public static final String DATEDIFF = "DIFF";
	public static final int DEALDAY = 10;
	public static final String BH = "BH";
	public static final String BS = "BS";
	/** 交易验证的初始值 **/
	public static final String TRANS_VIND = "2";

	public static final String DATE_STATUS_CD = "2";
	/** 预警未处理状态 **/
	public static final String ALERT_STATUS_CD = "0";
	/** 系统预警 **/
	public static final String SYS_ALERT = "1";
	/** 预警类型大额 **/
	public static final String ALERT_TYPE_CD_D = "1";
	public static final String ALERT_TYPE_CD_DE = "DE";
	/** 预警类型可疑 **/
	public static final String ALERT_TYPE_CD_Y = "2";
	public static final String ALERT_TYPE_CD_KY = "KY";

	public static final String TRUE = "1";
	// 生成案例的规则类别
	public static final String pbckeytype = "'1','3'";
	// 预警状态
	public static final String alert_status = "2";

	/** 本币标志 */
	public static String BEN_CURR = "1";
	/** 外币标志 */
	public static String WAI_CURR = "2";

	/** 案例流程ID **/
	public static final String FLOW_ID = "01";
	public static final String FLOW_IDK = "02";
	public static final String FLOW_ID_WB = "03";
	public static final String FLOW_IDK_WB = "04";
	public static final String FLOW_NET_B = "05";// 可疑外币对私流程

	/** 岗位ID **/
	public static final String POST_ID = "P0102"; // 本币编辑岗
	public static final String POST_ID_WB = "P0302";
	public static final String POST_NET_ID = "P0502";

	/** 节点ID **/
	public static final String NODE_ID = "N0102"; // 本币大额
	public static final String NODE_IDK = "N0202"; // 本币可疑
	public static final String NODE_ID_WB = "N0302"; // 本币大额
	public static final String NODE_IDK_WB = "N0402"; // 本币可疑
	public static final String NODE_NET_ID = "N0502"; // 本币可疑
	/** 案例种类正常 **/
	public static final String CASE_KIND = "N";

	/** 规则文件的扩展名 **/
	public static final String RULE_EXT = "drl";

	/** 规则引擎实现类 **/
	public static final String RULE_ENGINE_CLASS = "RuleEngine";

	/** 案例审批标志 **/
	public static final String CHECK_STATE_CD = "2";
	/** 日志错误信息 **/
	public static final String FILE_READ_ERROR = "读取规则文件失败:产生IO异常！";

	/** 文件加载错误 **/
	public static final String FILE_LOAD_ERROR = "装载规则文件时出错,请确定文件是否存在并保证规则文件间的规则不重名！";

	/** 规则文件语法错误 **/
	public static final String RULE_FILE_SYNTAX_ERROR = "规则文件语法有错误！";

	/** RuleBase错误 **/
	public static final String RULEBASE_NOT_INIT_ERROR = "没有初始化的RuleBase错误！";

	/** rulebase初始化错误 **/
	public static final String RULEBASE_INIT_ERROR = "初始化RuleBase失败！";

	/** 规则引擎初始化错误 **/
	public static final String ENGINE_INIT_ERROR = "初始化引擎错误, ";

	/** 找不到规则引擎错误 **/
	public static final String ENGINE_NOT_FOUNT_ERROR = "找不到规则引擎加载类!";

	/** 加载引擎错误 **/
	public static final String ENGINE_LOAD_ERROR = "加载引擎类错误:";

	/** 获取规则名和规则文件名错误 **/
	public static final String RULE_NAME_MSGFROMDB_ERROR = "从数据库中获取规则名和规则文件名失败：";

	/** 类加载错误 **/
	public static final String CLASS_LOAD_DEFAULt_ERROR = "加载类失败，找不到对应的类！";

	public static final String OBJIND = "01";
	public static final String DOBJIND = "02";
	public static String DPTABLE = "T67_P_M_ATTR";
	public static String DATABLE = "T67_A_M_ATTR";
	public static String TRANS_IND = "1";
	/** 客户标志 */
	public static String PARTY = "1";
	/** 对方客户标志 */
	public static String OPP_PARTY = "1";
	/** 高危客户被预警数量 */
	public static final String ALERTYPARTYNUMGF = "10";
	/** 高危客户被预警数量 */
	public static final String ALERTYPARTYNUMGZ = "5";
	/** 高危客户被预警数量，1是按大额统计，2按可疑统计，3不分大额和可疑 */
	public static String PARTYALERTCD = "0";// 判断高危客户是通过大额还是可疑预警，１是大额，２是可疑，０是不分大额和可疑
	public static final String ATTR_VAL_GF = "02";// 高危客户
	public static final String ATTR_VAL_GZ = "03";// 关注客户
	public static final String GRANULARITYS_M = "4";// 关注客户
	/** 个人长期参数key */
	public static final String ID_LPARAKEY = "";
	/** 公司长期参数key */
	public static final String CP_LPARAKEY = "";
	/** 个人短期参数key */
	public static final String ID_SPARAKEY = "10104";
	/** 公司短期参数key */
	public static final String CP_SPARAKEY = "10103";
	/** 个人连续频繁参数key */
	public static final String ID_OPARAKEY = "10125";
	/** 公司连续频繁参数key */
	public static final String CP_OPARAKEY = "10124";
	/**ＳＹＢＡＳＥ数据库 **/
	public static final String DATEBASE = "SYBASE";
	/** 规则文件命名空间 * */
	public static final Class DRL_NAME_SPACE = com.ist.server.cal.aml.jrules.rules.RuleNS.class;
	/** 账户标志 */
	public static String ACCT = "2";
    public static final String KY18 = "KY18";  
    
	/**  人工预警 **/
	public static final String MANUAL_ALERT = "2";
	/**  案例有效时间 **/
	public static final String num = "6";
	public static final String obj_type1 = "1";
	public static final String obj_type3 = "3";
	public static final String obj_type4 = "4"; //交易金额最大的帐户的开户机构.
	public static final String take_action = "继续关注";
	public static final String RISK_CHECK_STATUS = "'2','3','4','5','6'"; //已审核
	public static final String RISK_NOCHECK_STATUS = "'0','1'"; //已审核
	public static final String MOVERISKLEVEL = "'1001','1022','1023'"; //已审核
	 /** 动态参数类型，{1：自然日}{2：工作日}{3：自然周期} */
	   public static final String DYNA_IND_ND = "1"; //自然日
	   public static final String DYNA_IND_WD = "2"; //工作日
	   public static final String DYNA_IND_NC = "3"; //自然周期
	public static final String ACTIONDESC = "3.经我行分析，初步判断该报告所涉主体或行为的涉罪可疑行为代码为："; //行为代码前述
	public static final String RULEDESC = "2.该可疑报告符合我行自主监测规则："; //规则描述前述

	//增加预警的日期筛选参数t01_function_param表中paramcd字段的值  start -------------------------
	public static final String MFA_DT = "s_0100"; 
	//增加预警的日期筛选参数t01_function_param表中paramcd字段的值  end   -------------------------
	
	//预警增加机构前缀的长度，如果不足，则补0
	public static final int ORGANKEY_TOTAL_LENGTH=16; 
}
