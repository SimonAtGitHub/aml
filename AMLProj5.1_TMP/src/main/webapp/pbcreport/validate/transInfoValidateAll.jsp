<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.T47_transaction"%>
<%@ page import="com.ist.util.StringUtils"%>
<%@ page import="java.util.HashMap"%>
<%HashMap errorMap=(HashMap)request.getAttribute("errorHash"); %>
	<head>
		<%String url = request.getContextPath();
     String cssurl=url+"/css/css_all.css";
     String  titlejsurl=url+"/js/title.js";
     String basefuncurl=url+"/js/basefunc.js";
     String app_selecturl=url+"/js/App_Select.js";

     String valurl=url+"/js/validate.js";
     String  countryurl=url+"/js/country.js";
   %>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=valurl%>></script>
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="/js/validate.js" language="javascript"></script>

		<%
		String saveflag = (String)request.getAttribute("savesucc");
		if(saveflag==null) saveflag="-1"; // 不是从保存后进入
		else if("1".equalsIgnoreCase(saveflag)) saveflag="1"; // 成功保存后进入
		else saveflag="0";
		 %>
		<script language="javascript">		
		if("<%=saveflag%>"=="0") alert("保存失败");
		else if("<%=saveflag%>"=="1") alert("保存成功!");
		
		var g_appid = "1";
		function card_inf_exp(type,value){
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
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
			var agent_card_type_value=document.forms[0].tbit.value;
			var opp_card_type_value=document.forms[0].tcit.value;
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].tbit_inf.style.visibility='hidden';
				showValidateMsg($$('tbit_inf',0),'4','');
			}else {
				document.forms[0].tbit_inf.focus();
			}
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].tcit_inf.style.visibility='hidden';
				showValidateMsg($$('tcit_inf',0),'4','');
			}else {
				document.forms[0].tcit_inf.focus();
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
		   var str1 = " ";
           var str3 = "　";
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==str1)||(str2.substr(0,1)==str1)||(str2.substr(str2.length-1,1)==str3)||(str2.substr(0,1)==str3)){
         return(1);
         }
         }
       }				
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // 验证提示框
			//	g_ArrMsg.pop();
			var bAlertType = '<bean:write name='report_type'/>';
			
			//g_changed = true;
			//validate($$('ticd',0), '', '');
			g_changed = true;
			validate($$('tbnm',0), '', 'tbit');
			g_changed = true;	
			validate($$('tbid',0), 'tbit', '');
			g_changed = true;
			validate($$('settle_type_cd',0), 'tstp', '');
			
			<% String isTestPoint=(String)request.getAttribute("isTestPoint");
		      	  if(!"1".equals(isTestPoint))
		      	  {
		     %>
				g_changed = true;
				validate($$('tsct_key',0), 'tsct', '');
			<%}%> 
			
			g_changed = true;
			validate($$('ocurr',0), 'trcd', '');
			g_changed = true;
		    
			
			if(bAlertType=="1") {
			//g_changed = true;
			//validate($$('go',0), 'tdrc', '');
			g_changed = true;
	        validate($$('rltp',0), 'rltp_hash', '');
	        //g_changed = true;
	       // validate($$('ctac',0), '', '');
	       //  g_changed = true;
	       // validate($$('crat',0), '', '');
	        //g_changed = true;
	       // validate($$('crpp',0), '', '');
			g_changed = true;
				validate($$('finc',0), '', 'fict');
				g_changed = true;
				validate($$('finn',0), '', '');
				//g_changed = true;
				//validate($$('area',0), 'firc', '');
			}
			/*if (bAlertType=="2"){
				validate($$('opp_organarea',0), 'cfrc', '');
				g_changed = true;
				validate($$('crsp',0), '', '');
			}
			g_changed = true;
			validate($$('cfin',0), '', '1');
			g_changed = true;
			validate($$('cfic',0), '', 'cfct');
			g_changed = true;
			validate($$('tcnm',0), '', 'tcit');*/
			g_changed = true;
			validate($$('tcid',0), 'tcit', '');
			//g_changed = true;
			//validate($$('cfrc',0), 'cfrc', '');		
			//g_changed = true;
			//validate($$('tcac',0), 'tcat', '');		
			g_changed = false;
			
		 var agent_name=document.forms[0].tbnm.value;
			var agent_card_type=document.forms[0].tbit.value;
			var agent_card_no=document.forms[0].tbid.value;
			var agent_country=document.forms[0].tbnt.value;
	 
		   if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_card_no=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
 
				showValidateMsg($$('agent_table',0),'4','');	
			}else{
				showValidateMsg($$('agent_table',0),'2','代办人信息其中有一项为空时，所有代办人信息字段都应空，其中一项非空时，所有都必须非空');
			}
			validateDetail2('all');
		}
		function validateAgent() {
　　　　　　 　  var agent_name=document.forms[0].tbnm.value;
			var agent_card_type=document.forms[0].tbit.value;
			var agent_card_no=document.forms[0].tbid.value;
			var agent_country=document.forms[0].tbnt.value;
	 
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_card_no=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
		 
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','代办人信息其中有一项为空时，所有代办人信息字段都应空，其中一项非空时，所有都必须非空');
			}
		}
		
		function validateDetail2(type) {
		var valflag= '<bean:write name='report_type'/>';
		var alert_type='BS';
		if(valflag==1||valflag==3)alert_type='BH';	
		if(valflag==1){
	   if(type=='all'||type=='ctac'){
	      g_changed = true;
          if(valflag==3){
                validate1($$('ctac',0), '', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));    
          } else{		
			    validate1($$('ctac',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));    
		  }
		}
		
		if(type=='all'||type=='catp'){
           		g_changed = true;
           if(valflag==3){
               validate1($$('catp',0), 'pbc_catp', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
           }else{
			    validate1($$('catp',0), 'pbc_catp', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
		   }
		}
		}
		if(type=='all'||type=='cfin'){
		if(valflag==3){
		      g_changed = true;
              validate1($$('cfin',0), '', '1','',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
            }else{
		      g_changed = true;
			  validate1($$('cfin',0), '', '1',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
		    }
		 }
		if(type=='all'||type=='cfic'){
		    g_changed = true;
		    validate1($$('cfic',0), '', 'cfct',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
         if((type=='all'||type=='opp_organarea')&&valflag!=1){
		    g_changed = true;
		    validate1($$('opp_organarea',0), 'cfrc', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        if(type=='all'||type=='cfct'){
            g_changed = true;
			validate1($$('cfct',0), 'cfct_hash', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        if(type=='all'||type=='tcnm'){
            if(valflag==2||valflag==3){
			    g_changed = true;
			    if(valflag==3&&get_obj_value('opp_organarea')=='')
			       validate1($$('tcnm',0), '', 'tcit','BS',get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));
		        else
			    validate1($$('tcnm',0), '', 'tcit','BS',get_obj_value('tsdr'),get_obj_value('opp_organarea'),'',get_obj_value('settle_type_cd'));
		    } else{
			    g_changed = true;
			    validate1($$('tcnm',0), '', 'tcit',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));
		    }
		}
		if(type=='all'||type=='tcac'){
		   if(valflag==3){
		       g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),get_obj_value('opp_organarea'),get_obj_value('go'),get_obj_value('settle_type_cd'));
           }else if(valflag==1){
               g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));     
           }else if(valflag==2){
               g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),get_obj_value('opp_organarea'),'',get_obj_value('settle_type_cd'));
           }
        }
        if(type=='all'||type=='ocurr'){
            if(valflag==3){
             g_changed = true;
              validate1($$('ocurr',0), 'trcd', '','BS',get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
            }else{
             g_changed = true;
			  validate1($$('ocurr',0), 'trcd', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
           }		
		}
		
		if((type=='all'||type=='go')&&valflag!=2){
            g_changed = true;
			validate1($$('go',0), 'tdrc', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
		}
		
	    if(type=='all'||type=='crsp'||type=='crpp'){
		 if((type=='all'||type=='crsp')&&alert_type=='BS'){
			  g_changed = true;
			  validate1($$('crsp',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));		    
         }else{
             g_changed = true;
			 validate1($$('crpp',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        }
        //Begin  2009-05-18 修改
      if(type=='all'||type=='tcid'){
           		g_changed = true;
           		validate1($$('tcid',0), 'tcit', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));     	    
		}
	　//end   2009-05-18 修改
	
      //add by qiuyun 2013-3-22 试点增加验证：当交易方式为20(网上支付)时，涉外交易代码填写IP
      <%
      	  if("1".equals(isTestPoint))
      	  {
      %>
	       if(type=='all')
	       {	
	    	   des_disp2();
	       }
	  <%}%>
    	
        
	}

		function des_disp2(){

			var jsfs=document.forms[0].settle_type_cd.value;

			var isTestPoint='<%=isTestPoint%>';
			if (jsfs=='000120'&&isTestPoint=='1')
			{
				document.getElementById('tsct_disp').style.display='none';		
				document.getElementById('tsct_key').readOnly=false;
				
				testRegx($$('tsct_key',0));
			}else
			{
				
				document.getElementById('tsct_disp').style.display='';		
				document.getElementById('tsct_key').readOnly=true;
				change();				
				validate($$('tsct_key',0), 'tsct', '');
			}
			
		
		}

	
		</script>
		<script language="javascript"><!--
		function fPopUpCalendarDlg(ctrlobj)
		{
			showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
			showy = event.screenY - event.offsetY + 18; // + deltaY;
			newWINwidth = 210 + 4 + 18;
		
			retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval != null ){
				ctrlobj.value = retval;
			}else{
				//alert("canceled");
			}
		}
function _Confim(url, type){
	    var  bAlertType = '<bean:write name='report_type'/>';
			var errMsg ="";
		if ((document.forms[0].tbit.value=='19')&&(getLength(document.forms[0].tbit_inf.value)>30||getLength(document.forms[0].tbit_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
    }
	if ((document.forms[0].tcit.value=='19' || document.forms[0].tcit.value=='29')&&(getLength(document.forms[0].tcit_inf.value)>30||getLength(document.forms[0].tcit_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
    }		
   //业务标识码
    if (getLength(document.forms[0].ticd.value)==0) {
        errMsg = "业务标识码不能为空！";
    } //资金收付标识
    else if (getLength(document.forms[0].tsdr.value)==0) {
        errMsg = "资金收付标识不能为空！";
    } //币种
    else if (getLength(document.forms[0].crtp.value)==0) {
        errMsg = "币种不能为空！";
       
    }
    // else if (getLength(document.forms[0].tx_occur.value)==0) {
  //      errMsg = "交易发生地不能为空！";
       
  //  }
  
     //对方金融机构网点名称
    else if (getLength(document.forms[0].cfin.value)>256) {
        errMsg = "对方金融机构网点名称不能多于256个字符！";
    }
    
     //交易代办人姓名
    else if (getLength(document.forms[0].tbnm.value)>10) {
        errMsg = "交易代办人姓名不能多于10个字符！";
    }
     //交易代办人身份证件号码
    else if (getLength(document.forms[0].tbid.value)>20) {
        errMsg = "交易代办人身份证件号码不能多于20个字符！";
    }
      //对方金融机构网点代码
    else if (getLength(document.forms[0].cfic.value)>24) {
        errMsg = "对方金融机构网点代码不能多于24个字符！";
    }
     //交易对手姓名
    else if (getLength(document.forms[0].tcnm.value)>256) {
        errMsg = "交易对手姓名不能多于256个字符！";
    }
    //交易对手证件号码
    else if (getLength(document.forms[0].tcid.value)>24) {
        errMsg = "交易对手证件号码不能多于24个字符！";
    }
    //交易对手账号
    else if (getLength(document.forms[0].tcac.value)>64) {
        errMsg = "交易对手账号不能多于64个字符！";
    }
    if (bAlertType=='1'){
    //账号
 /* if (getLength(document.forms[0].ctac.value)>24) {
        errMsg = "账号不能多于24个字符！";
        }
        //资金来源和用途
    else if (getLength(document.forms[0].crpp.value)>128) {
        errMsg = "资金来源和用途不能多于128个字符！";
      
    }*/
     //账号标识码
    if (getLength(document.forms[0].ctac.value)==0&&document.forms[0].rltp.value=="01") {
        errMsg = "金融机构与大额交易的关系为'收单行'时,账号不能为空！";
         
    }
    
      //交易方向
  // else if (getLength(document.forms[0].tx_go.value)==0) {
  //     errMsg = "交易方向不能为空！";
        
   // }
      //金融机构与大额交易的关系
    else  if (getLength(document.forms[0].rltp.value)==0) {
        errMsg = "金融机构与大额交易的关系不能为空！";
      
    }
     if (document.forms[0].go.value=="XXX000000" && getLength(document.forms[0].cfin.value)==0) {
        errMsg = "当交易方向为汇入资金的境外机构为转汇行时，对方金融机构网点名称不能为空应填写转汇行名称！";
      
    }
    }
 /*if (bAlertType=='2'){
    //销户时间不能小于开户时间
    /* if (getLength(document.forms[0].close_dt_disp.value)!=0&&document.forms[0].open_dt_disp.value>document.forms[0].close_dt_disp.value) {
        errMsg = "销户时间不能小于开户时间！";
      
    }
 }*/
    /*if (document.forms[0].settle_type_cd.value.substr(2,2)=="00" && getLength(document.forms[0].ocurr.value)==0){
       errMsg = "当交易方式为现钞交易时交易发生地不能为空！";
  }
//资金来源和用途
    else if (getLength(document.forms[0].crsp.value)>128) {
        errMsg = "资金来源和用途不能多于128个字符！";
      
    }
    }*/
  /* if (document.forms[0].cny_amt.value==document.forms[0].acct_num.value){
     errMsg = "交易金额不能等于账号！";
    }else if (document.forms[0].cny_amt.value==document.forms[0].opp_acct_num.value){
     errMsg = "交易金额不能等于交易对手账号！";
    }else if (document.forms[0].cny_amt.value==document.forms[0].agent_card_no.value){
     errMsg = "交易金额不能等于代办人身份证件号码！";
    }else if (document.forms[0].cny_amt.value==document.forms[0].opp_card_no.value){
     errMsg = "交易金额不能等于交易对手身份证件号码！";
    }else if (document.forms[0].cny_amt.value==document.forms[0].card_no.value){
     errMsg = "交易金额不能等于客户身份证件号码！";
    }else if (bAlertType=='2'&& document.forms[0].cny_amt.value==document.forms[0].lgent_card_no.value){
     errMsg = "交易金额不能等于法定代表人身份证件号码！";
    }*/
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
				if( !checkAllValidate()) {
				//alert("存在未校正的数据，保存失败！");
				return ;
			}
		   document.forms[0].action=url;
		   document.forms[0].submit();
		   
		}
		
		--></script>
		<style type="text/css">
			.STYLE2 {color: #ff0000}
		</style>
		<script language="javascript">
			var c= new Array();
			c.push(0);c.push(0);c.push(0);c.push(0);
			function expand(idx, id) {
				/*c[idx]++; 
				var disp='none'; 
				if(c[idx]==1) 
					disp='none'; 
				else {
					disp=''; 
					c[idx]=0;
				} 
				document.getElementById(id).style.display=disp;*/
			}
			
function  _back(url){
           document.forms[0].action=url;
		   document.forms[0].submit();
}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg"
		onload="card_inf_exp('1','');validateDetail();"> 
		<html:form action="/validate/getValidateTransDisp" method="post">	
		<input type="hidden" name="reportkey" value="<bean:write name="reportkey"/>"/>
			<input type="hidden" name="ticd" value="<bean:write name="ticd"/>"/>
			<input type="hidden" name="rpdi_seqno" value="<bean:write name="rpdi_seqno"/>"/>	
			<input type="hidden" name="ctif_seqno" value="<bean:write name="ctif_seqno"/>"/>
			<input type="hidden" name="crcd" value="<bean:write name="crcd"/>"/>
			<input type="hidden" name="trans_type" value="<bean:write name="trans_type"/>"></input>
        	<input type="hidden" name="saveString" value="<bean:write name="saveString"/>"></input> 		
	 <div id="main">
			<!-- conditions --> 
               <div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>交易信息补录</span>
						<span class="buttons">
						 	<input type="checkbox" name="toSource" checked="true"  value="1"/>保存回原数据&nbsp;&nbsp;&nbsp;
						 <logic:present name="fromcase">
						 <logic:notEqual name="fromcase" value="1">
							 修改下一条: <html:select
								property="trans_seq" style="width:350px" 
								onchange="_back('getValidateTransDisp.do')">
								<html:options collection="transMap" property="label"
									labelProperty="value" />
							</html:select> &nbsp; 
							</logic:notEqual>
							</logic:present>
							<a href="#" onclick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/modifyTransDo.do')">
							    <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
						    <a href="#"
							    onclick="_back('<%=request.getAttribute("validbackurl")%>')">
							    <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
							    <input type="hidden" name="validbackurl"
								value="<%=request.getAttribute("validbackurl")%>" />
								 <input type="hidden" name="fromcase"
								value="<%=request.getAttribute("fromcase")%>" />
							    
					     </span>
					</div>
					
			<logic:equal value="1" name="report_type">
   
						<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
	             <tr><th colspan="4"><strong>机构信息</strong></th></tr>
									<tr>
										<td><!--FICT-->
											
											 网点代码类型：
										</td>
										<td>
											<html:text property="fict"  readonly="true"/>
											<img src="../../images/lock.jpg" height='20' />		
											<font color=#CC0000><strong><%if(errorMap!=null&&errorMap.containsKey("FICT")) out.print("["+errorMap.get("FICT")+"]");%>
											</strong>
											</font>											
										</td>
										<td><!--FINC-->
											
											 网点代码：
										</td>
										<td>
											 <html:text property="finc" onchange="change();"
												onblur="validate(this, '', 'fict');"/>
											
										<font color=#CC0000><strong><%if(errorMap!=null&&errorMap.containsKey("FINC")) out.print("["+errorMap.get("FINC")+"]");%>
											</strong>
											</font>			 
										</td>
									</tr>
									<tr>
										<td><!--FINN-->
											

											 金融机构网点名称：
										</td>
										<td>
											  <html:text property="finn" onchange="change();" onblur="validate(this, '', '');" />
											 <font color="#CC0000"><strong>
											  <%if(errorMap!=null&&errorMap.containsKey("FINN")) out.print("["+errorMap.get("FINN")+"]");%>
											</strong>
											</font>
										</td>
										<td><!--RLTP-->
											
											 机构与大额交易关系：
										</td>
										<td >
											<html:select property="rltp">
												<html:options collection="rltpMap" property="key" labelProperty="value" />
											</html:select><font color="#FF0000"> *</font>
											  <font color=#CC0000><strong>
											   <%if(errorMap!=null&&errorMap.containsKey("RLTP")) out.print("["+errorMap.get("RLTP")+"]");%>
											</strong>
											</font>
										</td>
										
									</tr>
									<tr>
										<td><!--FIRC-->
											
											 地区行政区划代码：
										</td>
										<td colspan="3">
										
											<html:text property="firc_disp" readonly="true" />
											<html:text property="firc"  readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	
											<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("FIRC")) out.print("["+errorMap.get("FIRC")+"]");%>
											</strong>
											</font>
											</td>
									</tr>
 </table>
					</div>
			</logic:equal>
			
 

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" align="center" id="agent_table">
						<tr><th colspan="4"><strong>代办人信息</strong></th></tr>
								<tr>
									<td>
										<!--TBNM-->代办人姓名： </td>
									<td>
										<html:text property="tbnm" onchange="change();"
											onblur="validate(this, '', 'tbit');validateAgent();" />
										<img style="display:none" width="20" height="20" />
											 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBNM")||errorMap.containsKey("BKNM"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBNM"))+StringUtils.nullToStr((String)errorMap.get("BKNM"))+"]");%>
									  </strong>
									  </font>
									</td>
									<td><!--TBNT-->
										
										 代办人国籍：
									</td>
									<td>
										<html:select property="tbnt"
											onchange="validateAgent();">
											<html:options collection="nationalityMap" property="label"
												labelProperty="value" />
										</html:select>
										<img style="display:none" width="20" height="20" />
										  <font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBNT")||errorMap.containsKey("BKNT"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBNT"))+StringUtils.nullToStr((String)errorMap.get("BKNT"))+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>
								
								<tr>
									<td><!--TBIT-->
										
										 代办人身份证件类型：
									</td>
									<td colspan="3">
										<html:select property="tbit" style="width:250px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" 
											onchange="card_inf_exp('tbit','tbit_inf');change();validate($$('tbid',0), 'tbit', '');change();validate($$('tbnm',0), '', 'tbit');validateAgent();">
											<html:options collection="agent_card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:text  property="tbit_inf" size="30" maxlength="30"  onblur="validate_type('tbit_inf');validateAgent();"/> 
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBIT")||errorMap.containsKey("BITP"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBIT"))+StringUtils.nullToStr((String)errorMap.get("BITP"))+"]");%>
									 </strong>
									  </font>
									</td>
								 </tr>
									<tr>
									<td><!--TBID-->
										
										 代办人身份证件号码：
									</td>
									
									<td colspan="3">
										<html:text property="tbid" onchange="change();"
											onblur="validate(this, 'tbit', '');validateAgent();" />
											
										<img style="display:none" width="20" height="20" />
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBID")||errorMap.containsKey("BKID"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBID"))+StringUtils.nullToStr((String)errorMap.get("BKID"))+"]");%>
									  </strong>
									  </font>
									</td>
								</tr>
						
			</table>
					</div>
			 

					<div class="cond_c2">
						 <table width="100%" border="0" cellpadding="1" cellspacing="1">
					 <tr><th colspan="4"><strong>交易信息</strong></th></tr>
							<logic:equal value="1" name="report_type">
								<tr>
									<td><!--CATP-->
										 帐户类型：
									</td>
									<td>										
										<html:select style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" property="catp" onchange="change();" onblur="validateDetail2('catp');">
											<html:options collection="catpMap" property="key" labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CATP")) out.print("["+errorMap.get("CATP")+"]");%>
									 </strong>
									  </font>
									</td>
									<td><!--CTAC-->
										 账号：
									</td>
									<td>
								    <html:text property="ctac" onchange="change();" onblur="validateDetail2('ctac');" alt="账号" />
									  <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CTAC")) out.print("["+errorMap.get("CTAC")+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>	
								  </logic:equal>
								 <tr>
							     <td><!--TSTM-->
										 交易时间：
									</td>
									<td>

										<html:text property="tstm_disp" readonly="true" />
									  <img src="../../images/lock.jpg" height='20' />
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSTM")) out.print("["+errorMap.get("TSTM")+"]");%>
									  </strong>
									  </font>
									</td>
									
									<td><!--CRTP-->
										 币种：
									</td>
									<td>
										<%--<html:select property="crtp" disabled="true">
											<html:options collection="crtpMap" property="key"
												labelProperty="value" />
										</html:select>
											<img src="../../images/lock.jpg" height='20'>--%>
										<html:text property="crtp_disp" readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	<html:hidden property="crtp" />	
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRTP")) out.print("["+errorMap.get("CRTP")+"]");%>
									  </strong>
									  </font>
									</td>
								</tr>
								
								<tr>
								<td><!--CRAT-->
										 交易金额：
									</td>
									<td>
										<html:text property="crat_disp" onchange="change();" onblur="validate(this, '', '');" readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	<html:hidden property="crat" />
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRAT")) out.print("["+errorMap.get("CRAT")+"]");%>
									  </strong>
									  </font>
									</td>
			<td><!--TSDR-->
										

										 资金收付标识：
									</td>
									<td>
										<html:select property="tsdr" onchange="change();" onblur="validateDetail2('all');">
											<html:options collection="tsdrMap" property="key" labelProperty="value" />
										</html:select><font color="#FF0000"> *</font>
	                                 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSDR")) out.print("["+errorMap.get("TSDR")+"]");%>
									 </strong>
									  </font>
									</td>	
								</tr>
								 <tr>
									<td><!--TSTP-->
										 交易方式：
									</td>
									<td colspan="3"><!--<html:select property="tstp">
											<html:options collection="tstpMap" property="key"
												labelProperty="value" />
										</html:select>-->
									    <html:text property="tstp_disp" readonly="true"  size="30"  alt="交易方式" onclick="window.open('../../common/editTransWay.jsp?inname=settle_type_cd&inname_disp=tstp_disp','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');" />   
										<html:text property="settle_type_cd"  readonly="true"onchange="change();" onblur="validate(this, 'tstp', '');validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSTP")) out.print("["+errorMap.get("TSTP")+"]");%>
									 </strong>
									  </font>
									</td>
									</tr>
											
								<tr>
								<tr>
									
									
									<td><!--TSCT-->
										 涉外交易分类代码：
									</td>
									<td colspan="3"><!-- select tsctMap key value-->
									 <html:text styleId="tsct_disp" property="tsct_disp" readonly="true" size="30"  onclick="window.open('../../common/editTsct.jsp?inname=tsct_key&inname_disp=tsct_disp','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<html:text styleId="tsct_key" property="tsct_key"  readonly="true" onchange="" onblur="des_disp2();"/>
									 
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSCT")) out.print("["+errorMap.get("TSCT")+"]");%>
									  </strong>
									  </font>
									
									   
									</td>
								</tr>	
								<tr>
									<td><!--TRCD-->
										 交易发生地：
									</td>
									<td colspan="3">
										<html:text property="trcd_disp" size="30"  readonly="true"onclick="window.open('../../common/editCountryArea.jsp?inname=ocurr&inname_disp=trcd_disp&type=0','enter1','height=20, width=850,left=100,top=100,scrollbars=yes,resizable=yes');" alt="交易发生地"/>
										<html:text property="ocurr" readonly="true"onchange="change();" onblur="validateDetail2('ocurr');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TRCD")) out.print("["+errorMap.get("TRCD")+"]");%>
									  </strong></font>
									</td>
								</tr>
								<logic:equal value="1" name="report_type">
									<tr>
										<!-- 大额 -->
										<td><!--TDRC-->
											
											 交易方向：
										</td>
										<td colspan="3"><!--  onclick="showCountryAreaInput(this)" --><!-- <img src="../../images/lock.jpg" height='20'> --><!-- onchange="change();" onblur="validate(this, '', '');"  -->
										    <html:text property="tdrc_disp" size="30" readonly="true" onclick="window.open('../../common/editCountryArea.jsp?inname=go&inname_disp=tdrc_disp&type=1','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');" alt="交易方向"/>
										<html:text property="go" readonly="true"onchange="change();" onblur="validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TDRC")) out.print("["+errorMap.get("TDRC")+"]");%>
									  </strong></font>
									</td>
									</tr>
									<tr>
									<!-- 大额 -->
										<td><!--CRPP-->
											 资金用途：
										</td>
										<td colspan="3">
											<html:text property="crpp"  size="30" maxlength="64"  onchange="change();"
												onblur="validateDetail2('crpp');" />
												<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRPP")) out.print("["+errorMap.get("CRPP")+"]");%>
									  </strong></font>
                                        </td>
								</tr>
								</logic:equal>
								<logic:equal value="2" name="report_type">
									<!-- 可疑 -->
									<!-- 交易对手信息  -->
									<tr>
										<!-- 可疑 -->
										<td><!--CRSP-->
											 资金来源和用途：
										</td>
										<td>
											<html:text property="crsp"  size="40" maxlength="64" onchange="change();"
												onblur="validateDetail2('crsp');" />
												<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRSP")) out.print("["+errorMap.get("CRSP")+"]");%>
									  </strong></font>
                                        </td>
									</tr>

								</logic:equal>
							 <tr><th colspan="4"><strong>对手信息</strong></th></tr>

				 
								<logic:equal value="2" name="report_type">
								<tr>
									<td>
										<!--CFRC-->
										对方金融机构网点行政区划代码：
									</td>
									<td colspan="3">
										<html:text property="cfrc_disp" size="40"  readonly="true" onclick="window.open('../../common/editCountryArea.jsp?inname=opp_organarea&inname_disp=cfrc_disp','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<!--select oppPbcAreaMap key  value-->
										<html:text property="opp_organarea" readonly="true" onchange="change();" onblur="validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFRC")) out.print("["+errorMap.get("CFRC")+"]");%>
									 </strong> </font>
									</td>
								</tr>
								</logic:equal>
								<tr>
									<td>
										<!--CFIN-->
										对方金融机构网点名称：
									</td>
									<td colspan="3">
										<html:text property="cfin" size="40" onchange="change();"onblur="validateDetail2('cfin');" />
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFIN")) out.print("["+errorMap.get("CFIN")+"]");%>
									 </strong> </font>
									</td>
								 </tr>
								<tr>
									<td>
										<!--CFCT-->
										对方金融机构代码类型：
									</td>
									<td colspan="3">
										<html:select property="cfct"  onchange="change();validateDetail2('cfct');validateDetail2('cfic');">
										<html:option value="@I" >--请选择--</html:option>
											<html:options collection="opp_organ_typeMap" property="key"
												labelProperty="value" />
										</html:select>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFCT")) out.print("["+errorMap.get("CFCT")+"]");%>
									 </strong> </font>
									</td>
								</tr>
								<tr>
									<td>
										<!--CFIC-->
										对方金融机构网点代码：
									</td>
									<td colspan="3">
										<html:text property="cfic" size="40" onchange="change();"
											onblur="validateDetail2('cfic');" />
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("CFIC")||errorMap.containsKey("CFNC"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("CFIC"))+StringUtils.nullToStr((String)errorMap.get("CFNC"))+"]");%>
									 </strong> </font>
                                    </td>
							
								</tr>
								 <tr>
								 		<td>
										<!--TCNM-->
										交易对手姓名：
									</td>
									<td colspan="3">
										<script language="javascript">
												var class_cd = '<bean:write name='class_cd'></bean:write>';
												
											</script>
										<html:text property="tcnm" size="40" onchange="change();"
											onblur="validateDetail2('tcnm');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCNM")) out.print("["+errorMap.get("TCNM")+"]");%>
									  </strong></font>
									</td>
									</tr>
								<tr>
									<td>
										<!--TCID-->
										交易对手证件号码：
									</td>
									<td colspan="3">
										<html:text property="tcid" size="40" onchange="change();"  
											onblur="validate(this, 'tcit', '');validateDetail2('tcid');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCID")) out.print("["+errorMap.get("TCID")+"]");%>
									  </strong></font>
									</td>
								</tr>
								<tr>
									<td>
										<!--TCIT-->
										交易对手证件类型：
									</td>
									<td colspan="3">
									
										<html:select property="tcit" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="card_inf_exp('tcit','tcit_inf');change();validateDetail2('tcnm');change();validateDetail2('tcid');">
											<html:option value="@I" >--请选择--</html:option>
											<html:options collection="opp_card_typeMap" property="key"
												labelProperty="value" />
										</html:select>
										 <html:text  property="tcit_inf" size="30" maxlength="30" onblur="validate_type('tcit_inf');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCIT")) out.print("["+errorMap.get("TCIT")+"]");%>
									</strong>  </font>
									</td>
								 </tr>
								
								
								<tr>
									<td>
										<!--TCAT-->
										交易对手账号类型：
									</td>
									<td colspan="3">
										
										<html:select property="tcat" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="change();validate($$('tcac',0), 'tcat', '');">
											<html:option value="@I" >--请选择--</html:option>
											<html:options collection="opp_acct_type_cdMap" property="key"
												labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCAT")) out.print("["+errorMap.get("TCAT")+"]");%>
									  </strong></font>
									</td>
								 </tr>
								<tr>
									<td>
										<!--TCAC-->
										交易对手账号：
									</td>
									<td colspan="3">
										<html:text property="tcac" size="40" onchange="change();"
											onblur="validateDetail2('tcac');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCAC")) out.print("["+errorMap.get("TCAC")+"]");%>
									 </strong> </font>
                                     </td>
								</tr>
					</table>
					</div>
					</div>
					
		</html:form>
	</BODY>
	<!--提示块-->
	<div id=div_hint style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
	
</html>
