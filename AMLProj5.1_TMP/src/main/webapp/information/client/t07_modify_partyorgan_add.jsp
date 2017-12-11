<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type='text/javascript' src='../../js/web_draw.js'></script>
<script language="JavaScript" src="../../js/App_Select.js"></script>
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

function checkForm(theUrl){
    var errMsg ="";
  
    //机构
    if (getLength(document.forms[0].organkey.value)==0) {
        errMsg = "合并机构不能为空！";
        document.forms[0].organkey.focus();
    }
    //机构
    if (getLength(document.forms[0].opp_organkey.value)==0) {
        errMsg = "被合并机构不能为空！";
        document.forms[0].opp_organkey.focus();
    }
   


    var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
    var msg="你真的确定将机构:"+document.forms[0].opp_organkey.value;
    if(document.forms[0].party_class_cd.value!=""){
      if(document.forms[0].party_class_cd.value=="I"){
       msg=msg+" 中的对私客户";
      }else{
        msg=msg+" 中的对公客户";
      } 
       if(document.forms[0].party_id.value!="")
       msg=msg+":"+document.forms[0].party_id.value;
    }else{
        if(document.forms[0].party_id.value!="")
       msg=msg+" 中的客户:"+document.forms[0].party_id.value;
      }
   
    msg=msg+" 合并到机构:"+document.forms[0].organkey.value+" 中吗？";
      if(confirm(msg)){
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
        }
    }
}


</script>
</head>
<body class="mainbg">
<html:form method="post" action="/client/t07_modify_partyorgan_add.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>新建合并信息</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('t07_modify_partyorgan_list.do')"><img src="../../images/blue/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	    <tr  >
              <td >&nbsp;合并机构：</td>
              <td  >
               
			  <input type="text" name="organkey" size="12" value="" class="text_white"/>
			  <input type="text" name="organname" size="30" />
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
				
              </td>
              <td   > 客户类型：</td>
              <td   >  <html:select property="party_class_cd" >
                      <html:options collection="clienttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
            </tr>
               <tr  > 
             <td   > 被合并机构：</td>
              <td  >  
			  <input type="text" name="opp_organkey" size="12" value="" class="text_white"/>
			  <input type="text" name="opp_organname" size="30" />
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=opp_organkey&input_name_disp=opp_organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
				</td>
              <td >客户号: </td>
              <td>          
               <html:text property="party_id" size="10" maxlength="60" />
				                    <html:text property="opp_name" size="30" maxlength="60" readonly="true" />
 				                    <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=opp_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
               
               </td>
               </tr>
	   <tr>
		<td align="center" class="in_button" colspan="4">
	
          <html:button property="button" value="提 交" onclick="checkForm('t07_modify_partyorgan_add_do.do')"/>
		  <input name="" type="reset" value="重 置" />	
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
        
