<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<script language="JavaScript" src="<%=request.getContextPath()%>/js/upload_attachment.js"></script>
 
<input type="hidden" id="attachkeys" name="attachkeys" />
<script>
  var obj = document.getElementById("attachkeys").value = '<c:out value="${attachkeyString}" />'; //单引号不能丢
  
  function uploadfile_n(url) {
  	 var isBack;
     if (!document.getElementById("isBack")) {
     	isBack = "2";
     } else {	
     	isBack = document.getElementById("isBack").value;
     }
     url += "&isBack=" + isBack;
  	 uploadfile(url);
  }
   
</script>

<input type="hidden" id="rowOfAttachList" name="rowOfAttachList" />
<!-- 可以上传、编辑附件 -->
<c:if test="${showMode == 'edit'}">
    <p align="left">
        <input type=button value="添 加 附 件" name="add" class="input"
            onClick="uploadfile_n('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_addType.do?programakey=<c:out value="${t12_articleActionForm.programakey}" />&systemkey=<c:out value="${systemkey}" />')">
    </p>
    <div class='list'>
        <table id="attachListTable">
            <tr align="center">
                <th>
                    附件名称
                </th>
                <th>
                    文件大小(KB)
                </th>
                <th>
                    创建人
                </th>
                <th>
                    操作
                </th>
            </tr>
            <c:forEach var="attachList" items="${t01_attachmentList}">
                <TR align="center">
                    <TD>
                        <a href="javascript:void(0);"
                            onclick="showAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_disp.do?attachkey=<c:out value="${attachList['attachkey']}" />')"><c:out
                            value="${attachList['sfilename']}" /> 
                         </a>
                    </TD>
                    <TD nowrap>
                        <c:out value="${attachList['filesize']}" />
                    </TD>
                    <TD nowrap>
                        <c:out value="${attachList['creator_disp']}" />
                    </TD>
                    <TD>
                        <c:if test="${currentUser == attachList['creator']}">
                          <!--  <a href="javascript:void(0);"
                                onclick="editAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_control.do?attachkey=<c:out value="${attachList['attachkey']}" />')">编辑
                            </a> --> 
				          		&nbsp;
				            <a href="javascript:void(0);" onclick="delAttach('<c:out value="${attachList['attachkey']}" />')">删除
				            </a>
                        </c:if>
                    </TD>
                </TR>
            </c:forEach>
        </table>
    </div>
</c:if>

<!-- 只显示附件 -->
<c:if test="${showMode == 'view'}">
    <div class='list'>
        <table id="attachShow">
            <tr align="center">
                <th>
                    附件名称
                </th>
                <th>
                    文件大小(KB)
                </th>
                <th>
                    创建人
                </th>
            </tr>
            <c:forEach var="attachList" items="${t01_attachmentList}">
                <TR align="center">
                    <TD>
                        <a href="javascript:void(0);"
                            onclick="showAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_disp.do?attachkey=<c:out value="${attachList['attachkey']}" />')"><c:out
                            value="${attachList['sfilename']}" /> 
                        </a>
                    </TD>
                    <TD nowrap>
                        <c:out value="${attachList['filesize']}" />
                    </TD>
                    <TD nowrap>
                        <c:out value="${attachList['creator_disp']}" />
                    </TD>
                </TR>
            </c:forEach>
        </table>
    </div>
</c:if>
