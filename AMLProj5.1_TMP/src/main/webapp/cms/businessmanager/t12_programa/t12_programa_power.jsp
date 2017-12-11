<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
<html:base />
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script language="JavaScript" src="../../js/avpfunc.js"></script>
<script language="JavaScript">
	
	/**
	* 表单验证
	*/
	function checkForm(theUrl){
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	}
	
	function addtype(val){
	   var obj = document.getElementById("arttype");
	   if(val == "1"){
	   		obj.style.display="";
	   }else{
	   		obj.style.display="none";
	   }
	}
	function displaylayer(val){
	  var type = "<c:out value="${t12_programa_power.isartcategory}"/>";
	  	//增加文章类别
	  	if(type == "1"){
	  		addtype(type);
	  	}
	}
</script>
</HEAD>
<BODY>	<div id='content'>
<html:form method="post" action="/businessmanager/t12_programa/t12_programa_busi_power.do">
	<html:hidden property = "categorykey"/>
	<html:hidden property = "programakey"/>

  
  <div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目管理 - <bean:write name="t12_programa" property = "categorykey_disp"/> - 权限管理</span>
						</td>
						<td align="right">
							  <html:button property="backbutton" value="返  回" styleClass="input" onclick="awpDoSubmit('t12_programa_busi_list.do','add')"/>
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
              <td>
                 <bean:write name="t12_programa"  property="programaname" scope="request"/>
              </td>
            </tr>
            <tr>
             <td><font color="#FF0000">*</font>是否需要审核：</td>
              <td>
              	<html:radio property="isaudit" name="t12_programa_power" value="1">是</html:radio>
				<html:radio property="isaudit" name="t12_programa_power" value="0" >否</html:radio>
              </td>
            </tr>
            <tr>
              <td><font color="#FF0000">*</font>可否回复：</td>
           		<td>
              	 <html:radio property="isreply" name="t12_programa_power" value="1">是</html:radio>
				 <html:radio property="isreply" name="t12_programa_power" value="0">否</html:radio>
              </td>
            </tr>
            <tr>
              <td> 回复是否需要审核：</td>
             <td>
                 <html:radio property="isrepleyaudit" name="t12_programa_power" value="1">是</html:radio>
				 <html:radio property="isrepleyaudit" name="t12_programa_power" value="0">否</html:radio>
              </td>
            </tr>
           
            <tr>
             <td> 附件是否可下载：</td>
             <td>
                 <html:radio property="isdownload" name="t12_programa_power" value="1">是</html:radio>
				 <html:radio property="isdownload" name="t12_programa_power" value="0">否</html:radio>
              </td>
            </tr>
            
            <tr>
              <td> 密级：</td>
             <td>
                 <html:select property="secretlevel" name="t12_programa_power" >
                 <html:options collection="secLevMap" property="label" labelProperty="value" />
                 </html:select>
              </td>
            </tr>
            
			 <tr>
              <td>是否显增加文章类别：</td>
              <td>
                 <html:radio property="isartcategory" name="t12_programa_power" value="1" onclick="addtype('1');">是</html:radio>
				 <html:radio property="isartcategory" name="t12_programa_power" value="0" onclick="addtype('0');">否</html:radio>
              </td>
            </tr>
            
             <tr id="arttype" style="display:none">
              <td>引用类别：</td>
              <td>
                <html:select property="artcategorytype" name="t12_programa_power" >
                 <html:options collection="categoryMap" property="label" labelProperty="value" />
                 </html:select>         
                </td>
            </tr>
    
            <tr bgcolor="F6F9FF">
             <td>&nbsp;</td>
             <td><html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t12_programa_busi_power_do.do')"/>
                <html:reset styleClass="input" value="重 填"/>
              </td>
            </tr>
       
  </TABLE></div>
  
  
</html:form></div>
<script language="JavaScript">
	displaylayer();
</script>
</BODY>
</html:html>
