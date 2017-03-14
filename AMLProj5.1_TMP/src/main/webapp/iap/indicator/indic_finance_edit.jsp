<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <META content="MSHTML 6.00.2600.0" name=GENERATOR>
    <link  href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl,type){
		var errMsg ="";
		//检查是否选择了粒度
		if(type=="finish"){
			var lidus = document.getElementsByName('granularity');
	    	var s_lidu =false;
			for(var i=0;i<lidus.length;i++){
				var ele = lidus[i];
				if(!ele.disabled && ele.checked){
					s_lidu = true;
					break;
				}
			}
			if(!s_lidu){
				errMsg="请输入计算公式和粒度！";
			}
		}
		//页面位置
		if(type=="espec"){
			var symbol = document.forms[0].symbol.value;
			theUrl = theUrl+"&symbol="+symbol;
		}
		if(errMsg==''){	
			 document.forms[0].action=theUrl;
			 document.forms[0].submit();	
		}else{
			alert(errMsg);
		}
    }
	function itemOpen(){
		var indickey = document.forms[0].indickey.value;
		var symbol = document.forms[0].symbol.value;
		var selObject = eval(document.forms[0].reportkey);
		var index=selObject.selectedIndex;
		var reportkey = selObject.options[index].value;
		var openUrl = "getT01_reportitemList.do?newsearchflag=1&reportkey="+reportkey+"&indickey="+indickey+"&symbol="+symbol;
		window.open(openUrl,'newwindow','height=500, width=450,left=1,top=1,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');
	}
    
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form action="/platform/indicator/t01_indic_subitem3_modify.do" method="POST">
            <div class='awp_title'>
                <table>
                    <tr>
                     
                        <td>
                            <span class="awp_title_td2">指标定义 - 财务指标公式编辑</span>
                        </td>
                        <td align="right" nowrap>
                        
                            <html:button property="backbutton" value="返 回"
                                onclick="dosubmit('indicator_list.do','returnlist')" />
                        </td>
                    </tr>
                </table>
            </div>

            <input type="hidden" name="showtype" value="<bean:write name="showtype"/>">

            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class="awp_detail_bgz">
                <table>
                    <tr>
                        <td colspan="2" align="left" nowrap>
                            <font color="#FF0000">*</font>定义计算公式：
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="6" align="right" nowrap>
                            <font color="#FF0000">*</font>计算公式：
                        </td>
                        <td align="left">
                            <TABLE>
                                <TR>
                                    <TD valign="top">
                                        <table height="150">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <bean:write name="formulaDisp" scope="request"
                                                        filter="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </TD>
                                </TR>
                            </TABLE>
                                <input type="button" value="公式后退"
                                onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=0&indickey=<%=request.getAttribute("indickey")%>','back')" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            四则运算符：
                            <html:select property="symbol">
                                <html:options collection="jisfuhMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                    </tr>

                    <tr>
                        <td align="left">
                            选择计算项：
                            <html:select property="reportkey">
                                <html:options collection="reportMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                            <c:if test="${showtype=='0' or showtype == '1'}">
                                <html:button property="button" value="确 定" onclick="itemOpen()" />
                            </c:if>
                            <c:if test="${showtype=='2' or showtype == '3'}">
                                <html:button property="button" value="确 定" onclick="itemOpen()"
                                    disabled="true" />
                            </c:if>
                    </tr>
                    <tr>
                        <td align="left">
                            基础操作符：
                            <c:if test="${showtype=='0' or showtype == '1'}">
                                <html:button property="button" value=" ( "
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=3','select')" />
                                <html:button property="button" value=" ) "
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=4','select')" />
                            </c:if>
                            <c:if test="${showtype=='2' or showtype == '3'}">
                                <html:button property="button" value=" ( "
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=3','select')"
                                    disabled="true" />
                                <html:button property="button" value=" ) "
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=4','select')"
                                    disabled="true" />
                            </c:if>
                    </tr>
                    <tr>
                        <td align="left">
                            请输入数值：
                            <html:text property="constant" size="10"></html:text>
                            <c:if test="${showtype=='0' or showtype == '1'}">
                                <html:button property="button" value="确 定"
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=2','select')" />
                            </c:if>
                            <c:if test="${showtype=='2' or showtype == '3'}">
                                <html:button property="button" value="确 定"
                                    onclick="dosubmit('t01_indic_subitem3_modify.do?itemtype=2','select')"
                                    disabled="true" />
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            特殊型公式：
                            <c:if test="${showtype=='0' or showtype == '2'}">
                                <html:button property="button" value="基期型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=1','espec')" />

                                <html:button property="button" value="同期型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=2','espec')" />
                                <html:button property="button" value="平均值型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=3','espec')" />

                                <html:button property="button" value="累加型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=4','espec')" />
                                <html:button property="button" value="累计日均型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=5','espec')" />

                                <html:button property="button" value="当期日均型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=6','espec')" />
                            </c:if>
                            <c:if test="${showtype=='3' or showtype == '1'}">
                                <html:button property="button" value="基期型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=1','espec')"
                                    disabled="true" />

                                <html:button property="button" value="同期型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=2','espec')"
                                    disabled="true" />
                                <html:button property="button" value="平均值型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=3','espec')"
                                    disabled="true" />

                                <html:button property="button" value="累加型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=4','espec')"
                                    disabled="true" />
                                <html:button property="button" value="累计日均型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=5','espec')"
                                    disabled="true" />

                                <html:button property="button" value="当期日均型公式"
                                    onclick="dosubmit('getEspecindicDisp.do?especindictype=6','espec')"
                                    disabled="true" />

                            </c:if>
                        </td>
                    </tr>

                    <tr>
                        <td align="right" nowrap>
                            <font color="red">*</font>粒 度：
                        </td>
                        <td align="left">
                            <%
                                                String lidu_jiaoji_num = (String) request
                                                .getAttribute("lidu_jiaoji");
                                        if (lidu_jiaoji_num == null || "".equals(lidu_jiaoji_num)) {
                                            lidu_jiaoji_num = "0000000";
                                        }
                                        int i_lidu = Integer.parseInt(lidu_jiaoji_num, 2);

                                        String granularity = (String) request.getAttribute("granularity");
                                        String[] checked = new String[] { "", "", "", "" };
                                        if (granularity != null && !"".equals(granularity)) {
                                            int lidu = Integer.parseInt(granularity, 2);
                                            if ((lidu / 64) % 2 == 1) {
                                                checked[0] = "checked";
                                            }
                                            if ((lidu / 8) % 2 == 1) {
                                                checked[1] = "checked";
                                            }
                                            if ((lidu / 4) % 2 == 1) {
                                                checked[2] = "checked";
                                            }
                                            if ((lidu / 1) % 2 == 1) {
                                                checked[3] = "checked";
                                            }
                                        }
                            %>
                            <%
                                            if ((i_lidu / 64) % 2 == 0) {
                                            out
                                                    .print("<input type=\"checkbox\" name=\"granularity\" disabled value=\"64\"/>日&nbsp;");

                                        } else {
                                            out.print("<input type=\"checkbox\" name=\"granularity\" "
                                                    + checked[0] + " value=\"64\"/>日&nbsp;");
                                        }
                                        if ((i_lidu / 8) % 2 == 0) {
                                            out
                                                    .print("<input type=\"checkbox\" name=\"granularity\" disabled value=\"8\"/>月&nbsp;");

                                        } else {
                                            out.print("<input type=\"checkbox\" name=\"granularity\" "
                                                    + checked[1] + " value=\"8\"/>月&nbsp;");
                                        }
                                        if ((i_lidu / 4) % 2 == 0) {
                                            out
                                                    .print("<input type=\"checkbox\" name=\"granularity\" disabled value=\"4\"/>季&nbsp;");

                                        } else {
                                            out.print("<input type=\"checkbox\" name=\"granularity\" "
                                                    + checked[2] + " value=\"4\"/>季&nbsp;");
                                        }
                                        if ((i_lidu / 1) % 2 == 0) {
                                            out
                                                    .print("<input type=\"checkbox\" name=\"granularity\" disabled value=\"1\"/>年&nbsp;");

                                        } else {
                                            out.print("<input type=\"checkbox\" name=\"granularity\" "
                                                    + checked[3] + " value=\"1\"/>年&nbsp;");
                                        }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap>
                            <font color="red">*</font>币 种：
                        </td>
                        <td align="left">
                            <html:select property="currency">
                                <html:options collection="currencyMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>


                    <tr>
                        <td nowrap>
                            &nbsp;
                        </td>
                        <td align="right">
                            <html:hidden property="indickey" />
                            <html:button property="button" value="完 成"
                                onclick="dosubmit('t01_indic_subitem3_modify_do.do?itemtype=99','finish')" />
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </div>
</BODY>
</html:html>
