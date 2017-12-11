<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.T47_transaction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String app_selecturl = url + "/js/App_Select.js";

			String valurl = url + "/js/validate.js";
			String countryurl = url + "/js/country.js";
		%>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type='text/javascript' src='./dwr/interface/TransWay.js'></script>
		<script src=<%=valurl%> language="javascript"></script>



		<%
			String tx_occur_area2 = "0";
			String tx_occur_area1 = "0";
			String tx_occur_area = "0";
			String tx_go_area2 = "0";
			String tx_go_area1 = "0";
			String tx_go_area0 = "0";
			String chinavalueflag = "0";
			if (request.getAttribute("chinavalue") != null)
				chinavalueflag = (String) request.getAttribute("chinavalue");
			T47_transaction t47_transaction = (T47_transaction) request
					.getAttribute("t47_transaction");

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
		%>


		<%--  上海银行项目修改内容
		如果是TF交易，tx_no like 'TF%'的交易
		需要放开交易机构、客户号、客户名、账号的修改
		修 改策略，
		1. 判断是否TF交易，if substr(tx_no,1,2) = 'TF' then is_tf = '1'
		2. 如果是is_tf = '1',则显示机构定位、客户定位、帐户修改及定位的功能。
		3. 保存的时候if is_tf = '1' 需要判断机构号、客户号、帐号不为空才能保存
		
--%>
		<%
			String is_tf = "0";
			String tf_tx_no = t47_transaction.getTx_no();
			if (tf_tx_no != null && tf_tx_no.length() > 1
					&& tf_tx_no.startsWith("TF")) {
				is_tf = "1";
			}

			pageContext.setAttribute("is_tf", is_tf, PageContext.PAGE_SCOPE);
		%>
		<script language="JavaScript">
var _st = window.setTimeout;
window.setTimeout = function(fRef, mDelay) {
 if(typeof fRef == 'function'){
  var argu = Array.prototype.slice.call(arguments,2);
  var f = (function(){ fRef.apply(null, argu); });
  return _st(f, mDelay);
 }
 return _st(fRef,mDelay);
}
			var curr_cd;
			var cash_ind;
			function changeType08() {
				curr_cd = document.getElementById("currency_cd").value;
				if(curr_cd=="CNY"){
				 curr_cd="1";
				}else{
				 curr_cd="2";
				}
				cash_ind=document.getElementById("cash_ind").value;
				//cascadType08(curr_cd);
				cascadType08();
			}
			function cascadType08() {			
				TransWay.getToolList08(curr_cd+':'+cash_ind,refreshType08);
			}
			function refreshType08(opts) {
				var optstxt = generateStrOpts(opts);
				document.getElementById("settle_type_cd").outerHTML = "<select name=\"settle_type_cd\" onchange=\"des_disp();\">" + optstxt + "</select>";			
			}
			function generateStrOpts(map) {
				var res = "";
				if(map == null)
					return res;
			  for(var i=0; i<map.length; i++) {	
					var obj = map[i];
					res += getOptionTxt(obj.key1, obj.value1);
				}
				return res;
			}						
						
			function getOptionTxt(value, txt) {
				return "<option value=\"" + value + "\">" + txt + "</option>";
			}

		function card_inf_exp(type,value){
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				showValidateMsg($$(value,0),'4','');
				var validate_typeNode=document.getElementsByName(type)[0];
				//var validate_typeNode=document.getElementById(type);
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
			}
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].opp_card_inf.style.visibility='hidden';
				showValidateMsg($$('opp_card_inf',0),'4','');
			}else {
				document.forms[0].opp_card_inf.focus();
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
function IndexSpaceLast(str2){
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==" ")||(str2.substr(0,1)==" ")){
         return(1);
         }
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



