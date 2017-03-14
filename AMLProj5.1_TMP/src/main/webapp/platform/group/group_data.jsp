<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
			}
			
			function checkForm(theUrl,type){
			   var errMsg = "";
			        var isSub = false;
			        if(type=='del'){
			            
			            if(errMsg==''){
			                if(confirm('你真的要删除吗？')){
			                    isSub = true;
			                }
			            }
			        }
			        else if(type=='search' || type=='add'){
			            isSub = true;
			        }
			        if(isSub && errMsg==''){
			            document.forms[0].action=theUrl;
			            document.forms[0].submit();
			        }else{
			            if(errMsg!='')
			                alert(errMsg);
			            return false;
			        }
			}
			
			function dispfunc(){
			<%
				String ispowerctrl = String.valueOf(request.getAttribute("ispowerctrl"));
			
				if(ispowerctrl.equals("0")){//全部权限，不控制
			%>
					powerid_1.style.display='none';
			<%
				}
				else{//部分权限，需要再选定
			%>
					powerid_1.style.display='';
			<%
				}
			%>
			}
			
			function changepower(){
	            document.forms[0].action='group_data_power_do.do';
	            document.forms[0].submit();
			}
	</SCRIPT>
	</HEAD>
	<body class="mainbg" onload="dispfunc()">
		<html:form method="post" action="/group/group_data_do.do">
			<html:hidden name="t00_group" property="groupkey" />
			<div id="main">
			<!-- conditions --> 
				  <div class="conditions">
				    <!-- title -->
					<div class="cond_t">
					  <span>权限管理 - 赋数据权限</span>
					  <span class="buttons">
					  	<a href="group_list.do?newsearchflag=1"><img src="../../images/blue/b_back.png" />返回</a>
					  </span>
					</div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
					<div class="cond_c2">
					  <table border="0" cellpadding="0" cellspacing="0">
							<tr >
								<td >
									组名：
								</td>
								<td>
									<bean:write name="t00_group" property="groupname" />
								</td>
							</tr>
							<tr >
								<td  >
									权限范围：
								</td>
								<td>
									<html:radio property="ispowerctrl" value="0" onclick="javascript:powerid_1.style.display='none';powerid_2.style.display='none';changepower()">全部数据权限</html:radio>
									<html:radio property="ispowerctrl" value="1" onclick="javascript:powerid_1.style.display='';powerid_2.style.display='';changepower()">部分数据权限</html:radio>
								</td>
							</tr>
							<tr  id="powerid_1">
								<td>
									<font color="#FF0000">*</font>选择机构：
								</td>
								<td>
									<input type="button" name="locate" value="多 选"
										class="in_button1"
										onclick="window.open('<%=request.getContextPath()%>/common/location_treewindow.do?menu_id=organtree&groupkey=<bean:write name="t00_group" property="groupkey"/>&organkey=<bean:write name="organkey"/>','enter1','height=450, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" />
								</td>
							</tr>
						</table>
					</div>
					<input type=hidden name=groupkey value=<bean:write name="groupkey"/> />
					<div class="list">
						<table id="powerid_2" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th width="5%">
									操作
								</th>
								<th width="25%">
									机构代码
								</th>
								<th width="45%">
									机构名称
								</th>
							</tr>
							<logic:iterate id="t00_group" name="t00_group_entitylist" type="com.ist.platform.dto.T00_group_organ">
							<TR align="center" >
								<TD height=22 noWrap>
									<a href=# onclick="checkForm('../group/deleteT00_group_entity.do?entitykey=<bean:write name="t00_group" property="organkey"/>&groupkey=<bean:write name="groupkey" />','del')" class="btn btn_delete" title="删除">删除</a>
								</TD>
								<TD height=22 noWrap>
									<bean:write name="t00_group" property="organkey" scope="page" />
								</TD>
								<TD height=22 noWrap>
									<bean:write name="t00_group" property="organname" scope="page" />
								</TD>
							</TR>
							</logic:iterate>
						</TABLE>
					</div>
				</div>
				<div class="list_page">
				<table width="98%" border="0" align="center" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false"  />
						</td>
					</tr>
				</table>
	    	</div>
			</div>
		</html:form>
	</BODY>
</HTML>

