<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    
	if(type=='search' || type=='add'){
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

<body >
<div id='content'>
	<html:form action="/hpom/getserver_content.do" method="POST">
    <div class='awp_title'>
     <table>
       <td><span class="awp_title_td2">获取服务器脚本</span></td>
       <td width="84%" align="right">
			<input type="button" value="保 存" onClick="dosubmit('createtable_from_odsdo.do','add')"/>			
			<input type="button" value="关 闭" onClick="window.close();"/>
		</td>
      </tr>
     </table>
	</div>
	 <div class="awp_detail">
                 <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                      <td width="47%" height="30" align="left"> 本地脚本： </td>
                      <td width="6%" height="30" align="center"></td>
                      <td height="30" align="left" width="47%"> 服务器脚本： </td>
                    </tr>
                    <tr >
                      <td  align="center">
                      	  <html:textarea property="shcontent" cols="7" rows="30"  readonly="true"></html:textarea>
                      </td>
                      <td  height="30" align="center">
	                      <input type="Button" name="Input" value=" &lt;&lt; 拷贝" class="input" onClick="moveSelectedOptions(this.form['righttablist'] , this.form['lefttablist'])" />
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                       <input type="Button" name="Input" value=" >> 上传" class="input"  onClick="moveSelectedOptions(this.form['lefttablist'],this.form['righttablist'])" />
                      </td>
                      <td >
                      	 <html:textarea property="server_content" cols="7" rows="30" styleClass="text_white" readonly="true"></html:textarea>
                      </td>
                    </tr>
                </table>
          </div>
	</html:form>
	</div>
</body>
</html>