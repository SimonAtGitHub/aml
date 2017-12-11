<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT language="JavaScript" src="../../js/App_Select.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
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
function checkID(numstr){
var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='X'&& TempChar!='x'&&TempChar!='-'){
            i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
function checkForm(theUrl){
    var record_type='<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>';
    //alert("record_type:  "+record_type);
    var errMsg="";
    errMsg+=getCreate_dt_end_disp(record_type);
    errMsg+=getCreate_dt_disp(record_type);
    errMsg+=getContent(record_type);
    errMsg+=getRecord_obj(record_type);
    errMsg+=getRemark1(record_type);
    errMsg+=getRemark2(record_type);
    errMsg+=getRemark3(record_type);
    
    errMsg+=getRemark4(record_type);   // add by lixx 2010.10.22
    
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

//create_end_dt_disp
function getCreate_dt_end_disp(record_type){
    var errMsg ="";
    if(record_type=="4"){
       if (getLength(document.forms[0].create_end_dt_disp.value)==0) {
          errMsg+="审计期限不能为空！\n";
          document.forms[0].create_end_dt_disp.focus();
       }     
       if(errMsg=="" && _compareTwoDateForString(document.forms[0].create_end_dt_disp.value,document.forms[0].create_dt_disp.value)){
          errMsg+="审计期限开始时间不能大于结束时间！\n";
       }
    }
   return errMsg; 
}

//create_dt_disp
function getCreate_dt_disp(record_type){
   var errMsg ="";
   if (getLength(document.forms[0].create_dt_disp.value)==0) {
       if(record_type=="1"){
          errMsg+= "培训时间不能为空！\n";
       }else if(record_type=="2"){
          errMsg+= "活动时间不能为空！\n";
       }else if(record_type=="3"){
          errMsg+= "制定时间不能为空！\n";
       }else if(record_type=="4"){
          errMsg+= "审计期限不能为空！\n";
       }else if(record_type=="5"){
          errMsg+= "协助时间不能为空！\n";
       }
       document.forms[0].create_dt_disp.focus();
   }
   return errMsg;  
}
//content
function getContent(record_type){
   var errMsg ="";
   if (getLength(document.forms[0].content.value)==0) {
       if(record_type=="1"){
          errMsg+= "培训内容不能为空！\n";
       }else if(record_type=="2"){
          errMsg+= "宣传内容不能为空！\n";
       }else if(record_type=="3"){
          errMsg+= "主要内容不能为空！\n";
       }else if(record_type=="4"){
          errMsg+= "审计项目名称及主要内容不能为空！\n";
       }else if(record_type=="5"){
          errMsg+= "协助内容不能为空！\n";
       }
       document.forms[0].content.focus();
   }
   return errMsg;  
}

//remark1
function getRemark1(record_type){
   var errMsg ="";
   if (getLength(document.forms[0].remark1.value)==0) {
       if(record_type=="1"){
          errMsg+= "培训对象不能为空！\n";
       }else if(record_type=="2"){
          errMsg+= "参加人数不能为空！\n";
       }else if(record_type=="3"){
          errMsg+= "制度名称不能为空！\n";
       }else if(record_type=="4"){
          errMsg+= "审计发现的主要问题不能为空！\n";
       }else if(record_type=="5"){
          errMsg+= "效果不能为空！\n";
       }
       document.forms[0].remark1.focus();
   }
   if(record_type=="2"){
     if(!checkNum(document.forms[0].remark1.value)){
        errMsg+= "参加人数必须是数字！\n";
        document.forms[0].remark1.focus();
     }
   }
   return errMsg;  
}

//remark2
function getRemark2(record_type){
   var errMsg ="";
   if(record_type=='4')return errMsg;
   if (getLength(document.forms[0].remark2.value)==0) {
       if(record_type=="1"){
          errMsg+= "参加人数不能为空！\n";
       }else if(record_type=="2"){
          errMsg+= "发放材料份数不能为空！\n";
       }else if(record_type=="3"){
          errMsg+= "相关文号不能为空！\n";
       }else if(record_type=="5"){
          errMsg+= "协助单位(公安机关/其他机关)不能为空！\n";
       }
       document.forms[0].remark2.focus();
   }
   if(record_type=="1"){
     if(!checkNum(document.forms[0].remark2.value)){
        errMsg+= "参加人数必须是数字！\n";
        document.forms[0].remark2.focus();
     }
   }
   if(record_type=="2"){
     if(!checkNum(document.forms[0].remark2.value)){
        errMsg+= "发放材料份数必须是数字！\n";
        document.forms[0].remark2.focus();
     }
   }
   return errMsg;  
}

//remark3
function getRemark3(record_type){
   var errMsg ="";
   if(record_type!='1' && record_type!='2' && record_type!='4')return errMsg;
   if (getLength(document.forms[0].remark3.value)==0) {
       if(record_type=="1"){
          errMsg+= "培训方式不能为空！\n";
       }else if(record_type=="2"){
          errMsg+= "宣传方式不能为空！\n";
       }else if(record_type=="4"){
          errMsg+= "问题整改情况不能为空！\n";
       }
       document.forms[0].remark3.focus();
   }
   return errMsg;  
}

//record_obj
function getRecord_obj(record_type){
   var errMsg ="";
   if(record_type!='3' && record_type!='4' && record_type!='5')return errMsg;
   if (getLength(document.forms[0].record_obj.value)==0) {
       if(record_type=="3"){
          errMsg+= "制定部门不能为空！\n";
       }else if(record_type=="4"){
          errMsg+= "审计部门名称不能为空！\n";
       }else if(record_type=="5"){
          errMsg+= "被协助部门不能为空！\n";
       }
       document.forms[0].record_obj.focus();
   }
   return errMsg;  
}

function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

//remark4 add lixx 2010.10.22
function getRemark4(record_type){
   var errMsg ="";
   if(record_type=="5"){
     if (getLength(document.forms[0].remark4.value)==0 || getLength(document.forms[0].remark5.value)==0 ||
     getLength(document.forms[0].remark6.value)==0 || getLength(document.forms[0].remark7.value)==0 ||
     getLength(document.forms[0].remark8.value)==0 || getLength(document.forms[0].remark9.value)==0 ||
     getLength(document.forms[0].remark10.value)==0 || getLength(document.forms[0].remark11.value)==0 ||
     getLength(document.forms[0].remark12.value)==0) {
       errMsg+= "打击洗钱活动信息的次数、份数、金额不能为空！\n";
       document.forms[0].remark1.focus();
     }else{
	     if(!checkNum(document.forms[0].remark4.value) || !checkNum(document.forms[0].remark5.value) || 
	     !checkNum(document.forms[0].remark7.value) || !checkNum(document.forms[0].remark9.value) ||
	     !checkNum(document.forms[0].remark11.value)){
	        errMsg+= "打击洗钱活动信息的次数、份数必须是数字！\n";
	        document.forms[0].remark1.focus();
	     }
	     if(!checkPrice(document.forms[0].remark6.value) ||!checkPrice(document.forms[0].remark8.value) || 
	     !checkPrice(document.forms[0].remark10.value) || !checkPrice(document.forms[0].remark12.value)){
	        errMsg+= "涉及金额的信息必须符合小数点后两位的格式（如：0.00）！\n";
	        document.forms[0].remark1.focus();
	     }
	 }
   }
   return errMsg;  
}
//end add

</script>

</HEAD>

<BODY leftmargin=0 topmargin=0>
<html:form method="post" action="/record/t07_record_modify.do">
  <html:hidden name="t07_recordActionForm" property="record_id"/>
  <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span><jsp:include flush="true" page="get_record_name.jsp"></jsp:include>- 修 改</span>
	  <span class="buttons">
	  
	  <a href="javascript:history.back(-1);"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
 </span>
	</div>
  
  
  <html:errors/>
  <div class="cond_c" >
	<TABLE border="0" cellpadding="0" cellspacing="0">
    <jsp:include flush="true" page="record_add_index.jsp"></jsp:include>
      <tr >
        <td  align="left"  class="in_button" colspan="2">
	             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	               &nbsp; &nbsp;    <input type=button value="提 交" name=Button22 onClick="checkForm('t07_record_modify_do.do?record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>')">
                   &nbsp; &nbsp;<html:reset  value="重 置"/>
	              </td>
      </tr> 
   
  </TABLE>
  </div>
   
  </div>
</html:form>
</BODY>
</html>
