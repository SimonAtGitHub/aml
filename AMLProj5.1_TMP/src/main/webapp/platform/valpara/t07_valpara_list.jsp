<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<script language="JavaScript">

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].opp_sys_ids)<0){
           errMsg = "请选择！";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].opp_sys_ids)<0){
                errMsg = "请选择！";
            }
            if(errMsg==''){
                if(confirm('你真的要删除所选信息吗？')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Open(url,tag){
  if(tag=="1"){
   
 //  window.open(url,'','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=yes');
  }else{
  // window.open(url,'','height=300, width=500,left=100,top=100,scrollbars=yes,resizable=yes');
   }
   window.open(url);
   window.location.reload();
}

</script>
</head>
<body   class="mainbg">
<div id="main">
<html:form action="/valpara/t07_valpara_list.do" method="post">
<div class="conditions">
<div class="cond_t">
<span> 指标域值参数信息 </span>
<span class="buttons">
<a href="#" id="hdd_display" class="bt_hidden"></a></span>
</div>
<div class="cond_c" id="searchtable">
<table  border=0  cellPadding=0 cellSpacing=0>
  
            <tr  > 
              <td >参数代码：</td>
              <td  >          
             <html:text property="valparakey"  size="20"/>
            </td>
              <td >参数类型：</td>
              <td  >          
              <html:select property="paratype" >
                      <html:options collection="paratypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
            </td>
            </tr>
            <tr>
              <td   > 币种：</td>
              <td   >  <html:select property="curr_cd" >
                      <html:options collection="curr_cdMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
              <td   >&nbsp;公私标志：</td>
              <td  >
              <html:select property="party_cd" >
                      <html:options collection="clienttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
              </td>
            </tr>
            <tr  > 
              <td  > 客户/帐户：</td>
              <td >          
               <html:select property="party_acct_cd" >
                      <html:options collection="alertobjtypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
            </td>
              <td  >是否启用：</td>
              <td  >          
            <html:select property="flag" >
                      <html:options collection="statusMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
         &nbsp;&nbsp;
         
		  
             <input name="ss" type="button" value="查 询" class="in_button1" onclick="dosubmit('t07_valpara_list.do?newsearchflag=1','add')" />
              </td>

            </tr>
             
          
   
</table>
</div>
 
   </div>
  <div class="list">
  <table   border=0   cellpadding="0" cellspacing="0">
    <tr  >
      <th>参数代码</th>
      <th>参数名称</th>
      <th>参数类型</th>
      <th>币种</th>
      <th>公私</th>
      <th>客户/帐户</th>
	  <th>值域上限</th>
      <th>值域下限</th>
	  <th>是否起用</th>
      <th>操作</th>
      
    </tr>
    <logic:present name="t07_valparaList">
<logic:iterate id="para" name="t07_valparaList" indexId="i" type="com.ist.platform.dto.T07_valpara">

    <tr   onmouseover="this.className='interval2'" onmouseout="this.className='interval'">
      <td  >
 
        <a href="#" onclick="_Open('t07_indic_valpara_list.do?valparakey=<bean:write name="para" property="valparakey" />','1')" > 
            <bean:write  name="para" property="valparakey" />
 </a>
      </td>
       <td><bean:write name="para" property="para_des" scope="page"/></td>
      <td><bean:write name="para" property="paratype_disp" scope="page"/></td>
       <td>
      <bean:write name="para" property="curr_cd_disp" scope="page"/></td>
        <td>
      <bean:write name="para" property="party_cd_disp" scope="page"/></td>
      <td><bean:write name="para" property="party_acct_cd_disp" scope="page"/></td>
     
       <td>
         <bean:write name="para" property="upper_limit_disp" scope="page"/>
       </td>
	     <td>
         <bean:write name="para" property="low_limit_disp" scope="page"/>
       </td>
	     <td>
         <bean:write name="para" property="flag_disp" scope="page"/>
       </td>
	     <td>
        <a href="#" onclick="_Open('t07_valpara_modify.do?valparakey=<bean:write  name="para" property="valparakey" />','2')" >
        <img src="../../images/blue/modify.gif" title="修改" /></a>
       </td>
    </tr>
</logic:iterate>
</logic:present>
  </table>
  </div>
 
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
    <tr>
      <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
    </tr>
  </table>
  	<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"></td>
    </tr>
  </table>
 
  <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
	<p>
	  1、域值参数维护用来维护监测特征的参数的上下限值,它针对每个系统规则下的每个指标而设定。<br/>
	  2、域值参数的上下限值直接影响到特征的范围。
	</p>
  </div>
</html:form>
</div>
</body>
</html>
