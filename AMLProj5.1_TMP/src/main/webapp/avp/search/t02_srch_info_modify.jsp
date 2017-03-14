<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
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
      <html:form method="post" action="/search/t02_srch_info_modify.do">
   	    <html:hidden property="srchcatekey" />
   	    <html:hidden property="oldtplakey"/>
        <html:hidden property="srchengkey" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">修改跳转模型</span></td>
		      	<td align="right">
		            <input type="button" name="Submit1" value="保 存" onClick="checkForm('t02_srch_info_modify_do.do');">
		            <input type="button" name="Submit1" value="返 回" onClick="awpDoSubmit('t02_srch_info_list.do');">
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
              <td nowrap><font color="#FF3300">*</font>搜索名称：</td>
              <td nowrap="nowrap" colspan="3"><html:text property="srchname" minlength="1" maxlength="64" warning="搜索名称"/>（最多32个汉字）</td>
	   	    </tr>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>模型名称：</td>
	   	      <td nowrap="nowrap" colspan="3">
	   	        <html:hidden property="tplakey"/>
                <html:text property="tplaname" readonly="true" minlength="1" warning="模型名称" />
           		<input type="button" name="locate" value="定 位" 
				 onClick="locate_pop_window('<%=request.getContextPath()%>','t02_TemplateLocation','radio','forms[0]','tplakey,tplaname','tplastat=1 and dptmid=100111');" />
			    （单选）
              </td>
            </tr>
	   	    <tr> 
              <td nowrap>页面跳转类型：</td>
              <td nowrap="nowrap" colspan="3">
				<html:select property="jumpcate">
	              <html:options collection="jumpcateMap" property="label" labelProperty="value" />
                </html:select>
             </td>
           </tr>
           <tr>
		       <td nowrap>显示序号：</td>
  			   <td colspan="3"><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="显示序号"/>（最多3位数字）</td>
		   </tr>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>