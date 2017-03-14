<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='export'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
        	isSub = true;
        }
    }
    
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}

function selectAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = true;
        }
    }
}

function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
</script>

<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全 清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全 选");
	  });
});
</script>

	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/function/t10_mt_property_list.do" method="post">
				
				<html:messages id="message" message="true">
					<bean:write name="message" filter="false"/>
				</html:messages>
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">

						<span> 元数据导出管理 </span>
						<span class="buttons">
							<a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a>
 							<a href="#" onclick="dosubmit('exportToTxt.do','export')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出</a> 
						</span>		
					</div>
					<html:errors />
					<div class="cond_c" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>日期：</td>
								<td>
									<input type="text" name="begin_dt" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
									-
									<input type="text" name="end_dt" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
								</td>
								<td>机构：</td>
								<td>
									<input type="text" name="organkey" size="7" maxlength="30" />
									<input type="text" name="organname" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								选择
							</th>
							<th>
								元表英文名
							</th>
							<th>
								元表中文名
							</th>
						</tr>
					<logic:present name="t01_mt_propertyList">
						<logic:iterate id="t01_mt_property" name="t01_mt_propertyList" type="com.ist.common.metadata.dto.T01_mt_property">
							<TR align="left">
								<TD>
									<html:multibox property="selectedtable" >
										<bean:write name="t01_mt_property" property="tablekey" />,<bean:write name="t01_mt_property" property="tableename" />
									</html:multibox>
								</TD>
								<TD>
								<html:hidden name="t01_mt_property" property="tableename"/>
									<a href="<%=request.getContextPath()%>/metadata/function/mt_table_disp.do?tablekey=<bean:write name="t01_mt_property" property="tablekey" />&tableename=<bean:write name="t01_mt_property" property="tableename" />&flag=0">
									<bean:write name="t01_mt_property" property="tableename" />
									</a>
								</TD>
								<TD><bean:write name="t01_mt_property" property="tablecname" /></TD>
							</TR>
						</logic:iterate>
					</logic:present>

				</table>
			</div>
			</html:form>
		</div>
	</body>
</html>
