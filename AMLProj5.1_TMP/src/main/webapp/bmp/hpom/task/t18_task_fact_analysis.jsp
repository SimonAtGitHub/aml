<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language=JavaScript src="../../js/selectbox.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl,type){
		 var errMsg = "";
		 var isSub = false;
		 if(type == 'modi'){		
			 
			 if(RadioMustChecked(document.forms[0])){				
				 errMsg = "请选择";
			}
			 isSub = true;
		}   
		 if(type == 'back'){
			isSub = true;
		}   
	    if(isSub && errMsg==''){
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }else{
	        if(errMsg!='')
	            alert(errMsg);
	        return false;
	    }
	}
	
</SCRIPT>	
</head>

<body class="mainbg">
	<div id='main'>
		<html:form action="/t18_task_fact/t18_task_fact_list.do" method="POST">
    	<div class='conditions'>
	    	<div class="cond_t">
		    	<span>任务分析</span>
		    	<span class="buttons">
		    		<!--<input type="button" value="返 回" onClick="dosubmit('t18_task_fact_list.do','back')"/>-->
		    		<a href="#" onclick="dosubmit('t18_task_fact_list.do','back')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
		    	</span>
	    	</div>
		</div>
	
		<table width="98%" align=center border="1" borderColor="#FFFFFF" cellPadding="1" cellSpacing="1" style="BORDER-COLLAPSE:collapse">
			<tr>
				<td width="60%" valign="top">
		        	<table border="0" cellpadding="0" cellspacing="0">
		            	<tr>
		            		<td>
								<div id="chartdiv" style="border: 0px solid">&nbsp;</div>
								<%String datestr = (String)request.getAttribute("datestr")==null ? "" : (String)request.getAttribute("datestr");%>
									<script>
					
									var exist = "MSLine.swf";
									if (exist != "") {
										var chart1 = new FusionCharts('../../charts/MSLine.swf', 'Chart1Id', '600', '300', '0', '0');										
										chart1.setDataXML('<%=datestr %>');   
										chart1.render("chartdiv");
									}
								</script>
				    	</td>
				  </tr>
		        </table>
	         </td>
			<td width="40%" valign="top">
			<div class="list">
				<table>
					<tr align="center">
						<td nowrap="nowrap">数据时间</td>
							<td nowrap="nowrap">实际耗时（秒）</td>
					</tr>
						<logic:iterate id="dto" name="t18_callogList" type="com.ist.bmp.hpom.dto.T18_callog">
							<tr align="center">
								<td nowrap="nowrap"><bean:write name="dto" property="statisticdate" /></td>
								<td nowrap="nowrap"><bean:write name="dto" property="usetime" /></td>
							</tr>								
						</logic:iterate>
					</table>
			</div>
			</td>
			</tr>
		</table>	
	</html:form>
	</div>
</body>
</html>