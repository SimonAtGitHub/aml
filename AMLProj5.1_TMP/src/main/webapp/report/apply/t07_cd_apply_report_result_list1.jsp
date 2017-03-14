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
function loadApply_type(){
	var applytype=document.forms[0].apply_type.value;
	changetype(applytype);
	
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" onload="loadApply_type()">
<div id="main">
<html:form method="post" action="/apply/t07_cd_apply_add.do">
<input type="hidden" property="msg_type" value="2"/>
       <div class="conditions" >
             <div class="cond_t" >
             	<span>逾期申请修改</span >
                   <span class="buttons" >
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
                          		<td>报告类型：</td >
                               <td><bean:write name="t07_cd_apply" property="msg_type_disp"/></td>
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
                         	<tr>
                         	<td>创建人：</td>
                         	<td><bean:write name="t07_cd_apply" property="create_user"/></td>
                         	<td>填表日期：</td>
                         	<td><bean:write name="t07_cd_apply" property="create_dt_disp"/></td>
                         	</tr>
                   </table>
             </div>
             </div>
             <html:errors/>
             <div class="list" >
                  <table border="0" cellspacing="0" cellpadding="0" id="tb">
						<tr>
				          <th>报告名称</th>
				          <th>金融机构名称</th>
				          <th>可疑交易总笔数</th>
				          <th>报告生成日期</th>
				          <th style="display:none">操作类型</th>
				          <th>原因</th>
				          <th>操作</th>
				          </tr>
				          <logic:present name="reportList">
								<logic:iterate id="t07_report"
									name="reportList"
									type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
				          <tr>
					          <td>
					          	<a name="selectReportkey" href="#" onclick="window.open('t07_report_detail.do?flag=no&casesearchtime=1&reportkey=<bean:write name="t07_report" property="reportkey"/>','enter2','height=500,width=800,left=100,top=100,scrollbars=yes,resizable=yes');">
					          	<bean:write name="t07_report" property="reportkey" /></a>
					          </td>
					          <td><bean:write name="t07_report" property="finm" /></td>
					          <td><bean:write name="t07_report" property="ttnm" /></td>
					          <td><bean:write name="t07_report" property="rpdt_disp" /></td>
					          <td style="display:none">
					          		<html:select name="t07_report" property="validate_ind">
										<html:options collection="apply_typeMap1" property="label"
											labelProperty="value" />
									</html:select></td>
					          <td><a href="#" onclick="ymPrompt.win({message:'t07_cd_apply_reason.do?msg_type=2&reportkey=<bean:write name="t07_report" property="reportkey"/>',width:600,height:200,title:'原因',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
          							<img src="../../images/blue/b_edit.png" title="原因" /></a></td>
				          	<td><a href="#" onclick="dosubmit('t07_cd_apply_item_delete.do?msg_type=2&reportkey=<bean:write name="t07_report" property="reportkey" />&modflag=1','delete')" title="删除"><img src="../../images/blue/b_delete.png" /></td>
				          </tr>
				          </logic:iterate>
				          </logic:present>
				          </table>
             </div>
             
				<table align="right">
	     	  <tr>
				<td class="in_button"  align="right">
					<input  type="button" value="添加" onclick="dosubmit('t07_cd_apply_add.do?msg_type=2&modflag=1','add')"/>
					<input  type="button" value="完成" onclick="dosubmit('t07_cd_apply_report_add_do.do?modflag=1','submit')"/>		
				</td>
	   			</tr>
	   			   		
	 		</table>
</html:form>
</div>
</BODY>
</HTML>
