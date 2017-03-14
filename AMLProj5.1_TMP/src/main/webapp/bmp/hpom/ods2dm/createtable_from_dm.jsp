<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	pageContext.setAttribute("ctx",request.getContextPath());
%>
<html>`
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/jquery.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/calendar.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/awp_base.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc_report.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/load_window.js"></script>
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
	<html:form action="/hpom/createtable_from_dm.do" method="POST">
	
	<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>数据装载脚本管理 - 修改</span>
	  <span class="buttons">
	    <a href="javascript:void(0);" onClick="dosubmit('createtable_from_dmdo.do','add');return false;"><img src="../../images/<bean:write name="style" scope="session"/>/b_save.png" />保 存</a>
		<a href="javascript:void(0);" onClick="window.close();"><img src="../../images/<bean:write name="style" scope="session"/>/b_shut.png" />关 闭</a>
	  
	  </span>
	</div>
    </div>
    
	<div  class='list'>
	 	<table>
			<tr align="center">
				<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
				<th width="15%" nowrap>
					英文名				
				</th>
				<th width="15%" nowrap>
					中文名		
				</th>
			</tr>
			<logic:notEmpty name="dmtablelist">
				 <logic:iterate id="dto" name="dmtablelist"
					type="com.ist.bmp.hpom.dto.T18_ods2dmetl">
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="selectods2dmkey" onclick="changcol(this)">
								<bean:write name="dto" property="tableename" />
							</html:multibox>
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="tableename" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="tablecname" />
						</TD>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
	</html:form>
	</div>
</body>
</html>