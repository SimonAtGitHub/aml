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
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
        <script type="text/javascript" src="../../js/aml.js"></script>

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
			var s4="";
			//alert(f.tableename.length+"=="+f.tablecname.length); 		
			//alert(f.tableename[0].value+"=="+f.tablecname[0].value); 	
			if(parseInt(length)>1){
				for (var i = 0 ; i < f.tableename.length ; i++ ){
					if ( f.tableename[i].checked){
						s1=f.tableename[i].value;
						s2=f.tcname[i].value;
						s3=f.tschema[i].value;
						s4=f.objtype[i].value;
						break;										
					}
				}
			}
			else if(parseInt(length)==1){
			
				if ( f.tableename.checked){
					s1=f.tableename.value;
					s2=f.tcname.value;	
					s3=f.tschema.value;	
					s4=f.objtype.value;					
				}	
			}	
			
			return s1+","+s2+","+s3+","+s4;
		}
		
		function clearVal(){  	
		  	window.returnValue=""+","+"";
		  	document.forms(0).tablename.value = "";
		  	document.forms(0).tabschema.value = "";
		  	//window.close();  	
		 }
		 function checkForm(){
		 	document.forms[0].tablename.value = trim(document.forms[0].tablename.value);
		 	document.forms[0].tabschema.value = trim(document.forms[0].tabschema.value);
		 	document.forms[0].submit();
		 }
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
		<html:form
			action="/table/metadata_tab_location_do.do?newsearchflag=1"
			method="POST">

			<input type="hidden" name="list_size" value="<%=length%>" />

			<html:hidden property="dblinkkey" />
			<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>数据库表定位- 表列表</span>
					  <span class="buttons">
					    <a href="#" onclick="dosubmit();"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a>
	                    <a href="#" onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
					  </span>
					</div>
			<div class="cond_c" id="searchtable">
			<table >
	
				<tr>
					<td >
						表模式：</td>
						<td><html:text property="tabschema" styleClass="text_white" maxlength="16"
							size="20" /></td>
						<td>表英文名称：</td>
						<td><html:text property="tablename" styleClass="text_white" maxlength="16"
							size="20" /></td>
						</tr>
						<tr>
						<td>类型：</td>
						<td><html:select property="tableview_type">
							<html:options collection="tableviewMap" property="label"
								labelProperty="value" />
						</html:select>
						</td>
						<td></td>
						<td class="in_button"><input type=button value="查 询" name=Button1 class="input"
							onclick="checkForm();"></td>
						</tr>
	

			</table>
			</div>
			<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
			<div class='list'>
			<table>
		<tr align="center">

					<th width="5%">
						选择
					</th>
					<th width="5%">
						序号
					</th>
					<th width="10%">
						表模式
					</th>
					<th width="10%">
						表英文名称
					</th>
					<th width="10%">
						表中文名称
					</th>
				</TR>
				<logic:iterate id="dto" name="list" indexId="ind" offset="0"
					type="com.ist.common.metadata.dto.T01_mt_property">
					<TR align="center">
						<TD height=22>
							<html:radio idName="dto" property="tableename" value="tableename" />
						</TD>

						<TD height=22>
							<%=ind.intValue() + 1%>
						</TD>
     
						<TD height=22>
							<input type="hidden" value="<bean:write name="dto" property="tabschema" scope="page" />" name="tschema">
							<bean:write name="dto" property="tabschema" scope="page" />
						</TD>
						<TD height=22 align="left">
							<bean:write name="dto" property="tableename" scope="page" />
						</TD>
						<TD height=22 align="left">
							<input type="hidden" value="<bean:write name="dto" property="tablecname" scope="page" />" name="tcname">
							<bean:write name="dto" property="tablecname" scope="page" />
						</TD>
						<html:hidden name="dto" property="objtype"/>
					</TR>
				</logic:iterate>
			</TABLE>
		</div>
		<div class='list_page'>
	<table width="98%" border="0" align="center" cellpadding="3"
		cellspacing="3">
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table>  
	</div>
		</html:form>
		</div>
	</BODY>
</HTML>
