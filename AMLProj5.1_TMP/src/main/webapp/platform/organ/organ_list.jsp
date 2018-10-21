<%@ page contentType="text/html; charset=GBK" %>
<%@page import="com.ist.common.AuthBean"%>
<%@page import="com.ist.common.Authorization"%>
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

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
	
<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫɾ��ѡ��Ļ�����')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
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
function dosubmit1(theUrl){
       document.forms[0].action=theUrl;
       document.forms[0].submit();
}
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
</script>
	</head>
	<body class="mainbg">
<html:form action="/organ/organ_list.do" method="post">
  <html:errors/>
<%

String path=(String)request.getAttribute("path");
while(path.indexOf("\\")!=-1){
  int index=path.indexOf("\\");
   path=path.substring(0,index)+"/"+path.substring(index+1);
}


//modufy by qiuyun 2011-6-16 �����ļ�����ǰ�ӵ�ǰ��¼�û�������
//Ϊ��֧�ָ��������еķ��˶��������Լ���������룬��������
	AuthBean authBean=(AuthBean)request.getSession().getAttribute("authBean");
	Authorization auth= authBean.getAuthToken();
	String userOrgankey=auth.getT00_user().getOrgankey();
	int index=path.lastIndexOf("/");
	path=path.substring(0,index+1)+userOrgankey+path.substring(index+1);	
	
//end 

 %>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>��������</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
  <a href="#" onclick="dosubmit('organ_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a> 
	  <a href="#" onclick="dosubmit('organ_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
	  <a href="#" onclick="dosubmit('organ_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
	  <a href="#" onclick="dosubmit1('t00_organ_create.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />���������ļ�</a>
	  <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/download_organ.jsp?url=<%=path%>','','height=160, width=300,left=100,top=100');"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />���������ļ�</a>
	  </span>
	</div>
	<%if((String)request.getAttribute("errors1")!=null){ %>
	
			 <font color="#FF0000" size="2"> <bean:write  name="errors1"  /></font>
		
		<% }%>
	<!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>������:</td>
         <td><html:text property="organkey_s"  /></td>
        <td>�������ƣ�</td>
          <td ><html:text property="organname_s" /></td>
        </tr>
	    <tr>
			<td>��������</td>
			<td><html:select property="organlevel_s">
				<html:options collection="organlevelMap" property="label"
			      labelProperty="value" />
				</html:select>
		    </td>

		    <td >�ϼ�������: </td>
		    <td><html:text property="uporgankey_s" />
		    <input type="button" name="ok" class="in_button1" value="�� ѯ" onclick="dosubmit('organ_list.do?newsearchflag=1','search')" />
	         </td>
			</tr>
								
	  </table>
	</div>
  </div>	
   <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  	<th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
		<th>������</th>
		<th>��������</th>
		<th>��������</th>
		<th>������������</th>
		<th>֧��ϵͳ�к�</th>
		<th>���ڻ�������</th>
		<th>�Ƿ�羳</th>
		<th>��ϵ��</th>
		<th>��ϵ�绰</th>
	  </tr>
<logic:iterate id="organ" name="t00_organList" type="com.ist.platform.dto.T00_organ">
<%
java.util.HashMap map = new java.util.HashMap();
map.put("organkey",organ.getOrgankey());
pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
%>
    <tr>
      <td>
          <html:multibox property="selectedOrgankey">
              	<bean:write name="organ" property="organkey"/>
          </html:multibox>
      </td>
      <td><bean:write name="organ" property="organkey"/></td>
      <td>
	  <html:link name="map" page="/organ/organ_disp.do"><bean:write name="organ" property="organname"/></html:link>
      </td>
      <td>
         <bean:write name="organ" property="organlevel_disp"/>
      </td>
      <td><bean:write name="organ" property="org_area"/></td>
            <td><bean:write name="organ" property="unionorgkey"/></td>
            <td><bean:write name="organ" property="organcode"/></td>
      <td><bean:write name="organ" property="overarea_ind_disp"/></td>
            
      <td><bean:write name="organ" property="linkman"/></td>
      <td><bean:write name="organ" property="telephone"/></td>
    </tr>
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

