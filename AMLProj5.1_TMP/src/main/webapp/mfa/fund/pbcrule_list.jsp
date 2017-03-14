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

function _Commit1(){
	
    if(checkRadio(document.forms[0].selectedStcr_key)<0){
           alert("请选择！");
           return false;
    }
    else
    {
    	var tag="";
    	var temp =  document.forms[0].selectedStcr_key;
    	for (i=0;i<temp.length;i++)
     	{ 
       	if(temp[i].checked) 
         	tag = tag + temp[i].value + "\n" ;
     	}
     	window.parent.document.forms[0].risk_type_str.value = window.parent.document.forms[0].risk_type_str.value + tag;
   	 	window.parent.ymPrompt.close();
    }
}
function _Commit(theUrl){

	errMsg = CheckBoxMustChecked(document.forms[0]);
	

    if(errMsg!='')
    {
    	alert(errMsg);
        return false;
    }else
    {
    	dosubmit(theUrl);
    }
           

}
function dosubmit(Url)
{
	document.forms[0].action=Url;
    document.forms[0].submit();
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/t13_mfa_deal/stcrlist_search.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>特征列表</span>
					  <span class="buttons">
					    <!--  <a href="#" onclick="javascript:_Commit();"><img src="../../images/blue/b_choose.png" />选定</a> -->
					    <a href="#" onclick="_Commit('stcrlist_search_result.do?net_id=<%=(String)request.getAttribute("net_id")%>');"><img src="../../images/blue/b_choose.png" />选定</a>
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
								特征代码
							</th>
							<th>
								简述
							</th>
						</tr>
						<logic:iterate id="stcr" name="stcrMap" >
						

							<tr>
								<td>
									<html:multibox property="selectedStcr_key">
										<bean:write name="stcr" property="key"  scope="page"/>
									</html:multibox>
								</td>
								<td align="center" nowrap>
									<bean:write name="stcr" property="key"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="stcr" property="value"
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