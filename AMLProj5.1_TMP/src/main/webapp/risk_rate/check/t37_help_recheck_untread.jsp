<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
	function _Confim(url) {
		var len = document.getElementById("return_reason").value.length;
		if(len<1){
			alert("请填写退回原因!");
			return false;
		}
		document.form1.action = url;
		document.form1.submit();
		window.parent.location.href="<%=request.getContextPath()%>/risk_rate/check/t37_help_recheck_list.do?newsearchflag=0&status_cd=2";
		window.parent.ymPrompt.close();
	}
	function closeW() {
		window.parent.ymPrompt.close();
	}
</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<form name=form1 action="/check/t37_recheck_untread.do" method=post>
			<div id="main">
				<%
					String check_no = (String)request.getAttribute("check_no");
					String resultkey =(String)request.getAttribute("resultkey");
					String data_source = (String)request.getAttribute("data_source");
				%>
				<div class="conditions">
					<div class="cond_t">
						<span>KYC审查 - 退回说明</span>
						<span class="buttons">
							<a href="#" onclick="_Confim('t37_recheck_untread_do.do?check_no=<%=check_no %>&resultkey=<%=resultkey %>&data_source=<%=data_source %>');"><img src="../../images/blue/b_save.png" />保存</a>
							<a href="#"	onclick=closeW();><img src="../../images/blue/b_shut.png" />关闭</a>
						</span>
					</div>
				</div>
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<input type="hidden" value="<%=check_no %>" />
						<tr>
							<td style="width: 20%;">
								退回原因：
							</td>
							<td>
								<textarea id="return_reason" name="return_reason" cols="40" rows="5" value=""></textarea>
							</td>
						</tr>

					</table>
				</div>


				<!-- all end -->
			</div>
		</form>
	</body>
</html>