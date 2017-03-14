<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String cordaurl="";
	if(request.getAttribute("cordaurl")!=null){
 		cordaurl=(String)request.getAttribute("cordaurl");
 		cordaurl=cordaurl.substring(1);
 		cordaurl="\""+request.getContextPath() + cordaurl;
	}
%>
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
     
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript">
function checkForm(theUrl){
	var errMsg = "";
	
	if(getLength(document.forms[0].tel_no.value)>0 && checkNumber(document.forms[0].tel_no.value)==0){
        errMsg+="联系电话输入有误！";
        document.forms[0].tel_no.focus();
    }
    var card_type=document.forms[0].card_type.value;
    if(card_type==""){
     errMsg+="证件类型不能为空！";
    }
    if(document.forms[0].card_no.value==""){
     errMsg+="证件号码不能为空！"
    }
   if(card_type=='19'||card_type=='29'){
       var card_type_inf=document.forms[0].card_type_inf.value;
       if(card_type_inf==""){
          alert("证件描述不能为空");
          return false;
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
function validateCardNo(cardnovalue){
 var cardtype=document.forms[0].legal_card_type.value;
 if(cardtype=="11"){
    IdCardValidate(cardnovalue);
 }
}

function card_inf_exp(type,value){
if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				
			}
		}else{
		 	var agent_card_type_value=document.forms[0].card_type.value;
		 	
			var class_cdValue='I';			
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_type_inf.style.visibility='hidden';
			}else {
			   document.forms[0].card_type_inf.style.visibility='visible';
				document.forms[0].card_type_inf.focus();
			}
			if(class_cdValue=='C'){
				var legal_card_type_value=document.forms[0].legal_card_type.value;
					if(legal_card_type_value!='19' && legal_card_type_value!='29'){
						document.forms[0].legal_card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].legal_card_type_inf.focus();
					}				
			}
		}
		}
