<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html; charset=GBK"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
	<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
	<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
	<%@ page import="com.ist.aml.report.dto.T47_transaction"%>

	<head>
		<%
			String url = request.getContextPath();
			String basefuncurl = url + "/js/basefunc.js";
			String app_selecturl = url + "/js/App_Select.js";

			String valurl = url + "/js/validate.js";
			String countryurl = url + "/js/country.js";
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=valurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<%
			String tx_occur_area2 = "0";
			String tx_occur_area1 = "0";
			String tx_occur_area = "0";
			String tx_go_area2 = "0";
			String tx_go_area1 = "0";
			String tx_go_area0 = "0";
			String chinavalueflag = "0";
			if (request.getAttribute("p_areavalue") != null)
				chinavalueflag = (String) request.getAttribute("p_areavalue");
			T47_transaction t47_transaction = (T47_transaction) request
					.getAttribute("t47_transaction");
			String validateflag = t47_transaction.getValidateflag();

			if (t47_transaction.getTx_occur_area2() != null
					&& !"".equals(t47_transaction.getTx_occur_area2().trim()))
				tx_occur_area2 = t47_transaction.getTx_occur_area2();
			if (t47_transaction.getTx_occur_area1() != null
					&& !"".equals(t47_transaction.getTx_occur_area1()))
				tx_occur_area1 = t47_transaction.getTx_occur_area1();
			if (t47_transaction.getTx_occur_area() != null
					&& !"".equals(t47_transaction.getTx_occur_area()))
				tx_occur_area = t47_transaction.getTx_occur_area();

			if (t47_transaction.getTx_go_area2() != null
					&& !"".equals(t47_transaction.getTx_go_area2().trim()))
				tx_go_area2 = t47_transaction.getTx_go_area2();
			if (t47_transaction.getTx_go_area1() != null
					&& !"".equals(t47_transaction.getTx_go_area1().trim()))
				tx_go_area1 = t47_transaction.getTx_go_area1();
			if (t47_transaction.getTx_go_area() != null
					&& !"".equals(t47_transaction.getTx_go_area().trim()))
				tx_go_area0 = t47_transaction.getTx_go_area();

			String cashind = "";
			if (t47_transaction.getCash_ind() != null
					&& !"".equals(t47_transaction.getCash_ind())) {
				cashind = t47_transaction.getCash_ind();
			}
			String alertType = "BS";
			if (validateflag.equals("1") || validateflag.equals("3"))
				alertType = "BH";
		%>


		<script language="JavaScript">
var alert_type='<%=alertType%>';
var _st = window.setTimeout;
window.setTimeout = function(fRef, mDelay) {
 if(typeof fRef == 'function'){
  var argu = Array.prototype.slice.call(arguments,2);
  var f = (function(){ fRef.apply(null, argu); });
  return _st(f, mDelay);
 }
 return _st(fRef,mDelay);
}
		function card_inf_exp(type,value){
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
				validate_type(value);
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				showValidateMsg($$(value,0),'4','');
				var validate_typeNode=document.getElementById(type);
				var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}
			}
		}else{
			var agent_card_type_value=document.forms[0].agent_card_type.value;
			var opp_card_type_value=document.forms[0].opp_card_type.value;
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_inf.style.visibility='hidden';
				showValidateMsg($$('card_inf',0),'4','');
			}else {
				document.forms[0].card_inf.focus();
				validate_type('card_inf');
			}
			
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
			
				document.forms[0].opp_card_inf.style.visibility='hidden';
				showValidateMsg($$('opp_card_inf',0),'4','');
				
			}else {
				
				document.forms[0].opp_card_inf.focus();
				validate_type('opp_card_inf');
			}
		}
		}
function validate_type(value){
			var validate_type_value=eval('document.forms[0].'+value+'.value');		
			if(getLength(validate_type_value)>30||getLength(validate_type_value)<4
			||IndexSpaceLast(validate_type_value)>0){
				showValidateMsg($$(value,0),'2','请输入证件的详细信息，左右不能有空格，并且在4至30个字符之内!');
			}else{
			    showValidateMsg($$(value,0),'3','');
			}
		}
function inputConfim(theUrl){
	if(checkAnyValidating()){
		window.setTimeout(inputConfim,100,theUrl);
	}else{
		if(!checkAllValidate()){ 
			return false; 
		} 
		else{ 
			document.forms[0].action=theUrl; 
			document.forms[0].submit();
		}
	}
}
/*
 * check any Validating by ajax
*/
function checkAnyValidating() {
	
	for(var i=0; i<g_ArrMsg.length; i++) {		
		var msg = g_ArrMsg[i].ps;		
		if(msg == "VALIDATING") {
			return true;
		} 
	}
	return false;
}
		
var valflag=<%=validateflag%>;
//将字符串转化成javascript中的数组
arrItem1=getArrayArea();

//初始化下拉筐
var  occur_area1="<%=tx_occur_area1%>";
var occur_area2="<%=tx_occur_area2%>";
var occur_area="<%=tx_occur_area%>";
var  go_area1="<%=tx_go_area1%>";
var go_area2="<%=tx_go_area2%>";
var go_area0="<%=tx_go_area0%>";
var chinavalueflag="<%=chinavalueflag%>";


function IndexSpace(str2){
         var str1 = " ";
        var s = str2.indexOf(str1);
        return(s);
 }
function IndexSpaceLast(str2){
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==" ")||(str2.substr(0,1)==" ")){
         return(1);
         }
         }
 }
function _Click(fromstr,tostr,type){
 var arrItem;
   if(type=="1"){
  // arrItem=arrItem2;
   }else{
     arrItem=arrItem1;
   }
   changelocation(fromstr,tostr,arrItem);
}

