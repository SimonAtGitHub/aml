<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=GBK">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	
</head>
<script language="JavaScript">
	function dosubmit(theUrl,type){
		
	    var errMsg = "";
	    var isSub = false;
	    if(type == 'save'){
	    	//验证
	    	if(getLength(document.forms[0].showname.value)==0){
    	        errMsg+="名称不能为空！";
    	        document.forms[0].showname.focus();
    	        alert(errMsg);
    	        return false;    
	    	}
	    	if(getLength(document.forms[0].listkey.value)==0 &&　getLength(document.forms[0].chartkey.value)==0){
    	        errMsg+="列表或图形必须选择一个！";
    	        alert(errMsg);
    	        return false;    
	    	}
	    	if((document.forms[0].arrangemode)[2].checked ||　(document.forms[0].arrangemode)[3].checked ){
		    	if(getLength(document.forms[0].leftsize.value)==0 || getLength(document.forms[0].rightsize.value)==0){
	    	        errMsg+="分配大小不能为空";
	    	        document.forms[0].showname.focus();
	    	        alert(errMsg);
	    	        return false;    
		    	}
	    	}
	    	if(getLength(document.forms[0].seq.value)==0){
    	        errMsg+="顺序不能为空！";
    	        document.forms[0].seq.focus();
    	        alert(errMsg);
    	        return false;    
	    	}
	    	isSub = true;
	    }
	    if(type == 'back'){
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
</script>
 
     
<body>
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/template/t02_tp_show_modify.do">
			<html:hidden property="tplakey"/>
			<html:hidden property="showkey"/>
			<!-- 标题区域 -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">定义图表展现 -- 修改</span></td>
						<td align="right">
							<input type=button value="返 回" name=Button52 class="input"	onClick="dosubmit('t02_tp_show_list.do','back')" />
						</td>
					</tr>
				</table>
			</div> 
			
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- 查询条件区 -->
			<div class='awp_detail'>
				<table>
					<tr>
						<td>
							<font color="#FF3300">*</font>名称：
						</td>
						<td>
							<html:text property="showname"></html:text>
						</td>
						</tr>
						<tr>
						<td>
							列表：
						</td>
						<td >
							 <html:select  property="listkey" style="{width:210px}">
								<html:options collection="t02_list" property="label" labelProperty="value"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td >
							图形：
						</td>
						<td>
            				 <html:select  property="chartkey" style="{width:210px}">
								<html:options collection="t02_chartList" property="label" labelProperty="value"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF3300">*</font>排列模式：
						</td>
						<td>
             				<html:radio property="arrangemode" value="1" /><img src="../../images/chart_blue/avp-1-1.png"/>
             				<html:radio property="arrangemode" value="2" /><img src="../../images/chart_blue/avp-2-1.png"/>
             				<html:radio property="arrangemode" value="3" /><img src="../../images/chart_blue/avp-3-1.png"/>
             				<html:radio property="arrangemode" value="4" /><img src="../../images/chart_blue/avp-4-1.png"/>
						 </td>
					</tr>
					<tr>
						<td>
							<font color="#FF3300">*</font>分配大小：
						</td>
						<td>
            				 左：<html:text property="leftsize" size="10"/> 右：<html:text property="rightsize" size="10"/><font color="#FF3300">列表图形左右排列位置时所占大小，填写百分比或者具体宽度（px）</font>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF3300">*</font>顺序：
						</td>
						<td>
							<html:text property="seq" size="10"/>
						</td>
					</tr>
						
					<tr>
				    	<td></td>
						<td  align="center">
						<input type="button"  value="保 存" class="botton" onClick="dosubmit('t02_tp_show_modify_do.do','save')">
						<html:reset value="重 置"/>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
