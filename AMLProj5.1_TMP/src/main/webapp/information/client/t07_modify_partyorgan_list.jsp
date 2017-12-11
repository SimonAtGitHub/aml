<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
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
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    
    }else if(type=='del'){
    
          errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除选择的客户吗？')){
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


</SCRIPT>

</HEAD>
<BODY leftmargin="0" topmargin="0">
 <div id="main">
<html:form action="/client/t07_modify_partyorgan_list.do" method="post">
 <div class="conditions">
					<div class="cond_t">
   <span>客户归属机构维护</span> 
       
 
    <span class="buttons">   <a href="#" id="hdd_display" class="bt_hidden"></a><a href="#" onclick="dosubmit('t07_modify_partyorgan_add.do','add')"><img
									src="../../images/blue/b_add.png"
									/>增加</a> 
						</span>
					</div>
     <div class="cond_c" id="searchtable">
 <table   border="0" cellpadding="1" cellspacing="0">
         
           
            <tr  >
              <td >&nbsp;合并机构：</td>
              <td  >
               <input type="hidden" name="organname"  />
               <html:text property="organkey_s" size="13" readonly="true"></html:text>
			 
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey_s&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
				
              </td>
              <td   > 客户类型：</td>
              <td   >  <html:select property="opp_pbc_party_class_cd_s" >
                      <html:options collection="clienttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
            </tr>
               <tr  > 
             <td   > 被合并机构：</td>
              <td  >  <input type="hidden" name="opp_organname"  />
              <html:text property="opp_organkey_s" size="13" readonly="true"></html:text>
			  
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=opp_organkey_s&input_name_disp=opp_organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
				</td>
              <td ></td>
              <td  >          
              <input name="ss" type="button" value="查 询" class="in_button1" onclick="dosubmit('t07_modify_partyorgan_list.do?newsearchflag=1','add')" />						
	    
               </td>
            </tr>
           
				
	
          </table> 
          </div>
          </div>
  <html:errors/>
  <div class="list">
  <TABLE   border=0   cellpadding="0" cellspacing="0" >
    <TR  >
      <th >序号</th> 
      <th >合并机构</th>
      <th>被合并机构</th>
	  <Th >客户类型</th>
       <th>客户号</th>
      <th>修改日期</th>
    </TR>
<logic:iterate id="party" name="t47_opp_infoList" indexId="i" type="com.ist.aml.report.dto.T47_party">

    <TR>
     
      <TD><%=i.intValue()+ 1%></TD>
        <TD>
         <bean:write name="party" property="organkey" scope="page"/><bean:write name="party" property="organname" scope="page"/>
       </TD>
	     <TD>
       <bean:write name="party" property="opp_organkey" scope="page"/><bean:write name="party" property="opp_organname" scope="page"/>
       </TD>
	     <TD>
         <bean:write name="party" property="opp_pbc_party_class_cd_disp" scope="page"/>
       </TD>
	     <TD>
         <bean:write name="party" property="party_id" scope="page"/>
       </TD>
        <TD>
         <bean:write name="party" property="create_dt_disp" scope="page"/>
       </TD>
     
    </TR>
</logic:iterate>
  </TABLE>
  </div>
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
    <tr>
      <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
    </tr>
  </table>

</html:form>
</div>
<!--提示块--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 

</BODY>
</HTML>
