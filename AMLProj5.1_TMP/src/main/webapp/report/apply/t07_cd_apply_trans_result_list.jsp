<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<HTML>
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script type="text/javascript" src="../../js/jquery.js"></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
             <script type="text/javascript" src="../../js/calendar.js"></script>
             <script type="text/javascript" src="../../js/ymPrompt.js"></script>
<SCRIPT LANGUAGE="JavaScript" >
function dosubmit(theUrl,type){
	var errMsg="";
	if(type=="submit"){
		var reportkeys=document.getElementsByName("selectReportkey");
		if(reportkeys.length==0){
			errMsg="请添加报告！";
		}
	}
	if(errMsg==""){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}else{
		alert(errMsg);
		return false;
	}
}
function changetype(value){
	if(value=="A"){//操作类型：不限
		var tb = document.getElementById('tb');
		var tr;
		var td;
		for(var i=0; i<tb.getElementsByTagName("tr").length;i++)
		{
		tr = tb.getElementsByTagName("tr")[i]; 
		td = tr.childNodes[4]; 
		td.style.display ='block';
		}
	}else{
		
		var tb = document.getElementById('tb');
		var tr;
		var td;
		for(var i=0; i<tb.getElementsByTagName("tr").length;i++)
		{
		tr = tb.getElementsByTagName("tr")[i]; 
		td = tr.childNodes[4]; 
		td.style.display ='none';
		}
	}
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form method="post" action="/apply/t07_cd_apply_trans_result_list.do">
<input type="hidden" property="msg_type" value="2"/>
       <div class="conditions" >
             <div class="cond_t" >
             	<span>新增申请 - 大额</span >
                   <span class="buttons" >
                   		<a href="#" onclick="dosubmit('t07_cd_apply_add.do?msg_type=2&initflag=1')"><img src="../../images/blue/b_sus.png" />可 疑</a>
	   					<a href="#" class="makegray"><img src="../../images/blue/b_large.png" />大 额</a>
						<a href="t07_cd_apply_list.do"><img src="../../images/blue/b_back.png" />返 回</a>
                 </span>
             </div>
             <div class="cond_c" id="searchtable">
                   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                               <td> 申请编号：</td >
                               <td>
                               	<bean:write name="t07_cd_apply" property="apply_no"/>
								</td>
                          	<td></td >
                               <td></td>
								</tr>
								<tr>
								<td>操作类型：</td>
								<td>
								<html:select property="apply_type" onchange="changetype(this.value)">
										<html:options collection="apply_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
                               
								<td>机构名称：</td>
                               <td><bean:write name="t07_cd_apply" property="rinm"/></td>
                         </tr>
                   </table>
             </div>
             </div>
             <html:errors/>
             <div class="list" >
                  <table border="0" cellspacing="0" cellpadding="0" id="tb">
						<tr>
				          <th>业务标识号</th>
				          <th>客户号</th>
				          <th>交易日期</th>
				          <th>大额交易特征代码</th>
				          <th style="display:none">操作类型</th>
				          <th>原因</th>
				          <th>操作</th>
				          </tr>
				          <logic:present name="transList">
								<logic:iterate id="t07_nbh_tsdt"
									name="transList"
									type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
				          <tr>
					          <td>
				          	<a name="selectReportkey" href="#" onclick="window.open('<%=request.getContextPath() %>/pbcreport/report/ibh_tsdt_detaillist.do?closeflag=1&&pbc_msg_type_cd=N&fromcase=2&reportkey=<bean:write name='t07_nbh_tsdt' property='reportkey' />&cati_seqno=<bean:write name='t07_nbh_tsdt' property='cati_seqno' />&Crcd=<bean:write name='t07_nbh_tsdt' property='crcd' />&tsdt_seqno=<bean:write name='t07_nbh_tsdt' property='tsdt_seqno' />','enter2','height=500,width=800,left=100,top=100,scrollbars=yes,resizable=yes');">
					          	<bean:write name="t07_nbh_tsdt" property="ticd" /></a>
					          </td>
					          <td><bean:write name="t07_nbh_tsdt" property="party_id"  /></td>
					          <td><bean:write name="t07_nbh_tsdt" property="tstm_disp" /></td>
					          <td><bean:write name="t07_nbh_tsdt" property="crcd" /></td>
					          <td style="display:none">
					          		<html:select name="t07_nbh_tsdt" property="validate_ind">
										<html:options collection="apply_typeMap1" property="label"
											labelProperty="value" />
									</html:select></td>
					          <td><a href="#" onclick="ymPrompt.win({message:'t07_cd_apply_reason.do?msg_type=1&reportkey=<bean:write name='t07_nbh_tsdt' property='reportkey' /><bean:write name='t07_nbh_tsdt' property='cati_seqno' /><bean:write name='t07_nbh_tsdt' property='crcd' /><bean:write name='t07_nbh_tsdt' property='tsdt_seqno' />',width:600,height:200,title:'原因',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
          							<img src="../../images/blue/b_edit.png" title="原因" /></a></td>
				          	<td><a href="#" onclick="dosubmit('t07_cd_apply_item_delete.do?msg_type=1&reportkey=<bean:write name='t07_nbh_tsdt' property='reportkey' /><bean:write name='t07_nbh_tsdt' property='cati_seqno' /><bean:write name='t07_nbh_tsdt' property='crcd' /><bean:write name='t07_nbh_tsdt' property='tsdt_seqno' />','delete')" title="删除"><img src="../../images/blue/b_delete.png" /></td>
				          </tr>
				          </logic:iterate>
				          </logic:present>
				          </table>
             </div>
             
				<table align="right">
	     	  <tr>
				<td class="in_button"  align="right">
					<input  type="button" value="添加" onclick="dosubmit('t07_cd_apply_add.do?msg_type=1','add')"/>
					<input  type="button" value="完成" onclick="dosubmit('t07_cd_apply_trans_add_do.do','submit')"/>		
				</td>
	   			</tr>
	   			   		
	 		</table>
</html:form>
</div>
</BODY>
</HTML>
