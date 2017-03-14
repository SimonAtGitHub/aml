<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html>
	<head>
	<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script language="JavaScript" src="../../js/App_Select.js"></script>

<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
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
            if(confirm('你真的要删除选择的记录吗？')){
                isSub = true;
            }
        }
    }else if(type=='add'){
        //location.href=theUrl+"&"+Math.random();
        location.href=theUrl;
    }else if(type=='search'){
        sel=allSelect(0,"list2","value","");
        if(!_isDateSpaceComplete(document.forms[0].create_dt_disp.value, document.forms[0].create_dt_end_disp.value)){
       		errMsg = "请填写完整的起始时间范围！";
       		}
    	   else if(!_compareTwoDateForString(document.forms[0].create_dt_disp.value, document.forms[0].create_dt_end_disp.value)) {
    			 errMsg = "开始时间不能大于结束时间";	
    		}
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

function fPopUpCalendarDlg(ctrlobj)
{
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

function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text")continue;
       ele[i].value="";
    }
    
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}

function toExcel(url){
   document.forms[0].action=url;
   document.forms[0].submit();
}

</script>
</HEAD>

<BODY leftmargin="0" topmargin="0">
<html:form action="/record/gett07_record_list.do" method="post">
<div id="main">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	 <span> <jsp:include flush="true" page="get_record_name.jsp"></jsp:include></span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a href="#" onClick="dosubmit('t07_record_add.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	  <a href="#" onClick="dosubmit('t07_record_modify.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
	  <a href="#" onClick="dosubmit('t07_record_delete_do.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	  <logic:greaterEqual value="1" name="size" scope="request" >
      <!--  <a href="#" onClick="dosubmit('t07_record_xls.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','add')">  -->
       <a href="#" onClick="toExcel('export_t07_recordList.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','add')">
       <img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
      </logic:greaterEqual>
	  </span>
	</div>
  
  <html:errors/>
  
  <jsp:include flush="true" page="record_search.jsp"></jsp:include>
  
  <jsp:include flush="true" page="record_list_index.jsp"></jsp:include>
  
  <table width="98%" align="center" border="0" cellpadding="3" cellspacing="3">
    <tr>
      <td align="center"><bean:write name="pageInfo" scope="request" filter="false" ignore="true"/></td>
    </tr>
  </table>
  </div>
  </div>
</html:form>
</BODY>
</HTML>
