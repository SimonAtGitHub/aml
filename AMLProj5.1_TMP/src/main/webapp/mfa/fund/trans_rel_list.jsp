<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">

function dosubmit(Url)
	{   
	    if(checkRadio(document.forms[0].selectedTrans_key)<0){
	        alert("请选择！");
	        return false;
	    }else{
			document.forms[0].action=Url;
		    document.forms[0].submit();
	    }
	}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/t13_mfa_deal/trans_rellist_search.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>交易列表</span>
					  <span class="buttons">
					    <a href="#" id="checkall"><img src="../../images/blue/b_checkall.png" />全  选</a>
					    <a href="#" onclick="dosubmit('trans_rel_result.do')"><img src="../../images/blue/b_choose.png" />确定</a>
	                    <a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
					  </span>
					</div>
				</div>
            

				<div class="list">
					<table>
						<tr>
						<th>
							选择
						</th>
						<th>
							流水号
						</th>
						<th>
							客户号
						</th>
						<th>
							客户名称
						</th>
						<th>
							交易日期
						</th>
						<th>
							交易机构
						</th>
						<th>
							账户
						</th>
						<th>
							交易对手名称
						</th>
						<th>
							币种
						</th>
						<th>
							交易金额
						</th>
						<th>
							借/贷
						</th>
						<th>
							现/转
						</th>
						<th>
							状态
						</th>
							
						</tr>
						<html:hidden property="net_id" name="t13_mfa_deal"/>
						<html:hidden property="stcr" name="t13_mfa_deal"/>
						<logic:iterate id="trans_rel" name="trans_relList"
							type="com.ist.mfa.dto.T13_mfa_deal">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("transactionkey", trans_rel.getTransactionkey());
										pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedTrans_key">
										<bean:write name="trans_rel" property="transactionkey" />,<bean:write name="trans_rel" property="party_id" scope="page" />,<bean:write name="trans_rel" property="acct_num" scope="page" />,<bean:write name="trans_rel" property="curr_cd" scope="page" />,<bean:write name="trans_rel" property="party_class_cd" scope="page" />,<bean:write name="trans_rel" property="amt" scope="page" />,<bean:write name="trans_rel" property="tx_dt_disp" scope="page" />
									</html:multibox>
								</td>
								<td>
									<bean:write name="trans_rel" property="tx_no" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="party_id" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="party_chn_name" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="tx_dt_disp" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="organkey" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="acct_num" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="opp_name" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="currency_cd_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="amt_disp" scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="debit_credit_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="cash_trans_flag_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="trans_rel" property="status_cd_disp" scope="page" />
								</td>
								
							</tr>
						</logic:iterate>
					</table>
				</div>
           </div>
           <div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	</body>
</html>