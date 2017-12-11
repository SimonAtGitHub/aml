<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
 <script type="text/javascript" src="../../js/ymPrompt.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript"> 
	function _Confim(url){
        document.form1.action=url;
        document.form1.submit();
	}

	function dosubmit(theUrl) {
		document.forms[0].action = theUrl;
		document.forms[0].submit();
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/insidereport/new_cust_view.do" method="post" styleId="form1">
<input type="hidden" name="backurl" value="<%=request.getContextPath()%>/report/insidereport/new_cust_view.do"/>
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	<div class="cond_t">
	  <span>客户视图</span>
	</div>
      <!-- table content -->
<div class="cond_c" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>客户：</td>
			<td>
	            <html:text property="party_id" />
	            <html:hidden property="party_chn_name" />
					<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
			<td>归属机构：</td>
			<td>
				<html:text property="organkey" styleClass="text_white"/>
				<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
		</tr>
		<tr>
        	<td>客户类型：</td>
			<td>
				<bean:define id="party_class_str" name="party_class_str"></bean:define>
				<%=party_class_str %>
			</td>
				
				<td></td>
				<td>
					<input name="" type="button" class="in_button1" value="查　询" onClick="_Confim('new_cust_view.do?newsearchflag=1')" />
				</td>
		 	</tr>
  </table>
      </div>
    </div>
    <!-- list -->
    <div class="list">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th>客户号</th>
          <th>客户名称</th>
		  <th>客户类型</th>
          <th>归属机构</th>
          <th>证件类型</th>
		  <th>证件号码</th>
        </tr>
		<logic:present name="t47_partyList" scope="request">
			<logic:iterate id="t47_party" indexId="i" name="t47_partyList" type="com.ist.aml.report.dto.T47_party">
       			<tr align="center" bgcolor="#FFFFFF">
					<td>
						<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/risk_rate/result/t37_party_view_disp.do?party_id=<bean:write name="t47_party" property="party_id" />&party_class_cd=<bean:write name="t47_party" property="party_class_cd" />&organkey=<bean:write name="t47_party" property="organkey" />&tempcategory=2')">
							<bean:write name="t47_party" property="party_id" />
						</a>
					</td>
					<td>
						<bean:write name="t47_party" property="party_chn_name"/>
					</td>
					<td>
						<bean:write name="t47_party" property="party_class_cd_disp"/>
					</td>
					<td>
						<bean:write name="t47_party" property="organ_name"/>
					</td>
					<td>
						<bean:write name="t47_party" property="card_type_disp"/>
					</td>
					<td>
						<bean:write name="t47_party" property="card_no"/>
					</td>
				</tr>
			</logic:iterate>
		</logic:present>
      </table>
    </div>
    <!-- list_page -->
	<div class="list_page">
		<logic:present name="pageInfo" scope="request"> 
			<bean:write name="pageInfo" scope="request" filter="false" />
		</logic:present>
	</div>
    <!-- all end -->
    <!-- all end -->
  </div>
</html:form>
</body>
</html>

