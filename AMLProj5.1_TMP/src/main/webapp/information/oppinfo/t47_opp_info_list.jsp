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
            if(confirm('你真的要删除选择的用户吗？')){
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
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}

</SCRIPT>

</HEAD>
<BODY leftmargin="0" topmargin="0">
 <div id="main">
<html:form action="/oppinfo/t47_opp_info_list.do" method="post">
 <div class="conditions">
					<div class="cond_t">
   <span>交易对手信息 </span> 
       
 
    <span class="buttons">   <a href="#" id="hdd_display" class="bt_hidden"></a><a href="#" onclick="dosubmit('t47_opp_info_add.do','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png"
									/>添 加</a> <a
							href="#" onclick="dosubmit('t47_opp_info_modify.do','modi')" ><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png"
									 />修 改</a>
							<a href="#"   onclick="dosubmit('t47_opp_info_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png"
									 />删 除</a>

						</span>
					</div>
     <div class="cond_c" id="searchtable">
 <table   border="0" cellpadding="1" cellspacing="0">
         
           
            <tr  >
              <td   >&nbsp;客户名称：</td>
              <td  ><html:text property="opp_name_s"   /></td>
              <td   > 客户类型：</td>
              <td   >  <html:select property="opp_pbc_party_class_cd_s" >
                      <html:options collection="clienttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
            </tr>
               <tr  > 
             <td   > 账户类型：</td>
              <td  >  <html:select property="opp_acct_type_cd_s" style="width:200"   onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))" onmouseover="FixWidth(this);">
                      <html:options collection="accttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
              <td  >账号：</td>
              <td  >          
               <html:text property="opp_acct_num_s"   />
               </td>
            </tr>
            <tr > 
             <td  > 证件类型：</td>
              <td  >  <html:select property="opp_card_type_s" style="width:200"   onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))" onmouseover="FixWidth(this);">
                      <html:options collection="card_typeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
              <td >证件号码：</td>
              <td  >
				<html:text property="opp_card_no_s"   />						
									</td>
            </tr>
            <tr  > 
          
               
              <td  >排序：</td>
              <td >
			<html:select property="orderby" >
                <html:options collection="oppsortMap"  property="label" labelProperty="value" />
               </html:select> 
              <html:radio property="order" value="1" />升序
			  <html:radio property="order" value="2" />降序
				</td>
				<td >
				<input name="ss" type="button" value="查 询" class="in_button1" onclick="dosubmit('t47_opp_info_list.do?newsearchflag=1','add')" />						
	    
	 </td>
	 <td></td>
            </tr>
          </table> 
          </div>
          </div>
  <html:errors/>
  <div class="list">
  <TABLE   border=0   cellpadding="0" cellspacing="0" >
    <TR  >
      <th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
      <th >序号</th> 
      <th >客户名称</th>
      <th>客户类型</th>
	  <Th >账号</th>
      <th>账户类型</th>
      <th>证件类型</th>
      <th>证件号码</th>
    </TR>
<logic:iterate id="party" name="t47_opp_infoList" indexId="i" type="com.ist.aml.information.dto.T47_Opp_info">

    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
    <html:multibox property="opp_sys_ids">
    <bean:write  name="party" property="opp_sys_id" />
    </html:multibox>
    </TD>
      <TD><%=i.intValue()+ 1%></TD>
        <TD>
         <bean:write name="party" property="opp_name" scope="page"/>
       </TD>
	     <TD>
         <bean:write name="party" property="opp_pbc_party_class_cd_disp" scope="page"/>
       </TD>
	     <TD>
         <bean:write name="party" property="opp_acct_num" scope="page"/>
       </TD>
	     <TD>
         <bean:write name="party" property="opp_acct_type_cd_disp" scope="page"/>
       </TD>
        <TD>
         <bean:write name="party" property="opp_card_type_disp" scope="page"/>
       </TD>
       <TD>
         <bean:write name="party" property="opp_card_no" scope="page"/>
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
