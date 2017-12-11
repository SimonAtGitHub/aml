<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.common.AuthBean"%>
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
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
         function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
		 }
		 
		 function openMfa(net_id){
		  var url='<%=request.getContextPath()%>/mfa/mfa_issue/MFA.html?net_id='+net_id;
		 
		  var isView=document.forms[0].isView.value;		  
		  if (isView=='1')
		  {
		  	url+='&isView=1';
		  }
		  
		  var username ='<%=((AuthBean) session.getAttribute("authBean")).getAuthToken().getT00_user().getUsername()%>';
		  url+='&username='+username; 
		 	var sheight = screen.height-70;
		    var swidth = screen.width-10;
		    var winoption ="dialogHeight:"+sheight+"px;dialogWidth:"+ swidth +"px;status:no;scroll:no;resizable:no;center:no";
		   //window.showModalDialog(url,window,winoption);

		 window.open(url,'MFA' , 'fullscreen=yes,titlebar=no,location=no,menubar=no,resizable=yes,scrollbars=no,status=no,toolbar=no');
		 }
        </script>
	</head>
	<body class="mainbg">
		<html:form action="/t13_mfa_info/t13_mfa_info_search.do" method="post">
			<html:errors />
			<html:hidden property="isView"/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
						<span>资金网络查询</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									资金网名称：
								</td>
								<td>
									<html:text property="net_name" />
								</td>

								<td nowrap>
									客户：
								</td>
								<td>
								    <html:text property="party_id_search" styleClass="text_white"  size="10"  maxlength="100"   />	
									<html:text property="party_chn_name_disp"
										styleClass="text_white" size="23" maxlength="10" readonly="true"/>
											<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id_search&input_name_disp=party_chn_name_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							
							<tr>
								<td>
								<logic:equal value="1" name="t13_mfa_infoActionForm" property="isView">
									状态：
								</logic:equal>
								</td>
								<td>
								
									<logic:equal value="1" name="t13_mfa_infoActionForm" property="isView">
										
										<html:select property="net_status">
											<html:options collection="net_statusMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
								</td>

								<!--<td>
									当前岗位：
								</td>
								<td>
								    <html:select property="net_status">
										<html:options collection="net_statusMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>-->
								 <td>
									创建日期：
								</td>
								<td>
									<html:text property="create_dt_start" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									--
									<html:text property="create_dt_end" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
								</td>
							</tr>
							<tr>
							    <td></td>
							    <td></td>
								<td></td>
								<td>
									<input type="button" class="in_button1" name="search"
										value="查 询"
										onclick="dosubmit('t13_mfa_info_search.do?newsearchflag=1')" />
								</td>
							</tr>
						</table>

					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								网络编号
							</th>
							<th>
								资金网名称
							</th>
							<th>
							          网络状态
							</th>
<!--							<th>-->
<!--							          处理状态-->
<!--							</th>-->
							<th>
							          机构
							</th>
							<th>
							          数据日期
							</th>
							<th>
								创建人
							</th>
							<th>
								创建时间
							</th>
							<!--<th>
								当前岗位
							</th>-->
						</tr>
						<logic:iterate id="t13_mfa_info" name="t13_mfa_infoList"
							type="com.ist.mfa.dto.T13_mfa_info">
							

							<tr>
							    <td align="center" nowrap>
								
										<a href="javascript:void(0)" onclick="openMfa('<bean:write name="t13_mfa_info" property="net_id" />','<bean:write name="t13_mfa_infoActionForm" property="isView" />');"> <bean:write name="t13_mfa_info" property="net_id" /></a>
								</td>
								<td align="center" nowrap>
<%--								<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/mfa/t13_mfa_deal/t13_mfa_info_deal.do?net_id=<bean:write name="t13_mfa_info" property="net_id"/>');"></a>--%>
									<bean:write name="t13_mfa_info" property="net_name" />
									
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_mfa_info" property="net_status"
										scope="page" />
								</td>
<!--								<td>-->
<!--								   -->
<!--								</td>-->
								<td align="center" nowrap>
									<bean:write name="t13_mfa_info" property="organ"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_mfa_info" property="data_dt"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_mfa_info" property="creator"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t13_mfa_info" property="createdate"
										scope="page" />
								</td>
								<!--<td>
								     
								</td>-->
							</tr>
						</logic:iterate>

					</table>
				</div>

				<!-- all end -->
				<div class="list_page">
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</body>
</html>