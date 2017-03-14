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
     
     	function tplaParmManager() {
     		var url = "addT02_parm_elmt_rela.do";
     		var errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
     		if (errMsg.length != 0) {
     			alert(errMsg);
     			return;
     		}
     		awpDoSubmit(url);
     	}
    </script>
  </head>
  <body>
  	<!-- 系统总体框架，占页面宽度的98％ -->
  	<div id='content'>
   	  <html:form method="post" action="/search/t02_srch_info_list.do">
   	    <html:hidden property="srchcatekey" />
   	    <html:hidden property="srchengkey" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
			  <td width="23%"><span class="awp_title_td2">统一视图 －搜索列表</span></td>
			  <td align="right">
	            <input type="button" name="btnAdd" value="增 加" onclick="dosubmit('t02_srch_info_add.do', 'add')">
	            <input type="button" name="btnModify" value="修 改" onClick="dosubmit('t02_srch_info_modify.do', 'modify')">
	            <input type="button" name="btnDelete" value="删 除" onClick="dosubmit('t02_srch_info_delete_do.do', 'delete')">
	            <input type="button" name="btnParam" value="参数" onClick="tplaParmManager();">
	            <input type="button" name="return" value="返 回" onClick="awpDoSubmit('t02_srch_cate_list.do');">
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
	   		  <td>搜索名称</td>
	   		  <td>模型名称</td>
	   		  <td>页面跳转类型</td>
	   		  <td>模型参数</td>
	   		  <td>创建人姓名</td>
	   		  <td>创建时间</td>
	   		  <td>修改人姓名</td>
	   		  <td>修改时间</td>
	   	    </tr>
            <logic:iterate id="listInfo" name="t02_srch_infList"  type="com.ist.avp.search.dto.T02_srch_inf">
			  <tr>
				<td align="center" nowrap>
				  <html:multibox property="tplakeys">
					<bean:write name="listInfo" property="tplakey" />
				  </html:multibox>
				</td>
				<td nowrap>
				  <bean:write name="listInfo" property="srchname" scope="page" />
				</td>
				<td nowrap>
				  <bean:write name="listInfo" property="tplaname" scope="page" />
				</td>
				<td align="center" nowrap>
				  <bean:write name="listInfo" property="jumpcate_disp" scope="page" />
				</td>
				<td nowrap>
				  <bean:write name="listInfo" property="dispparmstr" scope="page" />
				</td>
				<td align="center">
			      <bean:write name="listInfo" property="creator_disp" scope="page" />
				</td>
				<td align="center">
			      <bean:write name="listInfo" property="createdate" scope="page" />
				</td>
				<td align="center">
			      <bean:write name="listInfo" property="modifier_disp" scope="page" />
				</td>
				<td align="center">
			      <bean:write name="listInfo" property="modifydate" scope="page" />
				</td>
			  </tr>
		    </logic:iterate>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>