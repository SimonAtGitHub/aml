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
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script language="JavaScript">
      function dosubmit(theUrl,type){
          var errMsg ="";
          if(type=="delete"){
     	      errMsg = CheckBoxMustChecked(document.forms[0]);
          }
          if(type=="modify"){
              errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
          }
    
          if(errMsg!=""){
              alert(errMsg);
              return false;
          }else {
              if(type=="delete"){
			      if(confirm('您确定要删除此模型吗?')) {
         		      document.forms[0].action=theUrl;
         		      document.forms[0].target='_self';
        		      document.forms[0].submit();
        		      event.srcElement.disabled = true;
        	      }
              }else{
        	      document.forms[0].action=theUrl;
        	      document.forms[0].target='_self';
        	      document.forms[0].submit();
        	      event.srcElement.disabled = true;
              }
         }
     }
    </script>
  </head>
  <body>
  	<!-- 系统总体框架，占页面宽度的98％ -->
  	<div id='content'>
   	  <html:form method="post" action="/search/t02_crlt_srch_list.do">
   	    <html:hidden property="crltsrchkey" />
   	    <html:hidden property="srchengkey" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">统一视图 －相关搜索列表</span></td>
			  	<td align="right">
		            <input type="button" name="btnAdd" value="增 加" onclick="dosubmit('t02_crlt_srch_add.do', 'add')">
		            <input type="button" name="btnModify" value="修 改" onClick="dosubmit('t02_crlt_srch_modify.do', 'modify')">
		            <input type="button" name="btnDelete" value="删 除" onClick="dosubmit('t02_crlt_srch_delete_do.do', 'delete')">
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
 	    <div class='awp_list'>
  	      <table>
	   	    <tr>
	   		  <td>全部</td>
	   		  <td>相关搜索名称</td>
	   		  <td>内容描述</td>
	   		  <td>SQL</td>
	   	    </tr>
	   	    <logic:iterate id="crltInfo" name="t02_crlt_srchList" type="com.ist.avp.search.dto.T02_crlt_srch">
	   	      <tr>
				<td align="center" nowrap>
				  <html:multibox property="crltsrchkeys">
					<bean:write name="crltInfo" property="crltsrchkey" />
				  </html:multibox>
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
</html>