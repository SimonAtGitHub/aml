<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.util.StringUtils"%>
<%@ page import="com.ist.aml.risk.dto.T08_def_basic"%>
<%@ page import="com.ist.aml.risk.dto.T08_def_cat"%>
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
	
		<script language="JavaScript" src="../../js/basefunc.js"></script>
	

		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkID(numstr){
var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='X'&& TempChar!='x'&& TempChar!='-'){
           i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
function checkForm(theUrl){
   
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
    
}

function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}

function _Click(){
     var Index=document.forms[0].opp_area_id.selectedIndex;
    
    if(Index!="0"){
      document.forms[0].opp_area.value=document.forms[0].opp_area_id.options[Index].text
      document.forms[0].opp_area.disabled=true;
    }else{
       document.forms[0].opp_area.disabled=false;
       document.forms[0].opp_area.value="";
    }
}
</script>
	</head>

	<body id="iframecontent">
		<html:form method="post" action="/case/result_disp1.do">
			<html:hidden property="resulekey" />
			<html:errors />
			<logic:notEmpty name="t08_party_resultActionForm" property="party_chn_name">
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								客户名称：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="party_chn_name" />
							</td>
							<td>
								系统评级时间：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="appradate_disp" />
							</td>
						</tr>
						<tr>
							<td>
								客户类型：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="party_calss_cd_s" />
							</td>
							<td>
								系统评级结果：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="fristappralevel" />
							</td>
						</tr>
						<tr>
							<td>
								评级模板名称：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="template_name" />
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
					</table>
				</div>
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<div class="list2">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<th colspan="5">
								类别信息
							</th>
						</tr>
						<tr>
							<td class="st03" colspan="2">
								类别名称
							</td>
							<td class="st03">
								评分
							</td>
							<td class="st03">
								权重
							</td>
							<td class="st03">
								总得分
							</td>
						</tr>
						<logic:present name="t08_def_catList">
							<%HashMap catMap=(HashMap)request.getAttribute("catListMap"); %>
							<%ArrayList catList=(ArrayList)catMap.get("-1");
							if(catList!=null && catList.size()>0){
							request.setAttribute("catList",catList); %>
							<tr>
								<td rowspan="<%=catList.size()%>">
									<bean:write name="t08_party_resultActionForm" property="template_name" />
								</td>
								<%T08_def_cat t08_def_cat1=(T08_def_cat)catList.get(0); %>
								<td>
									<%=t08_def_cat1.getOperationame() %>
								</td>
								<td>
									<%=t08_def_cat1.getScore() %>
								</td>
								<td>
									<%=t08_def_cat1.getOcc() %>
								</td>
								<td rowspan="<%=catList.size()%>">
									<bean:write name="t08_party_resultActionForm" property="fristappragrade" />
								</td>
							</tr>
							<logic:iterate id="def_cat" name="catList" indexId="index" type="com.ist.aml.risk.dto.T08_def_cat">
								<%if(index.intValue()!=0){ %>
								<tr>
									<td>
										<bean:write name="def_cat" property="operationame" />
									</td>
									<td>
										<bean:write name="def_cat" property="score" />
									</td>
									<td>
										<bean:write name="def_cat" property="occ" />
									</td>
								</tr>
								<%} %>
							</logic:iterate>
							<%} %>

							<logic:iterate id="t08_def_cat" name="t08_def_catList"
								type="com.ist.aml.risk.dto.T08_def_cat">
								<%catList=(ArrayList)catMap.get(t08_def_cat.getCategorykey()); 
								if(catList!=null && catList.size()>0){
								request.setAttribute("catList",catList);%>
								<tr>
									<%T08_def_cat t08_def_cat1=(T08_def_cat)catList.get(0); %>
									<td rowspan="<%=catList.size()%>">
										<%=t08_def_cat.getOperationame() %>
									</td>
									<td>
										<%=t08_def_cat1.getOperationame() %>
									</td>
									<td>
										<%=t08_def_cat1.getScore() %>
									</td>
									<td>
										<%=t08_def_cat1.getOcc() %>
									</td>
									<td rowspan="<%=catList.size()%>">
										<%=t08_def_cat.getScore() %>
									</td>
								</tr>
								<logic:iterate id="def_cat" name="catList" indexId="index" type="com.ist.aml.risk.dto.T08_def_cat">
									<%if(index.intValue()!=0){ %>
									<tr>
										<td>
											<bean:write name="def_cat" property="operationame" />
										</td>
										<td>
											<bean:write name="def_cat" property="score" />
										</td>
										<td>
											<bean:write name="def_cat" property="occ" />
										</td>
									</tr>
									<%} %>
								</logic:iterate>
								<%}else{ 
								HashMap basicMap=(HashMap)request.getAttribute("basicListMap");
								ArrayList basicList=(ArrayList)basicMap.get(t08_def_cat.getCategorykey());
								if(basicList!=null && basicList.size()>0){
								request.setAttribute("basicList",basicList);
								%>
								<tr>
									<%T08_def_basic t08_def_basic1=(T08_def_basic)basicList.get(0); %>
									<td rowspan="<%=basicList.size()%>">
										<%=t08_def_cat.getOperationame() %>
									</td>
									<td>
										<%=t08_def_basic1.getBasicname() %>
									</td>
									<td>
										<%=t08_def_basic1.getScore() %>
									</td>
									<td>
										<%=t08_def_basic1.getBasicocc() %>
									</td>
									<td rowspan="<%=basicList.size()%>">
										<%=t08_def_cat.getScore() %>
									</td>
								</tr>
								<logic:iterate id="def_basic" name="basicList" indexId="index" type="com.ist.aml.risk.dto.T08_def_basic">
									<%if(index.intValue()!=0){ %>
									<tr>
										<td>
											<bean:write name="def_basic" property="basicname" />
										</td>
										<td>
											<bean:write name="def_basic" property="score" />
										</td>
										<td>
											<bean:write name="def_basic" property="basicocc" />
										</td>
									</tr>
									<%} %>
								</logic:iterate>
								<% }
								  }
								%>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<div class="list2">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<th colspan="5">
								要素信息
							</th>
						</tr>
						<tr>
							<td class="st03">
								要素名称
							</td>
							<td class="st03">
								基准值
							</td>
							<td class="st03">
								要素结果
							</td>
							<td class="st03">
								要素标准分值
							</td>
							<td class="st03">
								权重
							</td>
						</tr>
						<logic:present name="t08_def_basicList">
							<logic:iterate id="t08_def_basic" name="t08_def_basicList" type="com.ist.aml.risk.dto.T08_def_basic">
								<tr>
									<td>
										<bean:write name="t08_def_basic" property="basicname" />
									</td>
									<td>
										<bean:write name="t08_def_basic" property="base_score" />
									</td>
									<td>
										<bean:write name="t08_def_basic" property="basic_val" />
									</td>
									<td>
										<bean:write name="t08_def_basic" property="score" />
									</td>
									<td>
										<bean:write name="t08_def_basic" property="basicocc" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="cond_t2">
					<span class="buttons">
					    <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />客户评级历史记录</strong>
					</span>
				</div>
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<th>
								评定时间
							</th>
							<th>
								系统初评等级
							</th>
							<th>
								人工调整等级
							</th>
							<th>
								调整原因
							</th>
						</tr>
						<logic:present name="t08_party_result_hisList">
							<logic:iterate id="t08_party_result_his" name="t08_party_result_hisList" type="com.ist.aml.risk.dto.T08_party_result">
								<tr>
									<td>
										<bean:write name="t08_party_result_his" property="appradate_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="fristappralevel_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="level_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="reason" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
			</logic:notEmpty>
			<logic:empty name="t08_party_resultActionForm" property="party_chn_name">
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<b><font color="red">该客户还没进行风险评级！</font></b>
							</td>
						</tr>
					</table>
				</div>
			</logic:empty>
		</html:form>
	</body>
</html>