</script>
</HEAD>
<body id="iframecontent" onload="card_inf_exp('1','');"> 
<html:form action="/custcheck/t10_survey_cust_risk.do" method="post">
<html:hidden name="t10_check_cust_cardForm" property="party_class_cd"/>
<div class="conditions">
	<div class="cond_c2">
	<html:errors />
    <table border="0" cellspacing="0" cellpadding="0" >
	  <tr>
	    <th colspan="4">客户概况</th>
	  </tr>
   		 <tr>
		<td >客户号：</td>
		<td colspan="3"><html:text name="t10_check_cust_cardForm"  property="party_id"  readonly="true"/>
						<img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" align="absmiddle" /></td>
		</tr>
   		 <tr>
		<td>客户名称：</td>
		<td ><html:text name="t10_check_cust_cardForm"   property="party_chn_name"  readonly="true" />
			 <img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" align="absmiddle" />
		<td >
			 客户状态：
		</td>
		<td >
		   <html:select name="t10_check_cust_cardForm" property="party_status_cd">
					<html:options collection="party_statusMap" property="label" labelProperty="value" />
		    </html:select>
				
		</td>
	  </tr>
	  <tr>
	  	<td> 客户证件类型：</td>
		<td>
			<html:select name="t10_check_cust_cardForm"  property="card_type" style="width:130px"  onchange="card_inf_exp('card_type','card_type_inf');" >
				<html:options collection="card_typeMap" property="label" labelProperty="value" />
			</html:select>	
			<html:text name="t10_check_cust_cardForm"  property="card_type_inf" ></html:text>
		
			
									   
		</td>
		<td>客户证件号码： </td>
		<td >
			<html:text name="t10_check_cust_cardForm"   property="card_no" onchange="validateCardNo(this.value);" ></html:text>
		</td>
	  </tr>
								
								<tr>
									<td >
										 客户国籍：
									</td>
									<td >
										<html:select name="t10_check_cust_cardForm" property="country_cd">
											<html:options collection="nationalityMap" property="label" labelProperty="value" />
										</html:select>
									</td>
									<td >
										 客户职业：
									</td>
									<td >
									<html:select name="t10_check_cust_cardForm" property="occupation">
											<html:options collection="zhiyeMap" property="label" labelProperty="value" />
										</html:select>
                                          

									</td>
								</tr>
								
								<tr>
									<td >
										 客户归属机构：
									</td>
									
									<td >
										<html:hidden name="t10_check_cust_cardForm" property="organkey"/>	
										<html:text name="t10_check_cust_cardForm"  property="organname" size="20" readonly="true"/>
										<input type="button" name="locate" class="in_button1" value="定 位" 
											onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">	
											 
									</td>
									<td >
										证件到期日：
									</td>
									<td >
									 <html:text name="t10_check_cust_cardForm"  property="card_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
       
									</td>
								</tr>
								<tr>
									<td>
									   客户名单类型：
									</td>
									<td colspan="3">
									   <logic:iterate id="list_type" name="list_typeList">
							                <bean:write name="list_type" />&nbsp;&nbsp;&nbsp;&nbsp;
							                <br/>
							                <br/>
							            </logic:iterate>
									</td>
								</tr>
								
	  <TR>
									<th colspan="4" >
										通讯信息：
									</th>
								</TR>
								<tr>
									<td >
										通信地址：
									</td>
									<td>
										<html:text name="t10_check_cust_cardForm"  property="addr1" maxlength="200" />
									</td>
									<td >
										联系电话：
									</td>
									<td >
										<html:text name="t10_check_cust_cardForm"   property="tel_no" maxlength="16" />
									</td>
								</tr>
								<tr>
									<td >
										工作单位：
									</td>
									<td >
										<html:text name="t10_check_cust_cardForm"   property="company" maxlength="200" />
									</td>
									<td >
										移动电话
									</td>
									<td >
									   <html:text name="t10_check_cust_cardForm"   property="cell_no" maxlength="200" />
									</td>
									
								</tr>  
								<TR >
									<th colspan="4" >
										其他信息：
									</th>
								</TR>
								<tr>
									<td >
										客户经理号：
									</td>
									<td >
										<html:text name="t10_check_cust_cardForm"   property="manager_no" maxlength="12"/>
									</td>
									<td >
										客户经理名：
									</td>
									<td >
										<html:text name="t10_check_cust_cardForm"   property="manager_name" maxlength="40"/>
									</td>
								</tr>
								<tr>
									<td >
										地区代码：
									</td>
									<td >
<%--										<html:text name="t10_check_cust_cardForm"   property="area_no"  />--%>
									<html:text name="t10_check_cust_cardForm"   property="area_no_disp"  
										onclick="window.open('../../common/editCountryArea.jsp?inname=country_residence&inname_disp=area_no_disp','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<html:text property="country_residence" readonly="true"  />
									</td>
									<td >
										性别：
									</td>
									<td >
										<html:select name="t10_check_cust_cardForm" property="gender" >
												<html:options collection="sexMap" property="label" labelProperty="value" />
									    </html:select>
									</td>
								</tr>
								
								<tr>
									
									<td >
										其他补充信息：
									</td>
									<td >
										<html:text name="t10_check_cust_cardForm"   property="other_info" maxlength="2000"/>
									</td>
									<td >
										&nbsp;
									</td>
									<td >
										&nbsp;
									</td>	
								</tr>
								<%if(request.getAttribute("flag_disp")==null){
	   
	   %>
	  <tr>
	    <td colspan="4">
		<input type="button" class="in_button1" name="button1" value="修 改" onclick="checkForm('t47_client_modify_do.do')" />
		<input type="reset" class="in_button1" value="重 置" />
		</td>
	  </tr>
	  <% } %>  
	</table>
    </div>
    
    <div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 </div>
</html:form> 

<logic:equal name="t10_check_cust_cardForm" property="flag_disp" value="success">	
<script>alert('修 改成功');</script>
</logic:equal>
</BODY>
</HTML>
