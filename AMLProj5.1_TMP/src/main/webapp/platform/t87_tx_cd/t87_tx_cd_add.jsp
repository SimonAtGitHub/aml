<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
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
function checkForm(theUrl){
    var errMsg ="";
    //是否是特殊交易码
    if (getLength(document.forms[0].spec_flag.value)==0) {
        errMsg = "是否是特殊交易码不能为空！";
        document.forms[0].spec_flag.focus();
    }
       
    //核心代码
    else  if (getLength(document.forms[0].tx_cd.value)==0) {
        errMsg = "核心交易代码不能为空！";
        document.forms[0].tx_cd.focus();
    }
    else if(document.forms[0].tx_cd.value.length>4){
    	errMsg = "核心交易代码长度不能超过4位！";
    }
    //交易代码名称
    else if (getLength(document.forms[0].tx_name.value)==0) {
        errMsg = "交易代码名称不能为空！";
        document.forms[0].tx_name.focus();
    }
   
     
    //现钞标志
    else if (getLength(document.forms[0].tx_falg.value)==0) {
        errMsg = "现钞标志不能为空！";
        document.forms[0].tx_falg.focus();
    } 
     //交易方式
    else if (getLength(document.forms[0].tx_team.value)==0) {
        errMsg = "交易方式不能为空！";
        document.forms[0].tx_team.focus();
    } 
    //是否有效 
    else if (getLength(document.forms[0].flag.value)==0) {
        errMsg = "是否有效不能为空！";
        document.forms[0].flag.focus();
    } 
else if(getLength(document.forms[0].spec_flag.value)>0){
    var spec_flag_val=document.forms[0].spec_flag.value;
    if(spec_flag_val=="1"){
     //商户类型
<%--       if(getLength(document.forms[0].mer_cat_cd.value)==0){--%>
<%--         errMsg = "商户类型不能为空！";--%>
<%--        document.forms[0].mer_cat_cd.focus();--%>
<%--        }else{--%>
           var tx_team_val= document.forms[0].tx_team.value;
          if(tx_team_val!="20"){
           //是否跨行
           if(getLength(document.forms[0].is_out_bank.value)==0){
              errMsg = "是否跨行不能为空！";
             document.forms[0].is_out_bank.focus();
                }
           }
<%--       }--%>
    }
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

</script>
</HEAD>

<BODY leftmargin=0 topmargin=0>
<div id="main">
<html:form method="post" action="/t87_tx_cd/t87_tx_cd_add.do">
     <div class="conditions">
     <div class="cond_t">
	  <span>新建交易代码信息 
          </span>
      <span class="buttons">
       <a href="#" onclick="dosubmit('t87_tx_cd_list.do')"> 	   <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
 
      </span>
      </div>
  <html:errors/>
    <div class="cond_c">
 <TABLE   cellPadding=0   cellSpacing=0  border="0">
   
            <tr  >
              <td  >是否是特殊交易码：</td>
              <td  >          
               <html:select property="spec_flag"   >
                      <html:options collection="spec_flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
               
              <td  > 核心交易代码：</td>
              <td  > 
             <html:text property="tx_cd" size="4"  /> <font color="#FF0000">*</font>
              </td></tr>
              <tr  >
<%--              <td  > 商户类型：</td>--%>
<%--              <td  > --%>
<%--             <html:text property="mer_cat_cd"   /> <font color="#FF0000">*</font>--%>
<%--              </td> --%>
              <td  >是否跨行：</td>
              <td  colspan="3">          
               <html:select property="is_out_bank"   >
                      <html:options collection="is_out_bankMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select></td>
              </tr> 
              <tr  >
              <td  > 交易代码名称：</td>
              <td  > 
              <html:text property="tx_name"  /> <font color="#FF0000">*</font> 
              </td> 
              <td  >现钞标志：</td>
              <td  >          
               <html:select property="tx_falg"   >
                      <html:options collection="tx_flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
              </tr>  
              <tr  >
              <td >交易方式：</td>
              <td >          
               <html:select property="tx_team"   >
                      <html:options collection="tx_teamMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
               
              <td  >是否有效：</td>
              <td  >          
               <html:select property="flag"   >
                      <html:options collection="flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
              </tr>              
                         
              <tr  >
               
           <td colspan="4" align="center" class="in_button">
                  <html:hidden property="organkey" value="0"/>
                <html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t87_tx_cd_add_do.do')"/>
 
                <html:reset styleClass="input" value="重 置"/>
              </td>
            </tr>  
           
          </table>
   
  
 </div>
 </div>
					 <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
	 <p>
	  &nbsp;&nbsp;交易代码构成：<br>
	  &nbsp;&nbsp;普通交易代码：核心交易代码本身 <br>
	  &nbsp;&nbsp;特殊交易代码：核心交易代码  + 商户类型 + 跨行标志 <br>
      &nbsp;&nbsp;特殊交易代码包括以下两种情况：<br>
      &nbsp;&nbsp;1、交易方式是网上支付时，需要根据商户类型判断交易方式的交易代码；<br>
      &nbsp;&nbsp;2、交易方式是非网上支付时，需要根据商户类型和是否跨行判断交易方式的交易代码。<br>
   </p>	
</html:form>
</div>
</BODY>
</html:html>