function _Click(fromstr,tostr,type){
 var arrItem;
   if(type=="1"){
   arrItem=arrItem2;
   }else{
     arrItem=arrItem1;
   }
   changelocation(fromstr,tostr,arrItem);
}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
	var is_tf = '<%=is_tf%>';
	
  if(document.forms[0].cal_ind.value!="0"){  
	if(is_tf=='1' && document.forms[0].cal_ind.value=="1") {
	  if(document.forms[0].organkey.value=="")
	    errMsg+="交易机构号不能为空 ";
	  if(document.forms[0].host_cust_id.value=="")
	    errMsg+="客户号不能为空  ";
	  if(document.forms[0].acct_num.value=="")
	    errMsg+="账号不能为空 ";
	}
		
    if ((document.forms[0].agent_card_type.value=='19')&&(getLength(document.forms[0].card_inf.value)>30||getLength(document.forms[0].card_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
    }
	if ((document.forms[0].opp_card_type.value=='19' || document.forms[0].opp_card_type.value=='29')&&(getLength(document.forms[0].opp_card_inf.value)>30||getLength(document.forms[0].opp_card_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
    }	
    if(document.forms[0].debit_credit.disabled==false){
     var index2=document.forms[0].debit_credit.selectedIndex;
    if(document.forms[0].debit_credit.options[index2].value==""){
      errMsg+="借贷标志不能为空  ";
    }}
    
    if(document.forms[0].tx_type_cd.disabled==false){
     var index3=document.forms[0].tx_type_cd.selectedIndex;
     if(document.forms[0].tx_type_cd.options[index3].value==""){
      errMsg+="交易类型不能为空  ";
    }
    }
    if((document.forms[0].tx_occur_country.value=="CHN"||document.forms[0].tx_occur_country.value=="Z01"
       ||document.forms[0].tx_occur_country.value=="Z02"||document.forms[0].tx_occur_country.value=="Z03")
    &&document.forms[0].tx_occur_area1.value=="")
    {
     errMsg+="请选择交易发生地区";
    }
    
    
    if(document.forms[0].tx_cd.disabled==false){
     var index4=document.forms[0].tx_cd.selectedIndex;
    if(document.forms[0].tx_cd.options[index4].value==""){
      errMsg+="交易代码不能为空  ";
    }}
    
    if(document.forms[0].overarea_ind.disabled==false){
      var index5=document.forms[0].overarea_ind.selectedIndex;
    if(document.forms[0].overarea_ind[index5].value==""){
      errMsg+="是否跨境交易不能为空  ";
    }
    }
    if(document.forms[0].opp_off_shore_ind.disabled==false){
      var index6=document.forms[0].opp_off_shore_ind.selectedIndex;
    if(document.forms[0].opp_off_shore_ind.options[index6].value==""){
      errMsg+="对手是否离岸帐户不能为空  ";
    }}
    var curr_cd="0";
    if(document.forms[0].currency_cd.disabled==false){
      var index7=document.forms[0].currency_cd.selectedIndex;
    if(document.forms[0].currency_cd.options[index7].value==""){
      errMsg+="币种不能为空  ";
    }
      curr_cd=document.forms[0].currency_cd.options[index7].value;
    }else{
        document.forms[0].currency_cd.disabled=false;
         var index71=document.forms[0].currency_cd.selectedIndex;
         curr_cd=document.forms[0].currency_cd.options[index71].value;  
          document.forms[0].currency_cd.disabled=true; 
    }
    
    if(curr_cd=="CNY"){
       if(document.forms[0].cash_ind.disabled==false){
         var index8=document.forms[0].cash_ind.selectedIndex;
        if(document.forms[0].cash_ind.options[index8].value==""){
         errMsg+="现钞标志不能为空  ";
        }}
     }   
    
   
    if(document.forms[0].opp_pbc_party_class_cd.disabled==false){
     if(document.forms[0].tx_typecd.value!="01"){
       var index9=document.forms[0].opp_pbc_party_class_cd.selectedIndex;
      if(document.forms[0].opp_pbc_party_class_cd.options[index9].value==""){
        errMsg+=" 对方客户类型不能为空  ";
       }
      }
    }
    if(document.forms[0].agent_name.disabled==false){
     if(getLength(document.forms[0].agent_name.value)>10){
      errMsg+="代办人姓名不能大于10个字符  ";
      }
    }
    if(document.forms[0].agent_card_no.disabled==false){
     if(getLength(document.forms[0].agent_card_no.value)>20){
      errMsg+="代办人证件号码不能大于20个字符  ";
      }
    }
    /*if(document.forms[0].acct_num.disabled==false){
     if(getLength(document.forms[0].acct_num.value)>24){
      errMsg+="账号不能大于24个字符  ";
      }
    }*/
     if(document.forms[0].use_des.disabled==false){
     if(getLength(document.forms[0].use_des.value)>128){
      errMsg+="用途不能大于128个字符  ";
      }
    }
     if(document.forms[0].opp_name.disabled==false){
     if(getLength(document.forms[0].opp_name.value)>64){
      errMsg+="对手姓名不能大于64个字符  ";
      }
    }
      if(document.forms[0].opp_acct_num.disabled==false){
     if(getLength(document.forms[0].opp_acct_num.value)>64){
      errMsg+="对手姓名不能大于64个字符  ";
      }
    }
    if ((document.forms[0].opp_pbc_party_class_cd.value=='02'&&document.forms[0].opp_card_type.value.substr(0,1)=="2")||
             (document.forms[0].opp_pbc_party_class_cd.value!='02'&&document.forms[0].opp_card_type.value.substr(0,1)=="1")) {
        errMsg += "对方客户类型与对方证件类型 不匹配!";
       }
    
   // if(document.forms[0].opp_acct_num.disabled==false){
    //    if(document.forms[0].tx_typecd.value!="01"){
     //      if(document.forms[0].opp_acct_num.value==""){
     //        errMsg+=" 对方帐号不能为空  ";
     //      }
     //   }
   // }
 
    if(document.forms[0].opp_name.disabled==false){
    
        if(document.forms[0].tx_typecd.value!="01"){
           if(document.forms[0].opp_name.value==""){
             errMsg+="对方客户姓名不能为空";
           } 
         
           if (getLength(document.forms[0].opp_name.value)>64) {
             errMsg = "交易对手姓名不能多于64个字符！";
           }          
        }
   }   
   
     var seleceindex1=document.forms[0].opp_coutry.selectedIndex;
      if(document.forms[0].opp_coutry.options[seleceindex1].value==""){
             var selectindex2=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex2].value!=""){
               errMsg="对方金融机构国家不能为空！" 
             }
      }else{
        if(document.forms[0].opp_coutry.options[seleceindex1].value=="CHN"){
         var selectindex3=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex3].value==""){
               errMsg="对方金融机构国家地区不能为空！" 
             }
           
          }
       }
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
  
  
   if(document.forms[0].status.value=="1"){
 if((getLength(document.forms[0].opp_organ_type.value)==0&&getLength(document.forms[0].opp_organkey.value)>0)||
 (getLength(document.forms[0].opp_organkey.value)==0&&getLength(document.forms[0].opp_organ_type.value)>0)){
       
             errMsg="对方金融机构代码和对方金融机构类型必须同时为空或有值才能保存对手信息!";
        }
    }
  
    
   if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    	if(!checkAllValidate()) {
					//alert("存在未校正的数据，保存失败！");
					return false;
		}
	  }
  // else{
     //   for (i=0;i<document.all.length ;i++ )
       //    {
        //     e=document.all[i];
            // alert(e.type);
        //     if(e.type=="text" ||e.type=="select-one"){
               
          //       var textname=e.name;
          //       var obj=eval('document.forms[0].'+textname);
                
              
            //     if(obj.disabled==true){
                 
               //     obj.disabled=false;
               //  }
            // }
            
           
           // }
           	
          
    
	if(document.forms[0].cal_ind.value=="0"){
	  if(confirm("确定要将本交易设置为不计算？")) {
	    if(document.activeElement.tagName=="INPUT")
			{
				window.setTimeout(inputConfim,100,theUrl);
			}else{
				if(!checkAllValidate()) {
						return false;
				}else{
				   document.forms[0].action=theUrl;
		           document.forms[0].submit();
				}
			}
      }
	} else {
	  if(document.activeElement.tagName=="INPUT")
			{
				window.setTimeout(inputConfim,100,theUrl);
			}else{
				if(!checkAllValidate()) {
						return false;
				}else{
				   document.forms[0].action=theUrl;
		           document.forms[0].submit();
				}
			}
       
    }
  // }
}

