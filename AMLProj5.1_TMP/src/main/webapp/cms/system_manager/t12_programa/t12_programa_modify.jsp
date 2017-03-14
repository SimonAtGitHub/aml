<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html:html>
<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script src="<%= path %>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%= path %>/js/basefunc.js"></script>
<script language="JavaScript">
/**
* 表单验证
*/
function checkForm(theUrl){
    var errMsg ="";
    
    var errMsg ="";
    var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;
	
    if(getLength(document.forms[0].programaname.value)==0){
        errMsg+="栏目名称不能为空！";
        document.forms[0].programaname.focus();
    }else if(getLength(document.forms[0].releasetype.value)==0){
        errMsg+="请选择发布类型！";
        document.forms[0].releasetype.focus();
    }
    else if(getLength(document.forms[0].programaname.value)>64){
        errMsg+="栏目名称不能大于64个字符！";
        document.forms[0].programaname.focus();
    }
    else if(selvalue == 3 && getLength(document.forms[0].programaadd.value)==0){
    	errMsg+="栏目地址不能为空！";
        document.forms[0].programaadd.focus();
    }
    else if(selvalue == 3 && getLength(document.forms[0].programaadd.value)>64){
    	errMsg+="栏目地址不能大于64个字符！";
        document.forms[0].programaadd.focus();
    }
    /**    
    }else if(getLength(document.forms[0].programaadd.value)>64){
    	errMsg+="栏目地址不能大于64个字符！";
        document.forms[0].programaadd.focus();
    }else if(getLength(document.forms[0].defaultname.value)>64){
    	errMsg+="默认页名称不能大于64个字符！";
        document.forms[0].defaultname.focus();
    */
    else if(!checkNum(document.forms[0].dispseq.value)) {
        errMsg+="显示顺序只能输入整数 ！";
        document.forms[0].dispseq.focus();
    }
    else if(getLength(document.forms[0].des.value)>128){
    	errMsg+="备注不能大于128个字符！";
        document.forms[0].des.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function releasetypeChange(){
	//alert(document.forms[0].releasetype);
	var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;

  	var trElement = document.getElementById("addr");
    if(selvalue==3){//系统内发布
    	trElement.style.display="";
    }else{
    	trElement.style.display="none";
    }
    
    var applytype = document.getElementById("applytype");
    if(selvalue == 4) {//特殊发布
        applytype.selectedIndex = "0";
    }else {
        applytype.selectedIndex = "1";
    }
  
}
</script>

<script type="text/javascript">
   function init(){
    var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;

  	var trElement = document.getElementById("addr");
    if(selvalue==3){//系统内发布
    	trElement.style.display="";
    }else{
    	trElement.style.display="none";
    }
    
    var applytype = document.getElementById("applytype");
    if(selvalue == 4) {//特殊发布
        applytype.selectedIndex = "0";
    }else {
        applytype.selectedIndex = "1";
    }
   }
</script>
</HEAD>
<div id='content'>
<BODY >
<html:form method="post" action="/system_manager/t12_programa/t12_programa_modify_do.do">
	<html:hidden property = "categorykey"/>
	<html:hidden property = "programakey"/>

  	<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">系统管理 - <bean:write name="t12_programaActionForm" property = "categorykey_disp"/> - 修改栏目</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回" styleClass="input" onclick="awpDoSubmit('t12_programa_list.do','add')"/>
						</td>
					</tr>
				</table>
			</div>
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle"/>
  </html:messages>
  <div class='awp_detail'>
  <TABLE>
   
           <tr>
              <td> <font color="#FF0000">*</font>栏目名称：</td>
              <td bgcolor="F6F9FF"><html:text property="programaname" styleClass="text_white" size="40"/>
              </td>
            </tr>
            <tr>
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>发布类型：</td>
              <td bgcolor="F6F9FF">
              		<html:select property="releasetype" onchange="releasetypeChange();">
                      <html:options collection="releasetypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            
            <tr>
               <td><font color="#FF0000">*</font>应用类型：</td>
              <td> 
              		<html:select property="applytype" >
                      <html:options collection="appTypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            <!-- 
            <logic:equal value="4" property="releasetype" name="t12_programaActionForm">
            	 <tr id ="yes1">
	              <td><font color="#FF0000">*</font>是否能维护结构：</td>
	              <td>
	              	  <html:select property="isstructure">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes2">
	              <td><font color="#FF0000">*</font>是否能发布内容：</td>
	              <td>
	              	  <html:select property="iscontent">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes3">
	              <td><font color="#FF0000">*</font>是否能查询内容：</td>
	              <td>
	              	  <html:select property="issearch">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
            </logic:equal>
            
            <logic:notEqual value="4" property="releasetype" name="t12_programaActionForm">
            	<tr id ="yes1" style="display:none">
	              <td><font color="#FF0000">*</font>是否能维护结构：</td>
	              <td>
	              	  <html:select property="isstructure">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes2" style="display:none">
	              <td><font color="#FF0000">*</font>是否能发布内容：</td>
	              <td>
	              	  <html:select property="iscontent">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes3" style="display:none">
	              <td><font color="#FF0000">*</font>是否能查询内容：</td>
	              <td>
	              	  <html:select property="issearch">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
            </logic:notEqual>
             -->
            
            <logic:equal value="3" property="releasetype" name="t12_programaActionForm">
            	 <tr id ="addr">
	              <td><font color="#FF0000">*</font>栏目地址：</td>
	              <td>
	              		<html:text property="programaadd" styleClass="text_white" size="40"/>
	              </td>
	            </tr>
            </logic:equal>
            <logic:notEqual value="3" property="releasetype" name="t12_programaActionForm">
            	<tr id ="addr" style="display:none">
	              <td><font color="#FF0000">*</font>栏目地址：</td>
	              <td>
	              		<html:text property="programaadd" styleClass="text_white" size="40"/>
	              </td>
	            </tr>
            </logic:notEqual>
             
             <tr>
               <td><font color="#FF0000">*</font>展现类型：</td>
              <td>
              		<html:select property="showtype">
                      <html:options collection="showtypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
           <tr>
              <td><font color="#FF0000">*</font>状态：</td>
              <td bgcolor="F6F9FF">
              		<html:select property="flag">
                      <html:options collection="flagMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
           <tr>
              <td> <font color="#FF0000">*</font>显示顺序：</td>
              <td bgcolor="F6F9FF"><html:text property="dispseq" styleClass="awp_intnumber" size="10" maxlength="10"/>
              </td>
            </tr>  
            <!--             
             <tr>
              <td> 发布地址：</td>
              <td bgcolor="F6F9FF"><html:text property="programaadd" styleClass="text_white" size="64"/>
              </td>
            </tr>
			<tr bgcolor="ECF3FF">
              <td>默认页的名称：</td>
              <td bgcolor="F6F9FF">
              		<html:text property="defaultname" styleClass="text_white" size="15"/>
              </td>
            </tr>
             -->
            <!-- 
            
            <tr>
              <td><font color="#FF0000">*</font>审核状态：</td>
              <td bgcolor="F6F9FF">
              		<html:select property="auditstat">
                      <html:options collection="auditstatMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            
             -->
            
           <tr>
              <td>备注：</td>
              <td bgcolor="F6F9FF">
              		<html:textarea property="des" styleClass="text_white" cols="30" rows = "3"/>
              </td>
            </tr>
            <tr>
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF">
                <html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t12_programa_modify_do.do')"/>
                <html:reset styleClass="input" value="重 填"/>
              </td>
            </tr>
         
  </TABLE></div>
  
   <div class='awp_msgtab'>
	<table>
		<tr>
			<td>
				<p>
					<strong>系统提示：</strong>
				</p>
				
				发布类型：<br>
				前台:内容由系统前台使用者，在使用过程中自由添加，经过后台管理员审核（若需要）后，发布到系统中 。前台用户可以对该库进行新增和查询两类权限；
				<br>
				后台:内容由后台管理员从系统后台发布功能（业务管理-发布文章）进行发布及维护。系统前台用户只具有 查询权限，不能更新该库信息。
				<br>
				系统内:与系统内其他模块的查询功能，通过URL方式进行对接，实现知识库内容的集中展示；
				<br>
				显示类型：<br>
				文章显示:利用文章的模板展示详细界面，界面以展示库内容为主。<br>
				条目显示:利用条目的模板展示详细界面，界面以表现类别、条目关系为主。
				<br>
			</td>
		</tr>
	</table>
</div>
</html:form>
<script type="text/javascript">
init();
</script>
</BODY></div>
</html:html>
