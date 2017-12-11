<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
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
		 if(type == 'save'){
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
	<html:form action="/t18_task_fact/t18_errorlog_modify_do.do" method="POST">
	<div id='main'>
     <div class='conditions'>
     <div class="cond_t">
     <span>任务错误日志  - 解决</span>
     <span class="buttons">
       		<!--<input type="button" value="保 存" onclick="dosubmit('t18_errorlog_modify_do.do','save')"  />
 			<input type="button" value="返 回" onClick="dosubmit('getT18_task_fact_error.do','back')"/>-->
     	<a href="#" onclick="dosubmit('t18_errorlog_modify_do.do','save')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />保存</a>
     	<a href="#" onclick="dosubmit('getT18_task_fact_error.do','back')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
     </span>
     </div>
	</div>
		<html:hidden property="taskkey"/>
		<html:hidden property="logkey"/>
		<html:hidden property="errtime"/>
	<div class="list">
		<table>
				<tr>
					<td>错误描述：</td>
					<td>
					<html:textarea property="errdes" cols="80" rows="8" readonly="true"></html:textarea>			
					</td>				
				</tr>
				<tr>
					<td>发生时间：</td>
					<td><bean:write name="t18_errorlogActionForm" property="errtime"/></td>				
				</tr>
				<tr>
					<td>解决人：</td>
					<td>
					<bean:write name="t18_errorlogActionForm" property="manager"/>
					<html:hidden property="manager"/>
					</td>					
				</tr>
				<tr>
					<td>解决方案：</td>
					<td>
					<html:textarea property="donemethod" cols="80" rows="8"></html:textarea>				
					</td>				
				</tr>
				<tr>
					<td>解决时间：</td>
					<td><html:text property="donetime"></html:text>
					</td>				
				</tr>
			
		</table>
	</div>
	</div>
	</html:form>
</body>
</html>