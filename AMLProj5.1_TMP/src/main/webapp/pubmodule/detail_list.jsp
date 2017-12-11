<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../js/basefunc.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
	
<script language="JavaScript">
function _Open(url){
    url=url+"&newsearchflag=1&msg_type="+document.forms[0].msg_type.value;
   //window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  window.open(url);     
}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</script>
	</head>
	<body class="mainbg">
<html:form action="/detail_list.do" method="post">
<input type="hidden" name="organlevel" value="<bean:write name="organlevel"/>"/>
<input type="hidden" name="msg_type" value="<bean:write name="msg_type"/>"/>
<input type="hidden" name="organkey" value="<bean:write name="organkey"/>"/>
<input type="hidden" name="post_id" value="<bean:write name="post_id"/>"/>
<input type="hidden" name="create_dt" value="<bean:write name="create_dt"/>"/>
  <html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions" id="searchtable">
    <!-- title -->
	<div class="cond_t">
	  <span>任务详细信息</span>
	  <span class="buttons">

	   <a href="#" onclick="window.close()"><img src="../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
	 
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c">
	  <table border="0" cellpadding="0" cellspacing="0">
	    <tr>
      <td>
        机构号：
        </td>
        <td>
        <html:text property="msg_org"  size="10" maxlength="12"/>
        </td>
        <td>
        机构名称：
        </td>
        <td>
        <html:text property="msg_org_name" />
	    <html:button property="s1" value="查  询" styleClass="in_button1" onclick="dosubmit('detail_list.do?newsearchflag=1')"/>
       </td>
    </tr>
    </table>
	</div>
  </div>
  <!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>序号</th>
		<th>日期</th>
	    <th>机构号</th>
		<th>机构名称</th>
		<th>数量</th>
		<th>未处理</th>
	  </tr>
	  <% 
	  String  maxorganlevel=(String)request.getAttribute("maxorganlevel");
	  maxorganlevel=maxorganlevel.substring(1,maxorganlevel.length()-1);
	     %>
	  <logic:iterate id="supervise" name="superList" indexId="i"
					type="com.ist.aml.information.dto.T07_Supervise_msg">
					<%String  organlevel=supervise.getOrganlevel();
					String currlevel="";
					if(!organlevel.equals(maxorganlevel))
					{
				
						currlevel=String.valueOf(Integer.parseInt(organlevel)+1);
					}
					else
					{
						currlevel=organlevel;
					}
					%>
					<tr>
						<td >
							<%=i.intValue()+1%>
						</td>
						<td>
							<bean:write name="supervise" property="create_dt" scope="page" />
						</td>
							<td>
							<bean:write name="supervise" property="organkey" scope="page" />
						</td>
						<td>
						<%if(!maxorganlevel.equals(organlevel)){ %>
						
							<a href="#" onclick="_Open('detail_list.do?organlevel=<%=currlevel%>&post_id=<bean:write name="supervise" property="post_id"/>&create_dt=<bean:write name="supervise" property="create_dt"/>&organkey=<bean:write name="supervise" property="organkey"/>')">
								<bean:write name="supervise" property="msg_org_name" scope="page" />
							</a>	
					    <%}else{ %>	
						<bean:write name="supervise" property="msg_org_name" scope="page" />
						<%} %>
						</td>
					
						<td>
							<bean:write name="supervise" property="total_num" scope="page" />
						</td>
						<td>
							<bean:write name="supervise" property="nooper_num" scope="page" />
						</td>
					</tr>
				</logic:iterate>
   </table>
  </div>		
	
	<!-- list_page --> 
  <div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
    </div>
<!-- all end -->   
</div>
		</html:form>
</body>
</html>
