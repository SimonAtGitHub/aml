<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String cordaurl="";
	if(request.getAttribute("cordaurl")!=null){
 		cordaurl=(String)request.getAttribute("cordaurl");
 		cordaurl=cordaurl.substring(1);
 		cordaurl="\""+request.getContextPath() + cordaurl;
	}
%>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>
<script language="javascript">
function checkForm(theUrl){
   	var errMsg = "";
   	var validite=document.forms[0].valid_dt_disp.value;
	var d=new Date();
	var today=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
   	if(getLength(document.forms[0].valid_dt_disp.value)==0){
        errMsg+="调查结论失效日期不能为空！";
        document.forms[0].valid_dt_disp.focus();
    }else if(!_compareTwoDateForString(today,validite)){
  		errMsg += "调查结论失效日期不能小于当前系统日期！";	
  		document.forms[0].valid_dt_disp.focus();
  	}
	else if(getLength(document.forms[0].check_explain.value)>2000){
        errMsg+="调查情况说明内容过多！";
        document.forms[0].check_explain.focus();
    }else if((getLength(document.forms[0].leader_num.value)!=0) && (!checkNum(document.forms[0].leader_num.value))){
    	errMsg = "收益人数必须为正整数！";
        document.forms[0].leader_num.focus();    
    }else if((document.forms[0].addw_flag.value)==1 && (getLength(document.forms[0].w_reason.value)>200)){
        errMsg+="白名单建立原因内容过多！";
        document.forms[0].w_reason.focus();
    }
    else if((document.forms[0].addb_flag.value)==1 && (getLength(document.forms[0].b_reason.value)>2000)){
        errMsg+="黑名单建立原因内容过多！";
        document.forms[0].b_reason.focus();
    }
    else if((document.forms[0].addw_flag.value)==1 && (getLength(document.forms[0].w_rule_type.value)==0)){
    	errMsg = "免检类型不能为空！";
    	document.forms[0].w_rule_type.focus();
    }
    else if((document.forms[0].addb_flag.value)==1 && (getLength(document.forms[0].m_list_type.value)==0)){
    	errMsg = "名单类型不能为空！";
    	document.forms[0].m_list_type.focus();
    }
    
    if(errMsg==""){
    	
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
    
}
function w_check(){
	var w_val=document.forms[0].addw_flag.value;
	if(w_val == 0){
		document.getElementById("w_reason").value = "";
		document.getElementById("w_rule_type").value = "";
		document.getElementById("w_flag2").style.display='none';
	}
	if(w_val == 1){
		if(document.forms[0].addb_flag.value != 1){
			b_check();
		}else{
			document.forms[0].addb_flag.value = 0;
			b_check();
		}
		document.getElementById("w_flag2").style.display='';
		document.getElementById("b_flag2").style.display='none';
	}
}

function b_check(){
	var b_val=document.forms[0].addb_flag.value;
	
	if(b_val == 0){
		document.getElementById("b_reason").value = "";
		document.getElementById("m_list_type").value = "";
		document.getElementById("b_flag2").style.display='none';
	}
	if(b_val == 1){
		if(document.forms[0].addw_flag.value != 1){
			w_check();
		}else{
			document.forms[0].addw_flag.value = 0;
			w_check();
		}
		document.getElementById("b_flag2").style.display='';
		document.getElementById("w_flag2").style.display='none';
	}
}

function _onblur1()
{

	var party_id = document.forms[0].party_id.value;
	
    $.ajax({
	 			type:"post",
				url:"is_w_b.do",
				data:{party_id:party_id},
				dataType:"text",
				success:function(msg){
					document.forms[0].list_type.value=msg;
				 }
	 });
	
}
function check_level()
{
	var level_flag = document.forms[0].auditlevel_flag.value;
	if(level_flag == 0)
	{
		document.getElementById("risklevel1").style.display='none';
		document.getElementById("risklevel2").style.display='none';
	}
	if(level_flag == 1)
	{
		document.getElementById("risklevel1").style.display='';
		document.getElementById("risklevel2").style.display='';
	}
}

</script>
</head>
<body id="iframecontent">
<html:form action="/cust_identify/t10_checkparty_rate_mod.do" method="post">
<div class="conditions">  
	<div class="cond_c2">
	<html:hidden property="party_id" />
	<html:hidden property="party_class_cd" />
	<html:hidden property="check_type" />
	<html:hidden property="changeflag" />
	<html:hidden property="list_type" />
    <table border="0" cellspacing="0" cellpadding="0">
   	  <tr>
		<td><font color="red">*</font>调查结论失效日期：</td>
		<td><html:text  property="valid_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" /></td>
		<td>是否他人代理：</td>
		<td>
			<html:select property="agent_flag" style="width:300">
				<html:options collection="agent_flagMap" property="label" labelProperty="value" />
			</html:select>
		</td>
	  </tr>
	  
	  <tr>
		<td>收益人数：</td>
		<td><html:text property="leader_num" size="25"  /></td>
		<td>调查途径：</td>
		<td>
			<html:select property="check_method" style="width:300">
				<html:options collection="check_methodMap" property="label" labelProperty="value" />
			</html:select>
		</td>
	  </tr>
	  <tr>
		<td>是否与离岸中心有关：</td>
		<td>
			<html:select property="lian_flag" style="width:300">
				<html:options collection="lian_flagMap" property="label" labelProperty="value" />
			</html:select>
		</td>
		<td>是否通过机构信用代码查询：</td>
		<td>
			<html:select property="credit_flag" style="width:300">
				<html:options collection="credit_flag" property="label" labelProperty="value" />
			</html:select>
		</td>
	  </tr>
	  <tr>
		<td >是否白名单：</td>
		<td>
			<html:select property="addw_flag" style="width:300" onchange="w_check()">
				<html:options collection="w_Map" property="label" labelProperty="value" />
			</html:select>
		</td>
		<td>是否黑名单：</td>
		<td>
			<html:select property="addb_flag" style="width:300" onchange="b_check()">
				<html:options collection="b_Map" property="label" labelProperty="value" />
			</html:select>
		</td>
	  </tr>
	  
	  <tr id="w_flag2" style="display:none">
		<td><font color="red">*</font>免检类型：</td>
		<td>
			<html:select styleId="w_rule_type" property="w_rule_type" style="width:300">
				<html:options collection="w_rule_typeMap" property="label" labelProperty="value" />
			</html:select>
		</td>
	  
	  	<td height="22" align="right" bgcolor="ECF3FF"> 白名单建立原因： </td>
		<td bgcolor="F6F9FF" align="left">
				<html:textarea styleId="w_reason" cols="29" rows="3" property="w_reason"></html:textarea>
				<br>
		</td>
	  </tr>
	  
	  <%-- <tr id="b_flag1" style="display:none">
		
	  </tr>--%>
	  <tr id="b_flag2" style="display:none">
	    <td><font color="red">*</font>名单类型：</td>
		<td>
			<html:select styleId="m_list_type" property="m_list_type" style="width:250px" onmouseover="FixWidth(this)" >
				<html:options collection="m_list_typeMap" property="label" labelProperty="value" />
			</html:select>
		</td>
		<td>黑名单建立原因：</td>
		<td bgcolor="F6F9FF" colspan="3">
				<html:textarea styleId="b_reason" cols="29" rows="3" property="b_reason"></html:textarea>
				<br>
		</td>
	  </tr>
	  <tr>
		<td>调查情况说明：</td>
		<td colspan="3"> 
			<html:textarea cols="30" rows="4" property="check_explain" styleId="check_explain"></html:textarea>
			<br>
		</td>
		
	  </tr>
	  
	  <tr>
	    <td colspan="4">
		<input type="button" class="in_button1" name="button1" value="保存" onclick="checkForm('t10_checkparty_reltdisp_mod_do.do?')" />
		<input type="reset" class="in_button1" value="重 置" />
		</td>
	  </tr>
	</table>
    </div>
    </div>
    
</html:form>
<script language="javascript">
_onblur1();
</script>
</HTML>
