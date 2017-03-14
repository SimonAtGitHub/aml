<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>

		<SCRIPT LANGUAGE="JavaScript"> 	
		function dosubmit(theUrl,type){
	      var errMsg = "";
	      var isSub = false;
	       if(type=='search'){
	          isSub=true;
	       }
	       if(type=='adddo'){
	          if(document.forms[0].subscibename.value==null||document.forms[0].subscibename.value==''){
	             errMsg="订阅名称不能为空！";
	             document.forms[0].subscibename.focus();
	         }else if(getLength(document.forms[0].subscibename.value) > 128){
		        errMsg="订阅名称不能多于128个字符！";
		        document.forms[0].subscibename.focus();
		    }else if(document.forms[0].subscibetype.value==null||document.forms[0].subscibetype.value==''){
	             errMsg="订阅类型不能为空！";
	              document.forms[0].subscibetype.focus();
	         }else if(getLength(document.forms[0].des.value) > 128){
		        errMsg="描述不能多于128个字符";
		        document.forms[0].des.focus();
		    }	         
	          isSub=true;
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
	    
		function showContent(obj){		
		if(obj.value==1){
		document.getElementById("1").style.display="";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
		
		
		}else if(obj.value==2){
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="";
		document.getElementById("3").style.display="none";
		
		
		}else if(obj.value==3){
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="";
		
		
		}else{
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
				}
		}
		
	</SCRIPT>

	</head>

	<body>
		<div id='content'>
			<html:form method="post"
				action="/myknowledge/t12_subscibe/t12_subscibe_tactics_modify_do.do">
				<html:hidden property="subscibekey" />

				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">订阅管理 - 修 改</span>
							</td>
							<td align="right">
								<input type="button" name="goback" value="返  回"
									onclick="awpDoSubmit('t12_subscibe_tactics_list.do','search')")>
							</td>
						</tr>
					</table>
				</div>
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="false" />
				</html:messages>
				<div class='awp_detail'>
					<TABLE>
						<tr>
							<td align="right">
								<font color="#FF0000">*</font>订阅名称：
								<br>
							</td>
							<td>
								<html:text property="subscibename" size="32" />
								（最多64个汉字）
							</td>
						</tr>
						<tr>
							<td align="right">
								<font color="#FF0000">*</font>订阅类型：
								<br>
							</td>
							<td>
								<html:hidden property="subscibetype" />
								<bean:write name="t12_subscibe_tactics"
									property="subscibetype_disp" />
							</td>
						</tr>
						<logic:equal value="1" property="subscibetype"
							name="t12_subscibe_tactics">
							<tr>

								<td align="right">
									栏目选择：
								</td>
								<td>
									<html:hidden property="programakey" />
									<html:text property="programaname" size="40" />
									<input type="button" name="locate" value="选 择"
										class="text_white"
										onClick="locate_pop_window('<%=request.getContextPath()%>','t12_programaLocation','checkbox','forms[0]','programakey,programaname','');" />
								</td>

							</tr>
						</logic:equal>
						<logic:equal value="2" property="subscibetype"
							name="t12_subscibe_tactics">
							<tr>

								<td align="right">
									人员选择：
								</td>
								<td>
									<html:hidden property="username" />
									<html:text property="realname" size="40" />
									<input type="button" name="locate" value="多 选"
										class="text_white"
										onclick="locate_pop_window('<%=request.getContextPath()%>','t00_userLocation','checkbox','forms[0]','username,realname','');" />
								</td>

							</tr>
						</logic:equal>
						<logic:equal value="3" property="subscibetype"
							name="t12_subscibe_tactics">
							<tr>
								<td align="right">
									订阅起止日期：
									<br>
								</td>
								<td>
								    <html:text property="begindate" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="弹出日历下拉菜单"
									onClick="new Calendar().show(document.forms[0].begindate);">
								-
								<html:text property="enddate" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="弹出日历下拉菜单"
									onClick="new Calendar().show(document.forms[0].enddate);">
									<br>
								</td>
							</tr>
						</logic:equal>
						<tr>
							<td align="right">
								备注：
								<br>
							</td>
							<td><html:text property="des" size="60" />
							<br></td>
						</tr>

						<tr>
							<td align="center">
								&nbsp;
							</td>
							<td>
								<input type="button" name="button_save" value="保  存"
									onclick="dosubmit('t12_subscibe_tactics_modify_do.do','adddo')">
								<html:reset styleClass="input" value="重  填" />
							</td>
						</tr>


					</TABLE>
				</div>
			</html:form>
		</div>
	</body>

</html>
