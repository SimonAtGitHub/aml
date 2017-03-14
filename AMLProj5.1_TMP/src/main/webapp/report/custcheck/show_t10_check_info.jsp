<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.TreeMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<script type='text/javascript' src='/report/case/dwr/interface/CountryArea.js'></script>
<script type='text/javascript' src='/report/case/dwr/engine.js'></script>
<script type='text/javascript' src='/report/case/dwr/util.js'></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
	else if(type=='adit'){
        if(checkRadio(form1.username)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要删除选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要暂停选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要激活选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        location.href=theUrl+"&"+Math.random();
    }
    if(isSub && errMsg==''){
        document.form1.action=theUrl;
        document.form1.submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
   
        document.form1.action=url;
        document.form1.submit();
   
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
function checkForm(theUrl){
   
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function add_row(divid,butttonid,resultid)
{
	
	var tag=document.getElementById(resultid).value;
	if(tag=='1'){
		document.getElementById(butttonid).value="取消";
		document.getElementById(divid).style.display = "inline";
		document.getElementById(resultid).value="2";
	}
	if(tag=='2'){
		document.getElementById(butttonid).value="添加";
		document.getElementById(divid).style.display = "none";
		document.getElementById(resultid).value="1";
	}
	
}
function add_do(tagid,tableid,theUrl){
	  var tagresut=document.getElementById(tagid).value;
	  var amt=document.getElementById('amt').value;
	  if(isNaN(amt)){
		  alert('请输入正确的数字');   
	        return false;
	  }
	  if(tagresut==1){
        alert('先添加，后保存');   
        return false;
	   } 
	   
    document.forms[0].action=theUrl+'?tablename='+tableid;
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
function dosubmit(){
	
	var checkresult=document.getElementById('check_result').value;
	if(checkresult==''){
		 alert('调查结论为必填项');
	        return false;
		}
	var tablename="";
	var valid_dt_disp=document.getElementById('valid_dt_disp').value;
	if(valid_dt_disp==''){
        alert('调查结论有效期为必填项');
        return false;
	}
	CountryArea.getcustTableName(checkresult,function(data){
		  if(data=='black'){
			  var con =confirm('是否将该客户加入黑名单');
			  if(con){
				  document.forms[0].action='modifyT10_colu_result.do?tablename=T07_BLACKLIST&custtype=1';
				  document.forms[0].submit();
			   }else{
				   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
				 document.forms[0].submit();
			}
		   }
		  else if(data=='white'){
			  var con =confirm('是否将该客户加入白名单');
			  if(con){
				  document.forms[0].action='modifyT10_colu_result.do?tablename=T07_WHITELIST_INFO&custtype=1';
				  document.forms[0].submit();
			   }else{
				   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
					 document.forms[0].submit();
			}
			  
		   }else{
			   document.forms[0].action='modifyT10_colu_result.do?custtype=1';
				 document.forms[0].submit();
			}
		});
	
}
</script>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main"> 

<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>已识别客户历史详情</span>
	  <span class="buttons">
	    <a href="#" onclick="javascript:window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关闭</a>
	   </span>
	</div>
	<div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <th>识别类型</th>
	  <th>调查日期</th>
	  <th>结论有效期</th>
	  <th>调查结论</th>
	  <th>调查情况说明</th>
	  <th>调查人</th>
	  <th>调查人机构</th>
	 </tr>
    <logic:iterate id="result" name="t47_clientList" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
    <tr>
    
       <td>
         <bean:write name="result" property="check_type" scope="page" />
       </td>
	     <td>
         <bean:write name="result" property="card_due_dt_disp" scope="page" />
       </td>
	     <td>
         <bean:write name="result" property="valid_dt_disp" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="check_result" scope="page" />
       </td> 
       <td>
         <bean:write name="result" property="check_explain" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="checker" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="checker_org" scope="page" />
       </td>
       </tr>
	</logic:iterate>
  	</table>
  </div>
	  
 </div>
</div>

</BODY>
</HTML>
