<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/uc.js" ></script>
		<script type="text/javascript" src="../../js/selectbox.js"></script>
		<script type="text/javascript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
 
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
       isSub=true;
    }
    else if(type=='del'){
    	
    	errMsg = CheckBoxMustChecked(document.forms[0]);
       // if(errMsg=='')
      //  {   if(confirm('你真的要删除吗？'))
      //      {
     //           isSub = true;
     //       }
     //   }	
        
        }
    if(errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        
        alert(errMsg);
        return false;
    }
}


function getReportkey(){

	document.getElementsByName("reportkey")[0].value=window.parent.document.getElementsByName("reportkey")[0].value;
}
function _open(type){
	var reault= parent._Confim('','validate');
	if(reault==false)
	{
		return false;
	}

	
    
	var casetype='1';//案例类型 1大额 2可疑
	//根据父页面的大额交易特征的值，判断案例种类
	//alert(parent.document.getElementsByName("stcr")[0]);
	if(parent.document.getElementsByName("stcr")[0]==null||parent.document.getElementsByName("stcr")[0]=="undefined")
	{
		casetype='2';
		var reault1= parent._Confim1();
    if(reault1==false){
      return false;
    }
	}
	
	
	var url='';
    var val='';
    var party_id ='';
    if(casetype=="2"){
    var i_party = parent.document.getElementById("iframe_party").contentWindow;
    var form= i_party.document.forms[0];
    for(var i=0;i<form.elements.length;i++){
         if((true == form.elements[i].checked) && (form.elements[i].type == "radio")){
        	 val=form.elements[i].value;
         }
    }
    
    //alert(val);
	 party_id = val.substring(0,val.indexOf("--"));

	var temp = val.substring(val.indexOf("--")+2);
	//alert(party_id);
	//alert(temp);
	
	var	party_chn_name = temp.substring(0,temp.indexOf("--"));
	//alert(party_chn_name);
	
	temp = temp.substring(temp.indexOf("--")+2);
	var	party_class_cd = temp.substring(0,temp.indexOf("--"));
	//alert(party_class_cd);

	temp = temp.substring(temp.indexOf("--")+2);
	var is_party = temp;
	//alert(is_party);

   }
    
	if (type=='add'){
	     // ljd add stcr
   		 var stcr="";
	     if(casetype=="1"){
		 party_id=parent.document.forms[0].csnm.value;
		 //ljd add stcr
		 stcr=parent.document.forms[0].stcr.value;
		 
		 }
   		url='<%=request.getContextPath()%>/report/case/t07_case_app_add_trans_page.do?searchtype=all&party_id='+ party_id+'&stcr='+stcr;
	}
	
	if(type=='newadd')
		
	{	
	 var party_chn_name="";
	  var host_cust_id="";
	  var	party_class_cd="";
	  var is_party="";
	  if(casetype=="1"){
	      party_id=parent.document.forms[0].csnm.value;
	       party_chn_name=parent.document.forms[0].ctnm.value;
			host_cust_id=parent.document.forms[0].csnm.value;
			party_class_cd=parent.document.forms[0].cttp.value;
		
		if(party_class_cd=='02'){
			party_class_cd='I';
		}else
		{
			party_class_cd='C';
		}
		 is_party='1';
		var	party=parent.document.forms[0].is_party;
		//if(party[0].checked!=true)
		if(party.checked!=true)
		{
			is_party='0';
		}
	 }else{
	      var i_party = parent.document.getElementById("iframe_party").contentWindow;
          var form= i_party.document.forms[0];
         for(var i=0;i<form.elements.length;i++){
            if((true == form.elements[i].checked) && (form.elements[i].type == "radio")){
        	 val=form.elements[i].value;
           }
        }
    
    //alert(val);
	 party_id = val.substring(0,val.indexOf("--"));

	var temp = val.substring(val.indexOf("--")+2);
	//alert(party_id);
	//alert(temp);
	
		party_chn_name = temp.substring(0,temp.indexOf("--"));
	//alert(party_chn_name);
	
	temp = temp.substring(temp.indexOf("--")+2);
	var	party_class_cd = temp.substring(0,temp.indexOf("--"));
	//alert(party_class_cd);

	temp = temp.substring(temp.indexOf("--")+2);
	 is_party = temp;
	//alert(is_party);
	   
	   }
	
		
		var organkey=parent.document.forms[0].ficd.value;
		var organName=parent.document.forms[0].finm.value;
		
		
         if(party_id.indexOf("#")!=-1){
        	party_id = party_id.replace("#","23%"); 
            }
		url='<%=request.getContextPath()%>/report/case/t07_case_app_add_trans_page_new.do?';

		var oname="java.net.URLEncoder.encode("+organName+")";
		url+='caseType='+casetype+'&organkey=' + organkey+'&party_chn_name='+encodeURI(encodeURI(party_chn_name))+'&host_cust_id='+party_id+'&party_class_cd='+party_class_cd+'&is_party='+is_party;
		url=url+"&organ_name="+ encodeURI(encodeURI(organName)); 
	

		
		}

  window.open(url,'tranadd','height=400,width=1100,left=100,top=100,scrollbars=yes, resizable=yes');
    
   
}

