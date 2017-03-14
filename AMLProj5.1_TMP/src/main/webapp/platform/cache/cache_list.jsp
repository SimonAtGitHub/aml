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
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='refresh'){
        //errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        errMsg = CheckBoxMustChecked(document.forms[0]);
        isSub = true;
    }else if(type=='detail'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        isSub = true;
    }else if(type=='list'){
        isSub = true;
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
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
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
			<html:form action="/cache/cache_list.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">

						<span> 缓存管理 </span>
						<span class="buttons"> <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a>
 							<a
							href="#" onclick="dosubmit('cache_list.do?type=list','list')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_DTO.png" />码表转DTO类</a> <a
							href="#" onclick="dosubmit('cache_list.do?type=sql','list');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_HASH.png" />码表转HASH类</a> <a
							href="#" onclick="dosubmit('cache_list.do?type=hash','list');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_access.png" />字段类型类</a> </span>
					</div>
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<input type="button" name="ok" class="in_button1" value="显  示"
										onclick="dosubmit('cache_manage_listdetail.do','detail')" />
									<input type="button" name="ok" class="in_button1"
										value="刷 新"
										onclick="dosubmit('cache_manage_refresh.do','refresh')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
							<th>
								对象名
							</th>
							<th>
								描述
							</th>
							<th>
								缓存类型
							</th>
							<th>
								是否被加载
							</th>
						</tr>
				<bean:define id="type" name="type" scope="request" />
					<logic:iterate id="_map" name="cachelistMap">
						<bean:define id="cachename" name="_map" property="key" scope="page" />
								<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("type", type);
								map.put("selectedCache", cachename);
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
								%>
						<TR align="left">
							<TD >
								<html:multibox property="selectedCache" >
									<bean:write name="_map" property="key" />
								</html:multibox>
							</TD>
							<TD >
								<html:link name="map"
									page="/cache/cache_manage_listdetail.do">
									<bean:write name="_map" property="key" />
								</html:link>
							</TD>
							
							<logic:iterate id="_list" name="_map" property="value">
								<TD align="center">
									<bean:write name="_list" />
								</TD>
							</logic:iterate>
						</TR>
					</logic:iterate>

					</table>
					<html:hidden property="type" />
				</div>
			</html:form>
		</div>
	</body>
</html>
