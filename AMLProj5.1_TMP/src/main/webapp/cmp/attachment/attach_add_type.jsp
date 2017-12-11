<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<c:if test="${isClosed == 'y'}">
    <script language="JavaScript">
		window.opener.addAttach_n('<c:out value="${dispAttachPath}" />','<c:out value="${editAttachPath}" />','<c:out value="${attachkey}" />','<c:out value="${fname}" />','<c:out value="${fileSize}" />','<c:out value="${creator}" />','<c:out value="${attachtype}"/>');
		<c:if test="${t01_attachmentActionForm.isBack == 1}">
			window.opener.setSelectOption('picName','<c:out value="${picUrl}" />','<c:out value="${fname}" />');
		</c:if>
		window.close();
	</script>
</c:if>

<c:if test="${empty isClosed or isClosed != 'y'}">
    <html>
        <HEAD>
            <META http-equiv=Content-Type content="text/html; charset=GBK">
            <META content="MSHTML 6.00.2600.0" name=GENERATOR>
            <%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
            
            <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
            <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
            <script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/uc.js"></script>
            <script language="JavaScript">
function dosubmit(theUrl){
	if(trim(document.forms[0].filename.value) == '') {
	    alert("请选择要上传的文件！");
		return;
	}
   	if (document.forms[0].filename.value.split('.').length < 2){
		alert("不允许上传该类型的文件！");
		return;
	}
   if(trim(document.forms[0].rename.value).length > 100){
		alert("重命名名称不能超过50个汉字！");
		return;
	}
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}
function test(){
	var _opener = window.opener;
	var s = _opener.document.getElementById("attachkeys").value;
	s = s + ",7";
	_opener.document.getElementById("attachkeys").value = s;
	
	var objTable = _opener.document.getElementById("attachListTable");
	var objRow = objTable.insertRow();
	for (i=0;i<4;i++) {
		myTD = objRow.insertCell();
		myTD.innerText="第"+(i+1).toString()+"个单元格";
	}
	myTD = objRow.insertCell();
	myTD.outerHTML ="<a href=\"#\" onclick=\"delAttach('7')\">删除</a>";

	//window.opener.test();
	window.close();
}

			</script>
        </HEAD>
        
        <BODY leftmargin=0 topmargin=0>
            <div id='content'>
                <html:form method="post" action="/attachment/t01_attachment_type_add_do.do"
                    enctype="multipart/form-data">
                    <html:hidden property="systemkey" />
                    <html:hidden property="isBack" />
                     <html:hidden property="programakey" />
                    
                    <div class='awp_title'>
                        <table>
                            <tr>
                                <td class="td1">
                                    <span class="awp_title_td2">附件管理</span>
                                </td>
                                <td align="right" nowrap>
                                    <input type="button" name="Submit" value="关 闭" class="input"
                                        onClick="window.close();">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <html:messages id="errors" message="true">
                        <bean:write name="errors" filter="fasle" />
                    </html:messages>


                    <div class="awp_cond">
                        <table>
                            <tr>
                                <td align="right" nowrap>
                                    上传文件：
                                </td>
                                <td>
                                    <html:file property="filename" size="30" />
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    重命名：
                                </td>
                                <td>
                                    <html:text property="rename" size="30" />
                                    <input type=button value="上 传" name="Button23222" class="input"
                                        onClick="dosubmit('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_type_add_do.do');">
                                         <font color="red">重命名无需后缀名</font>
                                </td>
                            </tr>
                            <logic:notEmpty name="attchtypeList">
                            
	                		 	<tr>
	                                <td align="right">
	                                   	 栏目附件类别：
	                                </td>
	                                <td>
	                                   <html:select property="attachtype">
													
													<logic:iterate id="list" name="attchtypeList" type="com.ist.common.attachment.dto.T01_programa_attachtype">
														<option value="<bean:write name="list" property="attachkey" />#<bean:write name="list" property="attachname"/>"><bean:write name="list" property="attachname" /></option>
													</logic:iterate>
													
										</html:select>
							        </td>
	                            </tr>  
	                               <tr>
                            
                            <td>备注：</td>
                            <%
                            String suffixStr = (String)request.getAttribute("suffixStr") == null? "" : (String)request.getAttribute("suffixStr");
                            %>
                    			<td>上传文件类型的后缀为      <%=suffixStr %>  </td>
                    		</tr>
                            </logic:notEmpty>          
                        </table>
                    </div>
                </html:form>
            </div>
        </BODY>
    </html>
</c:if>
