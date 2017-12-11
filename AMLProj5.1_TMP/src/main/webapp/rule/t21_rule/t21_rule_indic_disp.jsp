<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		

<script language="JavaScript">

function dosubmit(theUrl) {
		document.forms[0].action = theUrl;
		document.forms[0].submit();
}
</script>
<style type="text/css">
#valmaxid div 
{
   float:left;
    white-space:nowrap;
}

</style>

</head>
<body class="mainbg">

	<html:form method="post" action="/t21_rule/modify_rule_indic.do">
	<div id="main">
		<div class="conditions">
			<div class="cond_t">
						<span> 规则信息 </span>
						<span class="buttons">
						   <a href="#" onclick="dosubmit('<c:out value="${backUrl}" escapeXml="false"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
						</span>
			</div>
		</div>	
			<html:errors />
			<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="15%">
								所属规则：
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="pbc_des" scope="request" />
							</td>
							<td width="15%">
								计算方式：
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="gs_type_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								类型：
							</td>
							<td>
								<bean:write name="t21_rule" property="interfacekey_disp" scope="request" />
							</td>
							<td>
								币种：
							</td>
							<td>
								<bean:write name="t21_rule" property="curr_cd_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								规则编号：
							</td>
							<td>
								<bean:write name="t21_rule" property="rulekey" scope="request" />
							</td>
							<td>
								规则名称：
							</td>
							<td>
								<bean:write name="t21_rule" property="rule_des" scope="request" />
							</td>
						</tr>

						<tr>
							<td>
								预警主体：
							</td>
							<td>
								<bean:write name="t21_rule" property="party_acct_cd_disp" scope="request" />
							</td>
							<td>
								主体描述：
							</td>
							<td>
								<bean:write name="t21_rule" property="type_des" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								粒度：
							</td>
							<td>
								<bean:write name="t21_rule" property="granulairty_disp" scope="request" />
							</td>
							<td>
								状态：
							</td>
							<td>
								<bean:write name="t21_rule" property="flag_disp" scope="request" />
							</td>
						</tr>
						

						<tr>
							<td>
								公式：
							</td>
							<td colspan="3" style="white-space:normal;">
									<bean:write name="t21_rule_gs" property="gs_des" scope="request" />
							</td>
						</tr>
					</table>
				</div>
			<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1" id="tableid">
						<TR>
 							 <th>指标编号</th>     
  							 <th>指标名称</th>    
  							 <th>指标类型</th>
 							 <th>比较符</th>    
  							 <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参数值&nbsp;&nbsp;&nbsp;&nbsp;</th> 
  							  <th>值序列</th>   
 							    

						</TR>
						
						<logic:iterate id="indic" name="t21_rule_indic_List" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<TR>
								
								
								<TD>
									<bean:write name="indic" property="indickey" />
									<input type="hidden"  name="indickey" id="indickey" value="<bean:write name="indic" property="indickey" />"/>
								</TD>
								<TD>
									<bean:write name="indic" property="indicname" />
								</TD>
								<TD>
									<bean:write name="indic" property="indic_attr"  />
									<input type="hidden"  name="indic_attr" id="indic_attr" value="<bean:write name="indic" property="indic_attr" />"/>
								</TD>
								<TD >
								<%  LinkedHashMap map=(LinkedHashMap)request.getAttribute("valtypeMap");
	                              Iterator iter=map.keySet().iterator();
	                              String typevalue=indic.getValtype();
							%>
									<select name="valtype"  onchange="isShow(this)" disabled="true">
									<% while(iter.hasNext()){
		                                   String key=(String)iter.next();
		                                      String value=(String)map.get(key);
	                                     %>
	                                    <option value="<%=key%>" <% if(key.equals(typevalue)){ %> selected <%} %>><%=value%></option>
						                <%  } %>
									</select>
								</TD>
								
								<TD  >
									<bean:write name="indic" property="valparamin" />
									<% if(typevalue.equals("BETWEEN")){ %>
									<span id="valmaxid"> 
									<%}else{ %>
									<span id="valmaxid" style="display:none"> 
									<%}%>
									-
									<bean:write name="indic" property="valparamax" />
									</sapn>
									
								</TD>
									<TD>
									<bean:write name="indic" property="valnum"  />
								</TD>
								
								     
							</TR>
						</logic:iterate>
					</TABLE>
			</div>
			
			</div>
		
	</html:form>
	
</BODY>
</HTML>
