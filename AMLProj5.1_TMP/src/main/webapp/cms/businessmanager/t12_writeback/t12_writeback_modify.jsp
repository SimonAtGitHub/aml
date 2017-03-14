<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	function _Click(){
			var  fromarea=eval(document.forms[0].indictype);
		    var  toarea=eval(document.forms[0].defmode);
		    var index=fromarea.selectedIndex;
			var selvalue=fromarea.options[index].value;
		  
		  	var j;
		  	
			for(j=toarea.length-1;j>=0;j--){
					toarea.options[j]=null;
			}
			if(selvalue==2)
			{
				var newOptionName=new Option("界面配置","2");
				toarea.options[0]=newOptionName;
			}
			else if(selvalue==3)
			{
				var newOptionName=new Option("界面配置","2");
				toarea.options[0]=newOptionName;
			}
		    else
		    {
		    	var newOptionName=new Option("SQL实现","1");
		    	//var newOptionName1=new Option("界面配置","2");
		    	 toarea.options[0]=newOptionName;
		    	// toarea.options[1]=newOptionName1;
		    	 
		    }
		  
		  	//为财务指标时：粒度不显示  标准值：显示
		  	var trElement = document.getElementById("indic3");
		  	var trElementorg = document.getElementById("noindic3");
		    if(selvalue==3){
		    	trElement.style.display="";
		    	trElementorg.style.display="none";
				trElementorg.value=""
		    }else{
		    	trElementorg.style.display="";
		    	trElement.style.display="none";
				trElement.value=""
		    }
		}
</SCRIPT>
</head>

<body>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_writeback/t12_writeback_modify.do">
			<html:hidden property="articlekey" />
			<html:hidden property="programakey" />
			<html:hidden property="replykey" />
			<html:hidden property="auditstat" />

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章回复 - 修 改</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="awpDoSubmit('t12_writeback_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='awp_detail'>
				<TABLE>
					<tr>
						<td align="right">
							文章标题：
						</td>
						<td>
							<bean:write property="articlename" name="t12_article" />
						</td>
					</tr>

					<tr>
						<td align="right">
							<FONT color="#ff0000">*</FONT>回复内容：
						</td>
						<td>
							<html:textarea property="replycontent" cols="60" rows="18" />
						</td>
					</tr>

					<tr>
						<td align="right">
							回复时间：
						</td>
						<td>
							<bean:write property="createdate" name="t12_writebackActionForm" />
						</td>
					</tr>



					<tr>
						<td align="right">

						</td>
						<td align="left">
							<html:button property="button" value="提  交" styleClass="input"
								onclick="awpDoSubmit('t12_writeback_modify_do.do','add')" />
							<html:reset styleClass="input" value="重  填" />
						</td>
					</tr>

				</TABLE>
			</div>
		</html:form>
	</div>
</body>

</html:html>
