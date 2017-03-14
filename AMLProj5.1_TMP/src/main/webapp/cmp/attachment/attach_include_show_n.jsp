<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<script language="JavaScript"
  src="<%=request.getContextPath()%>/js/upload_attachment.js"></script>


<input type="hidden" id="attachkeys" name="attachkeys" />
<script>
  var obj = document.getElementById("attachkeys").value = '<c:out value="${attachkeyString}" />'; //单引号不能丢
</script>
<input type="hidden" id="rowOfAttachList" name="rowOfAttachList" />

<!-- 只显示附件 -->
<c:if test="${showMode == 'view'}">
<c:forEach var="attachtypeList" items="${t12_programa_attachtypeList}">
           <div class="Ar_other">
			   <h1><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_annex.gif" /><c:out value="${attachtypeList['attachname']}" /></h1>
			    <c:forEach var="attachList" items="${t01_attachmentList}">
	            	<c:if test="${attachtypeList['attachkey']  == attachList['attachtype'] }">
		                <span><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_fileicon.gif" /><a href="javascript:void(0);"
	                           onclick="showAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_disp.do?attachkey=<c:out value="${attachList['attachkey']}" />')"><c:out
	                           value="${attachList['sfilename']}" /> </a>( <c:out value="${attachList['filesize']}" />KB)
	                    </span>
	                    <br>
	                </c:if>
	           </c:forEach>
  			</div>
 </c:forEach>
    
    <logic:empty name="t12_programa_attachtypeList">
            <c:forEach var="attachList" items="${t01_attachmentList}">
                <div class="Ar_other">
				   <span><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_fileicon.gif" /><a href="javascript:void(0);"
                              onclick="showAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_disp.do?attachkey=<c:out value="${attachList['attachkey']}" />')"><c:out
                              value="${attachList['sfilename']}" /> </a>( <c:out value="${attachList['filesize']}" />KB)
                   </span>
				 </div> 
				  <br>
            </c:forEach>
    </logic:empty>
    
</c:if>