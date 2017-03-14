<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
	var party_var = document.forms[0].party_id_s.value;
	var chn_name_var = document.forms[0].party_chn_name_search.value;
	var card_no_var = document.forms[0].card_no.value;
	if(party_var == '' && chn_name_var == '' && card_no_var == '')
	{
		alert("客户号，客户名称，证件号至少一项不能为空！");
		return false;
	}
    　 document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function _Click(party_id,party_chn_name,country_cd,card_type,card_no,addr1,tel_no,party_class_cd,organkey,
industrykey,enrol_fund_amt,legal_obj,legal_card_type,legal_card_no){

     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
     document.forms[0].country_cd.value=country_cd;
     document.forms[0].card_type.value=card_type;
     document.forms[0].card_type_disp.value=card_no;
     document.forms[0].addr1.value=addr1;
     document.forms[0].tel_no.value=tel_no;
     document.forms[0].addr2.value=party_class_cd;
     document.forms[0].organkey.value=organkey;
     document.forms[0].industrykey.value=industrykey;
     document.forms[0].enrol_fund_amt.value=enrol_fund_amt;
     document.forms[0].legal_obj.value=legal_obj;
     document.forms[0].legal_card_type.value=legal_card_type;
     document.forms[0].legal_card_no.value=legal_card_no;
     
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id1)<0){
           alert("请选择！");
           return false;
    } 
	
     opener.document.forms[0].<%=(String)request.getAttribute("input_name")%>.value=document.forms[0].party_id.value;
     opener.document.forms[0].<%=(String)request.getAttribute("input_name_disp")%>.value=document.forms[0].party_chn_name.value;
     opener.document.forms[0].ctnt.value=document.forms[0].country_cd.value;
    // opener.document.forms[0].citp.value=document.forms[0].card_type.value;
    opener.document.forms[0].citp.value=document.forms[0].card_type.value.substring(0,2);
    opener.document.forms[0].card_type_inf.value=document.forms[0].card_type.value.substring(2);
     opener.document.forms[0].ctid.value=document.forms[0].card_type_disp.value;
     opener.document.forms[0].addr1.value=document.forms[0].addr1.value;
     opener.document.forms[0].tel_no.value=document.forms[0].tel_no.value;
     opener.document.forms[0].organkey.value=document.forms[0].organkey.value;
     opener.document.forms[0].ctvc_i.value=document.forms[0].industrykey.value;
     var party_class=document.forms[0].addr2.value;
     if(party_class=='I'){
     opener.document.forms[0].cttp.value='02';
     }else{
     opener.document.forms[0].cttp.value='01';
     opener.document.forms[0].enrol_fund_amt.value=document.forms[0].enrol_fund_amt.value;
      opener.document.forms[0].legal_obj.value=document.forms[0].legal_obj.value;
      opener.document.forms[0].legal_card_type.value=document.forms[0].legal_card_type.value.substring(0,2);
      opener.document.forms[0].legal_card_type_inf.value=document.forms[0].legal_card_type.value.substring(2);
        opener.document.forms[0].legal_card_no.value=document.forms[0].legal_card_no.value;
     }
   window.close();
   opener.validateDetail();
   if(party_class=='C')
   {
 	  opener.validateAgent();
   }
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/case/t47_party_list_bs.do" method="post">

<div id="main">
<input type="hidden" name="input_name" value="<%=(String)request.getAttribute("input_name") %>"/>
<input type="hidden" name="input_name_disp" value="<%=(String)request.getAttribute("input_name_disp") %>"/>
<div class="conditions">
	<div class="cond_t">
	  <span>客户定位</span>
	  
	   <span class="buttons" >
	   <a href="#" onclick="_Commit()"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选定</a>	   
	   <a href="#" onclick="javascript:window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关闭</a>
	  </span>
	
	</div>
	<div class="cond_c">
  		 <table border="0" cellpadding="0" cellspacing="0">
    
	    <tr>
	      <td>
	         	客户号：
	         <html:text property="party_id_s"   size="12"/>
	       	    客户名称：
	   	      <html:text property="party_chn_name_search"   size="12"/>
	      	     证件号：
	         <html:text property="card_no"   size="12"/>
	      </td>
	      <td>客户类型：<html:select property="party_class_cd" >
	                      <html:options collection="clienttypeMap"
	                                    property="label"
	                                   labelProperty="value" />
	                    </html:select>
	      <input type="button" name="ok" value="查询" class="in_button1" 
										onclick="dosubmit('t47_party_list_bs.do?newsearchflag=1&type=search')"/> 
	     
	         <html:hidden property="party_chn_name"  />
	         <html:hidden property="party_id"  />
	         <html:hidden property="country_cd"  />
	         <html:hidden property="card_type"  />
	         <html:hidden property="card_type_disp"  />
	         <html:hidden property="addr1"  />
	         <html:hidden property="tel_no"  />
	         <html:hidden property="addr2"  />
	          <html:hidden property="organkey"  />
	           <html:hidden property="industrykey"  />
	         <html:hidden property="enrol_fund_amt"  />
	         <html:hidden property="legal_obj"  />
	         <html:hidden property="legal_card_type"  />
	         <html:hidden property="legal_card_no"  />
	      </td>
	    </tr>
	  </table>
	</div>
</div>

  <html:errors/>
 <div class="list">
  <table border="0" cellpadding="0" cellspacing="0">
    <TR >
      <th >选择</th>
      <th >客户编号</th>
      <th >客户名称</th>
      <th >客户类型</th>
      <th >国籍</th>
      <th >证件类型</th>
      <th >证件号码</th>
      <th >详细地址</th>
      <th >联系电话</th>
      
    </TR>
<logic:iterate id="party" name="t47_partyList" indexId="i" type="com.ist.aml.report.dto.T47_party">

    <TR>
      <TD>
     <input type="radio" name="party_id1" onclick="_Click('<bean:write name="party" property="party_id" />',
     '<bean:write name="party" property="party_chn_name" />','<bean:write name="party" property="country_cd" />',
     '<bean:write name="party" property="card_type" />','<bean:write name="party" property="card_no" />',
     '<bean:write name="party" property="addr1" />','<bean:write name="party" property="tel_no" />',
     '<bean:write name="party" property="party_class_cd" />','<bean:write name="party" property="organkey" />',
      '<bean:write name="party" property="industrykey" />','<bean:write name="party" property="enrol_fund_amt" />',
       '<bean:write name="party" property="legal_obj" />','<bean:write name="party" property="legal_card_type" />',
      '<bean:write name="party" property="legal_card_no" />')">
      </TD>
      <!--  <TD><%=i.intValue()+1%></TD>-->
       <TD> 
      <bean:write name="party" property="host_cust_id" scope="page"/></TD>
      <TD><bean:write name="party" property="party_chn_name" scope="page"/></TD>
     
       <TD>
       <logic:equal name="party" property="party_class_cd" value="I">对私</logic:equal>
       <logic:equal name="party" property="party_class_cd" value="C">对公</logic:equal>
       </TD>
       <TD><bean:write name="party" property="country_cd" scope="page"/></TD>
       <TD><bean:write name="party" property="card_type" scope="page"/></TD>
       <TD><bean:write name="party" property="card_no" scope="page"/></TD>
       <TD><bean:write name="party" property="addr1" scope="page"/></TD>
       <TD><bean:write name="party" property="tel_no" scope="page"/></TD>
    
    </TR>
	</logic:iterate>
  </TABLE>
  </div>
  <div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
</div>

  </div>
</html:form>
</BODY>
</HTML>
