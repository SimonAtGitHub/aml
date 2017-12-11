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

	<body class="mainbg">
		<div id='main'>
			<html:form action="/t18_tasklist/t18_task_dep_check.do" method="post">
			<div class='conditions'>
				<div class='cond_t'>
					<span>依赖关系列表</span>
					<span class="buttons">
						<a href="#" onclick="history.back();"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
					</span>
				</div>
		 	</div>
				
				
				<bean:define id="depHtmlStr" name="depHtmlStr"></bean:define>
				<logic:notEmpty name="depHtmlStr">
					 <div class="aml_taskrely">
		             	<%=depHtmlStr %>
					</div>
				</logic:notEmpty>
			</html:form>
		</div>
	</body>

</html>