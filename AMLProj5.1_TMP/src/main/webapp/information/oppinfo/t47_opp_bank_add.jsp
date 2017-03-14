<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	
	 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/App_Select.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->	
	<%
	String sItem2 = "";
	%>

	<logic:iterate id="area" name="areaList"
		type="com.ist.platform.dto.T87_PBC_AREA">
		<%
					String upId = area.getPbc_up_areakey();
					String areaId = area.getPbc_areakey();
					String areaName = area.getPbc_areaname();
					String idname2 = upId + "@" + areaId + "#" + areaName;
					sItem2 = sItem2 + ",\"" + idname2 + "\"";
		%>
	</logic:iterate>
	<%
				if (!sItem2.equals("")) {
				sItem2 = sItem2.substring(1);
			}
	%>
	<script language="JavaScript">
//将字符串转化成javascript中的数组

arrItem=new Array(<%=sItem2%>);
function _Click(fromstr,tostr){
   changelocation(fromstr,tostr,arrItem);
}
function dosubmit(theUrl){
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
function  _Disp(){
     var index=document.forms[0].country_cd.selectedIndex; 
   var selvalue=document.forms[0].country_cd.value;
   if(selvalue=="CHN"){
    document.all.org.style.display="";
   }else{
     document.all.org.style.display="none";
   }
}
function checkForm(theUrl){
    var errMsg ="";
    //金融机构代码
    if (getLength(document.forms[0].unionorgkey.value)==0) {
        errMsg = "金融机构代码不能为空！";
        document.forms[0].unionorgkey.focus();
    }
   
    //金融机构名称
    else if (getLength(document.forms[0].union_name.value)==0) {
        errMsg = "金融机构名称不能为空！";
        document.forms[0].union_name.focus();
    }
    //金融机构代码类型
    else if (getLength(document.forms[0].union_type.value)==0) {
        errMsg = "金融机构代码类型不能为空！";
        document.forms[0].union_type.focus();
    }
    //金融机构国家
    else if (getLength(document.forms[0].country_cd.value)==0) {
        errMsg = "金融机构国家不能为空！";
        document.forms[0].country_cd.focus();
    }
    //金融机构地区
   else if(document.forms[0].country_cd.value=="CHN" && (document.forms[0].opp_area1.value=="-1"||document.forms[0].opp_area1.value=="" )){
        errMsg = "金融机构地区不能为空！";
        document.forms[0].opp_area1.focus();
    }
   

    var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
   
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function dosubmit(theUrl)
{
	document.forms[0].action=theUrl;
    document.forms[0].submit();
}

</script>
</HEAD>

<BODY leftmargin=0 topmargin=0>
 <div id="main">
	<html:form method="post" action="/oppinfo/t47_opp_bank_add.do">
	  <html:errors/>
		 <div class="conditions">
					<div class="cond_t">
   <span>新建对方金融机构信息 </span>
				 <span class="buttons"> <a href="#" onclick="dosubmit('t47_opp_bank_list.do')">
				 <img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a>
					 
		 </span></div> <div class="cond_c">
						<table   border="0" cellpadding="0" cellspacing="0">
							<tr  >
								<td >
									金融机构代码：
								</td>
								<td >
									<html:text property="unionorgkey"  
										 /> <font color="#FF0000">*</font>
								</td>
							 
								<td  >
									金融机构名称：
								</td>
								<td  >
									<html:text property="union_name"   /> <font color="#FF0000">*</font>
								</td>
							</tr>
							<tr   >
								<td  >
									金融机构代码类型：
								</td>
								<td  >
									<html:select property="union_type">
										<html:options collection="organtypeMap" property="label"
											labelProperty="value" />
									</html:select> <font color="#FF0000">*</font>
								</td>
							 
								<td  >
									金融机构所在国家：
								</td>
								<td >
									<html:select property="country_cd" onchange="_Disp()">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select> <font color="#FF0000">*</font>
								</td>
							</tr>
							<tr id="org" >
								<td  >
									金融机构所在地区：
								</td>
								<td  colspan="3">
									<html:select property="opp_area1"
										onchange="_Click('opp_area1','opp_area2')">
										<html:options collection="area1Map" property="label"
											labelProperty="value" />
									</html:select>
									&nbsp;&nbsp;

									<html:select property="opp_area2"
										onchange="_Click('opp_area2','opp_area')">
										<option value="-1">
											请选择
										</option>
									</html:select>
									&nbsp;&nbsp;
									<html:select property="opp_area">
										<option value="-1">
											请选择
										</option>
									</html:select> <font color="#FF0000">*</font>
								</td>
							</tr>
							<tr  >
								 
								<td  colspan="4" align="center" class="in_button">
									<html:button property="button" styleClass="input" value="提 交"
										onclick="checkForm('t47_opp_bank_add_do.do')" />
									<html:reset styleClass="input" value="重 置" />
								</td>
							</tr>

						</table>
				 

</div>
</div>
	</html:form>
	</div>
</BODY>
</html:html>
