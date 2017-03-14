<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

    <SCRIPT LANGUAGE="JavaScript"> 
		
		function dosubmit(theUrl,type){
			if(type=='test'){    	
				document.forms[0].target='_blank';
			} 
			else{
				document.forms[0].target='_self';
			}
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
		function checkForm(theUrl,type){    
			var errMsg ="";
			if (type == 'commit'){

			}
			
			if(errMsg!=""){
				alert(errMsg);
				return false;
			}
			dosubmit(theUrl,type);
			
		}
	function parentpage(theUrl){
	  parent.location=theUrl;
	}
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form action="/indicator/indicator_colmap.do" method="POST">
            <div class="conditions">
            <div class="cond_t">
               <span>指标定义 - 关系映射</span>
			   <span class="buttons">
			     <%if(!"inedit".equals((String)request.getAttribute("type"))){ %>
			     
			        <a href="javascript:void(0);" onclick="dosubmit('indicator_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
                              
                 <%}else{ %>
                 
                    <a href="javascript:void(0);" onclick="parentpage('indicator_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
                  
                 <%} %>
			    
			   </span>
            </div>
            </div>

            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>
	
                    <table height="30" width="98%" border="0" align="center" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td valign="bottom" class="td1">
                            <input type="hidden" name="type" value="<%=(String)request.getAttribute("type") %>"/> 
                            <html:hidden property="indickey" />
                            <html:hidden property="aliasStr" />
                            <strong><bean:write name="t09_indicatorActionForm" property="indickey"
                                scope="request" />
                            --
                            <bean:write name="t09_indicatorActionForm" property="indicname"
                                scope="request" />
                            ; 指标类别：
                            <bean:write name="t09_indicatorActionForm" property="indictype_disp"
                                scope="request" />
                            定义方式：
                            <bean:write name="t09_indicatorActionForm" property="calmode_disp"
                                scope="request" /></strong>
                        </td>
                    </tr>
                </table>
                

            <div class="list">
                <table>
                    <tr>
                        <td align="right">
                            输出列：
                        </td>
                        <td>
                            <table >
                                <tr>
                                    <TD align="center" rowspan="2" class="st03">
                                        序号
                                    </TD>
                                    <TD align="center" colspan="3" class="st03">
                                        目标表列信息
                                    </TD>
                                    <TD align="center" colspan="1" class="st03">
                                        对应输入信息
                                    </TD>
                                </tr>
                                <tr>
                                    <TD align="center" class="st03">
                                        列代码
                                    </TD>
                                    <TD align="center" class="st03">
                                        列名称
                                    </TD>

                                    <TD align="center" class="st03">
                                        数据类型
                                    </TD>
                                    <TD align="center" class="st03">
                                        数据来源内容
                                    </TD>
                                </tr>
                                <logic:iterate id="kind" name="mt_colList"
                                    type="com.ist.common.metadata.dto.T01_mt_col_pro" indexId="j">
                                    <%
                                    String colkey = kind.getColkey();
                                    %>
                                    <bean:define id="curr_colname" name="kind" property="colename"></bean:define>
                                    <tr>
                                        <TD align="center" noWrap>
                                            (
                                            <%=j.intValue() + 1%>
                                            )
                                        </TD>
                                        <TD align="center" noWrap>
                                            <bean:write name="kind" property="colkey" />
                                        </TD>
                                        <TD align="center" noWrap>
                                            <bean:write name="kind" property="colename" />
                                        </TD>
                                        <TD align="center" noWrap>
                                             <bean:write name="kind" property="coltype" />
                                        </TD>
                                        <TD align="center" noWrap>
                                            <select name="skey_<%=colkey%>">
                                                <%
                                                                            HashMap colmapHash = (HashMap) request
                                                                            .getAttribute("colmapHash");
                                                                    String scolname = "";
                                                                    if (colmapHash.containsKey(colkey)) {
                                                                        scolname = (String) colmapHash.get(colkey);
                                                                    }

                                                                    //
                                                                    LinkedHashMap bdsMap = (LinkedHashMap) request
                                                                            .getAttribute("bdsMap");
                                                                    Iterator iter = bdsMap.keySet().iterator();
                                                                    while (iter.hasNext()) {
                                                                        String selectstr = "";
                                                                        String alias = (String) iter.next();
                                                                        String express = (String) bdsMap.get(alias);
                                                                        System.out.println("alias=" + alias
                                                                                + "    curr_colname=" + curr_colname);
                                                                        if (alias.equals(curr_colname))
                                                                            selectstr = "selected";
                                                                        //
                                                                        if (scolname.equals(alias))
                                                                            selectstr = "selected";
                                                %>
                                                <option value="<%=alias + "||" + express%>"
                                                    <%=selectstr%>>
                                                    <%=alias%>
                                                </option>
                                                <%
                                                }
                                                %>
                                            </select>
                                        </TD>
                                    </tr>
                                </logic:iterate>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="right">
                            <input type="button" name="button" value="完 成"
                                onClick="checkForm('indicator_colmap_do.do','commit')" class="in_button1">
                            <input type="reset" value="重 填" class="in_button1">
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </div>
</BODY>
</html>
