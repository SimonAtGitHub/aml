<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		 <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/js/selectCss.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/lib.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/selectCss.css" rel="stylesheet" type="text/css" />
	<script type=text/javascript> 
	<!--
	jQuery.noConflict();
	(function($){ 
	  $(function(){
		$(document).ready(function(){	
			$("#selectCss2 select").select();
			var selectul = $('#selectCss2 ul');
			var n = $('#selectCss2 ul li').length;
			var selecth = n*22;
			if(selecth<145){
			   selectul.css('height',selecth+'px');
			}else{
			   selectul.css('height','144px');
			}
			$('input#inaction').focus(function(){ if($(this).attr('value')=='请输入要搜索的内容......'){$(this).removeClass().addClass('stextin').attr('value','');} }).blur(function(){ if($(this).attr('value')==''){ $(this).removeClass().addClass('stext').attr('value','请输入要搜索的内容......'); }});
			$('input.sbtn').click(function(){
		    var sk = $('input#inaction').attr('value');
		    if(sk==undefined || sk=='请输入要搜索的内容......'){
		        $('.searchtip').show().html('抱歉，您还未输入查询内容');
		    }else{
				$('.searchtip').hide();
				document.forms[0].action="t12_search_list.do?newsearchflag=1";
			    document.forms[0].submit();
				
				
		    }
		});
		});
	// All End
	  });
	})(jQuery);
	//-->

</script>

	</head>
	<body>
	<div id='content'>
	<html:form method="post" action="/system_manager/t12_search/t12_search_list.do">
				<div class='awp_title'>
					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">全文检索</span>
							</td>
							<td align="right">
							</td>
						</tr>
					</table>
				</div>
				<div class="awp_search">
					<table>
						<tr>
							<td align="right">
							<logic:equal value="" name="content"> 
								<html:text property="content" size="68" styleClass="stext" styleId="inaction"  value="请输入要搜索的内容......"></html:text>
							</logic:equal>
							<logic:notEqual value="" name="content"> 
								<html:text property="content" size="68" styleClass="stext" styleId="inaction" ></html:text>
							</logic:notEqual>
							</td>
							<td align="left">
							<input type="button" class="sbtn" value=" "  />
							</td>
						
						
						</tr>
						 <tr>
						    <td colspan="3" class="searchtip" style="display:none;">
						       抱歉，您输入的内容 <font color="#ff0000">““</font>不在查询范围内。
						    </td>
		                </tr>
					</table>
				</div>
				<logic:notEmpty name="searchList">
				<div class="awp_search_list">
				       <logic:iterate id="t12_search" name="searchList" type="com.ist.cms.dto.T12_search">
						 <dl>
							<dt>
									<a href="<bean:write name="t12_search" property="url" scope="page" />"
									target="blank"> <bean:write name="t12_search" property="title" scope="page" filter="false"/> </a>									
							</dt>
							<dt>							
							 	<logic:notEmpty name="t12_search" property="PROGRAMANAME">
							 		所属栏目:【<bean:write name="t12_search" property="PROGRAMANAME" scope="page" filter="false"/>】
							 		</logic:notEmpty>
							 		<logic:notEmpty name="t12_search" property="CREATOR">
									创建人:【<bean:write name="t12_search" property="CREATOR" scope="page" filter="false"/>】
									</logic:notEmpty>
									<logic:notEmpty name="t12_search" property="CREATEDATE">
									创建时间:【<bean:write name="t12_search" property="CREATEDATE" scope="page" filter="false"/>】
									</logic:notEmpty>
									<logic:notEmpty name="t12_search" property="FILESIZE">
										附件大小:【<bean:write name="t12_search" property="FILESIZE" scope="page" filter="false"/>】（单位：KB）
									</logic:notEmpty>
							</dt>
							<dd>
								<bean:write name="t12_search" property="content" scope="page" filter="false" />
								</dd>
							</dl>
						</logic:iterate>
				</div>   </logic:notEmpty>
			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
						<logic:notEmpty name="pageInfo">
							<bean:write name="pageInfo" scope="request" filter="false" />
							</logic:notEmpty>
						</td>
					</tr>
				</table>
			</div>
	</html:form>
	</div>
	</body>
</html>
