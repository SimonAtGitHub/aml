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
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language="JavaScript" src="../../js/basefunc_report.js"></script>
	<script type="text/javascript" src="../../js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			function dosubmit(theUrl,type){
		        var errMsg = "";
		        var isSub = false;
		        if(type=='modi'){
		            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		            isSub = true;
		        }
		        else if(type=='del'){
		            errMsg = CheckBoxMustChecked(document.forms[0]);
		            if(errMsg==''){
		                if(confirm('你真的要删除选择的用户吗？')){
		                    isSub = true;
		                }
		            }
		        }
		        else if(type=='search' || type=='add'){
		            isSub = true;
		        }
		        else if(type=='return' ){
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
</SCRIPT>
	</HEAD>
	<body class="mainbg">
	<html:form action="/user/user_list.do" method="post">
		<html:hidden name="t00_group" property="groupkey" />
		<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
			  <span>用户权限管理</span>
			  <span class="buttons">
				<a href="#" onclick="dosubmit('group_func.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
			  	<a href="#" onclick="dosubmit('group_func_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
			  	<a href="#" onclick="dosubmit('group_func_del.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
			  	<a href="group_list.do?newsearchflag=1"><img src="../../images/blue/b_back.png" />返回</a>
			  </span>
			</div>
		</div>
		<div class="list">
			<table border="0" cellpadding="0" cellspacing="0">
				<TR align=center >
					<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
					<th width="20%" noWrap>
						用户名
					</th>
					<th width="50%" noWrap>
						用户角色
					</th>
				</TR>
				<logic:iterate id="funcHash" name="t00_groupList_funcHash">
					<bean:define id="username" name="funcHash" property="key"></bean:define>
					<bean:define id="subList" name="funcHash" property="value" type="java.util.ArrayList"></bean:define>
					<%
					com.ist.platform.dto.T00_com_auth t00_com_auth = (com.ist.platform.dto.T00_com_auth)subList.get(0);
					%>
					<TR nowrap align="center">
						<TD height=22>
							<html:multibox property="selectedUsername">
								<%=t00_com_auth.getUsername()%>_<%=t00_com_auth.getGroupkey()%>_<%=t00_com_auth.getRolekey()%>
							</html:multibox>
						</TD>
						<TD nowrap align="left">
							<%=t00_com_auth.getUsername()%>（<%=t00_com_auth.getRealname()%>）
						</TD>
						<TD nowrap align="left">
							<%
							String roleStr = "";
							java.util.Iterator iter = subList.iterator();
							while(iter.hasNext()){
								com.ist.platform.dto.T00_com_auth _t00_com_auth = (com.ist.platform.dto.T00_com_auth)iter.next();
								roleStr += "、" + _t00_com_auth.getRolekey_disp();
							}
							if(roleStr.length()>1){
								roleStr = roleStr.substring(1);
							}
							out.print(roleStr);
							%>
						</TD>
					</TR>					
				</logic:iterate>
			</TABLE>
        	</div>
        </div>
		</html:form>
	</BODY>
</HTML>
