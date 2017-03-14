<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("必须输入数字"); 
	form.focus(); 
	}
} 


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(trim(document.forms[0].gsname.value))==0){
        errMsg+="公式名称不能为空！";
        document.forms[0].gsname.focus();
    }else if(getLength(document.forms[0].des.value)>=256){
        errMsg+="公式描述不能超过512位！";
        document.forms[0].des.focus();
    }else if(getLength(document.forms[0].levelkey.value)==0){
        errMsg+="公式等级必须选择！";
        document.forms[0].levelkey.focus();
    }else if(getLength(document.forms[0].calseq_str.value)>0 && !checkNum(document.forms[0].calseq_str.value)){
        errMsg+="公式计算顺序必须为数字！";
        document.forms[0].calseq_str.focus();
    }else if(getLength(document.forms[0].indickey.value)==0){
        errMsg+="指标编码不能为空！";
        document.forms[0].indickey.focus();
    }else if(getLength(document.forms[0].valnum.value)>0 &&!checkNum(document.forms[0].valnum.value)){
        errMsg+="公式值编号必须为数字！";
        document.forms[0].valnum.focus();
    }else if(getLength(document.forms[0].valtype.value)==0){
    	errMsg+="请选择比较符！";
    	document.forms[0].valtype.focus();
    }
    if(document.forms[0].valtype.value != '')
    {
    	if(document.forms[0].valtype.value == 'BETWEEN')
    	{
    		var aa = document.getElementById("valparamin1").value;
    		var bb = document.getElementById("valparamax").value;
    		if(aa == '' || bb == '')
    		{
    			errMsg+="请填写参数值！";
    		}
    		else if(!checkNum(aa)||!checkNum(bb))
    		{
        		errMsg+="参数值必须为数字！";
    		}
    	}
    	if(document.forms[0].valtype.value != 'BETWEEN')
    	{
    	    var cc = document.getElementById("valparamin").value;
    		if(cc==''){
    			errMsg+="请填写参数值！";
    		}
    		else if(cc != '' && !checkNum(cc))
    		{
        		errMsg+="参数值必须为数字！";
    		}
    	}
    }
    if(errMsg==""){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}
function check_val()
{
	var val_type=document.forms[0].valtype.value;
	if(val_type == 'BETWEEN')
	{
		document.getElementById("valtitle").style.display='';
		document.getElementById("single").style.display='none';
		document.getElementById("double").style.display='';
	}
	else
	{
		document.getElementById("valtitle").style.display='';
		document.getElementById("single").style.display='';
		document.getElementById("double").style.display='none';
	}
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" >
<html:form method="post" action="/t31_def_gs/t31_def_gs_add.do">
<html:hidden property="granularity" />
<html:hidden property="templatekey" />
<html:hidden property="templatename" />
<div id="main">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span> 新增评级公式
	  </span>
        <span class="buttons">
 	   		<a href="#" onclick="dosubmit('t31_def_gs_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
		</span>
	</div>
  <html:errors/>
	<div class="cond_c2">
  		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						<font color="red">*</font>公式名称：
					</div>
				</td>
				<td colspan="3"><input type="text" name="gsname" value="" size="50"></td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						公式描述：
					</div>
				</td>
				<td><html:textarea cols="29" rows="3" property="des"></html:textarea>
					<br>
				</td>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						粒度：
					</div>
				</td>
				<td>
				<html:select property="granularity" disabled="true">
						<html:options collection="granularityMap" property="label" labelProperty="value" />
					</html:select>
					<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
				</td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right"><font color="red">*</font>公式等级：</div>
				</td>
				<td>
					<html:select property="levelkey">
						<html:options collection="levelMap" property="label" labelProperty="value" />
					</html:select>
				</td>
				<td bgcolor="F6F9FF" align="left">
					<div align="right"><font color="red">*</font>客户类型：</div>
				</td>
				<td>
					<html:select property="party_class_cd">
						<html:options collection="clienttypeMap" property="label" labelProperty="value" />
					</html:select>
				</td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						计算顺序：
					</div>
				</td>
				<td><input type="text" name="calseq_str" value=""></td>
				<td><div align="right"><font color="red">*</font>累计方式：</div></td>
				<td>
					<html:select property="is_sum">
						<html:options collection="is_sumMap" property="label" labelProperty="value" />
					</html:select>
				</td>
			</tr>
			<tr>
				<td><div align="right"><font color="red">*</font>指标编码：</div></td>
				<td><html:text property="indickey" styleClass="text_white" size="23" readonly="true" maxlength="50" />
					<html:hidden property="indicname" />
					<a href="#" title="选择" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_indic/indic_search.do?rulekey=<%=(String)request.getAttribute("rulekey")%>&dispatcher=radio&newsearchflag=1&mark=2',width:650,height:420,title:'选择',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />选择</a>
				</td>
				<td>值编号：</td>
				<td><input type="text" name="valnum" value=""></td>
			</tr>
			<tr>
				<td><div align="right"><font color="red">*</font>比较符：</div></td>
				<td>
					<html:select property="valtype" onchange="check_val()">
						<html:options collection="valtypeMap" property="label" labelProperty="value" />
					</html:select>
				</td>
				<td id="valtitle" style="display:none"><div align="right"><font color="red">*</font>参数值：</div></td>
				<td id="single" style="display:none"><input type="text" name="valparamin" value=""></td>
				<td id="double" style="display:none"><input type="text" name="valparamin1" value="">-<input type="text" name="valparamax" value=""></td>
			</tr>
			<tr>
				<td></td>
				<td align="right" colspan="3">
					<input type="button" name="button1" class="in_button1" value="提 交" onclick="checkForm('t31_def_gs_add_do.do')" />
					<input type="reset" name="button1" class="in_button1" value="重 置" />
				</td>
			</tr>
		</table>
    </div>
  
  </div>
</div>   
</html:form>
</BODY>
</HTML>
