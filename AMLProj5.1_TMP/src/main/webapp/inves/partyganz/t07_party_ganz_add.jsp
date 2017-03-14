<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<script type="text/javascript" src="../../js/jquery.validator.js"></script>

<script type="text/javascript">
function dosubmit(theUrl){
	if(checkDateField()&&jQuery(document.forms[0]).validateAll()){
	 	document.forms[0].action=theUrl;
	 	document.forms[0].submit();
	}else{
		return;
	}
}

function checkDateField(){
	var infact_disp_val = document.forms[0].infact_date_disp.value;
	if(infact_disp_val!=null&&""!=infact_disp_val){
		if(!_compareTwoDateForString(currDateStr(),infact_disp_val)){
			alert("失效日期不能小于当前日期")
			return false;
		}else{
			return true;
		}
	}else{
		alert("请设定失效日期");
	}
	return false;
}

function currDateStr(){
	var curdate = new Date(),str="";
	return numberToStr(curdate.getFullYear())+"-"+numberToStr(curdate.getMonth()+1)+"-"+numberToStr(curdate.getDate());
}
function numberToStr(num){
	return num<10?("0"+num):(num+"");
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
}
</script>
</head>
<body class="mainbg">
		<html:form action="/partyganz/t07_party_ganz_add_do.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>跟踪客户添加</span>
						<span class="buttons"> <a href="t07_party_ganz_list.do?newsearchflag=1"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返
								回</a> </span>
					</div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>客户：
								</td>
								<td>
									<html:text property="party_id" styleClass="text_white"
										size="10" onblur="_Onblur('party_chn_name')" maxlength="32" readonly="true" require="true" datatype="require"  msg="客户编号不能为空"/>
									<html:text property="party_chn_name" styleClass="text_white"
										size="23" readonly="true" readonly="true"/>
				 					<a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>			
								</td>
								<td>
         							<span style="color:#FF0000;">*</span>状态：
         						</td>
         						<td>
         						   <html:select property="status_cd" require="true" datatype="require"  msg="状态必须选择一个">
         								<html:options collection="statusMap" property="label" labelProperty="value" />
								   </html:select>
								</td>
							</tr>
							<tr>
								
								<td>
            						<span style="color:#FF0000;">*</span>失效日期：
            					</td>
         						<td>
									<html:text property="infact_date_disp" size="12"
									 	onclick="calendar.show(this);" readonly="true"
											styleClass="calimg" require="true" datatype="require"  msg="失效日期不能为空且不能小于当前日期" />
								</td>
				 
								<td>
            						&nbsp;
            					</td>
         						<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="4"  align="center" class="in_button">
									<html:reset  value="重 填" />
									<html:button property="button" value="提 交" onclick="dosubmit('t07_party_ganz_add_do.do');" />
								</td>		
							</tr>
						</table>
					</div>
				</div>
			</div>
		</html:form>
	</body>
</html>