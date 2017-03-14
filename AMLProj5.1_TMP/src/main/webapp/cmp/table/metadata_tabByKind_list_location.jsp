<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
	java.util.ArrayList list = (java.util.ArrayList) request
			.getAttribute("list");
	int length = 0;
	if (list != null && list.size() > 0) {
		length = list.size();
	}
%>
<HTML>
	<base target="_self" />
	<HEAD>
		<title>数据库表定位</title>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<link rel="stylesheet" href="../../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../../js/title.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>


		<SCRIPT LANGUAGE="JavaScript">
				
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    errMsg = RadioCheckedSingleOne(document.forms(0));     	
		    if(errMsg==''){ 
		    	 window.returnValue=selectInfo();  	 
		    	 window.close();		
		    }
		    else{
		    	alert(errMsg);
		    	return;
		    }
		}
		
		function selectInfo(){
			var f=document.forms(0);
			var length=f.list_size.value;
			var s1="";
			var s2="";
			var s3="";
			//alert(f.tableename.length+"=="+f.tablecname.length); 		
			//alert(f.tableename[0].value+"=="+f.tablecname[0].value); 	
			if(parseInt(length)>1){
				for (var i = 0 ; i < f.tableename.length ; i++ ){
					if ( f.tableename[i].checked){
						s1=f.tableename[i].value;
						s2=f.tablecname[i].value;
						s3=f.tablekey[i].value;
						break;										
					}
				}
			}
			else if(parseInt(length)==1){
			
				if ( f.tableename.checked){
					s1=f.tableename.value;
					s2=f.tablecname.value;	
					s3=f.tablekey.value;						
				}	
			}	
			
			return s1+","+s2+","+s3;
		}
		
		function clearVal(){  	
		  	window.returnValue=""+","+""+","+"";
		  	window.close();  	
		 }
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form
			action="/table/metadata_tabByKind_location_do.do"
			method="POST">

			<input type="hidden" name="list_size" value="<%=length%>" />

			<table width="98%" border="0" align="center" cellpadding="2"
				cellspacing="0">
				<tr>
					<td class="td1">
						<span class="css014"> <strong><font color="0072BC">数据库表定位
									- 表列表</font>
						</strong> </span>
					</td>
					<td width="22%" align="center" nowrap class="td2">
						<input type=button value="确  定" name=Button1 class="input"
							onclick="dosubmit();">
						<input type=button value="关  闭" name=Button1 class="input"
							onclick="window.close();">
						<input type="button" value="清  空" name="backbutton"
							onclick="clearVal();" class="input">

					</td>
				</tr>

				<tr>
					<td class="td3" colspan="2" noWrap>
						表名称：
						<html:text property="tablename" styleClass="text_white"
							size="20" />
                        <input type="hidden" name="categorykey" value=<%= (String)request.getAttribute("categorykey")%>>
						<input type=button value="查  询" name=Button1 class="input"
							onclick="document.forms[0].submit();">
					</td>
				</tr>

			</table>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
			<TABLE width="98%" border=0 align="center" cellpadding="2"
				cellspacing="1" bgcolor="#000000">
				<TR align=center bgcolor="A3C0EE">
					<TD width="5%">
						选择
					</TD>
					<TD width="5%">
						序号
					</TD>
					<TD width="10%">
						表代码
					</TD>
					<TD width="10%">
						表名称
					</TD>
				</TR>
				<logic:iterate id="dto" name="list" indexId="ind" offset="0"
					type="com.ist.brms.metadata.dto.T01_mt_property">
					<TR align="center" bgcolor="#FFFFFF">
						<TD height=22>
							<html:radio idName="dto" property="tableename" value="tableename" />
						</TD>

						<TD height=22>
							<%=ind.intValue() + 1%>
						</TD>
     
						<TD height=22>
							<bean:write name="dto" property="tableename" scope="page" />
						</TD>
						<TD height=22>
							<html:hidden name="dto" property="tablecname" />
							<html:hidden name="dto" property="tablekey" />
							<bean:write name="dto" property="tablecname" scope="page" />
						</TD>
					</TR>
				</logic:iterate>
			</TABLE>

		</html:form>
	</BODY>
</HTML>
