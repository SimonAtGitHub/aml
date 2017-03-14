<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.Map"%>
<%@page import="com.ist.aml.report.controller.T07_ATTENTION_libActionForm"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv="Content-Type" content="text/html; charset=GBK">

		<link id="skincss"
				href="../../css/aml_<%=session.getAttribute("style")%>.css"
				rel="stylesheet" type="text/css" />

		    <script type="text/javascript" src="../../js/jquery.js"></script>
			<script type="text/javascript" src="../../js/aml.js"></script>
			<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
			<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
			<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<script language="JavaScript" src="../../js/jquery.validator.js"></script>
			<script type="text/javascript" src="../../js/ymPrompt.js"></script>
			<SCRIPT LANGUAGE="JavaScript">
		



	function dosubmit(theUrl, is_add_reason, validate_type, op_result,
			target_post, op_type) {

		//alert("theUrl:"+theUrl+" is_add_reason:"+is_add_reason+" validate_type:"+validate_type+" op_result:"+op_result+" target_post:"+target_post+" op_name:"+op_name);

		var errMsg = "";
		var isSub = false;

		if (validate_type == '1')//单选
		{
			errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
			

		} else if (validate_type == '2') {//多选
			errMsg = CheckBoxMustChecked(document.forms[0]);

		}

		if (errMsg != "") {
			alert(errMsg);
			return false;
		}

		var selectedKeys=getSelectKeys();
		
		var str="";
		if(theUrl.indexOf("?")>0)
		{
			str="&";
	    }else
	    {
	    	str="?" ;
		    }
		theUrl = theUrl + str+"op_result=" + op_result + "&target_post="
				+ target_post +"&is_add_reason="+is_add_reason+ "&op_type=" +op_type+"&keys="+selectedKeys+"&atten_post="+"<%=request.getAttribute("atten_post") %>";

		document.getElementById("theurl").value = theUrl;

		if (is_add_reason == "1") {

			ymPrompt.win( {
				message : 't07_attention_add_reason.jsp?atten_post=P1',
				width : 450,
				height : 230,
				title : '关注库',
				handler : handler,
				iframe : true,
				fixPosition : true,
				dragOut : false
			});
			return false;
		}

		document.forms[0].action = '<%=request.getContextPath()%>'+theUrl;
		if (jQuery('#form0').validateAll()) {
			document.forms[0].submit();
		}

	}
function getSelectKeys()
{

	var selectedKeys= document.getElementsByName("selectedKeys");	
	var keys="";
	for (var i = 0; i < selectedKeys.length; i++) {
		if (selectedKeys[i].checked==true) {
			keys=keys+selectedKeys[i].value+",";
		}
	}

	if(keys!="")
	{
		keys=keys.substring(0,keys.length-1);
	}

   return keys;
}
function dosubmit2(theUrl)
{
	document.forms[0].action = theUrl;
	if (jQuery('#form0').validateAll()) {
		document.forms[0].submit();
	}
}

