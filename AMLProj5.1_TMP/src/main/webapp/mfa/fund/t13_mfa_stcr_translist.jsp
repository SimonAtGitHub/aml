<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>

		<script language="JavaScript">
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}
function dosubmit(url){
  if(confirm('你真的要删除吗？')){
     document.forms[0].action=url;
     document.forms[0].submit();
  }
}
</script>
	</head>
	<body id="iframecontent">
	
		<html:form method="post" action="/t13_mfa_deal/t13_mfa_stcr_trans.do">
		<div class="conditions">
			<div class="cond_t">
				<span> 
				   <strong>特征交易信息</strong> 
				</span>
				<span class="buttons">
				  <a href="#" onclick="ymPrompt.win({message:'trans_rellist_search.do?net_id=<bean:write name="t13_mfa_deal" property="net_id"/>&stcr=<bean:write name="t13_mfa_deal" property="stcr"/>&newsearchflag=1',width:700,height:450,title:'添加',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
					<img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
				</span>
			</div>
		</div>
			<!-- 大选项卡（2）**b.特征交易信息2**内容 -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" id="trans_table">
					<tr>
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
						<!--<th>
							资金来源或用途
						</th>  -->
						<th>
							借/贷
						</th>
						<th>
							现/转
						</th>
						<th>
							状态
						</th>
						<th>
							操作
						</th>
					</tr>
					<logic:iterate id="trans" name="t13_mfa_stcr_transList"
						type="com.ist.mfa.dto.T13_mfa_deal" indexId="number">

						<tr>
							<td>
								<!--<a href="#"
									onclick="_open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=trans.getTransactionkey()%>&casesearchtime=<%=request.getAttribute("casesearchtime") %>');return false"></a>
									--><bean:write name="trans" property="tx_no" scope="page" />
								
							</td>
							<td>
								<bean:write name="trans" property="party_id" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="party_chn_name" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="tx_dt_disp" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="organkey" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="acct_num" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="opp_name" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="currency_cd_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="amt_disp" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="debit_credit_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="cash_trans_flag_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="status_cd_disp" scope="page" />
							</td>
							<td>
								<a href="#" onClick="dosubmit('t13_mfa_stcr_trans_delete.do?stcr=<bean:write name="trans" property="stcr"/>&net_id=<bean:write name="trans" property="net_id"/>&transactionkey=<bean:write name="trans" property="transactionkey"/>')">
								<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	
	</body>
</html>