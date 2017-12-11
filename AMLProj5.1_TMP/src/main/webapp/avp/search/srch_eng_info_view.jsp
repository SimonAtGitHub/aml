<%@ page contentType="text/html; charset=GBK" %>
<%@page import="com.ist.avp.search.Constants"%>
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
    	var completeSuccessFlagConst = "<%=Constants.COMPLETE_SUCCESS_FLAG%>";
    	var completeSuccessFlag = "<%=request.getAttribute("successFlg") %>";
    	
    	function completed() {
    		if (completeSuccessFlagConst == completeSuccessFlag) {
    		    parent.opener.document.forms[0].submit();
    			window.parent.close();
    		}
    	}
    	function checkForm() {
    		if (confirm("您是否确认引擎的相关信息已经配置完成?")) {
    			awpDoSubmit('srch_eng_info_view_complete.do');
    		}
    	}
    	
    	function srchEngTest() {
    		var path = "eng_init.do?srchengkey=" + document.forms[0].srchengkey.value;
    		avpPopUp(path, 1024, 768);
    	}
    </script>
  </head>
  <body>
  	<!-- 系统总体框架，占页面宽度的98％ -->
  	<div id='content'>
   	  <html:form method="post" action="/search/srch_eng_info_view.do">
   	    <html:hidden property="srchengkey" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">统一视图信息汇总</span></td>
			  	<td align="right">
			  		<input type="button" value="测 试" onClick="srchEngTest();">
	            	<input type="button" value="完 成" onClick="checkForm();">
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
              <td><font color="#FF3300">*</font>引擎名称：</td>
              <td><bean:write name="t02_srch_eng_infActionForm" property="srchengname"/></td>
	     	</tr>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>相关搜索结果列数：</td>
              <td><bean:write name="t02_srch_eng_infActionForm" property="crltsrchcolcnt"/></td>
	        </tr>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>相关搜索结果记录条数：</td>
              <td><bean:write name="t02_srch_eng_infActionForm" property="crltsrchrowcnt"/></td>
	    	</tr>
	   	    <tr> 
              <td>功能说明：</td>
              <td><bean:write name="t02_srch_eng_infActionForm" property="fundes"/></td>
            </tr>
          </table>
        </div>
        <div class='awp_list'>
  	      <table>
	   	    <tr>
	   		  <td>序号</td>
	   		  <td>参数代码</td>
	   		  <td>显示名称</td>
	   		  <td>参数类型</td>
	   		  <td>是否必输</td>
	    	</tr>
			<logic:iterate id="parmInfo" name="t02_srch_eng_parmList" type="com.ist.avp.search.dto.T02_srch_eng_parm" indexId="index">
			  <tr>
				<td nowrap align="center">
				  <%=index.intValue()+1%>
				</td>
				<td nowrap align="center">
				  <bean:write name="parmInfo" property="parmkey"/>
				</td>
				<td nowrap>
				  <bean:write name="parmInfo" property="parmname"/>
				</td>
				<td nowrap>
				  <bean:write name="parmInfo" property="parmcate_disp"/>
				</td>
				<td nowrap align="center">
				  <bean:write name="parmInfo" property="isness_disp"/>
				</td>
			  </tr>
		    </logic:iterate>
          </table>
        </div>

        <div class='awp_list'>
  	      <table>
	   	    <tr>
	   		  <td>序号</td>
	   		  <td>类别编码</td>
	   		  <td>类别名称</td>
	   		  <td>搜索名称</td>
	   		  <td>模型名称</td>
	   		  <td>页面跳转类型</td>
	   		  <td>模型参数</td>
	   	    </tr>
	   	    <logic:iterate id="cateInfo" name="t02_srch_cate_infList" type="com.ist.avp.search.dto.T02_srch_cate" indexId="index">
			  <tr>
				<td nowrap align="center">
				  <%=index.intValue()+1%>
				</td>
				<td nowrap align="center">
				  <bean:write name="cateInfo" property="srchcatekey"/>
				</td>
				<td nowrap>
				  <bean:write name="cateInfo" property="srchcatename"/>
				</td>
				<td nowrap>
				  <bean:write name="cateInfo" property="srchname"/>
				</td>
				<td nowrap>
				  <bean:write name="cateInfo" property="tplaname"/>
				</td>
				<td nowrap align="center">
				  <bean:write name="cateInfo" property="jumpcate_disp"/>
				</td>
				<td nowrap>
				  <bean:write name="cateInfo" property="dispparmstr"/>
				</td>
			  </tr>
		    </logic:iterate>
          </table>
        </div>
        <div class='awp_list'>
  	      <table>
	   	    <tr>
	   		  <td>序号</td>
	   		  <td>相关搜索名称</td>
	   		  <td>内容描述</td>
	   		  <td>SQL</td>
	   	    </tr>
	   	    <logic:iterate id="crltInfo" name="t02_crlt_srchList" type="com.ist.avp.search.dto.T02_crlt_srch" indexId="index">
			  <tr>
				<td nowrap align="center">
				  <%=index.intValue()+1%>
				</td>
				<td nowrap>
				  <bean:write name="crltInfo" property="crltsrchname"/>
				</td>
				<td nowrap>
				  <bean:write name="crltInfo" property="crltsrchdes"/>
				</td>
				<td nowrap>
				  <bean:write name="crltInfo" property="crltsrchsql"/>
				</td>
			  </tr>
		    </logic:iterate>
          </table>
        </div>
      </html:form>
    </div>
  </body>
  <script language="JavaScript">
    	//completed();
    </script>
</html>