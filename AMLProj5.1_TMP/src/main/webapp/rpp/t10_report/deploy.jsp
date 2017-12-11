<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
<head>
	<title></title>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
	<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
   function dosubmit(theUrl,type){
  
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('您真的要删除操作符吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add' ){
    	 if(getLength(document.forms[0].dispseq.value)==0){
	        errMsg="显示序号不能为空！";
	        document.forms[0].dispseq.focus();
	    }else if(getLength(document.forms[0].dispseq.value)> 10){
	        errMsg="显示序号不能多于10个字符！";
	        document.forms[0].dispseq.focus();
	    }
        isSub = true;
    }else if(type=='deploy')isSub = true;
    
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t00_roleLocation','checkbox','forms[0]','rolekeys,rolenames','');
	}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>

		<html:form method="post" action="/t10_report/t10_report_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">报表发布 - 发 布</span>
						</td>
						<td align="right">
							<input type="button" name="add" value="返 回"
								onClick="dosubmit('t10_report_deploy_list.do','deploy')"
								class="input">

						</td>
					</tr>
				</table>
			</div>
			<div class="awp_detail">
				<html:hidden property="reportkeys" />
				<html:hidden property="rolekeys" />
				<table>
					<tr>
						<td>
							<font color="red">*</font>菜单显示序号：
						</td>
						<td>
							<html:text property="dispseq" styleClass="text_white" size="6"
								maxlength="6" onkeyup="value=value.replace(/[\W]/g,'')" />
						</td>
					</tr>
					<tr>
						<td>
							所属角色：
						</td>
						<td>
							<html:textarea property="rolenames" styleClass="text_white"
								cols="40" rows="3" disabled="true"></html:textarea>
							<html:button property="Button52" styleClass="text_white"
								onclick="locationrole()">多 选</html:button>
							<br>
							<font color="red">注：此处只为角色追加操作，请在角色管理模块中维护角色。</font>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<html:button property="Button52" styleClass="text_white"
								onclick="dosubmit('deploy_report_do.do','add')">提 交</html:button>
							<html:reset styleClass="text_white">重 填</html:reset>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
</body>

</html:html>
