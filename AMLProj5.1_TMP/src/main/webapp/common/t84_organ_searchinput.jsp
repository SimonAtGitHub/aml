<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
  /**
   * 客户选择公共页面：
   * 权限：公共页面没有权限控制
   * 接口参数：
   * form_name form框的名字
   * input_name 客户号的文本框的名字
   * input_name1 客户名称的文本框的名字
   * 例如：<input type=button value="查 询" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
*         <html:button property="b2" value="查 询" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
   */
%>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<link rel="stylesheet" href="../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR><title>机构查询</title>
<SCRIPT LANGUAGE="JavaScript" src="../js/basefunc.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].organkey)<0){
        errMsg+="请选择您要加入机构号！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function selectUsers(){
	var obj_disp=opener.document.forms(0).organname_disp;
        var obj=opener.document.forms(0).organkey;

        var valueObj=document.forms(0).organname_disp;
        var keyObj=document.forms(0).organkey;
   	 if(typeof(keyObj)=='object'){
        	if(keyObj.length>1){
         	     for(var i=0;i<keyObj.length;i++){
                        if(keyObj[i].checked){
                  		obj_disp.value=valueObj[i].value;
                                  obj.value=keyObj[i].value;
                    	}
                     }
      		  }
      		  else{
       	 	    if(keyObj.checked){
                                obj_disp.value=valueObj.value;
                                  obj.value=keyObj.value;
                    }
      		  }
        }

        window.close();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form action="/common/t84_organ_search.do" method="post">

  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1"> <span class="css014"> <strong><font color="0072BC">法人机构信息查询</font></strong></span></td>
      <td width="22%" align="right" nowrap class="td2">
         <html:button property="b1" value="选 定" styleClass="input" onclick="return selectUsers()"/>
         <html:button property="b2" value="关 闭" styleClass="input" onclick="window.close()"/>
      </td>
    </tr>
  </table>

   <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"></td>
    </tr>
  </table>
  <html:errors/>
  <TABLE width="98%" border=0 align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
    <TR align="center" class="tdhead">
      <TD width="30" height=22 noWrap>选择</TD>
      <TD width="80">机构代码</TD>
      <TD width="80">法人代码</TD>
      <TD width="120">机构名称</TD>
      <TD width="80">行业类别</TD>
      <TD width="70" noWrap>含境外分行</TD>
      <TD width="70" noWrap>含附属公司</TD>
      <TD width="70" noWrap>分地区</TD>
    </TR>
  <logic:iterate id="t84_organ" name="t84_organList" type="com.ist.platform.dto.T84_organ">
      <html:hidden name="t84_organ" property="organname_disp"/>
      <html:hidden name="t84_organ" property="porgankey"/>

    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
                <html:radio property="organkey" idName="t84_organ" value="organkey"></html:radio>
      </TD>
                <TD height=22><bean:write name="t84_organ" property="organkey"/></TD>
                <TD><bean:write name="t84_organ" property="porgankey"/></TD>
                <TD><bean:write name="t84_organ" property="organname_disp"/></TD>
                <TD><bean:write name="t84_organ" property="tradekey_disp"/></TD>
                <TD><bean:write name="t84_organ" property="isouterbank_disp"/></TD>
                <TD><bean:write name="t84_organ" property="issubcorp_disp"/></TD>
                <TD><bean:write name="t84_organ" property="isarea_disp"/></TD>
     </TR>
   </logic:iterate>
  </TABLE>
 <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">

  </table>
</html:form>
</BODY>
</HTML>


