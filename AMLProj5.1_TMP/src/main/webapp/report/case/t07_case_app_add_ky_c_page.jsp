<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function dosubmit(theUrl,type){
    var errMsg = "";
   
    if(type=='new'){
         if(checkRadio(document.forms[0].reportkey1)<0){
           errMsg="请选择报告信息！";
         }
    }else if(type=='all'){
        selectAll(document.forms[0].button); 
    }
    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
var errMsg="";
var organkey=parent.document.getElementsByName('ficd')[0];
	var val=0;
	
	if(getLength(document.forms[0].create_dt_disp.value)>0||getLength(document.forms[0].create_dt_enddisp.value)>0){
			val+=1 ;
	}else  if (getLength(document.forms[0].reportkey.value)>0) {
        	val+=1 ; 
    }else  if (getLength(document.forms[0].stcr.value)>0) {
       		val+=1 ;  
    }

   if(getLength(document.forms[0].create_dt_disp.value)>0&&getLength(document.forms[0].create_dt_enddisp.value)>0){
       if(!_compareTwoDateForString(document.forms[0].create_dt_disp.value, document.forms[0].create_dt_enddisp.value)) {
           document.forms[0].create_dt_disp.focus();
	        errMsg += "报告生成起止日期开始时间不能大于结束时间";		    
		}
  		}else if(organkey.value=='')
		   {
		   
		   		errMsg+="请先定位机构!";
		   }
		 else if(val==0)
	 	{
	 		errMsg="请至少输入一个查询条件！";
	 	}
    if(errMsg!=''){
        alert(errMsg);
        return false; 
         }else
       {
       
       	  url+='&create_org='+organkey.value;
       	  document.forms[0].action=url;
	      document.forms[0].submit();
      }
}

function selectAll(obj){
    if(document.forms[0].reportkeyCheckBox!=null){
    if(obj.value=="全  选"){
        obj.value="全不选"
		if(document.forms[0].reportkeyCheckBox.value!=""){
                document.forms[0].reportkeyCheckBox.checked=true;
    	}
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ ){
             document.forms[0].reportkeyCheckBox[i].checked=true;
        }
    }
    else{
	    obj.value="全  选"
	    if(document.forms[0].reportkeyCheckBox.value!="")
                document.forms[0].reportkeyCheckBox.checked=false;
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ )
	             document.forms[0].reportkeyCheckBox[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}
function back_reportkey(url){
   var distype="";
   var temp=document.getElementsByName("reportkey1"); 
     for (i=0;i<temp.length;i++){ 
        if(temp[i].checked) distype=temp[i].value ;
     }
  parent.document.getElementById("reportkey").value=distype;
}

</SCRIPT>
		<style type="text/css">
<!--
.STYLE2 {
	color: #000000
}
-->
</style>
	</head>
	<body leftmargin="0" topmargin="0">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="iframecontent">
			<html:form action="/case/t07_case_app_add_ky_c_page.do" method="post">
				<html:hidden property="pbc_msg_type_cd" />
				<input type="hidden" name="casetype" value="1" />
				<div class="conditions">
					<div class="cond_t">
						<span>选择已上报的报告 </span>

					</div>

					<div class="cond_c">

						<table border="0" cellpadding="0" cellspacing="0">

						
							<tr>
								<td>
									报告生成起止日期：
								</td>
								<td>
								<html:text property="create_dt_disp" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>--
								<html:text property="create_dt_enddisp" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>

	
								</td>
								<td>
									报告代码：
								</td>
								<td>
									<html:text property="reportkey" size="20" maxlength="60" />
								</td>
							</tr>
							<tr>
								<td>
									可疑特征：
								</td>
								<td>
									<html:select property="stcr" style="width:160 "
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="pbcnbhruleMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									排序：
								</td>
								<td>
									<html:select property="ordername">
										<html:options collection="orderMap" property="label"
											labelProperty="value" />
									</html:select>

									<html:radio property="ordertype" value="" />
									升序
									<html:radio property="ordertype" value="1" />
									降序
									<input type="button" name="ok" value="查询" class="in_button1" 
										onClick="_Confim('t07_case_app_add_ky_c_page.do?newsearchflag=1');"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<th>
								选择
							</th>
							<th>
								报告代码
							</th>
							<th>
								金融机构名称
							</th>
							<th>
								可疑特征（可多选）
							</th>
							<th>
								客户总数
							</th>
							<th>
								可疑交易总笔数
							</th>
							<th>
								填报人员
							</th>
							<th>
								报告生成日期
							</th>
						</tr>
						<logic:present name="t07_reportList">
							<logic:iterate id="search" name="t07_reportList"
								type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
								<%
									java.util.HashMap map = new java.util.HashMap();
													map.put("reportkey", search.getReportkey());
													map.put("pbc_msg_type_cd", search
															.getPbc_msg_type_cd());
													map.put("tag", "2");
													map.put("url","'/pbcreport/t07_nbh_tsdt/t07_nbsreport_list.do'");
													pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);							
	
							%>
								<tr align="center" class="interval"
									onMouseOver="this.className='interval2'"
									onMouseOut="this.className='interval'">
									<td>
										<input type="radio" onclick="back_reportkey()"  name="reportkey1" value="<%=search.getReportkey()%>"/></td>
									<td>
										<a target="_blank"
											href="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info.do?fromcase=0&report_time_cd=1&reportkey=<bean:write name="search" property="reportkey" />&pbc_msg_type_cd=<bean:write name="search" property="pbc_msg_type_cd" />&tag=2&newsearchflag=1&url=
											<%=URLEncoder.encode(request.getContextPath()+ "/report/case/t07case_nbsreport_list.do?flow_id=10&casetype=1&intPage=")%><bean:write name='intPage'/>">
											<bean:write name="search" property="reportkey" scope="page" />
										</a>
										
										
									</td>
									<td>
										<bean:write name="search" property="finm" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="stcr" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="cttn" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="ttnm" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="rpnm" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="rpdt_disp" scope="page" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>

					</table>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo" scope="request">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
				<!--   <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td align="right" >
        <html:button property="button4" value="创建" styleClass="input" onclick="dosubmit('addT07_caseErrorKyDo.do','new')"/>
      </td>
    </tr>
	
  </table>
  -->
			</html:form>
			<!--提示块-->
			<div id="div_hint"
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>

		</div>
	</body>
</html>