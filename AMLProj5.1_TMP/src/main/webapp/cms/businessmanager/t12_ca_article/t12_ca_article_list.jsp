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
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc_report.js"></script>
</HEAD>
<body>
    <div id='content'>
        <html:form method="post" action="/businessmanager/t12_ca_article/t12_ca_article_list.do">
            <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">类别管理</span>
                        </td>
                        <td align="right" nowrap>
                            <input type="button" name="btsearch2" value="查 找"
                                    onclick="btnDisplayHidden(this, 'searchtable')" />
                           <html:button property="button2" value="新  建" styleClass="input"
							onclick="awpDoSubmit('t12_ca_article_add.do','add')" />
						    <html:button property="button3" value="修  改" styleClass="input"
							onclick="awpDoSubmit('t12_ca_article_modify.do','modi')" /> 
						    <html:button property="button4" value="删  除" styleClass="input"
							onclick="awpDoSubmit('t12_ca_article_delete_do.do','del')" />
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
                            <html:text property="categorykey" size="30" />
                        </td>
                        <td align="right" nowrap>
                            类别名称：
                        </td>
                        <td nowrap>
                            <html:text property="categoryname" size="30" />
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
                                onClick="awpDoSubmit('t12_ca_article_list.do?newsearchflag=1&type=search','search')"
                                class="input">
                        </td>
                    </tr>
                </table>
            </div>
            <input type="hidden" name="treekey"  value="<%= request.getAttribute("treekey") %>"/>
			<input type="hidden" name="level"  value="<%= request.getAttribute("level") %>"/>
			<input type="hidden" name="parentid"  value="<%= request.getAttribute("parentid") %>"/>
			<input type="hidden" name="categorytype"  value="<%= request.getAttribute("categorytype") %>"/>
            <div class='awp_dynamic_list'>
                <table>
                    <tr align="center">
                        <td width="2%" noWrap onclick='selectAllCheckBox(this,document.forms[0])'
                            style='cursor:hand;'>全部</td>
                        <td width="10%" noWrap>
                            	类别编码
                        </td>

                        <td width="20%" noWrap>
                            	类别名称
                        </td>
                        <td width="18%" noWrap>
                            	层级
                        </td>
                         <td width="10%" noWrap>
                            	状态
                        </td>
                        <td width="20%" noWrap>
                            	创建人
                        </td>
                         <td width="20%" noWrap>
                            	创建时间
                        </td>
                    </tr>
                    <logic:iterate id="t12_ca_article" name="t12_ca_articleList"
                        type="com.ist.cms.dto.T12_ca_article" indexId="i">
                        <tr align="center">
                            <td>
                                <html:multibox property="selectCategoryKeys" disabled="false"
                                    onclick="changcol(this)">
                                    <bean:write name="t12_ca_article" property="categorykey" />
                                </html:multibox>
                            
                            </td>
                            <td noWrap>
                                <bean:write name="t12_ca_article" property="categorykey" scope="page" />
                            </td>
                            <td noWrap>
                                <bean:write name="t12_ca_article" property="categoryname" scope="page" />
                            </td>
                            <td noWrap>
                                <bean:write name="t12_ca_article" property="level" scope="page" />
                            </td>
                           
                           <td  noWrap>
                                <bean:write name="t12_ca_article" property="flag_disp" scope="page" />
                            </td>
                             <td noWrap>
                                <bean:write name="t12_ca_article" property="creator" scope="page" />
                            </td>
                            <td  noWrap>
                                <bean:write name="t12_ca_article" property="createdate" scope="page" />
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
