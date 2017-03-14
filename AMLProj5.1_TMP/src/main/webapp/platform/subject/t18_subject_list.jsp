<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<%String root=request.getContextPath();
root="\""+root+"\"";%>

 
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<script language="JavaScript">

function dosubmit(theUrl){
 document.forms[0].action=<%=root%>+theUrl;
   document.forms[0].submit();
}

</script>
</head>



<body leftmargin="0" topmargin="0">
<div id="main">
	 
<html:form action="/subject/subject_list.do" method="post">
 <div class="conditions">
<div class="cond_t">
	  <span>
   科目维护 - 列表    </span>     
          <span class="buttons">
          <a href="#" id="hdd_display" class="bt_hidden"></a>
          
          <a href="#" onclick="dosubmit('/platform/subject/subject_type_modify.do?newsearchflag=1')"> 	   <img src="../../images/<%=session.getAttribute("style") %>/b_maintenance.png" />维 护</a>
   </span>
   </div>
  <html:errors/>
  <div class="cond_c"  id="searchtable">
 <table   border=0 cellPadding=0 cellSpacing=0  >
  
    
            <tr > 
              <td  >科目类型：</td>
              <td  >
            
            	   <html:select property="subject_flag" onchange="dosubmit('/platform/subject/subject_list.do?newsearchflag=1')">
　　　　　　　　　　<html:options collection="subject_typeMap" property="label" labelProperty="value" />
　　　　　　　　　　</html:select>	  
              </td>
            </tr>
          </table> 
 
 </div>
 </div>
  <div class="list">
  <table cellspacing="0" cellpadding="0" border=0>
    <tr  >
      <th>科目编码</th>
      <th width="25%">科目名称</th>
  
      <th width="25%">科目类别</th>
     </tr>
     <logic:notEmpty name="t18_config_subjectList">
 	        <logic:iterate id="t18_config_subjects" name="t18_config_subjectList" type="com.ist.platform.dto.T87_subject">
            <tr align="center" class="interval" onmouseover="this.classname='interval2'" onmouseout="this.classname='interval'">
          <td height=22>
          	<bean:write name="t18_config_subjects" property="subject_num"/>
         </td>
         <td height=22>
           <bean:write name="t18_config_subjects" property="subject_name"/>
         </td> 
       
         <td height=22>
         	<bean:write name="t18_config_subjects" property="subject_flag_disp"/>
         </td>                 
      </tr>
      </logic:iterate>
     </logic:notEmpty>
      </table>
     
  <logic:present name="pageInfo">
</logic:present>
 </div> 
 			<div class="list_page">
						<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				
  <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
	  <p>
	  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1、科目维护用来维护科目类型,用于后台导数之用。<br>
	  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2、在“列表”页面中选择一个科目类型，点维护按钮进入“修改”页面,可选择不同科目类型下的科目名称保存到“列表”页面选的科目类型下,此类型下原有的科目名称将自动册除
	 </p>
  </div>
</html:form>
</div>
</body>

</html>

