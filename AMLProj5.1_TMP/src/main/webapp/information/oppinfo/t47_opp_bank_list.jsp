<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">

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
<script LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){ 
          errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    
    }else if(type=='del'){
    
         errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除选择的机构吗？')){
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
</script>
</head>
<body leftmargin="0" topmargin="0">
<div id="main">
<html:form action="/oppinfo/t47_opp_bank_list.do" method="post">

  <div class="conditions">
					<div class="cond_t">
   <span>交易对方金融机构信息 </span> 
      <span class="buttons">
  <a href="#" id="hdd_display" class="bt_hidden"></a>
    <a href="#" onclick="dosubmit('t47_opp_bank_add.do','add')" ><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png"
									/>添 加</a> <a
							href="#" onclick="dosubmit('t47_opp_bank_modify.do','modi')" ><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png"
									 />修 改</a>
							<a href="#"   onclick="dosubmit('t47_opp_bank_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png"
									 />删 除</a>

						</span>
					</div>
     <div class="cond_c" id="searchtable">
   <table   border="0" cellpadding="0" cellspacing="0">
         
            
            <tr >
              <td   >&nbsp;金融机构代码：</td>
              <td  ><html:text property="opp_organkey_s"  /></td>
              <td   > 金融机构名称：</td>
              <td   >  <html:text property="opp_orgname_s"  /></td>
            </tr>
               <tr > 
             <td  > 金融机构代码类型：</td>
              <td  >  <html:select property="opp_code_type_cd_s" >
                      <html:options collection="organtypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;</td>
              <td >金融机构所在国家：</td>
              <td  >          
              <html:select property="opp_country_s" >
                      <html:options collection="countryMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
               </td>
            </tr>
             <tr > 
            
              <td  >排序：</td>
              <td  >          
               <html:select property="orderby" >
                <html:options collection="banksortMap"  property="label" labelProperty="value" />
               </html:select> 
              <html:radio property="order" value="1" />升序
			  <html:radio property="order" value="2" />降序	
			  </td>
			  <td  colspan="2" align="center">
			  <center>
			  <input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('t47_opp_bank_list.do?newsearchflag=1','add')"/>
			  </center>
               </td>
            </tr>
          </table> 
   </div>
   </div>
    <div class="list">
  <TABLE  border=0  cellpadding="0" cellspacing="0"  >
    <TR >
     <th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
      <TH>序号</TH> 
      <TH >金融机构代码</TH>
      <th>金融机构名称</TH>
      <th>金融机构代码类型</th>
      <th>金融机构所在国家</th>
      <th>金融机构所在地区</th>
    </TR>

<logic:iterate id="t47_opp_bank" name="t47_opp_bankList" indexId="i" type="com.ist.aml.information.dto.T47_OPP_bank">

    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD  >
      <%String key= t47_opp_bank.getUnionorgkey();
      String type=t47_opp_bank.getUnion_type();
      String value=key+","+type;%>
    <input type="checkbox" name="opp_organkeys" value=<%=value %>>
     </TD>
      <TD><%=i.intValue()+ 1%></TD>
        <TD>
         <bean:write name="t47_opp_bank" property="unionorgkey"/>
       </TD>
	     <TD>
         <bean:write name="t47_opp_bank" property="union_name"/>
       </TD>
	     <TD>
         <bean:write name="t47_opp_bank" property="opp_code_type_cd_disp"/>
       </TD>
	     <TD>
         <bean:write name="t47_opp_bank" property="opp_country_disp" />
       </TD>
        <TD>
         <bean:write name="t47_opp_bank" property="opp_areaname" />
       </TD>
       
    </TR>
</logic:iterate>
  </TABLE>
  </div>
  <div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
  
  
</html:form>
</div>
</BODY>
</HTML>

