<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.CreditTask"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/iepngfix.js"></script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<script language="JavaScript">
		var searchseqno = "";		
	function _Click(seqno, type) {
		if(type=="cust") { // ctif_seqno
			searchseqno = "getValidateCustDisp.do?cati_seqno=" + seqno;
		} else if(type=="trans") { // rpdi_seqno
			searchseqno = "getValidateTransDisp.do?rpdi_seqno=" + seqno;
		} else if(type=="acct"){
		    searchseqno = "getValidateAcctDisp.do?atif_seqno=" + seqno;
		}else if(type=="report"){
		    searchseqno = "modifyNbs_msg.do?reportkey=" + seqno;
		}
		else {
			searchseqno = "";
		}

	}
		
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    var form1 = document.forms[0];
    var fromcase=<bean:write  name="t07_nbs_rbif" property="fromcase"  />;
    if(type=='validate'){
        if(checkRadio(form1.radioname)<0){
           	errMsg = "请选择";
        } else {
	        if(errMsg == '') {
	        	theUrl += searchseqno+"&fromcase="+fromcase;
	        }
        }
		isSub = true;
    }else if(type=='search' || type=='add'){
        isSub=true;
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

function _Submit(){
 var url='<%=(String) request.getAttribute("url")%>';
 var reported='<%=(String) request.getAttribute("reported")%>';
 if( url.indexOf('?')>0){
 url=url+"&intPage=0&reported="+reported;
 }else {
 url=url+"?intPage=0&reported="+reported;
 }

        document.forms[0].action=url;
        document.forms[0].submit();
    
}

</script>

	</head>
	<body class="mainbg">
		<html:form action="/report/nbs_base_info1.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<input type="hidden" name="reportkey"
							value="<bean:write name="t07_nbs_rbif" property="reportkey" />" />
						<input type="hidden" name="report_type" value="2" />
						<input type="hidden" name="trans_type" value="NBS" />
						<input type="hidden" name="fromcase" value="<bean:write  name="t07_nbs_rbif" property="fromcase" />" />
						<input type="hidden" name="pbc_msg_type_cd" value="<bean:write  name="pbc_msg_type_cd" />" />
						
					
							<%
								CreditTask credittask = (CreditTask) session
												.getAttribute("credittask");
			                   
										String button1Value = "";
									if(credittask!=null)
										if (credittask.getPost_id().equals("P0102")) { // 编辑岗
											button1Value = "校正";
										//}
										// else { // 审批岗
										//	button1Value = "查看";
										//}
										
							%>
						
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 
							<input type="button" name="button1" value="<%=button1Value%>"
								class="in_button1"
								onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/validate/','validate')" />&nbsp;
						<%} %>	
						<logic:present name="backurl">
						 <logic:notEmpty name="backurl">
						  <a href="#" onclick="dosubmit('<ban:write name="backurl"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>	
						 </logic:notEmpty>
						 </logic:present>	
							<input type="hidden" name="validbackurl"
								value="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do" />

						
					</div>
					<div class="cond_t2">
						<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />特征列表：</strong>
						</span>
					</div>
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0">
							
							<tr>
							<% if(!button1Value.equals("")){ %>
								<th>
									请选择
								</th>
								<%} %>
								<th>
									可疑交易特征
								</th>
								<th>
									可疑程度
								</th>
							</tr>
							<logic:iterate id="t07_nbs_rbif1" name="t07_nbs_rbifList"
							indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
							<tr>
							<% if(!button1Value.equals("")){ %>
								<td>
									<input type="radio" name="radioname"
										onclick="_Click('<bean:write name="t07_nbs_rbif1" property="reportkey"/>', 'report')" />
								</td>
								<%} %>
								
								<td>
								<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/pbcreport/validate/modifyNbs_msg.do?report_time_cd=<bean:write name="t07_nbs_rbif" property="report_time_cd" />&reportkey=<bean:write name="t07_nbs_rbif1" property="reportkey" />&closeflag=1','enter2','height=600, width=700,left=400,top=100,scrollbars=yes,resizable=yes');">
									
										<bean:write name="t07_nbs_rbif1" property="stcr" /></a>
									<html:hidden name="t07_nbs_rbif1" property="stcr" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif1" property="ssdg_disp" />
								</td>
							</tr>
							</logic:iterate>
						</table>
					</div>
				</div>
				<div class="cond_t2">
					<span class="buttons"> 
					     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />客户列表：</strong>
					</span>
				</div>
				<!-- list -->
				<div class="list">
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>	 
							<% if(!button1Value.equals("")){ %>
								<th>
									请选择
								</th>
								<%} %>
							<th>
								客户序号
							</th>
							<th>
								客户名称
							</th>
							<th>
								客户身份证件类型
							</th>
							<th>
								客户证件号码
							</th>
							<th>
								客户号
							</th>
							<th>
								验证状态
							</th>
						</tr>
						<logic:iterate id="t07_nbs_ctif" name="t07_nbs_ctifList"
							indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
							<tr>
								<% if(!button1Value.equals("")){ %>
							<td>
									<input type="radio" name="radioname"
										onclick="_Click('<bean:write name="t07_nbs_ctif" property="ctif_seqno"/>', 'cust')" />
								</td>
								<%} %>
								
								<td>
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/nbs_ctif_list.do?newsearchflag=1&report_time_cd=<bean:write name="t07_nbs_rbif" property="report_time_cd" />&reportkey=<bean:write name="t07_nbs_ctif" property="reportkey" />&ctif_seqno=<bean:write name="t07_nbs_ctif" property="ctif_seqno" />','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=yes');">
										<bean:write name="t07_nbs_ctif" property="ctif_seqno" /> </a>
								</td>
								<td>
									<bean:write name="t07_nbs_ctif" property="ctnm" />
								</td>
								<td>
									<bean:write name="t07_nbs_ctif" property="citp_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_ctif" property="ctid" />
								</td>
								<td>
									<bean:write name="t07_nbs_ctif" property="csnm" />
								</td>
								<td>
									<logic:equal name="t07_nbs_ctif" property="validate_ind"
										value="1">
										<bean:write name="t07_nbs_ctif" property="validate_ind_disp" />
									</logic:equal>
									<logic:equal name="t07_nbs_ctif" property="validate_ind"
										value="0">
										<font color="#FF0000"> <bean:write name="t07_nbs_ctif"
												property="validate_ind_disp" scope="page" /> </font>
									</logic:equal>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="cond_t2">
				    <table cellspacing="0" cellpadding="0" border="0">
						<tr>
						    <td>
								<span class="buttons"> 
								     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />账号列表：</strong>
								</span>
							 </td>
							 <td align="right">
							     <input type="button" value="更多账号" class="in_button1"
											onclick="window.open('nbs_base_infoAll.do?newsearchflag=1&report_time_cd=<bean:write name="t07_nbs_rbif" property="report_time_cd" />&reportkey=<bean:write name="t07_nbs_rbif" property="reportkey" />','enter2','height=500, width=800,left=100,top=100,scrollbars=yes,resizable=yes');" )/>
							 </td>
						</tr>
				     </table>
				</div>
				<!-- list -->
				<div class="list">
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<% if(!button1Value.equals("")){ %>
								<th>
									请选择
								</th>
								<%} %>
							<th>
								账号
							</th>
							<th>
								账号类型
							</th>
							<th>
								验证状态
							</th>
						</tr>
						<logic:iterate id="t07_nbs_atif" name="atifList" indexId="i"
							type="com.ist.aml.pbcreport.dto.T07_nbs_atif">
							<tr>
								<% if(!button1Value.equals("")){ %>
							<td>
									<input type="radio" name="radioname"
										onclick="_Click('<bean:write name="t07_nbs_atif" property="atif_seqno"/>&ctif_seqno=<bean:write name="t07_nbs_atif" property="ctif_seqno"/>', 'acct')" />
								</td>
								<%} %>
								
								<td>
									<bean:write name="t07_nbs_atif" property="ctac" />
								</td>
								<td>
									<bean:write name="t07_nbs_atif" property="catp_disp" />
								</td>
								<td>
									<logic:equal name="t07_nbs_atif" property="validate_ind"
										value="1">
										<bean:write name="t07_nbs_atif" property="validate_ind_disp" />
									</logic:equal>
									<logic:equal name="t07_nbs_atif" property="validate_ind"
										value="0">
										<font color="#FF0000"> <bean:write name="t07_nbs_atif"
												property="validate_ind_disp" scope="page" /> </font>
									</logic:equal>
								</td>
								<!-- 		<TD><bean:write name="t07_nbs_atif" property="validate_ind_disp" /></TD> -->
							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="cond_t2">
					<span class="buttons"> 
					     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />交易列表：</strong>
					</span>
				</div>
				<!-- list -->
				<div class="list">
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<% if(!button1Value.equals("")){ %>
								<th>
									请选择
								</th>
								<%} %>
							<th>
								交易序号
							</th>
							<th>
								客户名称
							</th>
							<th>
								账号
							</th>
							<th>
								交易时间
							</th>
							<th>
								交易发生地
							</th>
							<th>
								交易金额
							</th>
							<th>
								验证状态
							</th>
						</tr>
						<logic:iterate id="t07_nbs_rpdi" name="t07_nbs_rpdiList"
							indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
							<tr>	
							
							<% if(!button1Value.equals("")){ %>
								<td>
									<input type="radio" name="radioname"
										onclick="_Click('<bean:write name="t07_nbs_rpdi" property="rpdi_seqno"/>&ticd=<bean:write name="t07_nbs_rpdi" property="ticd"/>&ctif_seqno=<bean:write name="t07_nbs_rpdi" property="ctif_seqno"/>','trans')" />
								</td>
								<%} %>
							
								
								<td>
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/nbs_rpdi_detail.do?report_time_cd=<bean:write name="t07_nbs_rbif" property="report_time_cd" />&reportkey=<bean:write name="t07_nbs_rpdi" property="reportkey" />&rpdi_seqno=<bean:write name="t07_nbs_rpdi" property="rpdi_seqno" />','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=yes');">
										<bean:write name="t07_nbs_rpdi" property="rpdi_seqno" /> </a>
								</td>
								<td>
									<bean:write name="t07_nbs_rpdi" property="ctnm" />
									<bean:write name="t07_nbs_rpdi" property="cati_seqno" />
								</td>
								<td>
									<bean:write name="t07_nbs_rpdi" property="ctac" />
								</td>
								<td>
									<bean:write name="t07_nbs_rpdi" property="tstm_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_rpdi" property="trcd_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_rpdi" property="crat" />
								</td>
								<td>
									<logic:equal name="t07_nbs_rpdi" property="validate_ind"
										value="1">
										<bean:write name="t07_nbs_rpdi"
											property="validate__transind_disp" />
									</logic:equal>
									<logic:equal name="t07_nbs_rpdi" property="validate_ind"
										value="0">
										<font color="#FF0000"> <bean:write name="t07_nbs_rpdi"
												property="validate__transind_disp" scope="page" /> </font>
									</logic:equal>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				<!-- all end -->
			    <logic:notEqual name="fromcase" value="1">
			        </div>
			    </logic:notEqual>
		 </html:form>
	</body>
</html>