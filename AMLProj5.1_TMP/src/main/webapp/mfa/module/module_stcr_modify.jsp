<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script language="javascript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();  
}
function checkForm(theUrl){
  var errMsg ="";
  if(getLength(document.forms[0].case_minscore_str.value)==0){
      errMsg+="生成案例模型分值不能为空！";
      document.forms[0].case_minscore_str.focus();
   }
  else if(!checkNum(document.forms[0].case_minscore_str.value)){
      errMsg+="生成案例模型分值必须为正整数！";
      document.forms[0].case_minscore_str.focus();
  }
  if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
 }
</script>
</head>
<body class="mainbg">
<div id="main">
<html:form method="post" action="/module/module_stcr_modify.do">
<html:hidden property="module_no"/>
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>生成案例必须符合的关键特征</span>
	   <span class="buttons">
	    <a href="#" onClick="ymPrompt.win({message:'<%=request.getContextPath()%>/mfa/module/t23_module_stcr_search.do?module_no=<%=(String)request.getAttribute("module_no")%>&newsearchflag=1',width:600,height:330,title:'定位',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_add.png" />增加</a>
	 </span>
	 </div>
	 </div>
     
     <div class="list">
        <table border="0" cellpadding="0" cellspacing="0" id="tableid">
        <tr>
          		<th nowrap align="center">特征编号</th>
          		<th nowrap align="center" >特征名称</th>
          		<th noWrap align="center">操作</th>
       	</tr>
       	<logic:iterate id="t23_module_stcr" name="t23_module_stcrListType2" type="com.ist.mfa.dto.T23_module_stcr">
       	<%
       		java.util.HashMap map = new java.util.HashMap();
       		map.put("module_no", t23_module_stcr.getModule_no());
			map.put("keystcr", t23_module_stcr.getKeystcr());
			pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
		%>
       	<tr>
       		<td><bean:write name="t23_module_stcr" property="keystcr" scope="page" />
          	</td>
          	<td><bean:write name="t23_module_stcr" property="pbc_des" scope="page" />
          	</td>
          	<td>
          		<html:link name="map" page="/module/update_module_stcr_type.do">
					<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" />
				</html:link>
			</td>
		</tr>
       	</logic:iterate>
        </table>
     </div>
     
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><font color="#FF0000">*</font>生成案例模型分值 >= </td>
            <td colspan="3">
             <html:text property="case_minscore_str"  size="15"/>
            </td>
          </tr>
           <tr>
           	<td></td>
            <td align="center" colspan="3"><input name="" type="button" class="in_button1" value="提 交" onclick="checkForm('module_stcr_modify_do.do')" />
              <input name="" type="reset" class="in_button1" value="重 置" />
            </td>
          </tr>
        </table>
        </div>
     </div>
     
    </div>
  </div>
</html:form>
</body>
</html>