function selectAll(obj){

    if(document.forms[0].transactionkeyCheckBox!=null){
    if(obj.innerHTML=="全选"){
   
        obj.innerHTML="全不选"
		if(document.forms[0].transactionkeyCheckBox.value!=""){
                document.forms[0].transactionkeyCheckBox.checked=true;
    	}
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ ){
             document.forms[0].transactionkeyCheckBox[i].checked=true;
        }
    }
    else{
	    obj.innerHTML="全选"
	    if(document.forms[0].transactionkeyCheckBox.value!="")
                document.forms[0].transactionkeyCheckBox.checked=false;
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ )
	             document.forms[0].transactionkeyCheckBox[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}

</script>

</head>

	<body >
<div id="iframecontent">
		<html:form action="/case/t07_case_app_add_trans.do" method="post">
		
	<div class="conditions">
		<div class="cond_t">
		  <span>交易列表</span>
		   <span class="buttons">
		   <img src="../../images/blue/b_checkall.png" /><a href="#" onclick="selectAll(this)">全选</a>
		   <a href="#" onclick="dosubmit('<%=request.getContextPath() %>/report/case/t07_case_app_add_trans_del.do','del');"><img src="../../images/blue/b_delete.png" />删除</a>
		   <a href="#" onclick="_open('add');"><img src="../../images/blue/b_add2.png" />添加</a>
		   <a href="#" onclick="_open('newadd');"><img src="../../images/blue/b_add.png" />新增</a>
		  </span>
		</div>
	</div>				
		  <div class="list">
		   <table  border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<th>选择</th>
					<th>流水号</th>
					<th>客户号</th>
					<th>客户名称</th>
					<th>交易日期</th>
					<th>交易机构</th>
					<th>账户</th>
					<th>币种</th>
					<th>交易金额</th>
					<th>金额(折人民币)</th>
					<!--  <th>交易类型</th>-->
					<th>借贷标志</th>
				  </tr>
				 <logic:present name="case_transMap" scope="session" >
					 <logic:iterate id="transMap" name="case_transMap" scope="session"   >
					 
						 <bean:define id="t47_transaction" name="transMap" property="value" type="com.ist.aml.report.dto.T47_transaction" />
					<tr>
						<td>
							<html:multibox property="transactionkeyCheckBox">
								<bean:write name="t47_transaction" property="transactionkey" />
							</html:multibox>
						</td>
						<td>
								<bean:write name="t47_transaction" property="tx_no" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="party_id" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="party_chn_name" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="tx_dt_disp" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="organName" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="acct_num" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="currency_cd_disp" />
						</td>
						<td>
							<bean:write name="t47_transaction" property="amt_disp" />
						</td>
						<td>
						    <bean:write name="t47_transaction" property="cny_amtDisp" />
						</td>
					<!-- 	<td>
						    <bean:write name="t47_transaction" property="tx_type_cd_disp" />
						</td> -->
						<td>
						    <bean:write name="t47_transaction" property="debit_credit_disp" />
						</td>


					</tr>
									
					</logic:iterate>
				</logic:present>
				
			</table>
			</div>			
		
		</html:form>
	  </div>
	</body>
</html>
