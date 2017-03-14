<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
  <head>
    <META http-equiv=Content-Type content="text/html; charset=gbk">
    
    <META content="MSHTML 6.00.2600.0" name=GENERATOR>
    <title><c:out value="${titleStr}" escapeXml="false"></c:out>_行列转换_定位页面</title>
   <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
   
    <script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    
    <script LANGUAGE="JavaScript">
		function tplaSelect(areatype) {
			var checkbox = document.forms[0].selectedOutcolkey;
		  	if (!checkbox.length) {
		  		checkbox = new Array(checkbox);
		  	}

        	for (var i=0; i < checkbox.length; i++) {
        		var oCheck = checkbox[i];
            	//如果被选中则处理
           		var array_value = oCheck.value.split(",");
              	var rename = array_value[1];

              	if (oCheck.checked) {
                  	if (areatype == '1') {
	                    opener.setSelectOption("colAreaSelect",oCheck.value,array_value[1]);
	                } else if (areatype == '2') {
	                    opener.setSelectOption("rowAreaSelect",oCheck.value,array_value[1]);
	                } else if (areatype == '3') {
	                	var colNames = document.getElementsByName("colname");
	                    var selTypes = document.getElementsByName("rsltdisptype");

	                    if (trim(colNames[i].value).length != 0) {
	                        rename = colNames[i].value;
	                    }

	                    var dataAreaValue = oCheck.value+","+rename+","+selTypes[i].value;
	                    var dispColumnName = dataAreaValue.split(",")[5];
	                    opener.setSelectOption("dataAreaSelect",dataAreaValue,dispColumnName);
	                }
	           }
         }
         window.close();
      }
    </script>
    <% request.setAttribute("areaTypeStr", request.getParameter("areatype")); %>
  </head>
  <body leftmargin="0" topmargin="0">
    <div id='content'>
      <form method="post" action="">
      	<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${titleStr}" escapeXml="false"></c:out>_行列转换_定位页面</span></td>
						<td align="right">
							<logic:notEmpty name="t02_tp_exec_rstList">
                 <input type=button value="选 定" name="btnTplaSelect"  onClick="tplaSelect('<%=request.getParameter("areatype")%>')">
              </logic:notEmpty>
                 <input type='button' value='关 闭' onClick="window.close();">				                  </td>
					</tr>
				</table>
			</div> 
      	
       
        <html:messages id="errors" message="true">
          <bean:write name="errors" filter="fasle" />
        </html:messages>
        <div class="awp_list">
         <table>
          <tr> 
            <td>
              <input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)"></td>
            <td>列中文名称</td> 
            <td>列英文名称</td>
            <c:choose>
              <c:when test="${areaTypeStr == '3'}">
                <td>重命名</td>
                <td>统计方式</td>
              </c:when>
            </c:choose>
          </tr>
          <logic:notEmpty name="t02_tp_exec_rstList">
          	<logic:iterate id="binfo" name="t02_tp_exec_rstList"  type="com.ist.avp.template.dto.T02_tp_exec_rst">
	            <tr align="center" id='id_<bean:write name="binfo" property="dispcolkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="dispcolkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="dispcolkey" />')>
	              <td height='22' nowrap>
	                <html:multibox name="binfo" property="selectedOutcolkey">    
	                  <bean:write name="binfo" property="dispcolkey" />,<bean:write name="binfo" property="outcolname" />,<bean:write name="binfo" property="colaliascd"/>,<bean:write name="binfo" property="coldatatype"/>,<bean:write name="binfo" property="dispstyle"/>
	                </html:multibox>
	              </td>
	              <td align="left"><bean:write name="binfo" property="outcolname" /></td> 
	              <td align="left"><bean:write name="binfo" property="colaliascd"/></td>
	              <!--  <td align="left"><bean:write name="binfo" property="coldatatype"/></td>-->
	              <c:choose>
	                <c:when test="${areaTypeStr == '3'}">
	                  <td align="center">
	                    <input type="text" name="colname" value="<bean:write name="binfo" property="outcolname" />" size="20"/>
	                  </td>
	                  <td>
	                    <select name="rsltdisptype">
	                      <c:forEach var="disp_col" items="${resultMap}">
	                        <option value='<c:out value="${disp_col.key}"/>'>
	                          <c:out value="${disp_col.value}"/>
	                        </option>
	                      </c:forEach>
	                    </select>
	                  </td>
	                </c:when>
	              </c:choose>
	            </tr>
	          </logic:iterate>
          </logic:notEmpty>
         </table>
        </div>
      </form>
    </div>
  </body>
</html>