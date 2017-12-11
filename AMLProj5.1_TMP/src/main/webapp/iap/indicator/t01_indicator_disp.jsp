<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>   
    

</head>

<body leftmargin="0" topmargin="0">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_disp.do">
         <div class="conditions">
           <div class='cond_t'>
			    <span class="awp_title_td2">指标明细</span>
			    <span class="buttons">
	    			<a href="#" onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
			    </span>
			</div>
            <div class="cond_c2">
                <table id="detail_table">
                    <tr>
                        <td align="right">
                            指标名称：
                        </td>
                        <td>
                            <bean:write property="indicname" name="t01_indicator" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            指标类别：
                        </td>
                        <td>
                            <bean:write property="apptype_disp" name="t01_indicator" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            指标属性：
                        </td>
                        <td>
                            <bean:write property="indictype_disp" name="t01_indicator" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            计算方式：
                        </td>
                        <td>
                            <bean:write property="calmode_disp" name="t01_indicator" />
                        </td>
                    </tr>

                    <tr>
                        <td align="right">
                            计算粒度：
                        </td>
                        <td>
                            <bean:write property="granularity_disp" name="t01_indicator" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            状态：
                        </td>
                        <td>
                            <bean:write property="flag_disp" name="t01_indicator" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            指标描述：
                        </td>
                        <td>
                            <bean:write property="des" name="t01_indicator" />
                        </td>
                    </tr>

                   
                </table>
            </div>
            </div>
        </html:form>
    </div>
</body>
</html>
