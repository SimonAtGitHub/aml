<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript"> 
	function doSubmit(theUrl){
		var errMsg = checkFormat("starttime");
		var errorMsg = checkFormat("endtime");
		if(isShowFlex()){
			var st = document.getElementById("flex").value;
			if(st.length<1){
				alert("延时天数必须填写!");
				document.forms[0].flex.focus();
				return false;
			}
			var regFlex = /^\d+$/;
			if(!regFlex.test(st)){
				alert("延时天数格式不对，请输入正确的正整数!");
				document.forms[0].flex.focus();
				return false;
			}else if(st.length>1){
				alert("延时天数应为0至10之间的正整数!");
				document.forms[0].flex.focus();
				return false;
			}
		}
		if("" != errMsg){
			alert(errMsg);
			return false;
		}
		if("" != errorMsg){
			alert(errorMsg);
			return false;
		}
		if(""==errMsg && ""==errorMsg){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
	}
	function checkFormat(param){
		var errMsg = "";
		var st = document.getElementById(param).value;
		var regIsFlex = /^([01]\d|2[0123]):([0-5]\d)$/;
		
		if(st.length == 0){
			if(param=="starttime"){
				errMsg = "开始时间必须填写! ";
				document.forms[0].starttime.focus();
				return errMsg;
			}else if(param="endtime"){
				errMsg = "结束时间必须填写! ";
				document.forms[0].endtime.focus();
				return errMsg;
			}
		}
		if(!regIsFlex.test(st)){
			if(param=="starttime"){
				errMsg = "开始时间格式不正确!";
				document.forms[0].starttime.focus();
				return errMsg;
			}else if(param="endtime"){
				errMsg = "结束时间格式不正确!";
				document.forms[0].endtime.focus();
				return errMsg;
			}
		}
		return errMsg;
	}
	function isShowFlex(){
		var t = document.getElementById("isflex");
		var selectedVal = t.options[t.selectedIndex].value;
		var tmp = document.getElementById("flexId");
		if(""==selectedVal || "0"==selectedVal){
			tmp.style.display = "none";
			return false;
		}else{
			tmp.style.display = "";
			return true;
		}
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/t18_task_type/t18_task_type_modify.do" method="post">
<div class="conditions">
	<!-- table content -->
	<div class="cond_c2" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<th colspan="4"><strong>任务开始时间修改</strong></th>
        </tr>
        <tr>
        	<td>是否延时</td>
			<td>
				<html:select styleId="isflex" property="isflex" onchange="isShowFlex();">
					<html:options collection="isflexMap" property="label" labelProperty="value" />
				</html:select>
			</td>
		</tr>
		<tr id="flexId">
			<td>延时天数</td>
			<td>
				<html:text styleId="flex" property="flex" />
			</td>
		</tr>
		<tr>
        	<td>当日任务执行允许开始时间：</td>
			<td>
				<html:text styleId="starttime" property="starttime" />
			</td>
        </tr>
        <tr>
        	<td>当日任务执行结束时间：</td>
        	<td>
        		<html:text styleId="endtime" property="endtime" />
        	</td>
        </tr>
		<tr>
			<td>
				<%
					String tasktypeStr = (String) request.getAttribute("tasktypeStr");
				%>
				<input type="hidden" name="tasktypeStr" value="<%=tasktypeStr %>" />
			</td>
        	<td>
        		<input name="Button522" type="button" class="in_button1" value="提交"
					 onClick="doSubmit('t18_task_type_modify_do.do')" />
			</td>
        </tr>
	  </table>
	</div>
	<div class="sys_warning"><strong><img src="../../images/blue/warning.png" />提示：</strong>
    &nbsp;&nbsp;<p>1、填写的时间格式标准为"00:00"，不可填写空值；</p>
    &nbsp;&nbsp;<p>2、如选择延时，则延时天数应为大于0小于10的正整数；</p>
	&nbsp;&nbsp;<p>3、填写的时间格式应为24小时制，冒号应为半角英文状态；</p>
	&nbsp;&nbsp;<p>4、提交后修改的是上一步操作中勾选的全部任务的执行信息；</p>
	&nbsp;&nbsp;<p>5、开始时间至结束时间周期内是后台任务执行时间，如开始时间大于结束时间，则任务将跨天执行，反之则当天执行；</p>
	&nbsp;&nbsp;<p>如：设置开始时间为20:00，结束时间为08:00，则在当天20点开始，次日8点结束；如设置开始时间为08:00，结束时间为20:00，则在8点开始任务，当天20点结束。</p>
	</div>
  </div>
  </html:form>
<script language="javascript">
	isShowFlex();
</script>
<!-- all end -->   
</div>
</body>
</html>
