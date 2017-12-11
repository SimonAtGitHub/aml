<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
		
		function dosubmit(theUrl,type){
		
		    var errMsg = "";
		    var isSub = false;
		    if(type == 'add'){
		    	isSub = true;
		    }
		    if(type == 'modi'){
		    	errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
		    	isSub = true;

		    	var sel_check = document.getElementsByName('selecttkeys');
		    	for(var i=0; i<sel_check.length; i++){
					if(sel_check[i].checked){
						var tkey = sel_check[i].value;
						if(tkey.indexOf("P") == 0){
							theUrl = "t02_tp_report_modify.do";
						} else if (tkey.indexOf("C") == 0){
							theUrl = "t02_tp_chart_modify.do";
						} else if (tkey.indexOf("S") == 0){
							theUrl = "t02_tp_stat_modify.do";
						}
					}
			    }
			}
		    if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		    	if(!errMsg &&　confirm('你真的要删除吗？')){
		            isSub = true;
		        }
		    }
		    if(type=='search'){
		        if(errMsg==''){
					isSub = true;
		        }
		    }
		    if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}
		</SCRIPT>


</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
<html:form method="post" action="/template/t02_tp_manager_list.do">
<html:hidden property="tplakey"/>
 <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">数据展现管理 - 列表</span>
						</td>
						<td align="right">
							<input type="button" name="Button1" value="新建报表" onclick="dosubmit('t02_tp_report_add.do','add')" class="input">
							<input type="button" name="Button2" value="新建图形" onclick="dosubmit('t02_tp_chart_add.do','add')" class="input">
							<input type="button" name="Button3" value="新建统计" onclick="dosubmit('t02_tp_stat_add.do','add')" class="input">
							<input type="button" name="Button4" value="修 改" onclick="dosubmit('','modi')" class="input">
							<input type="button" name="Button5" value="删 除" onclick="dosubmit('delete_t02_tp_manager.do','del')" class="input">
						</td>
					</tr>
				</table>
			</div>   
 
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
 
   
<div class="awp_list">
  <TABLE>
    <TR > 
       <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
      <TD align="center" nowrap width="48%">名称</TD> 
      <TD nowrap width="48%">展示类型</TD>
    </TR>


	<logic:iterate id="binfo" name="tp_mlist"  type="com.ist.avp.template.dto.T02_tp_manager">
    <TR align="center">
       <TD  nowrap>
           <input type="checkbox" name="selecttkeys" value="<bean:write name="binfo" property="tkey" />" />
		</TD>
		<TD  nowrap>
			<bean:write name="binfo" property="tname" />
		</TD>
		<TD  nowrap>
			<bean:write name="binfo" property="ttypename" />
		</TD>
    </TR>
    </logic:iterate>
  </TABLE>
</div> 
</html:form>
</div>
</BODY>
</html:html>
