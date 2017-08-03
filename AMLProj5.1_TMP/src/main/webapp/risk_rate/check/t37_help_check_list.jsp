<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript"> 
	function doSubmit(theUrl){
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<form name=form1 action="" method=post>
<div id="main">
<!-- conditions --> 
<html:form action="/check/t37_help_check_list.do" method="post">
<div class="conditions">
    <!-- title -->
<div class="cond_t">
	  <span>KYC审查 - 评级协查</span>
	  <span class="buttons"><a id="hdd_display" class="bt_hidden"></a>&nbsp;</span>	</div>
	<!-- table content -->
<div class="cond_c" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
         <td>发起协查日期：</td>
         <td>
         	<html:text property="send_date_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
         </td>
         <td>客户号：</td>
			<td>
				<!-- <input type="text" name="organkey" value="" size="10" onblur="_Onblur('organ_name')" >
				<input type="text" name="organ_name" size="20" value="" readonly="readonly" >
				<input name="" type="text" size="20" />
				<a href="#" onClick="ymPrompt.win({message:'../../report/case/location_cust.htm',width:700,height:330,title:'客户',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><span class="cond_buttons"><img src="../../images/blue/b_location.png" align="absmiddle" />定位</span></a>-->
				<html:text property="party_id" styleClass="text_white" size="10" maxlength="64" onchange="_Onblur('party_chn_name')"/>
				<html:text property="party_chn_name" styleClass="text_white" size="23" readonly="true" />
				<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
		</tr>
		<tr>
			<td>
				客户类型：
			</td>
			<td>
				<html:select property="party_class_cd">
					<html:options collection="clienttypeMap" property="label"
						labelProperty="value" />
				</html:select>
			</td>
		</tr>
        <tr>
        
        <td>发起协查机构：</td>
         <td>
         	<html:text property="send_org" />
			<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=send_org&input_name_disp=','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
            &nbsp;&nbsp;
         </td>
			<td>状态：</td>
			<td>
				<html:select property="status_cd">
					<html:options collection="statusMap" property="label"
						labelProperty="value" />
				</html:select>
			 	&nbsp;&nbsp;
				<input name="Button522" type="button" class="in_button1" value="查询"
					 onClick="doSubmit('t37_help_check_list.do?newsearchflag=1')" />
			</td>
		</tr>
      <!-- <tr>
			<td> 排序： </td>
			<td>
				<select name="orderby">
	                <option value="" selected="selected">--请选择--</option><option value="1">客户类型</option><option value="2">归属机构</option><option value="4">系统评级结果</option><option value="5">人工调整结果</option><option value="4">系统评级日期</option><option value="5">人工调整日期</option>
				</select>
				<input type="radio" name="order" value="1">升序
				<input type="radio" name="order" value="2">降序
			</td>
       </tr>-->
	  </table>
	</div>
  </div>
<!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>客户号</th>
			<th>客户名称</th>
			<th>发起协查机构</th>
			<th>发起协查日期</th>
			<th>协查原因</th>
			<th>状态</th>
		</tr>
	<logic:present name="t37_help_checkList">
		<logic:iterate id="result" name="t37_help_checkList" type="com.ist.aml.risk_rate.dto.T37_help_check">
		<tr align="center" bgcolor="#FFFFFF">
			<td>
				<a href="#" 
					onClick="doSubmit('t37_help_checkDisp.do?pageType=0&check_no=<bean:write name="result" property="check_no"/>&party_id=<bean:write name="result" property="party_id" />&party_class_cd=<bean:write name="result" property="party_class_cd" />')">
					<bean:write name="result" property="party_id" />
				</a>
			</td>
			<td>
				<bean:write name="result" property="party_chn_name" />
			</td>
			<td>
				<bean:write name="result" property="send_org" />
			</td>
			<td>
				<bean:write name="result" property="send_date_disp" />
			</td>
			<td>
				<a href="#"
					onClick="ymPrompt.win({message:'<%=request.getContextPath()%>/risk_rate/check/t37_help_check_reasonDisp.do?check_no=<bean:write name="result" property="check_no"/>',width:650,height:350,title:'关闭',handler:handler,iframe:true,fixPosition:true,dragOut:false});" >
					<!-- onClick="window.open('<%=request.getContextPath()%>/risk_rate/check/t37_help_check_reasonDisp.do?check_no=<bean:write name="result" property="check_no"/>','enter2','height=240, width=500,left=400,top=200,scrollbars=yes,resizable=yes');">  -->
					<bean:write name="result" property="check_reason" />
				</a>
			</td>
			<td>
				<logic:equal name="result" property="status_cd" value="1">
					<bean:write name="result" property="status_cd_disp" />
				</logic:equal>
				<logic:equal name="result" property="status_cd" value="4">
					<a href="#" 
						onClick="ymPrompt.win({message:'<%=request.getContextPath()%>/risk_rate/check/t37_help_check_statusDisp.do?check_no=<bean:write name="result" property="check_no"/>',width:650,height:350,title:'关闭',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
						<bean:write name="result" property="status_cd_disp" />
					</a>
				</logic:equal>
			</td>
		</tr>
		</logic:iterate>
	</logic:present>
	</table>
  </div>
<!-- list_page --> 
	<div class="list_page">
		<logic:present name="pageInfo">
			<table width="98%" align="center" border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</logic:present>
	</div>
  </html:form>
<!-- all end -->   
</div>
</form>
</body>
</html>
