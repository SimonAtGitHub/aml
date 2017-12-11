<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 <script type="text/javascript"> 
 
 function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  
  if(type=='modi'){
     for(i=0;i<document.all.tx_cd_id.length;i++){
        if(document.all.tx_cd_id[i].checked==true){
           errMsg = "";
           document.all.tx_cd_id.value = document.all.tx_cd_id[i].value;
           break;                      
           }else{ 
              errMsg = "请选择!";  
        }             
     }
     isSub = true;
    } 
    else if(type=='search' || type=='add'){
       isSub=true;
    }
    
    if(isSub && errMsg==''){
    // alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
 
 function doshift(type){
      if(type=='1'){
      document.all.button3.style.display=""; 
      document.all.button2.style.display="none";      
      }else{
       document.all.button2.style.display="";
       document.all.button3.style.display="none";
      }
 }
 
 function dochenge(theUrl){
    //  errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
       //   if(errMsg!=''){
   //   alert(errMsg);
   //   return false;
   //   }
      
     //alert(checkRadio(document.forms[0].tx_cd_id));
       if(checkRadio(document.forms[0].tx_cd_id)< 0){
           	errMsg = "请选择";
           	alert(errMsg);
           	return false
        }
     document.forms[0].action=theUrl;
     document.forms[0].submit();
 }
</script>
</head>
<body leftmargin="0" topmargin="0">
<div id="main">
<html:form action="/t87_tx_cd/t87_tx_cd_list.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>
   交易代码信息 </span> 
       	  <span class="buttons" >
       	     <a href="#" id="hdd_display" class="bt_hidden"></a>
	   <a href=" #" onclick="dosubmit('t87_tx_cd_add.do','add')" ><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	   <a href="#"  onclick="dosubmit('t87_tx_cd_modify.do','modi')" ><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
  <a id="button2" href="#"   onclick="dochenge('t87_tx_cd_shift_do.do?type=1')" ><img   src="../../images/<%=session.getAttribute("style") %>/b_effective.png" />有 效</a>
  <a id="button3" href="#"  onclick="dochenge('t87_tx_cd_shift_do.do?type=0')" ><img  src="../../images/<%=session.getAttribute("style") %>/b_disable.png" />无 效</a>
 
 </span>
 </div>
   <div class="cond_c"  id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >
       
            <tr  >
              <td  >&nbsp;核心交易代码：</td>
              <td  ><html:text property="tx_cd_s" maxlength="30"  /></td>
              <td  > 交易代码名称：</td>
              <td  >  <html:text property="tx_name_s"   maxlength="30"/></td>
            </tr>
               <tr  > 
             <td >&nbsp;交易方式：</td>
              <td  >
              <html:select property="tx_team" style="width:150" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                      <html:options collection="tx_teamMap" property="label" labelProperty="value" />
                 </html:select> 
                   <html:select property="tx_falg" style="width:150" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                      <html:options collection="tx_flagMap" property="label" labelProperty="value" />
                 </html:select> 
               </td>
              <td  >是否有效：</td>
              <td  >          
               <html:select property="flag_s" style="width:150" onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
                      <html:options collection="flagMap" property="label" labelProperty="value" />
                 </html:select> 
                  <input name="ss" type="button" value="查 询" class="in_button1" onclick="dosubmit('t87_tx_cd_list.do?newsearchflag=1','add')" />	
                    </td>
            </tr>
            <tr >
            </tr>
    </table>
   </div>
   </div>
  <html:errors />
    <div class="list">
  <table  border="0"   cellpadding="0" cellspacing="0"  >
    <tr  >
      <th>选择</th>
      <th>序号</th>
      <th>核心交易代码</th>
      <th>交易代码名称</th> 
       <th>现钞标志</th>
       <th>交易方式</th>
        <th>是否有效</th>
    </tr>
<logic:iterate id="t87_tx_cd" name="t87_tx_cdList" indexId="i" type="com.ist.platform.dto.T87_tx_cd">

    <tr align="center" bgcolor="#FFFFFF">
      <td height="22">
         <input type="radio" name="tx_cd_id" value="<bean:write name="t87_tx_cd" property="tx_cd" />"
                onclick="doshift('<bean:write name="t87_tx_cd" property="flag" />')"/>         
      </td>      
       <td>
         <%=i.intValue()+ 1%>
       </td>
       <td>
         <bean:write name="t87_tx_cd" property="tx_cd" scope="page" />
       </td>
	   <td>
         <bean:write name="t87_tx_cd" property="tx_name" scope="page" />
       </td>
        <td>
         <bean:write name="t87_tx_cd" property="tx_falg" scope="page" />
       </td> 
        <td>
         <bean:write name="t87_tx_cd" property="tx_team" scope="page" />
       </td>
         <td>
         <bean:write name="t87_tx_cd" property="flag_s" scope="page" />
       </td>
    </tr>
</logic:iterate>
  </table>
  </div>
  <div class="list_page">
					<logic:present name="pageInfo">
						<table width="98%" align="center" border="0" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
</html:form>
</div>

<div id="div_hint" style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
</body>
</html>