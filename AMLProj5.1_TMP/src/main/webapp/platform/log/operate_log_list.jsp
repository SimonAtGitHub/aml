<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function fPopUpCalendarDlg(ctrlobj){
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='del'){
        //errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除日志吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='search'){
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
<html:form action="/log/operate_log_list.do" method="post">
 <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
          <span>
           系统管理 - 操作日志 
          </span>
        <span class="buttons">
        删除   <html:text property="endtime" styleClass="calimg" onclick="calendar.show(this);" size="12" readonly="true"/> 之前的日志 
        <html:button value="删  除" property="Button3" styleClass="in_button1" 
             onclick="dosubmit('operate_log_delete_do.do','del')"/>
       </span>  
   
   </div>
 
  
    <div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">            
		<tr >
		 <td   >查 询：</td>
		 <td >
           <html:text property="searchtime" styleClass="calimg" onclick="calendar.show(this);" size="12" readonly="true"/>之前的日志 
         </td>  
		 <TD > 用户名称：</TD>
		 <td  >
		 	<html:text property="username" styleClass="text_white" size="25"></html:text>
		 </td>
	  </tr>
	  <tr> 
		 <td >操作类型：</td>
         <td >
             <html:select property="operate_type" style="width:200" >
             <html:options collection="operate_typeMap" property="label" labelProperty="value" />
             </html:select>
         </td>  
         <td></td>		 					  		
         <td >
            <input type="button" name="ok" value="查 询" class="in_button1"  onClick="dosubmit('operate_log_list.do?newsearchflag=1','search')" /> 
         </td>
         
      </tr>
</table>
	</div>
  </div>	
  
<div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
    <TR>
        <!---   <TD width=30 height=22 noWrap>选择</TD>  -->
      <th  width="18%">时间</th>
      <th width="10%" noWrap>用户名</th>
      <th width="18%" noWrap>操作描述</th>
      <th width="26%">操作对象</th>
      <th width="26%">操作结果</th>

    </TR>
<logic:iterate id="operate_log" name="t00_operate_logList" type="com.ist.platform.dto.T07_BJ_list_type_cd">
    <TR align="center" bgcolor="#FFFFFF">
      <TD ><bean:write name="operate_log" property="createdate_disp" scope="page"/></TD>
      <TD><bean:write name="operate_log" property="username" scope="page"/></TD>
      <TD><bean:write name="operate_log" property="module_key_sub1" scope="page"/></TD>
      <TD><bean:write name="operate_log" property="operate_desc" scope="page"/></TD>
      <TD><bean:write name="operate_log" property="module_key_sub1" scope="page"/><bean:write name="operate_log" property="operate_obj1" scope="page"/><bean:write name="operate_log" property="is_succ_disp" scope="page"/></TD>
    </TR>
</logic:iterate>
   </table>
  </div>	
  <!-- list_page --> 
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
<!-- all end -->   
</div>
		</html:form>
</body>
</html>
