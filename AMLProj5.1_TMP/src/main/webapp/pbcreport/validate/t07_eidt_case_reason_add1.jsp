<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="<%=request.getContextPath() %>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="<%=request.getContextPath() %>/js/blank.gif"; </script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet"
			href="<%=request.getContextPath() %>/css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript"
			src="<%=request.getContextPath() %>/js/title.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath() %>/js/basefunc.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath() %>/js/uc.js"></script>
		<%
		String saveflag = (String)request.getAttribute("savesucc");
		if(saveflag==null) saveflag="-1"; // 不是从保存后进入
		else if("1".equalsIgnoreCase(saveflag)) saveflag="1"; // 成功保存后进入
		else saveflag="0";
		 %>

		<script language="JavaScript">
		if("<%=saveflag%>"=="0") alert("保存失败");
		else if("<%=saveflag%>"=="1") alert("保存成功!");
		
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
    
}
function Commit(theUrl){
var errMsg ="";
   //业务标识码
   if (getLength(document.forms[0].ssds.value)==0) {
        errMsg = "可疑行为描述不能为空！";
        document.forms[0].ssds.focus();
   }else if (getLength(document.forms[0].ssds.value)>500) {
        errMsg = "可疑行为描述不能多于500个字符,250个汉字！";
   }
    if (getLength(document.forms[0].tkms.value)==0) {
        errMsg = "采取措施不能为空！";
        document.forms[0].tkms.focus();
    }else if (getLength(document.forms[0].tkms.value)>128) {
        errMsg = "采取措施不能多于128个字符,64个汉字！";
    }
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	   //var obj = window.opener;
       //obj.test1();
	  // window.close();
    }
   
}
function _Click(constant,type){
    var distype="";
    
    var temp=document.getElementsByName("distype"); 
     for (i=0;i<temp.length;i++){ 
        if(temp[i].checked)distype=temp[i].value ;
     }
    if(distype==2){
      if(type==1){
       document.forms[0].ssds.value=document.forms[0].ssds.value+constant;
      }else{
       document.forms[0].tkms.value=document.forms[0].tkms.value+constant;
     }
   }else{
     if(type==1){
       document.forms[0].ssds.value=constant;
      }else{
       document.forms[0].tkms.value=constant;
     }
   }
}
</script>
	</head>

	<body class="mainbg">
		<html:form method="post" action="/validate/modifyNbs_msgDO.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>修改可疑程度等相关信息</span>
						  <span class="buttons">
			 	              <logic:equal value="1" name="closeflag">
									<input type="button" name="button3" class="in_button1"
										value="关 闭" onclick="javascript:window.close();return false;" />
							      </logic:equal>
			            </span>
					
					</div>
					<html:hidden property="reportkey"/>
				
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									可疑程度：
								</td>
								<td>
									<html:select property="ssdg">
										<html:options collection="alert_levelMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									模板加载方式：
								</td>
								<td>
									<input type="radio" name="distype" value="1" />
									覆盖
									<input type="radio" name="distype" value="2" />
									追加
								</td>
							</tr>
							<tr>
								<td>
									可疑行为描述：
								</td>
								<td>
									<html:textarea property="ssds" cols="80" rows="8">
										<bean:write name="t07_nbs_rbifActionForm" property="ssds" />
									</html:textarea>
									<font color="#FF0000">* (认定是否可疑的理由及过程) </font>
								</td>
							</tr>
							<tr>
								<td>
									可疑行为描述模板：
								</td>
								<td>
									<logic:iterate id="temp" name="templetlist" type="com.ist.platform.dto.T07_nbs_templet">
										<logic:equal property="templet_type" name="temp" value="2">
											<input type="radio" name="num" value="<%=temp.getTemplet_num()%>"
												onclick="_Click('<bean:write name="temp" property="templet_constant" />','1')" />
											<bean:write name="temp" property="templet_title" /> &nbsp;
                                        </logic:equal>
									</logic:iterate>
								</td>
							</tr>
							<tr>
								<td>
									采取措施：
								</td>
								<td>
									<html:textarea property="tkms" cols="80" rows="8">
										<bean:write name="t07_nbs_rbifActionForm" property="tkms" />
									</html:textarea>
									<font color="#FF0000">*</font>
								</td>
							</tr>
							<tr>
								<td>
									采取措施模板：
								</td>
								<td>
									<logic:iterate id="temp" name="templetlist" type="com.ist.platform.dto.T07_nbs_templet">
										<logic:equal property="templet_type" name="temp" value="1">
											<input type="radio" name="num1" value="<%=temp.getTemplet_num()%>"
												onclick="_Click('<bean:write name="temp" property="templet_constant" />','2')" />
											<bean:write name="temp" property="templet_title" />&nbsp;
                                        </logic:equal>
									</logic:iterate>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
								<logic:equal value="0" name="closeflag">
									<input type="button" name="button3" class="in_button1"
										value="保 存" onclick="Commit('modifyNbs_msgDO.do')" />
								
									<input type="button" name="Submit4" value="返  回" class="in_button1"
							            onclick="dosubmit('<bean:write name="validbackurl"/>')"/>
							            	<input type="hidden" name="validbackurl" value="<bean:write name="validbackurl" />" />
							      </logic:equal>		      
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</html:form>
	</body>
</html>