function  _DispRep(country,rowid,rowidreplay,type){
    var countryobj=eval('document.forms[0].'+country);
	var rowobj=eval('document.all.'+rowid);
	var rowobj1=eval('document.all.'+rowidreplay);
     var index=countryobj.selectedIndex; 
   var selvalue=countryobj.value;

   if(selvalue=="CHN"||selvalue=="Z01"||selvalue=="Z02"||selvalue=="Z03"){
   
    rowobj.style.display="";
    rowobj1.style.display="none";
     if(type=="1"){
     changeArea('tx_occur_area1','tx_occur_area2',arrItem1,'tx_occur_area',occur_area2,'1');
     }
     if(type=="2"){
     changeArea('tx_go_area1','tx_go_area2',arrItem1,'tx_go_area',go_area2,'1'); 
     } 
   }else{
     rowobj.style.display="none";
     rowobj1.style.display="";
   }

}

		
		
		var g_appid = "2";
				
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // 验证提示框
			//	g_ArrMsg.pop();
			//g_changed = true;
			//validate($$('acct_num',0), '', '')
			//g_changed = true;
			//validate($$('transactionkey',0), '', '');
	     
			g_changed = true;
			validate($$('agent_name',0), '', 'agent_card_type');
			g_changed = true;
			validate($$('agent_card_no',0), 'agent_card_type', '');
		   
			//g_changed = true;
			//validate($$('use_des',0), '', '');
			if(valflag=='1' ||valflag=='3'){
			g_changed = true; 
			   validate($$('org_trans_rela',0), 'rltp_hash', '');
			   g_changed = true;
				validate($$('organ_code',0), '', 'organ_code_type');
				g_changed = true;
				validate($$('organname',0), '', '');
				g_changed = true;
				validate($$('organ_area',0), '', '');
				
			}	
			//g_changed = true;
			//validate($$('opp_organname',0), '', '1');
			//g_changed = true;
			//validate($$('opp_organkey',0), '', 'opp_organ_type');
			//g_changed = true;
			//validate($$('opp_name',0), '', 'opp_card_type');
			g_changed = true;
			validate($$('opp_card_no',0), 'opp_card_type', '');
			//g_changed = true;
			//validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');	
			//g_changed = true;
			//set_tx_occur_allValue();
			g_changed = false;
		    var agent_name=document.forms[0].agent_name.value;
			var agent_card_type=document.forms[0].agent_card_type.value;
			var agent_card_no=document.forms[0].agent_card_no.value;
			var agent_country=document.forms[0].agent_country.value;
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','代办人信息其中有一项为空时，所有代办人信息字段都应空，其中一项非空时，所有都必须非空');
			}
			
			validateDetail2('all');
			//document.forms[0].save.disabled = false;
		}
		function validateAgent() {
　　　　　　 　var agent_name=document.forms[0].agent_name.value;	
			var agent_card_type=document.forms[0].agent_card_type.value;
			var agent_card_no=document.forms[0].agent_card_no.value;
			var agent_country=document.forms[0].agent_country.value;
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','代办人信息其中有一项为空时，所有代办人信息字段都应空，其中一项非空时，所有都必须非空');
			}
		}
		
