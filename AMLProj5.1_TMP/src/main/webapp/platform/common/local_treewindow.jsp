<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<SCRIPT LANGUAGE="JavaScript">
		function test(){
				var awp_chk = document.getElementsByName('awp_tree');
				var sel_key = document.getElementById('problemsCode');
				var sel_val = document.getElementById('problemsText');
			    var val = "";
				var key = "";
				var len = awp_chk.length;
				for (var i = 0; i < len; i++){
					if(awp_chk[i].checked){
						key += ","+awp_chk[i].value;
						val += ","+awp_chk[i].disp_val;
					}
				}
				sel_key.value=key.substr(1);
				sel_val.value=val.substr(1);
			}
		 
		
		function topWin(){
					window.focus();
			}
		  function dosubmit(theUrl){
		
		  		var awp_chk = document.getElementsByName('awp_tree');
				var sel_key = document.getElementById('problemsCode');
				var sel_val = document.getElementById('problemsText');
			    var val = "";
				var key = "";
				var len = awp_chk.length;
				for (var i = 0; i < len; i++){
					if(awp_chk[i].checked){
						key += ","+awp_chk[i].value;
						val += ","+awp_chk[i].disp_val;
					}
				}
				sel_key.value=key.substr(1);
				sel_val.value=val.substr(1);
				if(sel_key.value==""){
				
					alert("请选择！");
				}else{
					document.forms[0].action=theUrl+'&selectedkey='+key.substr(1);
			    	document.forms[0].submit();
				}
		    
			}
			
		  function checkForm(theUrl,type){
		    var errMsg ="";
		    if(getLength(document.forms[0].organkey.value)==0){
		        errMsg+="请选择您要加入机构号！";
		    }
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>数据项菜单</title>
	
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>
			<link id="skincss" href="../css/aml_blue.css" rel="stylesheet" type="text/css" />
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<html:form action="/common/location_treewindow.do" method="post">
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
						<input type="hidden" id="problemsText" name="names" value="" 
							/>
						<input type="hidden" id="problemsCode" name="selectedkey" value=""
							size="30" />
			<%
			              String output = (String) request.getAttribute("output_tree");
			            out.print(output);
			%>
			<SCRIPT language=javascript>
			var OpenedWin = null;
			function myload2()
			{
					if (navigator.appName == "Netscape")
			    {
			    	document.actionbar.pageY=108;
						document.actionbar.pageX=10;
						//window.screen.width-100;
						mymove2();
					}
					else
					{
						actionbar.style.top=108;
						actionbar.style.left=10;//window.screen.width-100
						mymove2();
					}
			}
			document.ns = navigator.appName == "Netscape"
			var a
			var b
			var x=0
			function mymove2()
			{
			 		window.screen.width>800 ? a=200:a=0
			 		b=window.screen.width
			 		if(document.ns)
			 		{
			 			document.actionbar.top=pageYOffset;//pageYOffset+270+a
			 			document.actionbar.left=10;//b-100
			 			setTimeout("mymove2();",1)
			 		}
			 		else
			 		{
			 			actionbar.style.top=document.body.scrollTop+380;//document.body.scrollTop+270+a
			 			actionbar.style.left=450;//b-130
			 			setTimeout("mymove2();",1)
			 		}
			}
					</SCRIPT>
								<!--begin float-->
								<SCRIPT language=javascript>
						
					if (navigator.appName == "Netscape")
							
					{document.write("<layer align=center id=actionbar top=180 width=770>");
					}
						else
							
					{document.write("<div align=center id=actionbar style='position:absolute;height:40;width:770;top:180;left:-100;visibility: visible;z-index: 1'>");
					}
					
					</SCRIPT>
						<table align="left">
							<tr>
								<td>
									<c:if test="${fromtype eq 't17UserOrg'}">
										<input type='button' class="in_button1" value="确 定" 
											onclick="dosubmit('<%=request.getContextPath()%>/ldrp/parameter/addT17_org_user_mapping_do.do?fromoper=<%=request.getAttribute("fromoper") %>&currencyflag=<%=request.getAttribute("currencyflag") %>&username=<%=request.getAttribute("username") %>')" />
									</c:if>
									<c:if test="${fromtype == null || fromtype == ''}">
										<input type='button' class="in_button1" value="确 定" 
										onclick="dosubmit('location_treewindow_result.do?groupkey=<%=request.getAttribute("groupkey") %>')" />
									</c:if>
								</td>
								<td>
									<input type="button" class="in_button1" name="reset" value="重 选"
										onclick="_resetAll();" />
								</td>
							</tr>
						</table>
						<SCRIPT language=javascript>
				if(navigator.appName == "Netscape")
					{document.write("</layer>");
			myload2();
			}
				else
					{document.write("</div>");
			myload2();
			}
			</SCRIPT>
		</html:form>
	</body>
</html>
