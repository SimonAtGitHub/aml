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
    if(document.forms[0].country.value==""){
    	errMsg="所属国家不能为空！";
    }else if (document.forms[0].country.value=="CHN"&&getLength(document.forms[0].province.value)==0){
       errMsg="地区不能为空！";
    }
   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
    // for (i=0;i<document.all.length ;i++ )
        //   {
          //   e=document.all[i];
          //   alert(e.type);
           //  if(e.type=="text" ||e.type=="select-one"){
               
              //   var textname=e.name;
              //   var obj=eval('document.forms[0].'+textname);
                
              
                // if(obj.disabled==true){
                 
                //    obj.disabled=false;
                // }
            // }
            
           
          //  }

        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function  _Disp(){
     var index=document.forms[0].country.selectedIndex; 
   var selvalue=document.forms[0].country.value;
   if(selvalue=="CHN"){
    document.all.org.style.display="";
   }else if(selvalue!="" && selvalue!="CHN" ){
     document.all.org.style.display="none";
   }
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
		
	}
}
function _Open(url){
  window.open(url);
}


function _alert(){
	document.all.province.value='';
}
</script>
</head>
<body  class="mainbg" onload="_alert();">
<html:form method="post" action="/parameter/t87_attention_area_add_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
		          <span>  地区维护- 新建地区 </span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('t87_attention_area_list.do?newsearchflag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"  />返回</a>
	  </span>
	</div>		 
	<html:errors />
		<div class="cond_c2">
		<table   border="0"  >
		 
				<tr>
					<td>
						所属国家:
					</td>
					<td  >
						&nbsp;
						<html:select property="country" onchange="_Disp()">
							<html:option value="CHN" >中国</html:option>
							<html:options collection="countryMap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
				</tr>
					<tr id="org" style="display:none ">
						<td >
							所属地区名称:
						</td>
						<td >
							&nbsp;
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
					</tr>
				<tr>
					<td >
						地区类型：
					</td>
					<td >
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
					<td>&nbsp;
						
					</td>
					<td colspan="4" align="center" class="in_button">
						<html:button property="button"  value="提 交"
							onclick="checkForm('t87_attention_area_add_do.do')" />
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