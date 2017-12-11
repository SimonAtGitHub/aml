<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function CheckIsNull(fm){
	if(fm.csnm.value==''){
		return "客户号不能为空!";
	}
	if(fm.create_org.value==''){
		return "请选择创建机构!";
	}
	return "";
}
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


function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}

 function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            //errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            if(checkRadio(document.forms[0])=="-1"){
            errMsg ="请选择"
            }
            isSub = true;
        }
     
        else if(type=='add'){
            isSub = true;
        }
        else if(type=='search'){
        	if(!_isDateSpaceComplete(document.forms[0].start_time.value, document.forms[0].end_time.value)){
           		errMsg = "请填写完整的起始时间范围！";
           		}
        	   else if(!_compareTwoDateForString(document.forms[0].start_time.value, document.forms[0].end_time.value)) {
        			 errMsg = "开始时间不能大于结束时间";	
        		}
        	isSub = true;
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
function selectAll(obj){
    if(document.forms[0].reportkeys!=null){
    if(obj.value=="全  选"){
        obj.value="全不选"
		if(document.forms[0].reportkeys.value!=""){
                document.forms[0].reportkeys.checked=true;
    	}
        if(document.forms[0].reportkeys.length!=0)
             for ( var i=0; i < document.forms[0].reportkeys.length; i++ ){
             document.forms[0].reportkeys[i].checked=true;
        }
    }
    else{
	    obj.value="全  选"
	    if(document.forms[0].reportkeys.value!="")
                document.forms[0].reportkeys.checked=false;
        if(document.forms[0].reportkeys.length!=0)
             for ( var i=0; i < document.forms[0].reportkeys.length; i++ )
	             document.forms[0].reportkeys[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}
function _Open(url,name,local){
  window.open(url,name,local);
      
}
</script>
		<!--<style type="text/css">
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
</style>-->
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/report/normal_spc_list.do" method="post">

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>可疑<%=com.ist.util.Constans.REPORT_NAME%>导出</span>
						<span class="buttons"> <a href="#" id="hdd_display" class="bt_hidden"></a> 
						<a onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
						<!-- 	<a href="javascript:selectAll(this)"><img src="../../images/blue/b_checkall.png" />全 选</a>  -->
							<a href="#" onclick="javascript:dosubmit('<%=request.getContextPath()%>/pbcreport/report/export_nbs_reportAll.do','modi')">
								<img src="../../images/blue/b_export.png" />导出可疑信息</a>
						</span>
					</div>
					<!-- <input type="button" name="upload" value="全  选" class="input"
						onClick="selectAll(this)" /> 
						<input type="button" name="upload" value="导出可疑信息" class="input"
						onClick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/export_nbs_reportAll.do','report')" />   -->

					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0" id="searchtable">
							<tr>
								<td>
									客户号：
								</td>
								<td>
									<input type="hidden" name="csnmDis" />
									<html:text property="csnm" styleClass="text_white" size="20"
										maxlength="20" />
									<%
										String root = request.getContextPath();
											String root2 = "\"_Open('"
													+ root
													+ "/common/t47_party_list.do?newsearchflag=1&input_name=csnm&input_name_disp=csnmDis','','height=600, width=800,left=100,top=100,scrollbars=yes,resizable=yes')\"";
									%>
									
									<a href="#" onclick=<%=root2%> ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
									
									

								</td>
								<td>
									账号：
								</td>
								<td>
									<html:text property="ctac" styleClass="text_white" size="20"
										maxlength="20" />

								</td>

							</tr>
							<!-- start 新加条件 -->
							<tr>
								<td>
									<%=com.ist.util.Constans.REPORT_NAME%>生成日期：
								</td>
								<td>
								<html:text property="start_time" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
            
									
									-
									<html:text property="end_time" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
            
									
								</td>
								<td>
									创建机构：
								</td>
								<td>
									<html:text property="create_org" size="10"
										onblur="_Onblur('create_org_name')" />
									<html:text property="create_org_name" size="15" readonly="true" />
									&nbsp;
									
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=create_org&input_name_disp=create_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
									
									
								</td>

							</tr>
							<tr>
							
								<td>
									可疑程度：
								</td>
								<td>

									<html:select property="ssdg">
										<html:options collection="ssdg" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									排序：
								</td>
								<td>
									<html:select property="orderby">
										<html:options collection="report_sortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									<input type="button" name="button3" value="查 询"
										class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/normal_spc_exportlist.do?newsearchflag=1','search')" />
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				
							<html:errors />
							<font color="#FF0000"><%=StringUtils.nullToStr((String) request
								.getAttribute("message"))%></font>
						
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<th>
								选中
							</th>
							<th>
								<%=com.ist.util.Constans.REPORT_NAME%>代码
							</th>
							<th>
								客户号
							</th>
							<!--  <th>
								账号
							</th>-->
							<!-- <th>
								币种
							</th> -->
							<th>
								金融机构名称
							</th>
							<th>
								可疑特征
							</th>
							<th>
								可疑程度
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
								<%=com.ist.util.Constans.REPORT_NAME%>生成日期
							</th>
							<th>
								创建机构
							</th>
							<th>
								案例编号
							</th>
						</tr>
						<logic:iterate id="t07_nbs_rbif" name="t07_nbs_rbifList"
							indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
							<tr>
								<td>
								<!--<html:multibox property="reportkeys">
										<bean:write name="t07_nbs_rbif" property="reportkey" />
									</html:multibox>-->
									<html:radio property="reportkeys" value="<%=t07_nbs_rbif.getReportkey()%>"></html:radio>
								</td>
								<td>
									<a
										href="nbs_base_info.do?backurl=<%=request.getContextPath()%>/pbcreport/report/normal_spc_exportlist.do&
					reportkey=<%=t07_nbs_rbif.getReportkey()%>&fromcase=2&report_time_cd=<bean:write name="t07_nbs_rbif" property="report_time_cd"/>&newsearchflag=1">
										<bean:write name="t07_nbs_rbif" property="reportkey" /> </a>
								
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="csnm" />
								</td>
								<!--  <td>
									<bean:write name="t07_nbs_rbif" property="ctac" />
								</td>-->
								
								<td>
									<bean:write name="t07_nbs_rbif" property="finm" />
								</td>

								<td>
									<bean:write name="t07_nbs_rbif" property="stcr" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="ssdg" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="cttn" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="ttnm" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="rpnm" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="rpdt_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="create_org_name" />
								</td>
								<td>
									<bean:write name="t07_nbs_rbif" property="application_num" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</html:form>
		</div>
	</body>
</html>
