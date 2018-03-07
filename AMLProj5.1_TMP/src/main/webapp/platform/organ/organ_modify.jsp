<%@ page contentType="text/html; charset=GBk" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

	<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg ="";
   
    //机构名
  if(getLength(document.forms[0].organname.value)==0){
        errMsg+="机构名不能为空！";
        document.forms[0].organname.focus();
    }else if(getLength(document.forms[0].organname.value)>64){
        errMsg+="机构名不能大于64个字符！";
        document.forms[0].organname.focus();
    }
    //机构简称
   // else if(getLength(document.forms[0].organsf.value)>10){
    //    errMsg+="机构简称不能大于10个字符！";
    //    document.forms[0].organsf.focus();
    //}
    //上级机构
    else if(getLength(document.forms[0].uporgankey.value)==0){
        errMsg+="上级机构号不能为空！";
        document.forms[0].uporgankey.focus();
    }
    else if(getLength(document.forms[0].uporgankey.value)>16){
        errMsg+="上级机构号不能大于16个字符！";
        document.forms[0].uporgankey.focus();
    }
    //联系人
    else if(getLength(document.forms[0].linkman.value)>16){
        errMsg+="联系人姓名不能大于16个字符！";
        document.forms[0].linkman.focus();}
    //联系电话
    else if(getLength(document.forms[0].telephone.value)>0 && checkTelephone(document.forms[0].telephone.value)==0){
        errMsg+="联系电话输入有误！";
        document.forms[0].telephone.focus();
    }else if(getLength(document.forms[0].telephone.value)>32){
        errMsg+="电话长度不能大于32个字符！";
        document.forms[0].telephone.focus();
    }
 //机构地址
     else if(getLength(document.forms[0].organaddress.value)==0){
        errMsg+="机构地址不能为空！";
        document.forms[0].organaddress.focus();
    }
    else if(getLength(document.forms[0].organaddress.value)>128){
        errMsg+="机构地址不能大于128个字符！";
        document.forms[0].organaddress.focus();
    }
    //邮政编码
    else if(getLength(document.forms[0].postalcode.value)!=0 && getLength(document.forms[0].postalcode.value)!=6){
        errMsg+="邮政编码长度不正确！";
        document.forms[0].postalcode.focus();
    }else if(getLength(document.forms[0].postalcode.value)!=0 && checkNumber(document.forms[0].postalcode.value)==0){
        errMsg+="邮政编码含有非数字字符！";
        document.forms[0].postalcode.focus();
    //时间
    
    }    else if(getLength(document.forms[0].org_area.value)==0 ){
        errMsg+="行政区划代码不能为空！";
        document.forms[0].org_area.focus();
    }
      
     else if(getLength(document.forms[0].validatedate.value)==0 ){
        errMsg+="生效时间不能为空！";
        document.forms[0].validatedate.focus();
    }
     else if(getLength(document.forms[0].invalidatedate.value)==0){
        errMsg+="失效时间不能为空！";
        document.forms[0].invalidatedate.focus();
    }
    else if(!_compareTwoDateForString(document.forms[0].validatedate.value, document.forms[0].invalidatedate.value)) {
	 errMsg = "有效时间不能大于失效时间！";		
	 document.forms[0].validatedate.focus();    
		   } else if(getLength(document.forms[0].organdes.value)>256){
        errMsg+="其他不能大于256个字符！";
        document.forms[0].organdes.focus();
    }

    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
</script>
</head>
<body class="mainbg">
<html:form method="post" action="/organ/organ_add_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>修改机构</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('organ_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
 <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td><font color="#FF0000">*</font>机构号：</td>
         <td><html:text property="organkey" readonly="true" />
         <html:hidden property="organkey"  /></td>
		 <td><font color="#FF0000">*</font>机构名称：</td>
         <td><html:text property="organname"  /></td>
        </tr>
       <tr>
		 <td>机构简称：</td>
         <td><html:text property="organsf" /></td>
		  <td><font color="#FF0000">*</font>机构级别：</td>
         <td><html:select property="organlevel">
                      <html:options collection="organlevelMap" property="label" labelProperty="value"/>
                  </html:select>
          </td>
        </tr>
         <tr>
		 <td>金融机构代码：</td>
         <td><html:text property="organcode" /></td>
		 <td><font color="#FF0000">*</font>是否跨境：</td>
         <td>
         <html:select property="overarea_ind">
                      <html:options collection="overarea_indMap" property="label" labelProperty="value"/>
          </html:select>
		</td>
        </tr> 
         
     
	        <tr>
        
		 <td><font color="#FF0000">*</font>上级机构号：</td>
         <td><html:text property="uporgankey"  size="10" />
         <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=uporgankey&','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
         </td>
		  <td><font color="#FF0000">*</font>行政区划代码：</td>
         <td><html:text property="org_area" readonly="true" size="9"  onclick="window.open('../../common/editCountryArea.jsp?type=short&inname=org_area&inname_disp=org_disp&type=0','enter1','height=20, width=850,left=100,top=100,scrollbars=yes,resizable=yes');"  />
          <input type="hidden"  name="org_disp"/></td>
        </tr>
		<tr>
        
		 <td>现代化支付系统行号：</td>
         <td><html:text property="unionorgkey" /></td>
		 <td>民币结算帐户管理系统行号：</td>
         <td><html:text property="settleorgkey" /></td>
        </tr>
        <tr>
        
		 <td><font color="#FF0000">*</font>生效时间：</td>
         <td>
               <html:text property="validatedate" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
               </td>
		 <td><font color="#FF0000">*</font>失效时间：</td>
         <td> 
         <html:text property="invalidatedate" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
         
         </td>
        </tr>
         <tr>
         
		 <td><font color="#FF0000">*</font>机构地址：</td>
         <td><html:text property="organaddress" size="50" /></td>
		  <td>邮政编码：</td>
         <td><html:text property="postalcode" /></td>
        </tr>
		<tr>
        
		 <td>联系人：</td>
         <td><html:text property="linkman" /></td>
		  <td>联系电话：</td>
         <td><html:text property="telephone" /></td>
        </tr>
		
		<tr>
         
		 
      
	    <td >备注：</td>
          <td colspan="3" >
          <html:textarea property="organdes" cols="30" rows="3" ></html:textarea>
       </td>
     
        </tr>
	  
	       
       
       <tr>
	  
		<td align="center" class="in_button" colspan="4">
		  <html:button property="button" value="提 交" onclick="checkForm('organ_modify_do.do')"/>
                <html:reset styleClass="input" value="重 置"/>
         	</td>
	   </tr>
	  </table>
	</div>
  </div>
<!-- all end -->   
</div>
</html:form>
</body>
</html>
