<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
    <%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript">
        function checkForm(theUrl){
        	var result = checkform();//校验表单
			if(result){
                awpDoSubmit(theUrl);
            }
        }
    </script>
  </head>
  <body>
 	<!-- 系统总体框架，占页面宽度的98％ -->
    <div id='content'>
      <html:form method="post" action="/search/t02_srch_cate_add.do">
   	    <html:hidden property="srchengkey" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">统一视图 － 定义业务类别</span></td>
		      	<td align="right">
		            <input type="button" value="保 存" onClick="checkForm('t02_srch_cate_add_do.do');">
		            <input type="button" value="返 回" onClick="awpDoSubmit('t02_srch_cate_list.do');">
			        &nbsp;
	          </td>
	        </tr>
	      </table>
        </div>
	    <!-- 错误信息提示区 -->
	    <html:messages id="errors" message="true">
          <bean:write name="errors" filter="fasle" />
        </html:messages>
	    <!-- 查询条件区 -->
	    <!-- 数据区 -->
 	    <div class='awp_detail'>
  	      <table>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>类别名称：</td>
              <td><html:text property="srchcatename" minlength="1" maxlength="64" warning="类别名称"/>（最多32个汉字）</td>
            </tr>
            <tr>
	   	      <td nowrap>显示序号：</td>
              <td><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="显示序号"/>（最多3位数字）</td>
            </tr>
	   	    <tr> 
              <td>功能说明：<br>（最多128个汉字）</td>
              <td colspan=3> 
                <html:textarea property="fundes" rows="4" maxlength="256" warning="功能说明"/>
              </td>
           </tr>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>