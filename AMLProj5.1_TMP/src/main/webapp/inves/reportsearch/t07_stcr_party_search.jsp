<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>

		<script language="JavaScript">
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}
function onsubmit1(url,r,f){
    if(f == '1'){
	    if(confirm("您确定排除吗？")){
	        document.forms[0].action=url;
		    document.forms[0].submit();
		    
		    /**var i = r.parentNode.parentNode.rowIndex;
		    alert(i);
		    document.getElementById("trans_table").rows(i).cells[12].innerHTML='已排除';
		    var j = i - 2;
            document.getElementById('a'+j).style.display='none';
            document.getElementById('b'+j).style.display='';
            return false;**/
	    }else{
	        return;
	    }
    }else if(f == '2'){
        if(confirm("您确定恢复吗？")){
	        document.forms[0].action=url;
		    document.forms[0].submit();
		   
		    /**var i = r.parentNode.parentNode.rowIndex;
		    alert(i);
		    document.getElementById("trans_table").rows(i).cells[12].innerHTML='处理中';
		    var j = i - 2;
            document.getElementById('a'+j).style.display='';
            document.getElementById('b'+j).style.display='none';**/
            
		    var alert_table = parent.document.getElementById("alert_table");
		    var alertnum = alert_table.rows.length;
            for(var i=1;i<alertnum;i++){
               if(alert_table.rows(i).cells[0].childNodes[0].checked){
                   var inneralert = alert_table.rows(i).cells[4].innerHTML;
                   inneralert = inneralert.replace(" ","");
                   if(inneralert == "已排除"){
                       alert_table.rows(i).cells[4].innerHTML = "处理中";
                       var k = i - 1;
                       parent.document.getElementById('a'+k).style.display='none';
	                   parent.document.getElementById('b'+k).style.display='';
                       break;
                   }
               }
            }
            /**var case_table = parent.document.getElementById("case_table");
            var innercase = case_table.rows(1).cells[1].innerHTML;
            innercase = innercase.replace(" ","");
            if(innercase == "排除"){
                case_table.rows(1).cells[1].innerHTML = "正常";
            }**/
		    <%--<% String caseflag = (String)request.getAttribute("caseflag");%>
              if(caseflag == "1"){%>
		       var alert_table = parent.document.getElementById("alert_table");
		       alert(alert_table.rows.length);
		  <% }%>--%>
	    }else{
	        return;
	    }
    }
}
</script>
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/stcr_party_search.do">
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" id="trans_table">
					<tr>
						<th>
							客户号
						</th>
						<th>
							客户名称
						</th>
						<th>
						           客户类型
						</th>
						<th>
							证件号码
						</th>
						<th>
							状态
						</th>
					</tr>
					<logic:iterate id="party" name="t07_stcr_partyList"
						type="com.ist.aml.report.dto.T47_party" indexId="number">
					<%
						String id = party.getParty_id();
						if(id.contains("#"))
							id = id.replace("#","%23");
					%>
						<tr>
							<td>
							<a href="#"
									onclick="_open('../../report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party" property="party_class_cd"/>');return false">
								<bean:write name="party" property="party_id" scope="page" />
							</a>
							</td>
							<td>
								<bean:write name="party" property="party_chn_name" scope="page" />
							</td>
							<td>
								<bean:write name="party" property="party_class_cd_disp" scope="page" />
							</td>
							<td>
								<bean:write name="party" property="card_no" scope="page" />
							</td>
							<td>
								<bean:write name="party" property="party_status_disp" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	</body>
</html>