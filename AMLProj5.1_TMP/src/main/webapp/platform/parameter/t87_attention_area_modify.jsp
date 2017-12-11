<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/App_Select.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
   
	 
	<%
	String sItem2 = "";
	%>

	<logic:iterate id="area" name="areaList"
		type="com.ist.platform.dto.T87_PBC_AREA">
		<%
					String upId = area.getPbc_up_areakey();
					String areaId = area.getPbc_areakey();
					String areaName = area.getPbc_areaname();
					String idname2 = upId + "@" + areaId + "#" + areaName;
					sItem2 = sItem2 + ",\"" + idname2 + "\"";
		%>
	</logic:iterate>
	<%
				if (!sItem2.equals("")) {
				sItem2 = sItem2.substring(1);
			}
	%>
	<script language="JavaScript">
//将字符串转化成javascript中的数组

arrItem=new Array(<%=sItem2%>);
function _Click(fromstr,tostr){
   changelocation(fromstr,tostr,arrItem);
}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{

        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function  _Disp(){
     var index=document.forms[0].country.selectedIndex; 
   var selvalue=document.forms[0].country.value;
   if(selvalue=="CHN"){
     document.all.org_before.style.display="";
     document.all.org_modify.style.display="";
   }else if(selvalue!="" && selvalue!="CHN" ){
   	 document.all.org_before.style.display="none";
     document.all.org_modify.style.display="none";
   }
}

</script>
</head>
<body  class="mainbg" >
<html:form method="post" action="/parameter/t87_attention_area_add_do.do">
		<div id="main">
		  <div class="conditions">
		  	<div class="cond_t">
		  	 <span>
		 地区维护- 修改地区 </span>
		 <span class="buttons">
	   <a href="#" onclick="dosubmit('t87_attention_area_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
				 
		<html:errors />
		<html:hidden property="orgin_area_id"></html:hidden>
			<div class="cond_c2">
		<table>
			 
				<tr>
					<td  >
						所属国家:
					</td>
					<td  >
					 
						<html:select property="country" onchange="_Disp()">
							<html:option value="CHN">中国</html:option>
							<html:options collection="countryMap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<logic:equal name="t87_attention_areaActionForm" property="country"
					value="CHN">
					<tr id="org_before">
				</logic:equal>
				<logic:notEqual name="t87_attention_areaActionForm"
					property="country" value="CHN">
					<tr  style="display:none " id="org_before">
				</logic:notEqual>
				<td>
					原所属地区名称:
				</td>
				<td>
					<html:text property="area_des" styleClass="text_white" size="25"
						readonly="true" />
				</td>
			

				<logic:equal name="t87_attention_areaActionForm" property="country"
					value="CHN">
					<tr id="org_modify">
				</logic:equal>
				<logic:notEqual name="t87_attention_areaActionForm"
					property="country" value="CHN">
					<tr style="display:none " id="org_modify">
				</logic:notEqual>
				<td >
					修改所属地区名称:
				</td>
				<td>
					<html:select property="province"
						onchange="_Click('province','city')">
						<html:options collection="provinceMap" property="label"
							labelProperty="value" />
					</html:select>
					&nbsp;&nbsp;

					<html:select property="city" onchange="_Click('city','town')">
						<option value="-1">
							请选择
						</option>
					</html:select>
					&nbsp;&nbsp;
					<html:select property="town">
						<option value="-1">
							请选择
						</option>
					</html:select>
				</td>
				

				<tr  >
					<td  >
						地区类型：
					</td>
					<td  >
						<html:multibox property="area_type_cd1">
                    	1
                    </html:multibox>
						<bean:write name="t87_attention_areaActionForm"
							property="area_type_cd1_disp" />
						<html:multibox property="area_type_cd2">
                    	2
                    </html:multibox>
						<bean:write name="t87_attention_areaActionForm"
							property="area_type_cd2_disp" />
						<html:multibox property="area_type_cd3">
                    	3
                    </html:multibox>
						<bean:write name="t87_attention_areaActionForm"
							property="area_type_cd3_disp" />
						<html:multibox property="area_type_cd4">
                    	4
                    </html:multibox>
						<bean:write name="t87_attention_areaActionForm"
							property="area_type_cd4_disp" />
						<html:multibox property="area_type_cd5">
                    	5
                    </html:multibox>
						<bean:write name="t87_attention_areaActionForm"
							property="area_type_cd5_disp" />
					</td>
				</tr>

				<tr  >
					<td  >&nbsp;
						
					</td>
					<td colspan="4" align="center" class="in_button">
					
						<html:button property="button" styleClass="input" value="提 交"
							onclick="checkForm('t87_attention_area_modify_do.do')" />
						<html:reset styleClass="input" value="重 置" />
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
 