function _ChangeColor(){
     
     var index=document.forms[0].tx_type_cd.selectedIndex;
     document.forms[0].tx_typecd.value=document.forms[0].tx_type_cd.options[index].value;
     if(document.forms[0].tx_type_cd.options[index].value=="01"){
        document.all.color00.style.display="none";
        document.all.color01.style.display="none";
        //document.all.color12.style.display="none";
    }else{
         document.all.color00.style.display="";
         document.all.color01.style.display="";
         //document.all.color12.style.display="";
    }
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
     _init(occur_area1,occur_area2,occur_area,'1');
     }
     if(type=="2"){
     changeArea('tx_go_area1','tx_go_area2',arrItem1,'tx_go_area',go_area2,'1');
     _init(go_area1,go_area2,go_area0,'2');
     } 
   }else{
     rowobj.style.display="none";
     rowobj1.style.display="";
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
function _Open(url){
 
   window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
   //window.open(url);
      
}

	var g_appid = "2";
		
		function validateDetail() {
			
			g_changed = true;
			validate($$('agent_name',0), '', 'agent_card_type');
			g_changed = true;
			validate($$('agent_card_no',0), 'agent_card_type', '');
			g_changed = true;
			validate($$('acct_num',0), '', '')
		
			//g_changed = true;
			//validate($$('use_des',0), '', '');
			g_changed = true;
			validate($$('opp_organname',0), '', '1');
		
			g_changed = true;
			validate($$('opp_organkey',0), '', 'opp_organ_type');
			g_changed = true;
		
			validate($$('opp_name',0), '', 'opp_card_type');
			g_changed = true;
		
			//validate($$('opp_card_no',0), 'opp_card_type', '');
		
			g_changed = true;
			validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');	
			
			g_changed = false;
	
		
		}

function  _FoundParty(){
   var acctnum=document.forms[0].opp_acct_num.value;

  if(acctnum!="")
   Agreementinfo.getGgreementInfo(acctnum,refreshParty);	
}
function refreshParty(res){
  var acctnum=res.acct_num;
  var partyid=res.customer_id;
  var partyname=res.customer_name;
  var card_no=res.customer_num;
  var  acct_type_cd=res.aml_acct_type_cd;
  if(partyid !=null && partyid!="")
  document.forms[0].opp_party_id.value=partyid;
  if(partyname!=null && partyname!="")
  document.forms[0].opp_name.value=partyname;
  if(card_no!=null && card_no !="")
  document.forms[0].opp_card_no.value=card_no;
  if(acct_type_cd!=null && acct_type_cd!=""){
  for(i=0;i<document.forms[0].opp_acct_type_cd.length;i++){
      if(document.forms[0].opp_acct_type_cd.options[i].value==acct_type_cd){
        document.forms[0].opp_acct_type_cd.options[i].selected=true;
        break; 
      }
  }
  }
}
		                //add by lkl
                function searchlist(){
                
                        var temp6=document.forms[0].temp6.value;	
                        var temp3=document.forms[0].temp3.value;//对方
                      
                        //alert(temp3+"3333333333");
                        //alert(temp6+"6666666666");
                        var tempAccount="";
                        //--1.我方是客户账,对手是内部账     temp3对手,  temp6我方                  I表示为内部账.
                        if((temp6!="I"&&temp6!="X")&&(temp3=="I"||temp3=="X"))
                        {
                             tempAccount="aside";
                        }
						//2.我方是内部账
						if((temp6=="X")||(temp6=="I"&& temp3!="I")) 
                        {
							tempAccount="me";
						}
						//双方都是内部账
						if(temp3 == "I" && temp6 == "I"){
							tempAccount="other";
						}

						//双方为空
						if(temp3 == "" && temp6 == ""){
							tempAccount="other";
						}
						//alert(tempAccount+"tempAccount");
						if("other" == tempAccount || "" == tempAccount){
							tempAccount="没有相关联的交易,需手工补录!";
							alert(tempAccount);
							return false;
						}else{
							 var transactionkey1=document.forms[0].transactionkey.value;
	                        var amt1=document.forms[0].amt.value;
	                        var tx_dt1=document.forms[0].tx_dt_disp.value;
	                       //var amt2=document.forms[0].amt_disp.value;
	                       // alert(amt2+"amt");
	                      ///  alert(temp33);
	                      //  alert(temp66);
	                       // alert(transactionkey1);
	                       // alert(amt1);
	                       // alert(tx_dt1);
	                       // window.open('../../report/t47_transaction_relation_search.do?temp3='+temp33+'&temp6='+temp66+'','&transactionkey='+transactionkey1+'&amt='+amt1,'height=400, width=800,left=100,top=100,scrollbars=yes,resizable=yes');
							var url="../../report/case/t47_transaction_relation_search.do";
							url=url+"?transactionkey="+transactionkey1+"&tempAccount="+tempAccount+"&tx_dt_disp="+tx_dt1+"&newsearchflag=1";
							//alert(url);
							window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
						}            
                }
function des_disp(){
	var jsfs=document.forms[0].settle_type_cd.value;
	if(jsfs=="E100" || jsfs=="E110" || jsfs=="E120"){
		str_v="";
		if(jsfs=="E100"){
			str_v="人民币帐户购汇并转账交易资金用途应说明外币币种和金额";
		}else if(jsfs=="E110"){
			str_v="外币帐户结汇并转账交易资金用途应说明人民币金额";
		}else{
			str_v="外币间兑换并转账交易资金用途应说明资金转入帐户的币种和金额";
		}
		document.getElementById('des_disp').innerHTML='<font color="red">'+str_v+'</font>';
		document.getElementById('des_disp').style.display='block';
	}else{
		document.getElementById('des_disp').style.display='none';
	}
}
function des_disp2(){
	document.getElementById('des_disp').style.display='none';
}
function compare_time(a,b) {
   var arr=a.split("-");
   var starttime=new Date(arr[0],arr[1],arr[2]);
   var starttimes=starttime.getTime(); 
   var arrs=b.split("-"); 
   var endtime=new Date(arrs[0],arrs[1],arrs[2]);
   var endtimes=endtime.getTime();
   if(starttimes>endtimes)//开始大于结束
   {
   alert("请重新输入，开始时间必须小于结束时间");
     return false;
   } 
   else{ 
    return true; 
   }
} 
</script>
		<style type="text/css">
.STYLE2 {
	color: #ff0000
}
</style>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg"
		onload="validateDetail();card_inf_exp('1','');">
		<html:form method="post" action="/case/t47_transaction_modify.do">
<script type="text/javascript" src="../../js/calendar.js"></script>
			<bean:define id="p_chinavalue" name="chinavalue" />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 交易补录 &nbsp;&nbsp; </span>
						
						<span class="buttons"> 修改下一条: <html:select
								property="trans_key" style="width:180"
								onchange="dosubmit('t47_transaction_modify.do?flag=1&tableName=t47_transaction_ub')">
								<html:options collection="transkeyMap" property="label"
									labelProperty="value" />
							</html:select> &nbsp; 是否保存对手信息: 
							
							<bean:define id="yesNo_str" name="yesNo_str"></bean:define>
				                 <%=yesNo_str%>
							 &nbsp; 是否计算: 
							 <bean:define id="cal_ind_str" name="cal_ind_str"></bean:define>
				                 <%=cal_ind_str%>
							 <a href="#"
							onclick="checkForm('../../report/case/t47_transaction_modify_do.do?tableName=t47_transaction_ub')">
								<img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a> <a href="#"
							onclick="dosubmit('<bean:write name="url" />')"> <img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> <input type="hidden"
								name="url" value="<bean:write name="url" />" /> <html:hidden
								property="transactionkey" /> <html:hidden property="opp_sys_id" />
							<html:hidden property="opp_party_id" name="t47_transaction" /> </span>
					</div>

					<div class="cond_t2">
						<span class="buttons"> <strong> &nbsp;&nbsp;&nbsp;&nbsp;交易流水号:<bean:write
								name="t47_transaction" property="tx_no" /> <html:hidden
								name="t47_transaction" property="tx_no" /> &nbsp;&nbsp;传票号:<bean:write
								name="t47_transaction" property="voucher_no" /> <html:hidden
								name="t47_transaction" property="voucher_no" /> <input
								type="hidden" name="saveString"
								value="<bean:write name="saveString" />" /></strong> </span>
					</div>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />金融机构网点信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									机构网点代码：
								</td>
								<td align="left">
									<html:text property="organkey" name="t47_transaction"
										styleClass="text_white" size="25" readonly="true" />
									<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
									<logic:equal value="1" name="is_tf">
										<%
											String root = request.getContextPath();
											String root3 = "\"window.open('"
													+ root
													+ "/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes')\"";
										%>
										<input type="button" name="locate" value="定 位"
											class="in_button1" onclick=<%=root3%> />
									</logic:equal>
								</td>
								<td align="right">
									机构名称：
								</td>
								<td align="left">
									<html:text property="organName" name="t47_transaction"
										styleClass="text_white" size="25" readonly="true" />
									<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
								</td>
							</tr>
							<tr>
								<td align="right">
									机构与大额交易的关系：
								</td>
								<td align="left">
									<logic:equal property="org_trans_rela_flag"
										name="t47_transaction" value="0">
										<html:text property="org_trans_rela" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="org_trans_rela_flag"
										name="t47_transaction" value="0">
										<html:select name="t47_transaction" property="org_trans_rela">
											<html:options collection="org_trans_relaMap" property="key"
												labelProperty="value" />
										</html:select>
									</logic:notEqual>
								</td>
								<td align="right">
									机构行政区：
								</td>
								<td align="left">
									<bean:write property="org_area" name="t47_transaction" />
								</td>
							</tr>
						</table>
					</div>

					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />代办人信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									代办人姓名：
								</td>
								<td >
									<logic:equal property="agent_name_flag" name="t47_transaction"
										value="0">
										<html:text property="agent_name" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="agent_name_flag"
										name="t47_transaction" value="0">
										<html:text property="agent_name" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, 'agent_country', 'agent_card_type');" />
									</logic:notEqual>
								</td>
								<td >
									代办人国籍：
								</td>
								<td >
									<logic:equal property="agent_country_flag"
										name="t47_transaction" value="0">
										<html:select property="agent_country" style="width:200PX"
											disabled="true"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))" onmouseover="FixWidth(this);">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="agent_country" name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="agent_country_flag"
										name="t47_transaction" value="0">
										<html:select property="agent_country" style="width:200PX"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))"  onmouseover="FixWidth(this);">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td >
									代办人证件类型：
								</td>
								<td colspan="3">
									<logic:equal property="agent_card_type_flag"
										name="t47_transaction" value="0">
										<html:select property="agent_card_type"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											disabled="true" >
											<html:options collection="BITPMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="agent_card_type" name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="agent_card_type_flag"
										name="t47_transaction" value="0">
										<html:select property="agent_card_type"  
											onchange="card_inf_exp('agent_card_type','card_inf');change();validate($$('agent_card_no',0), 'agent_card_type', '');change();validate($$('agent_name',0), '', 'agent_card_type');">
											<html:options collection="BITPMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:notEqual>
									<html:text property="card_inf" size="30" maxlength="30"
										onblur="validate_type('card_inf');" />
								</td>
								</tr>
								<tr>
								<td >
									代办人证件号码：
								</td>
								<td colspan="3">
									<logic:equal property="agent_card_no_flag"
										name="t47_transaction" value="0">
										<html:text property="agent_card_no" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="agent_card_no_flag"
										name="t47_transaction" value="0">
										<html:text property="agent_card_no" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, 'agent_card_type', '');" />
									</logic:notEqual>
								</td>
							</tr>
						</table>
					</div>

					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />交易信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									业务标识：
								</td>
								<td align="left">

									<html:text property="transactionkey" name="t47_transaction"
										styleClass="text_white" size="25" readonly="true" />
									<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />

								</td>
								<td align="right">
									交易日期：
								</td>
								<td align="left">
									<logic:equal property="tx_dt_flag" name="t47_transaction"
										value="0">
										<html:text property="tx_dt_disp" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
										<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
									</logic:equal>
									<logic:notEqual property="tx_dt_flag" name="t47_transaction"
										value="0">
										<html:text property="tx_dt_disp" size="15" 
									onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
									</logic:notEqual>
									
								</td>
							</tr>
							<tr>
								<td align="right">
									客户名称：
								</td>
								<td align="left">
									<logic:equal property="party_chn_name_flag"
										name="t47_transaction" value="0">
										<html:text property="party_chn_name" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="party_chn_name_flag"
										name="t47_transaction" value="0">
										<html:text property="party_chn_name" name="t47_transaction"
											styleClass="text_white" size="25" />
									</logic:notEqual>
									<logic:equal value="1" name="is_tf">
										<input type="button" name="button222" value="定 位"
											class="in_button1"
											onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=host_cust_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" />

									</logic:equal>
								</td>
								<td align="right">
									原客户号：
								</td>
								<td align="left">
									<logic:equal property="host_cust_id_flag"
										name="t47_transaction" value="0">
										<html:text property="host_cust_id" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="host_cust_id_flag"
										name="t47_transaction" value="0">
										<html:text property="host_cust_id" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, '', '')" />
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									账号：
								</td>
								<td align="left">
									<logic:equal value="0" name="is_tf">
										<logic:equal property="acct_num_flag" name="t47_transaction"
											value="0">
											<html:text property="acct_num" name="t47_transaction"
												styleClass="text_white" size="25" readonly="true" />
											<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
										</logic:equal>
										<logic:notEqual property="acct_num_flag"
											name="t47_transaction" value="0">
											<html:text property="acct_num" name="t47_transaction"
												styleClass="text_white" size="25" onchange="change();"
												onblur="validate(this, '', '')" />
											<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
										</logic:notEqual>
									</logic:equal>
									<logic:equal value="1" name="is_tf">
										<html:text property="acct_num" name="t47_transaction"
											styleClass="text_white" size="20" onchange="change();"
											onblur="validate(this, '', '')" />
									</logic:equal>
								</td>
								<td align="right">
									借/贷：
								</td>
								<td align="left">
									<logic:equal property="debit_credit_flag"
										name="t47_transaction" value="0">
										<!-- <html:text property="debit_credit_disp" name="t47_transaction" styleClass="text_white" size="25" readonly="true" />  -->
										<html:select property="debit_credit" disabled="true">
											<html:options collection="debit_creditMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="debit_credit_flag"
										name="t47_transaction" value="0">
										<html:select property="debit_credit"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="debit_creditMap" property="label"
												labelProperty="value" />
										</html:select>
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									支付工具及结算方式：
								</td>
								<td align="left">
									<logic:equal property="settle_type_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="settle_type_cd" style="width:200px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" disabled="true" onmouseover="FixWidth(this);">
											<html:options collection="t87_pbc_gjfsMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="settle_type_cd" name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="settle_type_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="settle_type_cd"
											style="width:200px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="des_disp();" onmouseover="FixWidth(this);">
											<html:options collection="t87_pbc_gjfsMap" property="label"
												labelProperty="value" />
										</html:select>
							             &nbsp;&nbsp;                    
							        </logic:notEqual>
								</td>
								<td align="right">
									收/付：
								</td>
								<td align="left">
									<logic:equal property="receive_pay_cd_flag"
										name="t47_transaction" value="0">
										<!--<html:text property="receive_pay_cd_value" name="t47_transaction" styleClass="text_white" size="25" readonly="true" />-->
										<html:select property="receive_pay_cd" disabled="true">
											<html:options collection="receive_payMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="receive_pay_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="receive_pay_cd"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))" disabled="true">
											<html:options collection="receive_payMap" property="label"
												labelProperty="value" />
										</html:select> 
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易代码：
								</td>
								<td align="left">
									<logic:equal property="tx_cd_flag" name="t47_transaction"
										value="0">
										<html:select property="tx_cd" disabled="true" >
											<html:options collection="tx_cdMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="tx_cd_flag" name="t47_transaction"
										value="0">
										<html:select property="tx_cd">
											<html:options collection="tx_cdMap" property="label"
												labelProperty="value" />
										</html:select>
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
								<td align="right">
									是否跨境交易：
								</td>
								<td align="left">
									<logic:equal property="overarea_ind_flag"
										name="t47_transaction" value="0">
										<html:select property="overarea_ind" disabled="true">
											<html:options collection="overareaMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="overarea_ind_flag"
										name="t47_transaction" value="0">
										<html:select property="overarea_ind">
											<html:options collection="overareaMap" property="label"
												labelProperty="value" />
										</html:select>
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易类型：
								</td>
								<td align="left">
									<logic:equal property="tx_type_cd_flag" name="t47_transaction"
										value="0">
										<html:select property="tx_type_cd">
											<html:options collection="tx_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="tx_type_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="tx_type_cd" onchange="_ChangeColor()">
											<html:options collection="tx_typeMap" property="label"
												labelProperty="value" />
										</html:select> 
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
									<input type="hidden" name="tx_typecd"
										value="<bean:write name="t47_transaction" property="tx_type_cd" />" />
								</td>
								<td align="right">
									现钞标志：
								</td>
								<td align="left">
									<logic:notEqual property="cash_ind_flag" name="t47_transaction"
										value="0">
										<html:select property="cash_ind"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="changeType08();des_disp2();" >
											<html:options collection="t87_pbc_cashMap" property="label"
												labelProperty="value" />
										</html:select> 
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
									<logic:equal property="cash_ind_flag" name="t47_transaction"
										value="0">
										<html:select property="cash_ind" disabled="true">
											<html:options collection="t87_pbc_cashMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
								</td>
							</tr>
							<tr>
								<td align="right">
									币种：
								</td>
								<td align="left">
									<logic:equal property="currency_cd_flag" name="t47_transaction"
										value="0">
										<html:select property="currency_cd" disabled="true">
											<html:options collection="currencyMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="currency_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="currency_cd"  
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="changeType08();des_disp2();">
											<html:options collection="currencyMap" property="label"
												labelProperty="value" />
										</html:select>
                                        &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
								<td align="right">
									原金额：
								</td>

								<td align="left">
									<html:hidden property="amt" />
									<html:text property="amt_disp" name="t47_transaction"
										styleClass="text_white" size="25" readonly="true" />
									<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" height='20' />
								</td>
							</tr>
							<logic:equal property="curr_cd" name="t47_transaction" value="2">
								<tr>
									<td align="right">
										涉外收支交易分类与代码：
									</td>
									<td align="left">
										<%
											String taskkeyflag = (String) request.getAttribute("taskkeyflag");
											if (taskkeyflag.equals("1")) {
										%>
										<html:select property="tsctkey"style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="tsctMap" property="label"
												labelProperty="value" />
										</html:select>
										<%
										} else {
										%>
										<html:text property="tsctkey" onchange="change();"
											onblur="validate(this, 'tsct', '');"></html:text>
										<%
										}
										%>
									</td>
								</tr>
							</logic:equal>
							<logic:equal property="curr_cd" name="t47_transaction" value="1">
								<html:hidden property="tsctkey" />
							</logic:equal>
							<tr>
								<td align="right">
									交易方向：
								</td>
              					<td  bgcolor="F6F9FF">
              					<html:select property="tx_go_country"  onchange="_DispRep('tx_go_country','org1','orgreplay1','2')" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
			                   	<html:options collection="countryMap" property="label" labelProperty="value" />
			                   	</html:select>
                                 </td>
			   <logic:equal name="t47_transaction" property="tx_go_area" value="<%=p_chinavalue.toString()%>"  >
			   <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay1"></td>
               <td height="22"  bgcolor="ECF3FF" colspan="2" align="left"id="org1" style="display:none ">
               </logic:equal>
               <logic:notEqual  name="t47_transaction" property="tx_go_area" value="<%=p_chinavalue.toString()%>"  >
               <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay1"  style="display:none "></td>
               <td height="22"  bgcolor="ECF3FF" colspan="2" align="left" id="org1">
               </logic:notEqual>
            
			<html:select property="tx_go_area1" onchange="_Click('tx_go_area1','tx_go_area2','0');_Click('tx_go_area2','tx_go_area','0')"  style="width:150"  onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))"> 
			     <html:options collection="area1Map"
                                    property="label"
                                   labelProperty="value" />
                 </html:select>&nbsp;&nbsp; 
								   
				<html:select property="tx_go_area2" onchange="_Click('tx_go_area2','tx_go_area','0')"  style="width:150" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                <option value="">请选择</option>
                
			 </html:select> &nbsp;&nbsp; 
			 <html:select property="tx_go_area"   style="width:100" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
             <option value="">请选择</option>
              </html:select> 
            </tr>
            <tr >
				<td>交易发生地：</td>
                <td  bgcolor="F6F9FF">
                <html:select property="tx_occur_country" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))"  onchange="_DispRep('tx_occur_country','org2','orgreplay2','1')" >
                <html:options collection="countryMap" property="label" labelProperty="value" />
                </html:select>
                </td>       
             <logic:equal name="t47_transaction" property="tx_occur_area" value="<%=p_chinavalue.toString()%>">     
              <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay2">
			  </td>  
            	<td height="22" bgcolor="ECF3FF" colspan="2" align="left"  id="org2" style="display:none ">
          </logic:equal>
        
             <logic:notEqual  name="t47_transaction" property="tx_occur_area" value="<%=p_chinavalue.toString()%>"> 
             <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay2"  style="display:none ">
			
			  </td>
             <td height="22" bgcolor="ECF3FF" colspan="2" align="left"  id="org2">	
           </logic:notEqual>
			   <html:select property="tx_occur_area1"  style="width:150" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))"  onchange="_Click('tx_occur_area1','tx_occur_area2','0');_Click('tx_occur_area2','tx_occur_area')" >
			   <html:options collection="area1Map"
                                    property="label"
                                   labelProperty="value" /> 
			    </html:select> &nbsp;
			 <html:select property="tx_occur_area2" style="width:150" onchange="_Click('tx_occur_area2','tx_occur_area')"  style="width:100" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                <option value="">请选择</option>
                <option value="<bean:write property="tx_occur_area2" name="t47_transaction" />" selected> 
                <bean:write property="tx_occur_area2name" name="t47_transaction" /></option>
                </html:select> &nbsp;&nbsp;
                 
                <html:select property="tx_occur_area"  style="width:100" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                <option value="">请选择</option>
                <option value="<bean:write property="tx_occur_area" name="t47_transaction" />" selected> 
                <bean:write property="tx_occur_areaname" name="t47_transaction" /></option>
                 </html:select>

            </tr>
            <tr>
								<td>	用途或来源：
								</td>
								<td align="left" colspan="3">
									<logic:equal property="use_des_flag" name="t47_transaction"
										value="0">
										<html:textarea property="use_des" readonly="true" cols="80"
											rows="2"></html:textarea>

									</logic:equal>
									<logic:notEqual property="use_des_flag" name="t47_transaction"
										value="0">
										<html:textarea property="use_des" cols="80" rows="2"
											onchange="change();" onblur=""></html:textarea>
										<div id="des_disp" style="display: none;">
										</div>
									</logic:notEqual>
								</td>
							</tr>
						</table>
					</div>

					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />对方金融机构信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" >
									对方客户名称：
								</td>
								<td align="left">
									<logic:equal property="opp_name_flag" name="t47_transaction"
										value="0">
										<html:text property="opp_name" name="t47_transaction"
											styleClass="text_white" size="25" disabled="true" />
									</logic:equal>
									<logic:notEqual property="opp_name_flag" name="t47_transaction"
										value="0">
										<html:text property="opp_name" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, 'opp_area', 'opp_card_type');" />
									</logic:notEqual>
									 
									<a href="#" onclick="_Open('<%=request.getContextPath()%>/report/case/t47case_opp_info_list.do?newsearchflag=2','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									 
									<span id="color00"><font color="red">*</font> </span>
									&nbsp;&nbsp;
								</td>

								<td align="right">
									对手是否离岸帐户：
								</td>
								<td align="left">
									<logic:equal property="opp_off_shore_ind_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_off_shore_ind" disabled="true">
											<html:options collection="oppoffMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:equal>
									<logic:notEqual property="opp_off_shore_ind_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_off_shore_ind">
											<html:options collection="oppoffMap" property="label"
												labelProperty="value" />
										</html:select>
                                           &nbsp;&nbsp;<font color="red">*</font>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									对方账号类型：
								</td>
								<td align="left" >
									<logic:equal property="opp_acct_type_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_acct_type_cd" disabled="true"
											style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" style="width:200PX" onmouseover="FixWidth(this);">
											<html:options collection="pbc_cttpMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="opp_acct_type_cd"
											name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="opp_acct_type_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_acct_type_cd" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange=""  style="width:200PX" onmouseover="FixWidth(this);" >
											<html:options collection="pbc_catpMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:notEqual>
								</td>
								<td align="right">
									对方账号：
								</td>
								<td align="left">
									<logic:equal property="opp_acct_num_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_acct_num" name="t47_transaction"
											styleClass="text_white" size="25" disabled="true" />
									</logic:equal>
									<logic:notEqual property="opp_acct_num_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_acct_num" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, 'opp_acct_num', '');"/>

									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									对方客户类型：
								</td>
								<td align="left">
									<logic:equal property="opp_pbc_party_class_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_pbc_party_class_cd" disabled="true"
											 onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_cttpMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="opp_pbc_party_class_cd"
											name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="opp_pbc_party_class_cd_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_pbc_party_class_cd"
											onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_cttpMap" property="label"
												labelProperty="value" />
										</html:select>&nbsp;&nbsp;
                                       </logic:notEqual>
									<span id="color01"><font color="red">*</font> </span>
								</td>
								<td align="right">
									对方客户证件类型：
								</td>
								<td align="left" colspan="3">
									<logic:equal property="opp_Card_type_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_card_type" style="width:200px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" disabled="true" >
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:hidden property="opp_Card_type" name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="opp_Card_type_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_card_type" style="width:200px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="card_inf_exp('opp_card_type','opp_card_inf');change();validate($$('opp_name',0), 'opp_area', 'opp_card_type');change();validate($$('opp_card_no',0), 'opp_card_type', '');"  >
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>

									</logic:notEqual>
									<html:text property="opp_card_inf" size="30" maxlength="30"
										onblur="validate_type('opp_card_inf');" />
								</td>
							</tr>
							
							<tr>
								<td align="right">
									对方客户证件号码：
								</td>
								<td align="left">
									<logic:equal property="opp_Card_no_flag" name="t47_transaction"
										value="0">
										<html:text property="opp_card_no" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="opp_Card_no_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_card_no" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, 'opp_card_type', '');" />
									</logic:notEqual>
								</td>
								<td align="right">
									对方金融机构代码类型：
								</td>
								<td align="left">
									<logic:equal property="opp_organ_type_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_organ_type" disabled="true"
											style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="opp_organ_typeMap" property="label"
												labelProperty="value" />

										</html:select>
										<html:hidden property="opp_organ_type" name="t47_transaction" />
									</logic:equal>
									<logic:notEqual property="opp_organ_type_flag"
										name="t47_transaction" value="0">
										<html:select property="opp_organ_type" style="width:160"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="change();"
											onblur="validate($$('opp_organkey',0), '', 'opp_organ_type');">
											<html:options collection="opp_organ_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</logic:notEqual>
								</td>
							</tr>
							<tr>
								<td align="right">
									对方金融机构名称：
								</td>
								<td align="left">
									<logic:equal property="opp_organname_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_organname" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="opp_organname_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_organname" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, '', '')" />
									</logic:notEqual>
								</td>
								<td align="right">
									对方金融机构代码：
								</td>
								<td align="left">
									<logic:equal property="opp_organkey_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_organkey" name="t47_transaction"
											styleClass="text_white" size="25" readonly="true" />
									</logic:equal>
									<logic:notEqual property="opp_organkey_flag"
										name="t47_transaction" value="0">
										<html:text property="opp_organkey" name="t47_transaction"
											styleClass="text_white" size="25" onchange="change();"
											onblur="validate(this, '', 'opp_organ_type');" />
									</logic:notEqual>		 
								<a href="#" onclick="_Open('<%=request.getContextPath()%>/report/case/t47case_opp_bank_list.do?flag=1&newflag=0','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
								<td align="right">
									对方金融机构国家：
								</td>
              					<td bgcolor="F6F9FF">
			  					<html:select property="opp_coutry" style="width:200PX"  onchange="_DispRep('opp_coutry','org','orgreplay','0')" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                      			<html:options collection="countryMap" property="label" labelProperty="value" />
                				</html:select>
                				</td>
                				
			  <logic:equal name="t47_transaction" property="opp_area" value="<%=p_chinavalue.toString()%>">
              <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay"> </td>  
              <td height="22" bgcolor="ECF3FF" colspan="2" align="left"  id="org" style="display:none ">
              </logic:equal>
			  <logic:notEqual  name="t47_transaction" property="opp_area" value="<%=p_chinavalue.toString()%>">
              <td height="22" bgcolor="F6F9FF" colspan="2" align="left" id="orgreplay" style="display:none "> </td>
              <td height="22" bgcolor="ECF3FF" colspan="2" align="left"  id="org" >
              </logic:notEqual>
            
				    <html:select property="opp_area1" style="width:100" onchange="_Click('opp_area1','opp_area2');_Click('opp_area2','opp_area')" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                    <html:options collection="area1Map"
                                    property="label"
                                   labelProperty="value" />
              </html:select>&nbsp;&nbsp;
			  
			   <html:select property="opp_area2" style="width:100" onchange="_Click('opp_area2','opp_area')" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                     <option value="">请选择</option>
                    <option value="<bean:write property="opp_area2" name="t47_transaction" />" selected>
                    <bean:write property="opp_area2Name" name="t47_transaction" /></option> 
                </html:select> &nbsp;&nbsp;
				 <html:select property="opp_area" style="width:100" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                  <option value="">请选择</option>
                   <option value="<bean:write property="opp_area" name="t47_transaction" />" selected>
                   <bean:write property="opp_areaName" name="t47_transaction" /></option> 
              </html:select>				  
		    </tr>
          </table> 
	    
							 
					</div>
					<div class="sys_warning">
						<strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
						<p>
							&nbsp;&nbsp;1、大额报告必填要素：客户号、客户国籍、金融机构网点名称、金融机构所在地区行政区划代码、金融机构与大额交易的关系、金融机构网点代码类型、
							金融机构网点代码、交易日期、业务标示号、交易方式、交易方向、币种、交易金额、客户身份证件/证明文件号码、 客户名称/姓名。
							<br />
							&nbsp;&nbsp;2、可疑报告必填要素：金融机构名称、金融机构所在地区行政区划代码、金融机构代码类型、金融机构代码、客户号、客户国籍
							交易日期、交易发生地、业务标示号、交易方式、资金收付标志、币种、交易金额、 客户身份证件/证明文件号码、客户名称/姓名。
							<br />
							&nbsp;&nbsp;3、为了规则的监测，须尽量填写对手信息，尤其是对手账号。
						</p>
					</div>
				</div>
			</div>
		</html:form>
		<script type="text/javascript">
_ChangeColor();
_init(go_area1,go_area2,go_area0,'2');

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
