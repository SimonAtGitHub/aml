<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR/>
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
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form[0].action='AlertAnalyse_List.htm';
        document.form[0].submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form[0].action='AlertAnalyse_List.htm';
        document.form[0].submit();
   }
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
 if(type=='create'){
    
         errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要对所选的<%=com.ist.util.Constans.REPORT_NAME %>生成数据包吗？')){
                isSub = true;
            }
            }
        
    }else if(type=='all'){
    	<bean:size id="len" name="t07_nbh_rbifList" />;
    	<logic:equal name="len" value="0">
    		alert('没有可打包的数据！');
    		return false;
		</logic:equal>
        if(errMsg==''){
            if(confirm('你真的要对全部符合查询条件的<%=com.ist.util.Constans.REPORT_NAME %>生成数据包吗？')){
                isSub = true;
            }
            }
        
    }
      else if(type=='search'){
        _Date1 = document.forms[0].start_time.value;
    	_Date2 = document.forms[0].end_time.value;  
        if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;
	     else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	  
    isSub=true;
    }
    else if(type=='change'){  
       isSub=true;
    }
    if(isSub && errMsg==''){
     if(type=='all'||type=='create'){
        waitfor('waitfor');
        }
        document.forms[0].action=theUrl;
        document.forms[0].submit();
       if(type=='all'||type=='create'){
        delwaitfor('waitfor');
        }
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
function pbcTypechange(){
    var index1=document.forms[0].pbc_msg_type_cd.value;
    var url="";
    if(index1=="R"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/resend_huge_list.do?pbc_msg_type_cd=R&newsearchflag=1";
    }
    if(index1=="I"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/revise_huge_list.do?pbc_msg_type_cd=I&newsearchflag=1";
    }
    if(index1=="C"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/correct_huge_list.do?pbc_msg_type_cd=C&newsearchflag=1";
    }
    if(index1=="D"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/delete_huge_list.do?pbc_msg_type_cd=D&newsearchflag=1";
    }
    document.forms[0].action=url;
    document.forms[0].submit();
}
</SCRIPT>
<script>
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全选");
	  });
});
</script>
		<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
-->
</style>
	</head>
<body   class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>

		<html:form action="/report/revise_huge_list.do" method="post">
		
			<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
						<span>补正大额<%=com.ist.util.Constans.REPORT_NAME %>
							 
						</span>
					  <span class="buttons">	
					<a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全选</a>
						 <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createSPacket.do?url=<%=request.getContextPath()%>/pbcreport/report/revise_huge_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd"/>&create_type=0&interfacekey=BH','create')" >
						 <img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />选择生成数据包</a>		
						<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createIbhPacket.do?url=<%=request.getContextPath()%>/pbcreport/report/revise_huge_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&create_type=1&interfacekey=BH','all')"  >
						<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />全部生成数据包</a>
					</span>	
			  </div>

<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr >
	   		<td width="10%" colspan="1" class="in_button" >
										<input type="button" name="button1" value="大额" class="input" disabled="disabled"/>
										<input type="button" name="button2" value="可疑" class="input"
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/revise_spc_list.do?newsearchflag=2&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />','change')"/>
									</td>
										
									    <td width="8%" align="center">
									一个包的<%=com.ist.util.Constans.REPORT_NAME %>数：
									<html:select property="count">
											<html:options collection="countMap" property="label"
												labelProperty="value" />
										</html:select>
										</td>
										
							 </tr>
		  </table>
	</div>
			<div class="cond_c">
	  <table border="0" cellpadding="0" cellspacing="0">
								<tr bgcolor="ECF3FF">
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										补正<%=com.ist.util.Constans.REPORT_NAME %>生成日期：
									</td>
									<td width="36%" bgcolor="F6F9FF">
					   <html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
			                           <html:text property="end_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								
									</td>
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										<%=com.ist.util.Constans.REPORT_NAME %>类型：
									</td>
									<td width="36%" bgcolor="F6F9FF">
										<html:select property="pbc_msg_type_cd" onchange="pbcTypechange();">
											<html:options collection="pbc_msg_type_cdMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td align="right">
										创建机构：
									</td>
									<td bgcolor="F6F9FF">
									<html:text property="create_org" size="10"onblur="_Onblur('create_org_name')" maxlength="20"/>
									<html:text property="create_org_name" size="15" readonly="true"/>&nbsp;
								  <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=create_org&input_name_disp=create_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									
									</td>
									<td align="right">
										排序：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="orderby">
											<html:options collection="report_sortMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:radio property="order" value="1" />
										升序
										<html:radio property="order" value="2" />
										降序
										<input type="button" name="button3" value="查 询"  class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/revise_huge_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&newsearchflag=1','search')" />
									</td>
								</tr>

							</table>
						</div>
				 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
				<tr align=center class="tdhead">
			
					<th>
						选中
					</th>
					
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>代码
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>机构名称
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>机构编号
					</th>
					<th>
						补正<%=com.ist.util.Constans.REPORT_NAME %>生成日期
					</th>
					<th>
						交易主体总数
					</th>
					
					<th>
						<%=com.ist.util.Constans.CASE_NAME %>编号
					</th>
					<th>
						创建机构
					</th>
				
					<th>
						报文预览
					</th>
					
					
				</tr>
				<logic:iterate id="t07_nbh_rbif" name="t07_nbh_rbifList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_ibh_rbif">
					<TR >
				
						<TD height=22>
							<html:multibox property="reportkeys">
								<bean:write name="t07_nbh_rbif" property="reportkey" />
							</html:multibox>
						</TD>
					
						<TD>
								<bean:write name="t07_nbh_rbif" property="reportkey" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="rinm" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="ricd" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="irdt_disp" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="tstn" />
						</TD>
						
						<TD>
							<bean:write name="t07_nbh_rbif" property="application_num" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="create_org_name" />
						</TD>
					
						<TD>
							<a
								href="#" onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/preview.do?reportkey=<bean:write name="t07_nbh_rbif" property="reportkey" />&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&interfacekey=BH','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
								预览报文</a>
						</TD>
						
						
						
					</TR>
				</logic:iterate>
			 </table>
  </div>
   <div class="list_page">
   <bean:write name="pageInfo" scope="request" filter="false"/>
</div>
	</html:form>			
	</body>
</html>