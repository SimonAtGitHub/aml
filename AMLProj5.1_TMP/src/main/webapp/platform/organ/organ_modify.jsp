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
   
    //������
  if(getLength(document.forms[0].organname.value)==0){
        errMsg+="����������Ϊ�գ�";
        document.forms[0].organname.focus();
    }else if(getLength(document.forms[0].organname.value)>64){
        errMsg+="���������ܴ���64���ַ���";
        document.forms[0].organname.focus();
    }
    //�������
   // else if(getLength(document.forms[0].organsf.value)>10){
    //    errMsg+="������Ʋ��ܴ���10���ַ���";
    //    document.forms[0].organsf.focus();
    //}
    //�ϼ�����
    else if(getLength(document.forms[0].uporgankey.value)==0){
        errMsg+="�ϼ������Ų���Ϊ�գ�";
        document.forms[0].uporgankey.focus();
    }
    else if(getLength(document.forms[0].uporgankey.value)>16){
        errMsg+="�ϼ������Ų��ܴ���16���ַ���";
        document.forms[0].uporgankey.focus();
    }
    //��ϵ��
    else if(getLength(document.forms[0].linkman.value)>16){
        errMsg+="��ϵ���������ܴ���16���ַ���";
        document.forms[0].linkman.focus();}
    //��ϵ�绰
    else if(getLength(document.forms[0].telephone.value)>0 && checkTelephone(document.forms[0].telephone.value)==0){
        errMsg+="��ϵ�绰��������";
        document.forms[0].telephone.focus();
    }else if(getLength(document.forms[0].telephone.value)>32){
        errMsg+="�绰���Ȳ��ܴ���32���ַ���";
        document.forms[0].telephone.focus();
    }
 //������ַ
     else if(getLength(document.forms[0].organaddress.value)==0){
        errMsg+="������ַ����Ϊ�գ�";
        document.forms[0].organaddress.focus();
    }
    else if(getLength(document.forms[0].organaddress.value)>128){
        errMsg+="������ַ���ܴ���128���ַ���";
        document.forms[0].organaddress.focus();
    }
    //��������
    else if(getLength(document.forms[0].postalcode.value)!=0 && getLength(document.forms[0].postalcode.value)!=6){
        errMsg+="�������볤�Ȳ���ȷ��";
        document.forms[0].postalcode.focus();
    }else if(getLength(document.forms[0].postalcode.value)!=0 && checkNumber(document.forms[0].postalcode.value)==0){
        errMsg+="�������뺬�з������ַ���";
        document.forms[0].postalcode.focus();
    //ʱ��
    
    }    else if(getLength(document.forms[0].org_area.value)==0 ){
        errMsg+="�����������벻��Ϊ�գ�";
        document.forms[0].org_area.focus();
    }
      
     else if(getLength(document.forms[0].validatedate.value)==0 ){
        errMsg+="��Чʱ�䲻��Ϊ�գ�";
        document.forms[0].validatedate.focus();
    }
     else if(getLength(document.forms[0].invalidatedate.value)==0){
        errMsg+="ʧЧʱ�䲻��Ϊ�գ�";
        document.forms[0].invalidatedate.focus();
    }
    else if(!_compareTwoDateForString(document.forms[0].validatedate.value, document.forms[0].invalidatedate.value)) {
	 errMsg = "��Чʱ�䲻�ܴ���ʧЧʱ�䣡";		
	 document.forms[0].validatedate.focus();    
		   } else if(getLength(document.forms[0].organdes.value)>256){
        errMsg+="�������ܴ���256���ַ���";
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
	  <span>�޸Ļ���</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('organ_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
 <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td><font color="#FF0000">*</font>�����ţ�</td>
         <td><html:text property="organkey" readonly="true" />
         <html:hidden property="organkey"  /></td>
		 <td><font color="#FF0000">*</font>�������ƣ�</td>
         <td><html:text property="organname"  /></td>
        </tr>
       <tr>
		 <td>������ƣ�</td>
         <td><html:text property="organsf" /></td>
		  <td><font color="#FF0000">*</font>��������</td>
         <td><html:select property="organlevel">
                      <html:options collection="organlevelMap" property="label" labelProperty="value"/>
                  </html:select>
          </td>
        </tr>
         <tr>
		 <td>���ڻ������룺</td>
         <td><html:text property="organcode" /></td>
		 <td><font color="#FF0000">*</font>�Ƿ�羳��</td>
         <td>
         <html:select property="overarea_ind">
                      <html:options collection="overarea_indMap" property="label" labelProperty="value"/>
          </html:select>
		</td>
        </tr> 
         
     
	        <tr>
        
		 <td><font color="#FF0000">*</font>�ϼ������ţ�</td>
         <td><html:text property="uporgankey"  size="10" />
         <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=uporgankey&','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
         </td>
		  <td><font color="#FF0000">*</font>�����������룺</td>
         <td><html:text property="org_area" readonly="true" size="9"  onclick="window.open('../../common/editCountryArea.jsp?type=short&inname=org_area&inname_disp=org_disp&type=0','enter1','height=20, width=850,left=100,top=100,scrollbars=yes,resizable=yes');"  />
          <input type="hidden"  name="org_disp"/></td>
        </tr>
		<tr>
        
		 <td>�ִ���֧��ϵͳ�кţ�</td>
         <td><html:text property="unionorgkey" /></td>
		 <td>��ҽ����ʻ�����ϵͳ�кţ�</td>
         <td><html:text property="settleorgkey" /></td>
        </tr>
        <tr>
        
		 <td><font color="#FF0000">*</font>��Чʱ�䣺</td>
         <td>
               <html:text property="validatedate" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
               </td>
		 <td><font color="#FF0000">*</font>ʧЧʱ�䣺</td>
         <td> 
         <html:text property="invalidatedate" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
         
         </td>
        </tr>
         <tr>
         
		 <td><font color="#FF0000">*</font>������ַ��</td>
         <td><html:text property="organaddress" size="50" /></td>
		  <td>�������룺</td>
         <td><html:text property="postalcode" /></td>
        </tr>
		<tr>
        
		 <td>��ϵ�ˣ�</td>
         <td><html:text property="linkman" /></td>
		  <td>��ϵ�绰��</td>
         <td><html:text property="telephone" /></td>
        </tr>
		
		<tr>
         
		 
      
	    <td >��ע��</td>
          <td colspan="3" >
          <html:textarea property="organdes" cols="30" rows="3" ></html:textarea>
       </td>
     
        </tr>
	  
	       
       
       <tr>
	  
		<td align="center" class="in_button" colspan="4">
		  <html:button property="button" value="�� ��" onclick="checkForm('organ_modify_do.do')"/>
                <html:reset styleClass="input" value="�� ��"/>
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
