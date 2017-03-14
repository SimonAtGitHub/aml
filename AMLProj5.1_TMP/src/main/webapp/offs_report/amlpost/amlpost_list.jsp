<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="../../js/App_Select.js"></script>
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
            if(confirm('你真的要删除选择的机构和岗位设立情况吗？')){
                isSub = true;
            }
        }
    }else if(type=='add'){
        //location.href=theUrl+"&"+Math.random();
        //location.href=theUrl;
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else if(type=='search'){
    	
        sel=allSelect(0,"list2","value","");
        
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

function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    }
    
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}

function toExcel(url){
	<logic:present name="t07_amlpostList">
    <bean:size id="len" name="t07_amlpostList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
   document.forms[0].action=url;
   document.forms[0].submit();
}
</script>
</HEAD>

<BODY leftmargin="0" topmargin="0"  class="mainbg">

<html:form action="/amlpost/getT07_amlpost_list.do" method="post">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	 <span>机构和岗位设置</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a href="#" onclick="dosubmit('t07_amlpost_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	  <a href="#" onclick="dosubmit('t07_amlpost_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
	  <a href="#" onclick="dosubmit('t07_amlpost_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	  
	  <logic:greaterEqual value="1" name="size" scope="request" >
      <!--  <a href="#" onclick="dosubmit('t07_amlpost_xls.do','add')"> -->
       <a href="#" onclick="toExcel('export_t07_amlpostList.do')">
       <img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
      </logic:greaterEqual>
	  </span>
	</div>
  <div class="cond_c" >
	  <table border="0" cellpadding="0" cellspacing="0" id="searchtable">
       <tr>
         <td>部门名称 ：</td>
         <td> <html:text name="t07_amlpostActionForm" property="department"  size="20" maxlength="128"/> </td>
        <td align="right"> 单位负责人姓名：</td>
          <td > <html:text name="t07_amlpostActionForm" property="organ_username"  size="20" maxlength="128"/> </td>
        </tr>
	    <tr>
			<td> 单位负责人职务名称：</td>
			<td> <html:text name="t07_amlpostActionForm" property="organ_position"  size="20" maxlength="32"/> 
		    </td>

		    <td >单位负责人联系电话：</td>
		    <td>  <html:text name="t07_amlpostActionForm" property="organ_telephone"  size="20" maxlength="32"/> 
	         </td>
			</tr>
            <tr >
				<td >反洗钱部门负责人：</td>
				<td >
				 <html:text name="t07_amlpostActionForm" property="depart_username"  size="20" maxlength="128"/>
			    </td>

				<td >反洗钱部门联系电话：</td>
				<td>
				 <html:text name="t07_amlpostActionForm" property="depart_telephone"  size="20" maxlength="32"/> 
		    	</td>

			</tr>
			 <tr >
				<td >机构名称：</td>
				<td colspan="3" hight="40">
				 <bean:define id="organMultiSelHTMLStr" name="organMultiSelHTMLStr"></bean:define>
				<%=organMultiSelHTMLStr%>
		        </td>
            </tr>
            
		<tr >											
			<td align="right" colspan="4" class="in_button">

				<input type="button" name="button1" value="查 询"
					onclick="dosubmit('getT07_amlpost_list.do?newsearchflag=1','search')" >
				<input type="button" name="button1" value="清 空" 
					onclick="clearText()" >
			</td>
		</tr>
								
	  </table>
	</div>
  </div>
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
     <tr align=center>
      <th nowrap height="22"></th>
      <th nowrap></th>
      <th nowrap colspan="3" align="center">单位负责人</th>
      <th noWrap colspan="2" align="center">反洗钱部门负责人</th>
      <th nowrap colspan="2" align="center">反洗钱</th>
    </tr>
	  <tr>
	   <th >选择</th>
       <th nowrap>反洗钱机构名称（或职能部门名称）</th>
		<th>姓名</th>
		<th>职务名称</th>
		<th>联系电话</th>
		<th>姓名</th>
		<th>联系电话</th>
	
		<th>专职(人数)</th>
		<th>兼职(人数)</th>
	  </tr>
	  <logic:iterate id="amlpost" name="t07_amlpostList"
					type="com.ist.aml.offs_report.dto.T07_amlpost">
					
					<tr>
						<td >
							 <html:multibox property="user_id_selected">
              	<bean:write name="amlpost" property="user_id" ignore="true"/>
          </html:multibox>
						</td>
						 <TD><bean:write name="amlpost" property="department" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="organ_username" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="organ_position" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="organ_telephone" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="depart_username" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="depart_telephone" ignore="true"/></TD>
      <TD><bean:write name="amlpost" property="full_time_num" ignore="true"/></TD> 
      <TD><bean:write name="amlpost" property="part_time_num" ignore="true"/></TD>
					</tr>
				</logic:iterate>
   </table>
  </div>		
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
  </div>
</html:form>
</BODY>
</HTML>
