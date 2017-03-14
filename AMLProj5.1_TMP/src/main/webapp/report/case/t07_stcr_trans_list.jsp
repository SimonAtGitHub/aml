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
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			
			String basefuncurl = url + "/js/basefunc.js";
			
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		
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

function _Open1(url){

    window.open(url,'tranadviadd','height=280,width=600,left=300,top=200,scrollbars=yes, resizable=yes');
    //window.open(url);
}

var jq = jQuery.noConflict();
jq(document).ready(function(){
	 jq('#trans_table a[name=pop]').click(function(){
		 jq('#data_table a[name=pop]').attr('id','');
		 jq(this).attr('id','1');
		 jq('input[id=btnID]').val(jq(this).attr('id'))
			});
		});
</script>
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/stcr_trans_list.do">
		<input type="hidden"  id="check_flag" value="uncheck"/>
		<input type="hidden" id="btnID"/>
			<!-- <div class="cond_t2">
				<span class="buttons"> 
				   <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />特征交易信息</strong> 
				</span>
			</div> -->
			<!-- 大选项卡（2）**b.特征交易信息2**内容 -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" id="trans_table">
					<tr>
						<th>
							流水号
						</th>
						<th>
							客户号
						</th>
						<th>
							客户名称
						</th>
						<th>
							交易日期
						</th>
						<th>
							交易机构
						</th>
						<th>
							帐户
						</th>
						<th>
							交易对手名称
						</th>
						<th>
							币种
						</th>
						<th>
							交易金额
						</th>
						<!--<th>
							资金来源或用途
						</th>  -->
						<th>
							借/贷
						</th>
						<th>
							现/转
						</th>
						<th>
							状态
						</th>
						<logic:equal name="t07_case_application" property="post_id" value="P0102">
						<logic:equal name="t07_case_application" property="cast_type" value="2">
						<logic:empty name="no_oper" scope="request">
							<th>
								操作
							</th>
						</logic:empty>
						</logic:equal>
						</logic:equal>
						<logic:equal name="t07_case_application" property="post_id" value="P0302">
						<logic:equal name="t07_case_application" property="cast_type" value="2">
						<logic:empty name="no_oper" scope="request">
							<th>
								操作
							</th>
						</logic:empty>
						</logic:equal>
						</logic:equal>
						<th>
							验证状态
						</th>
					</tr>
					<logic:iterate id="trans" name="t07_stcr_transList"
						type="com.ist.aml.report.dto.T47_transaction" indexId="number">
					<%
						String id = trans.getParty_id();
						if(id.contains("#"))
							id = id.replace("#","%23");
					%>
						<tr>
							<td>
								<a href="#"
									onclick="_open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=trans.getTransactionkey()%>');return false">
									<bean:write name="trans" property="tx_no" scope="page" />
								</a>
							</td>
							<td>
								<bean:write name="trans" property="party_id" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="party_chn_name" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="tx_dt_disp" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="organkey" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="acct_num" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="opp_name" scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="currency_cd_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="amt_disp" scope="page" />
							</td>
							<!--<td>
								<bean:write name="trans" property="use_des" scope="page" />
							</td>-->
							<td>
								<bean:write name="trans" property="debit_credit_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="cash_trans_flag_disp"
									scope="page" />
							</td>
							<td>
								<bean:write name="trans" property="status_cd_disp" scope="page" />
							</td>
						<!--  <bean:write name="t07_case_application" property="post_id" />
							<bean:write name="t07_case_application" property="cast_type" />
						-->		
							
							<logic:equal name="t07_case_application" property="post_id" value="P0102">
							<logic:equal name="t07_case_application" property="cast_type" value="2">
							<logic:empty name="no_oper" scope="request">
								<td>
									<logic:notEmpty name="trans" property="status_cd_disp">
										<logic:equal name="trans" property="status_cd_disp" value="已排除">
											<!--  <a href="#" id='a<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=1',this,1);return false"
												style="display: none">排除</a>
											<a href="#" id='b<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=2',this,2);return false">恢复</a>
										    -->
										    <a href="#" name="pop"
												onclick="_Open1('addt07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&party_id=<%=id %>&acct_num=<bean:write property="acct_num" name="trans" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&val2=<bean:write name="trans" property="validate_ind2"/>&flag=2')">恢复</a>
										     	  
										</logic:equal>
										<logic:notEqual name="trans" property="status_cd_disp" value="已排除">
											<!-- <a href="#" id='a<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=1',this,1);return false">排除</a>
											<a href="#" id='b<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=2',this,2);return false"
												style="display: none">恢复</a> -->
											 <a href="#" name="pop"
												onclick="_Open1('addt07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&party_id=<%=id %>&acct_num=<bean:write property="acct_num" name="trans" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&flag=1')">排除</a>
										    <!--  <a href="#" id='b<bean:write name="number"/>' onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/addt07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=1',width:580,height:360,title:'排除',handler:handler,iframe:true,fixPosition:true,dragOut:false});">排除</a>
				                                 -->
												
										</logic:notEqual>
									</logic:notEmpty>
								</td>
								</logic:empty>
						    </logic:equal>
							</logic:equal>
							<logic:equal name="t07_case_application" property="post_id" value="P0302">
							<logic:equal name="t07_case_application" property="cast_type" value="2">
							<logic:empty name="no_oper" scope="request">
								<td>
									<logic:notEmpty name="trans" property="status_cd_disp">
										<logic:equal name="trans" property="status_cd_disp" value="已排除">
											<!--  
											<a href="#" id='a<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=1',this,1);return false"
												style="display: none">排除</a>
											<a href="#" id='b<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=2',this,2);return false">恢复</a>
										     -->
										     <a href="#" name="pop"
												onclick="_Open1('addt07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&val2=<bean:write name="trans" property="validate_ind2"/>&flag=2')">恢复</a>
										     
										</logic:equal>
										<logic:notEqual name="trans" property="status_cd_disp" value="已排除">
											<!-- <a href="#" id='a<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=1',this,1);return false">排除</a>
											<a href="#" id='b<bean:write name="number"/>'
												onclick="onsubmit1('t07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&party_id=<bean:write property="party_id" name="t07_case_stcr" />&flag=2',this,2);return false"
												style="display: none">恢复</a>
												  -->
											  <a href="#" name="pop"
												onclick="_Open1('addt07_stcr_trans_advi.do?application_num=<bean:write property="application_num" name="t07_case_stcr" />&stcr=<bean:write property="stcr" name="t07_case_stcr" />&transactionkey=<bean:write name="trans" property="transactionkey"/>&flag=1')">排除</a>
										     	  
										</logic:notEqual>
									</logic:notEmpty>
								</td>
								</logic:empty>
						    </logic:equal>
							</logic:equal>
							<td>
								<logic:notEmpty name="trans" property="status_cd_disp">  
									<logic:notEqual name="trans" property="status_cd_disp" value="已排除">  
									    <span id="ind<bean:write name="number"/>">
										<!-- 大额 -->
										<logic:equal name="t07_case_application" property="cast_type" value="1">
											<logic:equal name="trans" property="validate_ind" value="1">
												<img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />
											</logic:equal>
											<logic:notEqual name="trans" property="validate_ind" value="1">
												<font color="red"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" /></font>
											</logic:notEqual>
										</logic:equal>
										<!-- 可疑 -->
										<logic:equal name="t07_case_application" property="cast_type" value="2">
											<logic:equal name="trans" property="validate_ind2" value="1">
												<img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />
											</logic:equal>
											<logic:notEqual name="trans" property="validate_ind2" value="1">
												<font color="red"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" /></font>
											</logic:notEqual>
										</logic:equal>
										</span>
									</logic:notEqual>
									<logic:equal name="trans" property="status_cd_disp" value="已排除">  
									    <span id="ind<bean:write name="number"/>" style="display:none">
										<!-- 大额 -->
										<logic:equal name="t07_case_application" property="cast_type" value="1">
											<logic:equal name="trans" property="validate_ind" value="1">
												<img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />
											</logic:equal>
											<logic:notEqual name="trans" property="validate_ind" value="1">
												<font color="red"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" /></font>
											</logic:notEqual>
										</logic:equal>
										<!-- 可疑 -->
										
										<logic:equal name="t07_case_application" property="cast_type" value="2">
											<logic:equal name="trans" property="validate_ind2" value="1">
												<img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />
											</logic:equal>
											<logic:notEqual name="trans" property="validate_ind2" value="1">
												<font color="red"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" /></font>
											</logic:notEqual>
										</logic:equal>
										</span>
									</logic:equal>
								</logic:notEmpty>
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
	<SCRIPT LANGUAGE="JavaScript">
      parent.document.all("trans").style.height=document.body.scrollHeight+5;  
		</script>
</html>