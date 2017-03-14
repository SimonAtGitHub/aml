<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
var saveflag=<%=(String)request.getAttribute("saveflag")%>;
if(saveflag=="1"){
  alert("导入成功");
}
function dosubmit(theUrl){
    for(i=0;i<document.forms[0].tablecode.options.length;i++){
     if(document.forms[0].tablecode.options[i].selected){
        document.forms[0].tablename.value=document.forms[0].tablecode.options[i].text;
        break;
      }
    }
   
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(getLength(document.forms[0].filename.value)==0){
        errMsg="请选择文件！";
        document.forms[0].filename.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
   
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id="main">
			<html:form action="/lipmanager/addTableData.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="tablename">
			
			<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>名单数据导入</span>
					</div>
			
				
		

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
			</div>	
	<div class="cond_c2">
     <table>
      <tr>
	
       <td ><strong>名单库：</strong></span>          		
		              <html:select property="tablecode">
						<html:options collection="tableMap" property="label"
										labelProperty="value" />
					</html:select></td>
					
       <td ><html:file property="filename"></html:file>
     <html:button value="导 入" property="Button5" styleClass="in_button1"
									onclick="checkForm('addTableDataDo.do')" />
         </td>
      </tr>
     </table>
	</div>
	

	

</html:form>
</div>
</BODY>
</HTML>