function _check(obj)
{
	if (obj.value=='')
	{
		document.forms[0].organname.value='';
	}
}
</SCRIPT>
			<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("全清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("全选");
	  });
});
</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >
		<div id="main">
			<html:form action="/attention/t07_attention_lib_list.do"
				method="post" styleId="form0" enctype="multipart/form-data">
               <input type="hidden" id="theurl" name="theurl" value="" />
               <input type="hidden" name="atten_post"  value="<%=request.getAttribute("atten_post") %>" />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%= request.getAttribute("atten_post_name")%></span>
						
						<span class="buttons">
						
						    <logic:iterate id="swith" name="buttons" type="com.ist.aml.report.dto.T07_ATTENTION_swith">
						    <a href="javascript:void(0);" onClick="dosubmit('<bean:write name="swith" property="op_url" scope="page"/>','<bean:write name="swith" property="is_add_reason" scope="page"/>','<bean:write name="swith" property="validate_type" scope="page"/>','<bean:write name="swith" property="op_result" scope="page"/>','<bean:write name="swith" property="target_post" scope="page"/>','<bean:write name="swith" property="op_type" scope="page"/>');return false;">
						    <logic:equal value="1" name="swith" property="is_icon">
						    <img src="../../images/blue/<bean:write name="swith" property="icon_name" scope="page"/>"/>
						    </logic:equal><bean:write name="swith" property="op_name" scope="page"/></a>						    
						    </logic:iterate>
                    	   
                    	  </span>
					</div>

					<html:messages id="error" message="true">
					  <bean:write name="error" filter="false"/>
					</html:messages>
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
							<td height="22">
									客户号：
								</td>
								<td>
									<html:text property="party_id" require="true"
										datatype="safeString|limit_max" max="32"
										msg="请输入合法的用户id|不能超过32个字符" />
								</td>
								
								<td>
									客户名称：
								</td>
								<td>
									<html:text property="party_chn_name" size="20" />
								</td>
							
								
							</tr>
							<tr>
							   
							<td>
									归属机构：
								</td>
								<td>
									<html:text property="organkey" size="10" require="false"
										datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"  onblur="_check(this)"/>
									<html:text  property="organname" size="23" readonly="true" maxlength="10" />
									
									<a href="#"	onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
										class="cond_buttons"><img src="../../images/<%=session.getAttribute("style")%>/b_location.png" />定位</span>
									</a>
									
								</td>
								<td>
									客户类型：
								</td>
								<td>
								<%=request.getAttribute("party_class_cdStr")%>

								</td>	
								
							</tr>
							<tr>
								
								<td>

						 		关注类型：

								</td>
								<td>
									<html:select property="atten_type" >
										<html:options collection="atten_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									失效日期：
								</td>

								<td>

									<html:text property="invalid_dt_begin"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" size="12" />


									－
									<html:text property="invalid_dt_end"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" size="12" />
                                   
								</td>
							</tr>
							<tr>
								
								<td>

						 		关注状态：

								</td>
								<td>
									<html:select property="status" >
										<html:options collection="statusMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
								      关注来源：
								</td>

								<td>
								     <html:select property="atten_source" >
										<html:options collection="atten_sourceMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
						<tr>
								
								<td  >
								</td>
								<td>
								<logic:equal value="P5" name="atten_post">
									<html:radio property="is_his" value="0">当前</html:radio>&nbsp;<html:radio property="is_his" value="1">历史</html:radio>
								</logic:equal>
								</td>
								<td>
								
								</td>

								<td>

									
                                    <input type="button" class="in_button1" value="查 询"
										onclick="dosubmit2('t07_attention_lib_list.do?newsearchflag=1');" />

								</td>
							</tr>
						</table>
					</div>
					<table width="100" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							    <Th width=5% height=22 noWrap id="checkall" style='cursor:hand;'>
									全选
								</Th>
								
								<Th width=10% noWrap>
									客户号
								</Th>
								<Th width=15% noWrap>
									客户名称
								</Th>
								<Th width=8% noWrap>
									客户类型
								</Th>
								<Th width=22% noWrap>
									客户归属机构
								</Th>
								<Th width=10% noWrap>
									关注类型
								</Th>
								<Th width=10% noWrap>
									关注状态
								</Th>
								
								<Th width=10% noWrap>

									失效时间
								</Th>
								<Th width=10% noWrap>
									关注来源
								</Th>
								
							</TR>
							<logic:iterate id="t07_attention_lib" indexId="i"
								name="t07_attention_libList"
								type="com.ist.aml.report.dto.T07_ATTENTION_lib">
								<%java.util.HashMap map = new java.util.HashMap();
								T07_ATTENTION_libActionForm form= (T07_ATTENTION_libActionForm)request.getAttribute("t07_attention_libActionForm");
									map.put("atten_id", t07_attention_lib.getAtten_id());
									map.put("atten_post", request.getAttribute("atten_post"));
									map.put("is_his", form.getIs_his());
									pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);%>
								<TR>
				
									<TD>
										<html:multibox property="selectedKeys">
											<bean:write name="t07_attention_lib" property="atten_id" />
										</html:multibox>

									</TD>

									<TD>
										<html:link name="map"
											page="/attention/t07_attention_lib_disp.do">
											<bean:write name="t07_attention_lib" property="party_id" />
										</html:link>
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="party_chn_name"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="party_class_cd_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="organname"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="atten_type_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="status_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="invalid_dt"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="atten_source_disp"
											scope="page" />
									</TD>
									

								</TR>

							</logic:iterate>
						</TABLE>
					</div>
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
					
			</html:form>
		</div>
		
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</BODY>
</HTML>
