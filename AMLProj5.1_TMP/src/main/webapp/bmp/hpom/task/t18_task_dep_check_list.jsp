<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type == 'modi'){		
		 if(CheckBoxMustChecked(document.forms[0])){				
			 errMsg = "请选择";
		}
		 isSub = true;
	}   
    else if(type=='search'){
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
		function taskanalysis(theUrl){
			 document.forms[0].action=theUrl;
		      document.forms[0].submit();	

		}
  function open_relation(theUrl){
  	 var property = 'height=500, width=600,left=200,top=200,scrollbars=yes,resizable=yes';
     window.open(theUrl,'',property); 
  }
</SCRIPT>
	</head>

	<body>
		<div id='content'>
			<html:form action="/t18_tasklist/t18_task_dep_check.do" method="post">
				<div class='awp_title'>
					<table>
					<tr>
						<td>
							<span class="awp_title_td2">依赖关系列表</span>
						</td>
						<td width="84%" align="right">
							<input type="button" name="btsearch2" value="返 回"
								onclick="history.back();" />
						</td>
					</tr>
				</table>
				</div>
				
				
				<bean:define id="depHtmlStr" name="depHtmlStr"></bean:define>
				<logic:notEmpty name="depHtmlStr">
					 <div class="awp_taskrely">
		             	<%=depHtmlStr %>
					</div>
				</logic:notEmpty>
			</html:form>
		</div>
	</body>

</html>