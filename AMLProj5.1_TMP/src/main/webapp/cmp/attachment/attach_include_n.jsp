<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<script language="JavaScript" src="<%=request.getContextPath()%>/js/upload_attachment.js"></script>
 
<input type="hidden" id="attachkeys" name="attachkeys" />
<script>
  var obj = document.getElementById("attachkeys").value = '<c:out value="${attachkeyString}" />'; //�����Ų��ܶ�
  
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
<!-- �����ϴ����༭���� -->
<c:if test="${showMode == 'edit'}">
    <p align="left">
        <input type=button value="�� �� �� ��" name="add" class="input"
            onClick="uploadfile_n('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_addType.do?programakey=<c:out value="${t12_articleActionForm.programakey}" />&systemkey=<c:out value="${systemkey}" />')">
    </p>
    <div class='list'>
        <table id="attachListTable">
            <tr align="center">
                <th>
                    ��������
                </th>
                <th>
                    �ļ���С(KB)
                </th>
                <th>
                    ������
                </th>
                <th>
                    ����
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
                                onclick="editAttach('<%=request.getContextPath()%>/cmp/attachment/t01_attachment_control.do?attachkey=<c:out value="${attachList['attachkey']}" />')">�༭
                            </a> --> 
				          		&nbsp;
				            <a href="javascript:void(0);" onclick="delAttach('<c:out value="${attachList['attachkey']}" />')">ɾ��
				            </a>
                        </c:if>
                    </TD>
                </TR>
            </c:forEach>
        </table>
    </div>
</c:if>

<!-- ֻ��ʾ���� -->
<c:if test="${showMode == 'view'}">
    <div class='list'>
        <table id="attachShow">
            <tr align="center">
                <th>
                    ��������
                </th>
                <th>
                    �ļ���С(KB)
                </th>
                <th>
                    ������
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
