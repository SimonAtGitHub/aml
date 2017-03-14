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
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl,type){
   if(type=='del'){
            if(checkRadio(document.forms[0].assitno)<0){
                alert( "请选择！");
                return false;
              }
            if(document.forms[0].status.value=="1"){
              alert("该记录已处理不能删除！");
              return false;
            }
     }
   
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}
function _Click(status){
//alert(status);
document.forms[0].status.value=status;
}
function aa(){
    window.parent.document.getElementById("maskLevel").style.zIndex="-20000";
    window.parent.document.getElementById("ym-window").style.zIndex="-10000";
    window.parent.ymPrompt.close();   
}
</script>
	</head>
	<body id="iframecontent">
		<html:form action="/checkcase/checkcase_list.do" method="post">
		    <input type="hidden" name="status" value=""/>
			<logic:equal value="P0102" name="post_id">
				<div class="cond_t2">
					<span>案例协查</span>
					<span class="buttons">
						<a href="#" onclick="dosubmit('addT07_case_Assis.do','add');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_inves.png" />发起协查
					    </a>
					    <a href="#" onclick="dosubmit('delT07_case_AssisDo.do','del');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除
					    </a>
					    <a href="#" onclick="aa();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
					    <input type="hidden" name="application_num" value="<bean:write name="application_num"/>" />
                        <input type="hidden" name="party_id" value="<bean:write name="party_id"/>" />
					</span>
				</div>
			</logic:equal>
			<logic:equal value="P0302" name="post_id">
				<div class="cond_t2">
					<span class="buttons"> 
					    <a href="#" onclick="dosubmit('addT07_case_Assis.do','add');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_inves.png" />发起协查
					    </a> 
					    <a href="#" onclick="dosubmit('delT07_case_AssisDo.do','del');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除
					    </a>
					    <a href="#" onclick="aa();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
					    <input type="hidden" name="application_num" value="<bean:write name="application_num"/>" />
                        <input type="hidden" name="party_id" value="<bean:write name="party_id"/>" />
					</span>
				</div>
			</logic:equal>
			  <html:errors/>
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" style="width:1000px">
					<tr>
						<logic:equal value="P0102" name="post_id">
							<th>
								请选择
							</th>
						</logic:equal>
						<th>
							案例编号
						</th>
						<th>
							请求机构
						</th>
						<th>
							请求时间
						</th>
						<th >
							协查原因
						</th>
						<th>
							协查机构
						</th>
						<th>
							协查用户
						</th>
						<th>
							协查报告
						</th>
						<th>
							协查完成时间
						</th>
						<th>
							协查状态
						</th>
					</tr>
					<logic:iterate id="assit" name="t07_case_AssistList" type="com.ist.aml.report.dto.T07_case_Assist">
						<tr>
							<logic:equal value="P0102" name="post_id">
								<td>
									<!--<html:radio property="assitno" idName="assit" value="assitno"
										onclick="_Click(<%= assit.getStatus() %>)"></html:radio>-->
								    <input type="radio" name="assitno" value="<bean:write name="assit" property="assitno"/>" onclick="_Click(<%=assit.getStatus()%>)" />
								</td>
							</logic:equal>
							<td>
								<bean:write name="assit" property="application_num" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="req_orgname" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="req_time_disp" scope="page" />
							</td>
							<td style="width:200px;white-space: normal"> 
								<bean:write name="assit" property="reasons" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="deal_orgname" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="deal_username" scope="page" />
							</td>
							<td  style="width:200px;white-space: normal"> 
								<bean:write name="assit" property="handlereport" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="deal_time_disp" scope="page" />
							</td>
							<td>
								<bean:write name="assit" property="status_disp" scope="page" />
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
