<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
   <SCRIPT LANGUAGE="JavaScript"> 
	function checkForm(theUrl){
	    var errMsg ="";
	    var digit = "<%= request.getAttribute("digit")%>";
	    var seqval = "<%=request.getAttribute("code")%>";
	    if(getLength(document.forms[0].digit_value.value)==0){
	    	errMsg="类别编码不能为空!";
	        document.forms[0].digit_value.focus();
	    }else if(checkNumber(document.forms[0].digit_value.value)!=0 && document.forms[0].digit_value.value < seqval){
	    	errMsg="类别编码已被使用,请修改!";
	        document.forms[0].digit_value.focus();
	    }else if(getLength(document.forms[0].digit_value.value)!=digit && digit!=0 ){
	    	errMsg="类别编码必须为"+digit+"位!";
	        document.forms[0].digit_value.focus();
	    }else if(getLength(document.forms[0].dispseq.value)==0){
	    	errMsg="序号不能为空!";
	        document.forms[0].dispseq.focus();
	    }else if(checkNumber(document.forms[0].dispseq.value)==0){
	    	errMsg="序号必须为数字!";
	        document.forms[0].dispseq.focus();
	    }else if(getLength(document.forms[0].dispseq.value) >10){
	    	errMsg="序号不能大于10个字符!";
	        document.forms[0].dispseq.focus();
	    }else if(getLength(document.forms[0].categoryname.value)==0){
	     	errMsg="类别名称不能为空！";
	        document.forms[0].categoryname.focus();
	    }else if (getLength(document.forms[0].categoryname.value)>128){
	        errMsg="类别名称不能大于128个字符！";
	        document.forms[0].categoryname.focus();
	    }else if (getLength(document.forms[0].desc.value)>256){
	        errMsg="类别描述不能大于256个字符！";
	        document.forms[0].desc.focus();
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	      document.forms[0].action=theUrl;
	      document.forms[0].submit();
	    }
	}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_ca_article/t12_ca_article_modify_do.do">
			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">类别管理
									- 修 改</span>
                        </td>
                        <td align="right" nowrap>
						    <html:button property="button4" value="返 回" styleClass="input"
							onclick="awpDoSubmit('t12_ca_article_list.do','add')" />
                        </td>
                    </tr>
                </table>
            </div>
            
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<input type="hidden" name="treekey"  value="<%= request.getAttribute("treekey") %>"/>
			<input type="hidden" name="level"  value="<%= request.getAttribute("level") %>"/>
			<input type="hidden" name="parentid"  value="<%= request.getAttribute("parentid") %>"/>
			<input type="hidden" name="categorytype"  value="<%= request.getAttribute("categorytype") %>"/>
			<input type="hidden" name="prestr"  value="<%= request.getAttribute("prestr") %>"/>
			<input type="hidden" name="old_key"  value="<%= request.getAttribute("old_key") %>"/>
			<div class='awp_detail'>
				<table>
					<tr>
						<td>
							<font color="red">*</font>类别编码：
						</td>
						<td>
							<c:out value="${prestr}"></c:out>
							<input type="text" name="digit_value" value="<%=request.getAttribute("code")%>" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>类别名称：
						</td>
						<td>
							<html:text property="categoryname" size="30" styleClass="text_white" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>序号：
						</td>
						<td>
							<html:text property="dispseq" size="30" styleClass="text_white" />
						</td>
					</tr>
					
					<tr>
						<td>
							<font color="red">*</font>状态：
						</td>
						<td>
						  <html:select property="flag">
                             <html:options collection="flagMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
					<tr>
						<td>
							类别描述：
						</td>
						<td>
							<html:textarea property="desc" cols="60" rows="6" />
							
						</td>
					</tr>
				    <tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="提 交" OnClick="checkForm('t12_ca_article_modify_do.do')">
							<html:reset styleClass="input" value="重 填"/>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
