<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="authBean" class="com.ist.common.AuthBean" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/basefunc.js"></script>
	<script type="text/javascript" src="../../js/basefunc_report.js"></script>
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		function selectAllCheckBox(objElement,currentForm){
			var strInnerText = "";
			var isSelectAll = false;
			if(currentForm){
				for(var i=0;i<currentForm.elements.length;i++){
					var formElement = currentForm.elements[i];
					if(formElement.type=="checkbox" && !formElement.disabled){
						formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
						isSelectAll = formElement.checked;
					}						
				}
				strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
				objElement.innerText = strInnerText;
			}
		}
				
		    function dosubmit(theUrl,type){
		        var errMsg = "";
		        var isSub = false;
		        if(type=='modi' || type=='dgroup'){
		            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		            isSub = true;
		        }
		        else if(type=='del'){
		            errMsg = CheckBoxMustChecked(document.forms[0]);
		            if(errMsg==''){
		                if(confirm('你真的要删除选择的组吗？')){
		                    isSub = true;
		                }
		            }
		        }
		        else if(type=='add'){
		            isSub = true;
		        }
		        else if(type=='search'){
			        var d1=document.getElementsByName("date_start")[0].value;
			        var d2=document.getElementsByName("date_end")[0].value;
			        if(d1!=''&&d2!=''){
				        if(new Date(d1.split("-")[0],d1.split("-")[1],d1.split("-")[2]).getTime()>new Date(d2.split("-")[0],d2.split("-")[1],d2.split("-")[2]).getTime()){
					        errMsg='创建开始日期必须小于创建结束日期';
				        }else{
		            		isSub = true;
				        }
			        }else{
			        	isSub = true;
			        }
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
		</SCRIPT>
	</HEAD>
	<body class="mainbg">
		<html:form action="/group/group_list.do" method="post">
		<html:errors/>
		<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
			  <span>权限管理</span>
			  <span class="buttons">
			  <a href="#" id="hdd_display" class="bt_hidden"></a>
			  <a href="#" onclick="dosubmit('group_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
			  <a href="#" onclick="dosubmit('group_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
			  <a href="#" onclick="dosubmit('group_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
			   <a href="#" onclick="dosubmit('group_func_list.do?newsearchflag=1','dgroup')"><img src="../../images/<%=session.getAttribute("style") %>/b_reset.png" />维护用户权限</a>
			   <a href="#" onclick="dosubmit('group_data.do?newsearchflag=1','dgroup')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />维护数据权限</a>
			  </span>
			</div>
		<div class="cond_c" id="searchtable">
		 <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>数据组名称：</td>
         <td>
         	<html:text property="groupname"></html:text>
         </td>
        <td align="right">创建日期：</td>
          <td >
          	<html:text property="date_start" size="14" onclick="calendar.show(this);" styleClass="calimg" readonly=""></html:text>
          	--
          	<html:text property="date_end" size="14" onclick="calendar.show(this);" styleClass="calimg" readonly=""></html:text>
		  </td>
        </tr>
	    <tr>
			<td>状态：</td>
			<td>
				<html:select property="flag">
					<html:options collection="flagMap" property="label" labelProperty="value" />
				</html:select>
		    </td>
		    <td ></td>
		    <td><input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('group_list.do?newsearchflag=1','search')" />
	         </td>
			</tr>
								
	  </table>
		</div>
		<div class="list">
  	 <table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
					<th noWrap>
						组名
					</th>
					<th noWrap>
						创建人
					</th>					
					<th noWrap>
						创建时间
					</th>
					<th noWrap>
						修改人
					</th>					
					<th noWrap>
						修改时间
					</th>
					<th noWrap>
						状态
					</th>
				</tr>
				<logic:iterate id="t00_group" name="t00_groupList"
					type="com.ist.platform.dto.T00_group">
					<%
					                java.util.HashMap map = new java.util.HashMap();
					                map.put("groupkey", t00_group.getGroupkey());
					                pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<tr>
						<TD noWrap>
							<logic:equal name="t00_group" property="isbuildin" value="1">
								<html:multibox property="selectedGroupkey" disabled="true">
									<bean:write name="t00_group" property="groupkey" />
								</html:multibox>
							</logic:equal>
							<logic:notEqual name="t00_group" property="isbuildin" value="1">
								<html:multibox property="selectedGroupkey" disabled="flase">
									<bean:write name="t00_group" property="groupkey" />
								</html:multibox>
							</logic:notEqual>
						</TD>
						<TD  noWrap>
						    <bean:write name="t00_group" property="namepre" scope="page" />
							<html:link name="map" page="/group/group_disp.do?newsearchflag=1">
								<bean:write name="t00_group" property="groupname" scope="page" />
							</html:link>
						</TD>
						<TD  noWrap>
							<bean:write name="t00_group" property="creator" scope="page" />
						</TD>						
						<TD  noWrap>
							<bean:write name="t00_group" property="createdate" scope="page" />
						</TD>
						<TD  noWrap>
							<bean:write name="t00_group" property="modifier" scope="page" />
						</TD>
						<TD  noWrap>
							<bean:write name="t00_group" property="modifydate" scope="page" />
						</TD>
						<TD  noWrap>
						    <bean:write name="t00_group" property="flag_disp" scope="page" />
						</TD>
					</TR>
				</logic:iterate>
			</TABLE>
		</div>
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
	</BODY>
</HTML>
