<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
 <script type="text/javascript" src="../../js/ymPrompt.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
</head>
<body>
	<html:form action="/insidereport/finance_query.do" enctype="multipart/form-data" method="post">
		<label>上传:</label>&nbsp;<input type="file" name="file_upload" /><br /><input type="submit" value="提交"/><br />

		<select>
			<logic:iterate name="lists" id="o">
		       <li><bean:write name="o" /></li>
		    </logic:iterate>
		</select><button>匹配</button>
		<br />
		<button>下载</button>
		
	</html:form>
</body>
</html>

