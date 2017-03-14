<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></script>

	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;   
   document.forms[0].submit();
}
function selectSomeone(theForm)
{
 for (var i=0; i<theForm.elements.length; i++)
 {
  var e = theForm.elements[i];
  if ( e.checked )
   return true;
 }
  alert("请做出选择，再进行操作！");
 return false;
}

function checkForm(theUrl){
var boxe1 = document.getElementsByName("selectedplatform");
    var errMsg ="";
    var check1 = new Array();
    var status=document.forms[0].work_status.value;
    if (status=="limit") {
    for (var i = 0; i < boxe1.length; i++)
       {
            if (boxe1[i].checked)
            {
                 check1[check1.length] = boxe1[i].value;
            }
        }
    if(check1.length<1)
     {
       alert("请至少选择一种平台！");
       return false;}}
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}


function disp_rel(obj){
    var disp = document.getElementById("disp_module");    
    if(obj.value=="normal" || obj.value=="upgrade"){         
        document.all("disp_module").style.visibility="hidden";       
    }else if(obj.value=="limit"){
        document.all("disp_module").style.visibility="visible";           
    }
}

</SCRIPT>

</HEAD>

<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/platform/sysconfig/mode_config_modify.do"
			method="post">
			<div class='awp_title'>
				<table>
					<tr>
					
						<td width="23%">
							<span class="awp_title_td2">系统配置 - 运行模式设置</span>
						</td>
						<td align="right">
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="awp_detail">
				<table>
					<tr>
						<td>
							运行模式：
						</td>
						<td>
							<html:select property="work_status" size="1"
								onchange="disp_rel(this)">
								<html:option value="normal">正常模式</html:option>
								<html:option value="limit">受限模式</html:option>
								<html:option value="upgrade">升级模式</html:option>
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>模块选择：
						</td>
						<td>
							<span id="disp_module" style="visibility:hidden" class="css012">
								<logic:iterate id="subList" name="t00_systemMap">
									<logic:iterate id="subList_rows" name="subList"
										type="org.apache.struts.util.LabelValueBean">
										<html:multibox property="selectedplatform">
											<bean:write name="subList_rows" property="label" />
										</html:multibox>
										<bean:write name="subList_rows" property="value" />
									</logic:iterate>
								</logic:iterate> </span>
						</td>
					</tr>




					<tr>
						<td></td>
						<td>


							<html:button value="提 交" property="sub" styleClass="input"
								onclick="checkForm('mode_config_modify_do.do')" />
							<html:reset value="重 填" styleClass="input" />
						</td>
					</tr>

				</table>
				</div>
		</html:form>
		</div>
</BODY>

</html:html>

