<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
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
	<html:form action="/hpom/createtable.do" method="POST">
	
	<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>数据装载脚本管理 - 修改</span>
	  <span class="buttons">
	    <a href="javascript:void(0);" onClick="dosubmit('createtable_do.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
		<a href="javascript:void(0);" onClick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
	  
	  </span>
	</div>
    </div>
	<div  class='list'>
	 	<table border="0" cellpadding="0" cellspacing="0">
			<tr align="center">
				<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
				<th width="15%" nowrap>
					英文名				
				</th>
				<th width="15%" nowrap>
					中文名		
				</th>
				<th width="15%" nowrap>
					数据源		
				</th>
				<th nowrap>
					粒度
				</th>
				<th width="15%" nowrap>
					备注		
				</th>
			</tr>
			<logic:notEmpty name="dmtablelist">
				 <logic:iterate id="dto" name="dmtablelist"
					type="com.ist.bmp.hpom.dto.T18_dm_table">
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="selectdmkey" onclick="changcol(this)">
								<bean:write name="dto" property="tableename" />
							</html:multibox>
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="tableename" />
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="tablecname" />
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="dskey" />
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="granularity_disp" />
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="des" />
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