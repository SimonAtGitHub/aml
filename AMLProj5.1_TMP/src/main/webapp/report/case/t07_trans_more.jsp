<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
  <%String url = request.getContextPath();
     String cssurl=url+"/css/css_all.css";
     String basefuncurl=url+"/js/basefunc.js";
     String ucjsurl=url+"/js/uc.js";%>
<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
	
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
<script language="JavaScript">
<% String casesearchtime = (String)request.getAttribute("casesearchtime"); 
%>
function dosubmit(theUrl){
   theUrl = theUrl+'&casesearchtime=<%=casesearchtime%>';
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
function Export(theUrl)
{
	<logic:present name="getT47_transaction_moreList">
    <bean:size id="len" name="getT47_transaction_moreList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		return false;
		</logic:equal>
    </logic:present>

    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</script>
</HEAD>
<body id="iframecontent">
<html:form action="/case/trans_more.do" method="post">
<html:hidden property="application_num"/>
<html:hidden property="cast_type"/>

  <html:errors/>
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
      <span>  交易信息</span>
      <span class="buttons">
         验证状态:<html:select property="validate_ind"  onchange="dosubmit('trans_more.do?newsearchflag=1&casesearchtime=0')">
                      <html:options collection="statusMap"
                                    property="label"
                                   labelProperty="value" />
       　　　　 </html:select>
       <a href="#" onclick="Export('exportTrans_more.do');"><img
										src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
    <!--   <logic:present name="t07_case_applicationActionForm" property="state">
       <logic:notEqual  value="1"  name="t07_case_applicationActionForm"  property="state">
     <a href="#" onclick="window.close();">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
						   </a> 
		</logic:notEqual>
			</logic:present>	-->  		   
	 </span>
					</div>
 </div>
<div class="list">
<table border="0" cellspacing="0" cellpadding="0">
    <TR align=center class="tdhead">
      <th nowrap height="22">流水号</th>
      <th nowrap>客户号</th>
      <th  nowrap>客户名称</th>
      <th  nowrap>交易日期</th>
      <th  nowrap>交易机构</th>
      <th nowrap>账户</th>
       <th nowrap>币种</th>      
      <th  nowrap>交易金额</th>
       <th  nowrap>传票号</th>
      <th  nowrap>借贷标志</th>
	  <th  nowrap>交易类型</th>
    </TR>
    <logic:iterate id="trans" name="getT47_transaction_moreList" type="com.ist.aml.report.dto.T47_transaction">
<%
java.util.HashMap map = new java.util.HashMap();
map.put("transactionkey",trans.getTransactionkey());
map.put("application_num",trans.getApplication_num());
map.put("currency_cd",trans.getCurrency_cd());
pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
%>
<TR align="center" bgcolor="#FFFFFF">  
      <TD height="22">
      <a href="#" onclick="_Open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=trans.getTransactionkey()%>')">
      <bean:write name="trans" property="tx_no" scope="page"/></TD>
      <TD><bean:write name="trans" property="host_cust_id" scope="page"/></TD>
      <TD><bean:write name="trans" property="party_chn_name" scope="page"/></TD>
      <TD><bean:write name="trans" property="tx_dt_disp" scope="page"/></TD>
      <TD><bean:write name="trans" property="organName" scope="page"/></TD>
	  <TD><bean:write name="trans" property="acct_num" scope="page"/></TD>
      <TD><bean:write name="trans" property="currency_cd_disp" scope="page"/></TD>
	  <TD><bean:write name="trans" property="amt_disp" scope="page"/></TD>
	   <TD><bean:write name="trans" property="voucher_no" scope="page"/></TD>
	  <TD><bean:write name="trans" property="debit_credit_disp" scope="page"/></TD>
      <TD><bean:write name="trans" property="tx_type_cd_disp" scope="page"/></TD>
     </TR> 
</logic:iterate>
 </table>
</div>
				<!-- list_page -->
				<div class="list_page">
				    <logic:present name="pageInfo">
					    <bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
		</html:form>
	</body>
</html>
