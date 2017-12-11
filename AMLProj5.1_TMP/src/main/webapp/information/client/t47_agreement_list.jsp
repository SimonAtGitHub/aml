<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="javascript">
function _submit(type,id){

if (type=='C'){
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_modify1.do?newsearchflag=1&party_id="+id
  
  }else  {
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_modify.do?newsearchflag=1&party_id="+id
  }
  document.forms[0].submit();
  }
function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
   
}
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("请选择！");
            return false;
    }else {
     	opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     	opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     	window.close();
     }
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<html:form action="/client/t47_agreement_list.do" method="post">
				<%
					String root = request.getContextPath();
				%>
				<div class="conditions">
					<div class="cond_t">
						<span>账户信息维护 </span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> </span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">

							<tr>
								<td>
									客户类型：
								</td>
								<td>
									<html:select property="party_class_cd_s">
										<html:options collection="party_classMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									帐号：
								</td>
								<td>
									<html:text property="acct_num" size="25" />
								</td>
							</tr>

							<tr>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="customer_id" size="25" />
								</td>
								<td>
									当事人中文名称：
								</td>
								<td>
									<html:text property="customer_name" size="25" />
								</td>
							</tr>


							<tr>
								<td>
									归属机构：
								</td>
								<td>
									<html:text property="searchorgankey" size="10"
										onblur="_Onblur('organName')" />
									<html:text property="organName" size="13" readonly="true" />
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=searchorgankey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
										class="cond_buttons"><img
												src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span> </a>

								</td>
								<td>
								</td>
								<td>

									<input type="button" name="button1" value="查 询"
										class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/information/client/t47_agreement_list.do?newsearchflag=1')">

								</td>
						</table>

					</div>
				</div>

				<div class="list">
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<th>
								帐号
							</th>
							<th>
								客户号
							</th>
							<th>
								AMl账户类型
							</th>
							<th>
								归属机构
							</th>
							<th>
								当事人中文名称
							</th>
							<th>
								开户时间
							</th>
							<th>
								销户时间
							</th>
						</tr>

						<logic:present name="t47_agreementList">
							<logic:iterate id="t47_agreement" name="t47_agreementList"
								indexId="i" type="com.ist.aml.pbcreport.dto.T47_agreement">

								<%
									java.util.HashMap map = new java.util.HashMap();
									 map.put("acct_num",t47_agreement.getAcct_num());
									 map.put("acct_from",t47_agreement.getAcct_from());
									 pageContext.setAttribute("map",map,PageContext.PAGE_SCOPE);
								 %>
								<tr align="center" class="interval"
									onMouseOver="this.className='interval2'"
									onMouseOut="this.className='interval'">
									<TD>
										<html:link name="map"
											page="/client/t47_agreement_list_modify.do"
											paramName="t47_agreement">
											<bean:write name="t47_agreement" property="acct_num"
												scope="page" />
										</html:link>
									</TD>
									<td>
										<bean:write name="t47_agreement" property="customer_id"
											scope="page" />
									</td>
									<td height="22">
										<bean:write name="t47_agreement" property="catp" scope="page" />
									</td>
									<td>
										<bean:write name="t47_agreement" property="organName"
											scope="page" />
									</td>
									<td>
										<bean:write name="t47_agreement" property="customer_name"
											scope="page" />
									</td>
									<td>
										<bean:write name="t47_agreement" property="open_dt_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="t47_agreement" property="close_dt_disp"
											scope="page" />
									</td>

								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