function validateDetail2(type) {
	   if(type=='all'||type=='acct_num'){
           g_changed = true; 
           if(valflag==3){
			    validate1($$('acct_num',0), '', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }else{
		        validate1($$('acct_num',0), '', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		}
	   if(type=='all'||type=='acct_type'){
           		g_changed = true; 
           	 if(valflag==3){
			    validate1($$('acct_type',0), 'pbc_catp', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
	         }else{
	            validate1($$('acct_type',0), 'pbc_catp', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
	         }
		}
		if(type=='all'||type=='opp_organname'){
		if(valflag==3){
		      g_changed = true;
              validate1($$('opp_organname',0), '', '1','',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
            }else{
		      g_changed = true;
			  validate1($$('opp_organname',0), '', '1',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		 }
		if(type=='all'||type=='opp_organkey'){
		    g_changed = true;
		    validate1($$('opp_organkey',0), '', 'opp_organ_type',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
         }
        if((type=='all'||type=='opp_organarea')&&valflag!=1){
		    g_changed = true;
		    set_opp_area_allValue();
		    validate1($$('opp_organarea',0), 'cfrc', '','BS',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
        }
        if(type=='all'||type=='opp_organ_type'){
            g_changed = true;
			validate1($$('opp_organ_type',0), 'cfct_hash', '',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
         }
        if(type=='all'||type=='opp_name'){
           if (valflag==2||valflag==3){
			    g_changed = true;
			    if(valflag==3&&get_opp_country('opp_country','opp_area1','opp_area2','opp_area')=='')
			     validate1($$('opp_name',0), '', 'opp_card_type','BS',get_obj_value('receive_pay_cd'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
			     else 
			     validate1($$('opp_name',0), '', 'opp_card_type','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		    else{
			    g_changed = true;
			    validate1($$('opp_name',0), '', 'opp_card_type',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		}
		if(type=='all'||type=='opp_acct_num'){
           if(valflag==3){
               g_changed = true;
			   validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
            }else if (valflag==1){
			    g_changed = true;
			    validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }else if (valflag==2){
			    g_changed = true;
			    validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
        }
        if(type=='all'||type=='tx_occur'){
            g_changed = true;
            set_tx_occur_allValue();
            if(valflag==3){
              g_changed = true;
              validate1($$('tx_occur',0), 'trcd', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
            }else{
              g_changed = true;
			  validate1($$('tx_occur',0), 'trcd', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
           }		
		}
		if((type=='all'||type=='tx_go')&&valflag!=2){
            g_changed = true;
            set_tx_go_allValue();
			validate1($$('tx_go',0), 'tdrc', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		}
		if(type=='all'||type=='use_des'){
          if (valflag==3){
			g_changed = true;
			validate1($$('use_des',0), '', '','BS',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		  }else{
		    g_changed = true;
			validate1($$('use_des',0), '', '',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		  }
		    
        }
        if(type=='all'||type=='settle_type_cd'){
            var settle_type_cd_val=get_obj_value('settle_type_cd');
            if(settle_type_cd_val==null||settle_type_cd_val=='')
            {
            　　showValidateMsg($$('settle_type_cd',0),'2','结算方式不能为空');
            }else{
				showValidateMsg($$('settle_type_cd',0),'4','');
			}
        }
        //Begin  2009-05-18 修改
       if(type=='all'||type=='opp_card_no'){
           		g_changed = true;
			    validate1($$('opp_card_no',0), 'opp_card_type', '','',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		}
        //end   2009-05-18 修改
       //试点增加验证：当交易方式为20(网上支付)时，涉外交易代码填写IP
       <% String isTestPoint=(String)request.getAttribute("isTestPoint");
       	  if("1".equals(isTestPoint))
       	  {
       %>
	       if(type=='all')
	       {	
	    	   des_disp2();
	       }
	  <%}%>
	}
				

		function set_tx_occur_allValue()
		{
			var tx_occur=get_opp_country('tx_occur_country','tx_occur_area1','tx_occur_area2','tx_occur_area');
			document.forms[0].tx_occur.value=tx_occur;
		}
		function set_tx_go_allValue()
		{
			var tx_occur=get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area');
			document.forms[0].tx_go.value=tx_occur;
		}
		function set_opp_area_allValue()
		{
			var tx_occur=get_opp_country('opp_country','opp_area1','opp_area2','opp_area');
			document.forms[0].opp_organarea.value=tx_occur;
		}
		</script>
		<script type="text/javascript">
		
function _Confim(url){
	
			var errMsg ="";
			
			var nowDate = new Date();
			var str = nowDate.getFullYear()+"-"+(nowDate.getMonth() + 1)+"-"+nowDate.getDate();
			if(!_compareTwoDateForString(document.forms[0].dt_time_disp.value,str))
			{
				errMsg = "交易日期不能大于当前系统日期";
			}
				
	if ((document.forms[0].agent_card_type.value=='19')&&(getLength(document.forms[0].card_inf.value)>30||getLength(document.forms[0].card_inf.value)<=0)) {
        errMsg = "请写入详细的类型信息或者证件类型的注释应小于30个字符！";
    }
	if ((document.forms[0].opp_card_type.value=='19' || document.forms[0].opp_card_type.value=='29')&&(getLength(document.forms[0].opp_card_inf.value)>30||getLength(document.forms[0].opp_card_inf.value)<=0)) {
        errMsg = "请写入详细的类型信息或者证件类型的注释应小于30个字符！";
    }	
   //业务标识码
   // if (getLength(document.forms[0].transactionkey.value)==0) {
   //     errMsg = "业务标识码不能为空！";
  //      document.forms[0].transactionkey.focus();
 //   } //资金收付标识
   

   // var index1=document.forms[0].receive_pay_cd.selectedIndex;
   // if(document.forms[0].receive_pay_cd.options[index1].value==""){
   //   errMsg+="收付标志不能为空  ";
   // }
  //  var index2=document.forms[0].currency_cd.selectedIndex;
  //  if(document.forms[0].currency_cd.options[index2].value==""){
 //    errMsg+="币种标志不能为空  ";
  //  }
    

   
  //资金来源和用途
     if (getLength(document.forms[0].use_des.value)>128) {
        errMsg = "资金来源和用途不能多于128个字符！";
      
    }
   
     // 对方金融机构网点名称
     if (getLength(document.forms[0].opp_organname.value)>256) {
        errMsg = "对方金融机构网点名称不能多于256个字符！";
    }
  
     //账号
  //if (getLength(document.forms[0].acct_num.value)>24) {
   //     errMsg = "账号不能多于24个字符！";
   // }
     if(getLength(document.forms[0].tx_no.value)==0){
			 errMsg = "流水号不能为空！";
	 }
 
     // 交易代办人姓名
     if (getLength(document.forms[0].agent_name.value)>10) {
        errMsg = "交易代办人姓名不能多于10个字符！";
    }
 
     //交易代办人身份证件号码
    if (getLength(document.forms[0].agent_card_no.value)>20) {
        errMsg = "交易代办人身份证件号码不能多于20个字符！";
    }
   
      //对方金融机构网点代码
     if (getLength(document.forms[0].opp_organkey.value)>24) {
        errMsg = "对方金融机构网点代码不能多于24个字符！";
    }
  
     //交易对手姓名
     if (getLength(document.forms[0].opp_name.value)>64) {
        errMsg = "交易对手姓名不能多于64个字符！";
    }

    //交易对手证件号码
     if (getLength(document.forms[0].opp_card_no.value)>24) {
        errMsg = "交易对手证件号码不能多于24个字符！";
    }

    //交易对手账号
     if (getLength(document.forms[0].opp_acct_num.value)>64) {
        errMsg = "交易对手账号不能多于64个字符！";
    }
    //账号
    else if (IndexSpace(document.forms[0].acct_num.value)>0) {
        errMsg = "账号前后或中间不能出现空格！";
       document.forms[0].acct_num.focus();
    }
     //交易代办人身份证件号码
    else if (IndexSpace(document.forms[0].agent_card_no.value)>0) {
        errMsg = "代办人身份证件号码前后或中间不能出现空格！";
       document.forms[0].agent_card_no.focus();
    }
     //业务标识码
   // else if (IndexSpace(document.forms[0].transactionkey.value)>0) {
   //     errMsg = "业务标识码前后或中间不能出现空格！";
    //   document.forms[0].transactionkey.focus();
   // }
    //对方金融机构网点代码
    else if (IndexSpace(document.forms[0].opp_organkey.value)>0) {
        errMsg = "对方金融机构网点代码前后或中间不能出现空格！";
       document.forms[0].opp_organkey.focus();
    }
    //交易对手证件号码
    else if (IndexSpace(document.forms[0].opp_card_no.value)>0) {
        errMsg = "交易对手证件号码前后或中间不能出现空格！";
       document.forms[0].opp_card_no.focus();
    }
    //交易对手账号
    else if (IndexSpace(document.forms[0].opp_acct_num.value)>0) {
        errMsg = "交易对手账号前后或中间不能出现空格！";
       document.forms[0].opp_acct_num.focus();
    }
     //交易对手姓名
    else if (IndexSpaceLast(document.forms[0].opp_name.value)>0) {
        errMsg = "交易对手姓名前后不能出现空格！";
       document.forms[0].opp_name.focus();
    }
    //代办人姓名
    else if (IndexSpaceLast(document.forms[0].agent_name.value)>0) {
        errMsg = "代办人姓名前后不能出现空格！";
       document.forms[0].agent_name.focus();
    }
    //收付、借贷验证
    else if(document.forms[0].receive_pay_cd.value=="01" && document.forms[0].debit_credit.value=="D"){
      errMsg="收付标志和借贷标志不符 ";
    }
    else if(document.forms[0].receive_pay_cd.value=="02" && document.forms[0].debit_credit.value=="C"){
      errMsg="收付标志和借贷标志不符 ";
    }
    
    
 if(valflag=="1" ||valflag=="3"){
     //账号标识码
    if (getLength(document.forms[0].acct_num.value)==0&&document.forms[0].org_trans_rela.value=="01") {
        errMsg = "金融机构与大额交易的关系为'收单行'时,账号不能为空！";
        document.forms[0].acct_num.focus();
        }

      //金融机构与大额交易的关系
     if (getLength(document.forms[0].org_trans_rela.value)==0) {
        errMsg = "金融机构与大额交易的关系不能为空！";
      
    }
 
    var tx_go_countryindex=document.forms[0].tx_go_country.selectedIndex;
   
     if (document.forms[0].tx_go_country.options[tx_go_countryindex].value=="XXX" && getLength(document.forms[0].opp_organname.value)==0) {
        errMsg = "当交易方向为汇入资金的境外机构为转汇行时，对方金融机构网点名称不能为空应填写转汇行名称！";
      
    }
  }  
  	
	

   // var settleindex=document.forms[0].settle_type_cd.selectedIndex;
   // if(document.forms[0].settle_type_cd.options[settleindex].value==""){
   //    errMsg = "结算方式不能为空！";
  //  }
    //else{
     //  var cashIndex=document.forms[0].cash_ind.selectedIndex;
     //  if(document.forms[0].cash_ind.options[cashIndex].value==""){
      //     errMsg = "现钞标志不能为空！";
      // }else{
      //    if(document.forms[0].cash_ind.options[cashIndex].value=="00"){
       //       var occrsel=document.forms[0].tx_occur_area.selectedIndex; 
       //       var occrsel2=document.forms[0].tx_occur_area1.selectedIndex; 
       //        if(document.forms[0].tx_occur_area1.options[occrsel2].value==""){
      //          errMsg = "当交易方式为现钞交易时交易发生地不能为空！";
       //        } 
       //   }
      // }
    // } 
      var cash_ind='<%=cashind%>';
   if(cash_ind=="00"){
       var occrsel=document.forms[0].tx_occur_country.selectedIndex; 
              var occrsel2=document.forms[0].tx_occur_area1.selectedIndex; 
               if(document.forms[0].tx_occur_area1.options[occrsel2].value==""||document.forms[0].tx_occur_country.options[occrsel].value==""){
                errMsg = "当交易方式为现钞交易时交易发生地不能为空！";
          } 
    }
     
     
    if(valflag=="2" ||valflag=="3"){
      var seleceindex1=document.forms[0].opp_country.selectedIndex;
      if(document.forms[0].opp_country.options[seleceindex1].value==""){
             var selectindex2=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex2].value!=""){
               errMsg="对方金融机构国家不能为空！" 
             }
      }else{
        if(document.forms[0].opp_country.options[seleceindex1].value=="CHN"){
         var selectindex3=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex3].value==""){
               errMsg="对方金融机构国家地区不能为空！" 
             }
           
          }
       }
    }
      /*if(valflag=="1" ||valflag=="3"){ 
      var seleceindex2=document.forms[0].tx_go_country.selectedIndex;
      if(document.forms[0].tx_go_country.options[seleceindex2].value=="" ){
             var selectindex4=document.forms[0].tx_go_area1.selectedIndex;
             if(document.forms[0].tx_go_area1.options[selectindex4].value!=""){
               errMsg="交易方向国家不能为空！" 
             }
      }else{
        if(document.forms[0].tx_go_country.options[seleceindex2].value=='CHN'||document.forms[0].tx_go_country.options[seleceindex2].value=='Z01'
        ||document.forms[0].tx_go_country.options[seleceindex2].value=='Z02'||document.forms[0].tx_go_country.options[seleceindex2].value=='Z03'){
         var selectindex5=document.forms[0].tx_go_area1.selectedIndex;
             if(document.forms[0].tx_go_area1.options[selectindex5].value==""){
               errMsg="交易方向地区不能为空！" 
             }
         }
           
      }
    }*/
      

//if(valflag=="2"||valflag=="3"){
    //销户时间不能小于开户时间
 //    if (getLength(document.forms[0].close_dt_disp.value)!=0&&document.forms[0].open_dt_disp.value>document.forms[0].close_dt_disp.value) {
 //       errMsg = "销户时间不能小于开户时间！";  
 //    }
//}
 
   var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
			if(document.activeElement.tagName=="INPUT")
			{
				window.setTimeout(inputConfim,100,url);
			}else{
		       window.setTimeout(function(){
			        if(!checkAllValidate()) {
							return false;
					}else{
						//alert("保存");
					   document.forms[0].action=url;
			           document.forms[0].submit();
				    }
		       },100);
			}
          
		 //  document.forms[0].action=url;
		 //  document.forms[0].submit();
		}
		
		function _Confim1(url){
		document.forms[0].action=url;
		   document.forms[0].submit();
		}
function des_disp(){
	var jsfs=document.forms[0].settle_type_cd.value;
	if(jsfs=="E100" || jsfs=="E110" || jsfs=="E120"){
		str_v="";
		if(jsfs=="E100"){
			str_v="人民币账户购汇并转账交易资金用途应说明外币币种和金额";
		}else if(jsfs=="E110"){
			str_v="外币账户结汇并转账交易资金用途应说明人民币金额";
		}else{
			str_v="外币间兑换并转账交易资金用途应说明资金转入账户的币种和金额";
		}
		document.getElementById('des_disp').innerHTML='<font color="red">'+str_v+'</font>';
		document.getElementById('des_disp').style.display='block';
	}else{
		document.getElementById('des_disp').style.display='none';
	}
}
function des_disp2(){

	var jsfs=document.forms[0].settle_type_cd.value;
	
	if (jsfs=='20')
	{
		document.getElementsByName('tsctkey')[0].style.display='none';			
		document.getElementById('ipaddr').style.display='';
		
		testRegx($$('ipaddr',0));
	}else
	{
		document.getElementsByName('tsctkey')[0].style.display='';
		document.getElementById('ipaddr').style.display='none';
		showValidateMsg($$('ipaddr',0),'3','');
	}
	

}

	

//验证日期格式 obj字段 flag 1可以为空  0不可以为空
function isDate(obj,flag) {
	showValidateMsg(obj, 0, "");
	if(flag=='0')
	{
    if(obj.value==''||obj.value==null)
    {
    showValidateMsg(obj, 2,"不能为空！");
    //obj.focus();
    return false;
    }
    }
    
	
     if(obj.value!=null&&obj.value!=''&&obj.value.match(/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/)==null)
         {
                     //alert("请输入有效的日期!");
                    showValidateMsg(obj, 2, "日期格式错误！");
                    // obj.focus();
                     return false;
        }
     
      showValidateMsg(obj, 1, "");  
     }
//验证金额格式 obj字段  flag 1可以为空  0不可以为空
	function check_amt(obj,flag)
	{
		if(flag=='0')
		{
	    if(obj.value==''||obj.value==null)
	    {
	    showValidateMsg(obj, 2,"不能为空！");
	    //obj.focus();
	    return false;
	    }
	    }
		
		if(!checkFloat(obj.value)){
			showValidateMsg(obj, 2, "金额必须为数字！");
			return false;
	     }
	     
		showValidateMsg(obj, 1, ""); 
	}

	function  _Change(curr_cd){

		   var currobj=eval('document.forms[0].currency_cd');
		   var cash_ind = eval('document.forms[0].cash_ind');
		   var cash_indValue = cash_ind.value;
		   var selvalue=currobj.value;
		   if(selvalue=="CNY"){//本币
		   		if(cash_indValue=="00"){//现钞
		   			document.all.settle1.style.display="";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="none";
		   		}else{//非现
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="";
		    		document.all.settle4.style.display="none";
		   		}
		   		//for(var i = 0; i < document.getElementById('currency_cd').getElementsByTagName('option').length; i ++) {
		   		//	if(document.getElementById('currency_cd').getElementsByTagName('option')[i].value == "CNY") {
		   				//document.getElementById('currency_cd').getElementsByTagName('option')[i].selected = true;
		   		//	}
		   		//}
		   }else{//外币
		   		if(cash_indValue=="00"){//现钞
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="none";
		   		}else{//非现
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="";
		   		}
		   		//for(var i = 0; i < document.getElementById('currency_cd').getElementsByTagName('option').length; i ++) {
		   		//	if(document.getElementById('currency_cd').getElementsByTagName('option')[i].value == "USD") {
		   				//document.getElementById('currency_cd').getElementsByTagName('option')[i].selected = true;
		   			//}
		   		//}
		   }
		}
	//当settle_type_cd1-4的值改变的时候同步改变settle_type_cd的值
	function  syn_settle_type_cd(obj){

			document.forms[0].settle_type_cd.value=obj.value;
			//alert(document.forms[0].settle_type_cd.value);
		}
   function _Open2(url){
 
      window.open(url,'','height=500, width=900,left=100,top=100, status=yes, scrollbars=yes,resizable=yes');
         
	}
</script>


		<style type="text/css">
.STYLE2 {
	color: red;
}
</style>


	</head>
	<body class="mainbg"
		onload="card_inf_exp('1','');_Change('curr_cd');validateDetail();">
		<div id="main">
			<html:form action="/case/t07_case_app_add_trans_page_new.do"
				method="post">
				<html:hidden name="t47_transaction" property="party_class_cd" />
				<html:hidden name="t47_transaction" property="party_chn_name" />
				<html:hidden name="t47_transaction" property="party_id" />
				<html:hidden name="t47_transaction" property="organkey_new" />
				<html:hidden name="t47_transaction" property="organ_name" />				
				<html:hidden name="t47_transaction" property="validate_ind" />
				<html:hidden name="t47_transaction" property="validate_ind2" />
				<html:hidden name="t47_transaction" property="validateflag" />

				<bean:define id="p_areavalue" name="p_areavalue" />

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>新增交易</span>
						<span class="buttons"> <a href="#"
							onclick="_Confim('t07_case_app_add_trans_page_new_do.do')"> <img
									src="../../images/blue/b_save.png" />保 存</a> </span>
					</div>

					<%
						if (validateflag.equals("1") || validateflag.equals("3")) {
					%>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />机构信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									金融机构网点代码类型：
								</td>
								<td align="left">
									<html:text property="organ_code_type_disp" value="00"
										readonly="true" />
									<img src="../../images/lock.jpg" />
									<html:hidden property="organ_code_type" />
								</td>
								<td align="right">
									金融机构网点代码：
								</td>
								<td align="left">
									<html:text property="organ_code" readonly="true" alt="金融机构网点代码"
										onchange="change();"
										onblur="validate(this, '', 'organ_code_type');" />
									<img src="../../images/lock.jpg" />
									<html:hidden property="isInnerOrganCode"></html:hidden>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--FICT-->
									金融机构网点名称：
								</td>
								<td align="left">
									<html:text property="organname" readonly="true"
										onchange="change();" onblur="validate(this, '', '');" />
									<img src="../../images/lock.jpg" height='20' />
								</td>
								<td align="right">
									金融机构所在地区行政区：
								</td>
								<td align="left">
									<html:text property="organ_area_disp" readonly="true"
										onchange="change();validate(this, '', '');" />
									<!-- onclick="window.open('/common/editCountryArea.jsp?inname=organ_area&inname_disp=organ_area_disp&type=short','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');" -->
									<html:text property="organ_area" size="9" readonly="true" />
									<img src="../../images/lock.jpg" />

								</td>
							</tr>
							<tr>
								<td align="right">
									<!--RLTP-->
									金融机构与大额交易的关系：
								</td>
								<td align="left" colspan="3">
									<html:select property="org_trans_rela" alt="金融机构与大额交易的关系"
										onchange="change();validate(this, 'rltp_hash', '');" onblur="">
										<html:options collection="org_trans_relaMap" property="label"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font> （参考系统提示）
								</td>
							</tr>

						</table>
					</div>
					<%
						} else {
					%>
					<html:hidden property="org_trans_rela" />
					<%
						}
					%>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />代办人信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" align="center"
							id="agent_table">
							<tr>
								<td align="right">

									交易代办人姓名：
								</td>
								<td align="left">
									<html:text property="agent_name" onchange="change();"
										onblur="validate(this, 'agent_country', '0');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
								<td align="right">
									代办人国籍：
								</td>
								<td align="left">
									<html:select property="agent_country"
										onchange="change();validate($$('agent_name',0), 'agent_country', '');validateAgent();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="nationalityMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--FICT-->
									代办人身份证件类型：
								</td>
								<td align="left" colspan="3">
									<html:select property="agent_card_type" style="width:250px"
										onchange="card_inf_exp('agent_card_type','card_inf');change();validate($$('agent_card_no',0), 'agent_card_type', '');validateAgent();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="agent_card_typeMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:text property="card_inf" size="30" maxlength="30"
										onblur="validate_type('card_inf');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
							</tr>
							<tr>
								<td align="right">
									代办人身份证件号码：
								</td>
								<td align="left" colspan="3">
									<html:text property="agent_card_no" onchange="change();"
										onblur="validate(this, 'agent_card_type', '');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
							</tr>
						</table>
					</div>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />交易信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<!-- 交易详细信息 -->
							<!-- 金融机构网点信息  -->
							<!-- 代办人信息  -->

							<!-- 交易信息  -->
							<tr>

								<td width="24%" align="right" bgcolor="ECF3FF">
									交易时间：
								</td>
								<td width="76%" bgcolor="F6F9FF" >
									<input type="text" name="dt_time_disp" alt="交易时间"
										onpropertychange="isDate(this,0)" size="20" maxlength="20"
										onclick="calendar.show(this);" class="calimg" />
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									流水号：
								</td>
								<td bgcolor="F6F9FF">
									<html:text property="tx_no" alt="流水号" />
									<font color="#FF0000"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									资金收付标识：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="receive_pay_cd" alt="资金收付标识">
										<html:options collection="receive_pay_cdMap" property="key"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									交易金额：
								</td>
								<td bgcolor="F6F9FF">
									<!--<html:hidden  property="cny_amt" />-->
									<input type="text" name="amt_disp" maxlength="15"
										onpropertychange="check_amt(this,'0');" />
									<font color="#FF0000"> *</font>
								</td>

							</tr>


							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									币种：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="currency_cd" alt="币种"
										onclick="_Change('curr_cd');" style="width:80">
										<html:options collection="currency_cdMap" property="key"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									现钞标志：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="cash_ind" onclick="_Change('curr_cd');">
										<html:options collection="t87_pbc_cashMap" property="label"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									账号：
								</td>
								<td  bgcolor="F6F9FF">
									<html:text property="acct_num" onchange="change();"
										onblur="validateDetail2('acct_num');" alt="账号" />

								</td>
								<td>
									借/贷：
								</td>
								<td>
									<html:select property="debit_credit"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="debit_creditMap" property="label"
											labelProperty="value" />
									</html:select>

									<font color="red">*</font>
								</td>
								
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									账户类型：
								</td>
								<td colspan="3">
									<html:select property="acct_type" onchange="change();"
										onblur="validateDetail2('acct_type');" alt="账户类型"
										style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="acct_typeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								
							</tr>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TSTP-->

									支付工具及结算方式：
								</td>
								<td colspan="3">

									<html:select property="settle_type_cd1" styleId="settle1"
										onchange=" syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs1Map" property="label"
											labelProperty="value" />
									</html:select>


									<html:select property="settle_type_cd2" styleId="settle2"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs2Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:select property="settle_type_cd3" styleId="settle3"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs3Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:select property="settle_type_cd4" styleId="settle4"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs4Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:hidden property="settle_type_cd" />
									<font color="#FF0000"> *</font>
								</td>
								
							</tr>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TSCT-->

									涉外收支交易分类与代码：
								</td>
								<td bgcolor="F6F9FF" colspan="3">

									<html:select property="tsctkey" style="width:300px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="tsctMap" property="label"
											labelProperty="value" />
									</html:select>
                                    <input type="text" id="ipaddr" style="display:none" value=""  name="ipaddr" onblur="testRegx(this);"></input>
								</td>

							</tr>
							<tr>

								<td height="18" align="right" bgcolor="ECF3FF">
									<!--CRSP-->

									资金来源和用途：
								</td>
								<td bgcolor="F6F9FF" colspan="3" align="left">
									<html:text property="use_des" size="40" maxlength="64"
										onchange="change();" onblur="validateDetail2('use_des');" />
									<div id="des_disp" style="display: none;">
									</div>
								</td>
							</tr>
							<tr>

								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TRCD-->

									交易发生地：
								</td>

								<td bgcolor="F6F9FF">
									<html:select property="tx_occur_country" style="width:150"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="_DispRep('tx_occur_country','org2','orgreplay2','1');set_tx_occur_allValue();change();"
										onblur="validateDetail2('tx_occur');">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<logic:equal name="t47_transaction" property="tx_occur_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay2">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org2" style="display: none">
								</logic:equal>

								<logic:notEqual name="t47_transaction" property="tx_occur_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay2" style="display: none">

									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org2">
								</logic:notEqual>
								<html:select property="tx_occur_area1" style="width:150"
									onchange="_Click('tx_occur_area1','tx_occur_area2');_Click('tx_occur_area2','tx_occur_area');set_tx_occur_allValue();change();"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))"
									onblur="validateDetail2('tx_occur');">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>
								<html:select property="tx_occur_area2" style="width:150"
									onchange="_Click('tx_occur_area2','tx_occur_area');set_tx_occur_allValue();change();"
									onblur="validateDetail2('tx_occur');" style="width:100">
									<option value="">
										请选择
									</option>
									<option
										value="<bean:write property="tx_occur_area2" name="t47_transaction" />"
										selected>
										<bean:write property="tx_occur_area2name"
											name="t47_transaction" />
									</option>
								</html:select>
								<html:select property="tx_occur_area" style="width:100"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))"
									onchange="set_tx_occur_allValue();change();"
									onblur="validateDetail2('tx_occur');">
									<option value="">
										请选择
									</option>
									<option
										value="<bean:write property="tx_occur_area" name="t47_transaction" />"
										selected>
										<bean:write property="tx_occur_areaname"
											name="t47_transaction" />
									</option>
								</html:select>
								<input type="hidden" name="tx_occur"/>
								</td>

							</tr>
							<%
								if (validateflag.equals("1") || validateflag.equals("3")) {
							%>
							<tr>
								<!-- 大额 -->
								<td width="20%" height="18" align="right" bgcolor="ECF3FF">
									<!--TDRC-->

									交易方向：
								</td>
								<td bgcolor="F6F9FF">

									<html:select property="tx_go_country"
										onchange="_DispRep('tx_go_country','org1','orgreplay1','2');_Click('tx_go_area1','tx_go_area2','0');_Click('tx_go_area2','tx_go_area','0');change();set_tx_go_allValue();"
										onblur="validateDetail2('all');" style="width:150"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<logic:equal name="t47_transaction" property="tx_go_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay1">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org1" style="display: none">
								</logic:equal>
								<logic:notEqual name="t47_transaction" property="tx_go_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay1" style="display: none">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org1">
								</logic:notEqual>
								<html:select property="tx_go_area1"
									onchange="_Click('tx_go_area1','tx_go_area2','0');_Click('tx_go_area2','tx_go_area');set_tx_go_allValue();change();"
									onblur="validateDetail2('tx_go');" style="width:150"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>

								<html:select property="tx_go_area2"
									onchange="_Click('tx_go_area2','tx_go_area','0');change();set_tx_go_allValue();"
									onblur="validateDetail2('tx_go');" style="width:100"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										请选择
									</option>

								</html:select>
								<html:select property="tx_go_area" style="width:100"
									onchange="change();set_tx_go_allValue();"
									onblur="validateDetail2('tx_go');">
									<option value="">
										请选择
									</option>
								</html:select>
                               <input type="hidden" name="tx_go" value="" />
								</td>
								
							</tr>
							<%
								} else {
							%>
							<html:hidden property="tx_go_country" />
							<html:hidden property="tx_go_area" />
							<%
								}
							%>





						</table>
					</div>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />对手信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">



							<tr>
								<td align="right">
									交易对手账号类型:
								</td>
								<td align="left" colspan="3">
									<html:select property="opp_acct_type_cd" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="change();validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');">
										<html:options collection="opp_acct_type_cdMap"
											property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易对手账号：
								</td>
								<td align="left">
									<html:text property="opp_acct_num" onchange="change();"
										onblur="validateDetail2('opp_acct_num');" />
								</td>
								<td align="right">
									<!--TCNM-->
									交易对手姓名：
								</td>
								<td align="left">
									<%
										if (validateflag.equals("1") || validateflag.equals("3")) {
									%>
									<html:text property="opp_name" onchange="change();"
										onblur="validateDetail2('opp_name');" />
									<%
										} else {
									%>
									<html:text property="opp_name" onchange="change();"
										onblur="validateDetail2('opp_name');" />
									<%
										}
									%>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--TCIT-->
									交易对手身份证件类型：
								</td>
								<td align="left" colspan="3">

									<html:select property="opp_card_type" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="card_inf_exp('opp_card_type','opp_card_inf');change();validateDetail2('opp_name');change();validateDetail2('opp_card_no');">
										<html:options collection="opp_card_typeMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:text property="opp_card_inf" size="30" maxlength="30"
										onblur="validate_type('opp_card_inf');" />

								</td>
							</tr>
							<tr>

								<td align="right">
									<!--CFRC-->
									交易对手身份证件号码：
								</td>
								<td align="left">
									<html:text property="opp_card_no" onchange="change();"
										onblur="validate(this, 'opp_card_type', '');validateDetail2('opp_card_no');" />
								</td>
								<td align="right">
									对方金融机构网点名称：
								</td>
								<td align="left">
									<html:text property="opp_organname" onchange="change();"
										onblur="validateDetail2('opp_organname');" />
										<!--  
										<a href="#" onclick="_Open2('<%=request.getContextPath() %>/report/case/t47case_opp_bank_list.do?newflag=1')" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
								       -->
								</td>
							</tr>

							<tr>
								<td align="right">
									<!--CFIN-->
									对方金融机构代码类型：
								</td>
								<td align="left">
									<html:select property="opp_organ_type"
										onchange="change();validateDetail2('opp_organ_type');
											change();validateDetail2('opp_organkey');"
										style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="opp_organ_typeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<td align="right">
									对方金融机构网点代码：
								</td>
								<td align="left">
									<html:text property="opp_organkey" onchange="change();"
										onblur="validateDetail2('opp_organkey');" />
								</td>
							</tr>
							<%
								if (validateflag.equals("2") || validateflag.equals("3")) {
							%>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									对方金融机构网点行政区划代码：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="opp_country" style="width:150"
										onchange="_DispRep('opp_country','org','orgreplay','0');change();set_opp_area_allValue();"
										onblur="validateDetail2('all');"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>
									<input type="hidden" name="opp_organarea" vlaue="" />
								</td>
								<logic:equal name="t47_transaction" property="opp_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org" style="display: none">
								</logic:equal>
								<logic:notEqual name="t47_transaction" property="opp_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay" style="display: none">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org">
								</logic:notEqual>
								<html:select property="opp_area1" style="width:150"
									onchange="_Click('opp_area1','opp_area2');change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>
								&nbsp;&nbsp;

								<html:select property="opp_area2" style="width:100"
									onchange="_Click('opp_area2','opp_area');change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										请选择
									</option>
									<option
										value="<bean:write property="opp_area2" name="t47_transaction" />"
										selected>
										<bean:write property="opp_area2Name" name="t47_transaction" />
									</option>
								</html:select>
								&nbsp;&nbsp;
								<html:select property="opp_area" style="width:100"
									onchange="change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										请选择
									</option>
									<option
										value="<bean:write property="opp_area" name="t47_transaction" />"
										selected>
										<bean:write property="opp_areaName" name="t47_transaction" />
									</option>
								</html:select>
								</td>
							</tr>
							<%
								} else {
							%>
							<html:hidden property="opp_country" />
							<html:hidden property="opp_area" />
							<%
								}
							%>
						</table>
					</div>

					<div class="sys_warning">
						<strong><img src="../../images/blue/warning.png" />系统提示：</strong>
						<p> &nbsp;&nbsp;1、金融机构与大额交易的关系的值：本行客户发生大额交易时选择 '发卡银行'；通过境外银行卡发生大额交易时选择 '收单行';非本行客户发生大额交易时选择 '办理业务机构'
							<br />
							&nbsp;&nbsp;2、当交易金额与证件号码完全相同须进行核实，如：客户身份证件号码，交易对手身份证件号码，账号或交易对手账号，代办人身份证件号码，对公法定代表人身份证件号码(仅限可疑)。
							<br />
							&nbsp;&nbsp;3、当单笔大额或可疑交易金额超过1亿元人民币或等值1000万美元时须进行核实。
							<br />
							&nbsp;&nbsp;4、报送机构填写“账户类型(CATP)”或“交易对手账户类型(TCAT)”时，如无法区分人民币个人银行账户为“本地账户”或是“异地账户”，一律选择“本地账户”填写。
							<br />
							&nbsp;&nbsp;5、报送机构填写“账户类型(CATP)”或“交易对手账户类型(TCAT)”时，当该账户既是“6100银证转账账户”(或“6200银证转账账户”)又是其他账户类型(例如0011人民币本地存款人-基本账户)时,一律选择“6100银证转账账户”(或“6200银证转账账户”)填写。
							<br />
						</p>
					</div>
				</div>

			</html:form>
		</div>
		<script type="text/javascript">

if(valflag=="1" || valflag=="3"){	
_init(go_area1,go_area2,go_area0,'2');
}
_init(occur_area1,occur_area2,occur_area,'1');

function  _init(area1,area2,area,type){

if(area1!="0"){

  if(area!=chinavalueflag){
     if(type=="1")
      changeArea('tx_occur_area1','tx_occur_area2',arrItem1,'tx_occur_area',area2,'1'); 
      else{
   
      changeArea('tx_go_area1','tx_go_area2',arrItem1,'tx_go_area',area2,'1'); 
      
      }
    } 
}

if(area2!="0"){
  if(area=="0")
     area="";
    
   if(area!=chinavalueflag){
    if(type=="1"){
   changeArea('tx_occur_area2','tx_occur_area',arrItem1,'',area,0); 
   }
     else{ 
       changeArea('tx_go_area2','tx_go_area',arrItem1,'',area,0); 
       } 
   }
}

}
</script>
		<!--提示块-->
		<div id=div_hint
			style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
	</body>
</html>