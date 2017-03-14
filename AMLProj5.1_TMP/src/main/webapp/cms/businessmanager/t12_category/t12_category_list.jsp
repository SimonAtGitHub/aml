<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
    
</HEAD>
<body>
    <div id='content'>
        <html:form method="post" action="/businessmanager/t12_category/t12_category_list.do">
            <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">类别类型管理</span>
                        </td>
                        <td align="right" nowrap>
                            <input type="button" name="btsearch2" value="查 找"
                                    onclick="btnDisplayHidden(this, 'searchtable')" />
                           <html:button property="button2" value="新  建" styleClass="input"
							onclick="awpDoSubmit('t12_category_add.do','add')" />
						    <html:button property="button3" value="修  改" styleClass="input"
							onclick="awpDoSubmit('t12_category_modify.do','modi')" /> 
						    <html:button property="button4" value="删  除" styleClass="input"
							onclick="awpDoSubmit('t12_category_delete_do.do','del')" />
                        </td>
                    </tr>
                </table>
            </div>

            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class='awp_cond' id="searchtable" style="display:none">
                <table>
                    <tr>
                        <td align="right" nowrap>
                            类别编码：
                        </td>
                        <td nowrap>
                            <html:text property="categorytype" size="30" />
                        </td>
                        <td align="right" nowrap>
                            类别名称：
                        </td>
                        <td nowrap>
                            <html:text property="categorytypename" size="30" />
                        </td>
                    </tr>
                   
                    <tr>
                        <td align="right" nowrap>
                          
                        </td>
                        <td nowrap>
                           
                        </td>
                        <td align="right" nowrap>
                        </td>
                        <td nowrap>
                            <input type="button" name="button" value="查 询"
                                onClick="awpDoSubmit('t12_category_list.do?newsearchflag=1&type=search','search')"
                                class="input">
                        </td>
                    </tr>
                </table>
            </div>

            <div class='awp_list'>
                <table>
                    <tr align="center">
                        <td width="2%" noWrap onclick='selectAllCheckBox(this,document.forms[0])'
                            style='cursor:hand;'>全部</td>
                        <td width="15%" noWrap>
                            	类别编码
                        </td>

                        <td width="20%" noWrap>
                            	类别名称
                        </td>
                         <td width="10%" noWrap>
                            	是否引用类别
                        </td>
                        <td width="15%" noWrap>
                            	状态
                        </td>
                        <td width="15%" noWrap>
                            	创建人
                        </td>
                         <td width="20%" noWrap>
                            	创建时间
                        </td>
                    </tr>
                    <logic:iterate id="category" name="t12_categoryList"
                        type="com.ist.cms.dto.T12_category" indexId="i">
                        <tr align="center">
                            <td>
                                <html:multibox property="selectCategoryKeys" disabled="false"
                                    onclick="changcol(this)">
                                    <bean:write name="category" property="categorytype" />
                                </html:multibox>
                            
                            </td>
                            <td noWrap>
                                 <a
                                    href="javascript:openWin('<%=request.getContextPath()%>/cms/businessmanager/t12_category/t12_category_disp.do?categorytype=<%=category.getCategorytype()%>','')">
                                   <bean:write name="category" property="categorytype" scope="page" /></a>
                            </td>
                            <td noWrap>
                                <bean:write name="category" property="categorytypename" scope="page" />
                            </td>
                            <td noWrap>
                                <bean:write name="category" property="isquote_disp" scope="page" />
                            </td>
                           <td noWrap>
                                <bean:write name="category" property="flag_disp" scope="page" />
                            </td> 
                            <td noWrap>
                                <bean:write name="category" property="creator" scope="page" />
                            </td>
                            <td  noWrap>
                                <bean:write name="category" property="createdate" scope="page" />
                            </td>
                          
                        </tr>
                    </logic:iterate>
                </table>
            </div>

            <div class='awp_page_bottom'>
                <table>
                    <tr>
                        <td align="center">
                            <bean:write name="pageInfo" scope="request" filter="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </div>
	<c:if test="${reload == '1'}">
        <script>
		  parent.leftFrame.location.reload();
	   </script>
    </c:if>
</body>
</html:html>
