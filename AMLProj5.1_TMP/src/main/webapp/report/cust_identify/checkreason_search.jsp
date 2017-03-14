<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">
	   function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
		}
		function checkForm(theUrl,type){
		    var errMsg ="";
		    if(CheckBoxMustChecked(document.forms[0])!=''){
		        errMsg+="请选择您要加入的特征！";
		    }
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
function _Click(){
     var temp=document.getElementsByName("defparakey1");
     for (i=0;i<temp.length;i++)
     { 
       if(temp[i].checked) 
         document.forms[0].tag.value = temp[i].value ;
     }
     alert(document.forms[0].tag.value);
}

function _Commit(){
	
    if(checkRadio(document.forms[0].selectedrisk_No)<0){
           alert("请选择！");
           return false;
    }
    else
    {
    	var tag="";
    	var temp =  document.forms[0].selectedrisk_No;
    	for (i=0;i<temp.length;i++)
     	{ 
       	if(temp[i].checked) 
         	tag = tag + temp[i].value + "\n" ;
     	}
     	window.parent.document.forms[0].risk_type_str.value = window.parent.document.forms[0].risk_type_str.value + tag;
   	 	window.parent.ymPrompt.close();
    }
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/cust_identify/check_reason_list.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>识别原因定位</span>
					  <span class="buttons">
					   <!--  <a href="#" onclick="checkForm('check_reason_locate.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a> -->
					    <a href="#" onclick="javascript:_Commit();"><img src="../../images/blue/b_choose.png" />选定</a>
	                    <a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
					  </span>
					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								选择
							</th>
							<th>
								编号
							</th>
							<th>
								原因名称
							</th>
						</tr>
						<logic:iterate id="t10_check_reason" name="t10_check_reasonList"
							type="com.ist.aml.cust_identify.dto.T10_checkparty_fun">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("risk_no", t10_check_reason.getRisk_no());
										pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedrisk_No">
										<bean:write name="t10_check_reason" property="risk_no" />--<bean:write name="t10_check_reason" property="risk_name" />
									</html:multibox>
								</td>
								<td align="center" nowrap>
									<bean:write name="t10_check_reason" property="risk_no"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t10_check_reason" property="risk_name"
										scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
           </div>
		</html:form>
	</body>
</html>