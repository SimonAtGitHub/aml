<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
		
	<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var errMsg ="";
    if(type=="del"){
     	errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="mod"){
    errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
    }
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
		if(type=="del"){
			if(confirm('确定删除参数吗?')) {
         		document.forms[0].action=theUrl;
         		document.forms[0].target='_self';
        		document.forms[0].submit();
        		event.srcElement.disabled = true;
        	}
       }else{
        	document.forms[0].action=theUrl;
        	document.forms[0].target='_self';
        	document.forms[0].submit();
        	event.srcElement.disabled = true;
        }
    }
}



function dosubmitChk(theUrl){
   var errMsg ="";
   
   errMsg = CheckBoxMustChecked(document.forms[0]);
   
      
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        	window.open('../../pub/blank.jsp', 'checktest', "scrollbars=yes,toolbar=no,status=yes,resizable=no,MenuBar=no,location=no,top=0,left=0,width= 600,height=400");
	    	document.forms[0].action=theUrl;
        	document.forms[0].target='checktest';
        	document.forms[0].submit();
    }
    
}
function openWin(theUrl,win_name,height,width){	
	
    var top =  (window.screen.availHeight-30-400)/2;
    var left = (window.screen.availWidth-10-750)/2;
    var h,w;
    if(height==undefined){ h = 500 }else{ h = height; }
    if(width==undefined){ w = 600 }else{ w = width; }
   
	var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(theUrl,'',property);     
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
	<html:form method="post" action="/t21_rule/t03_param_org_list.do">
	<html:hidden property="tplakey"/>
	<div class="conditions">
		<div class="cond_t">
			<span>规则管理 - 机构参数列表</span>
			
		</div>
	</div>
     <div class="list">
		<TABLE>
			<TR align=center bgcolor="A3C0EE">
				<TH width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</TH>
				<TH width="18%" align="center" nowrap>
					参数代码
				</TH>
				<TH width="26%" noWrap>
					参数名称
				</TH>
				<TH width="17%" noWrap>
					输入参数类型
				</TH>		
				<TH width="17%" noWrap>
					参数类别
				</TH>		
				<TH width="11%" noWrap>
					操作
				</TH>				
			</TR>

            <logic:iterate id="parinfo" name="t03_param_orgList"  type="com.ist.aml.rule.dto.T03_param_org">
			<TR align="center">
				<TD height=22 nowrap >
					 <html:multibox property="selectParkeys">
								<bean:write name="parinfo" property="parmvalkey" />
				     </html:multibox>
				</TD>
				<TD nowrap>
					P_<bean:write name="parinfo" property="parmvalkey" scope="page" />
				</TD>	
				<TD nowrap>
					<bean:write name="parinfo" property="parmname" scope="page" />
				</TD>			
				<TD nowrap>
					<bean:write name="parinfo" property="samevalue_disp" scope="page" />					
				</TD>	
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />					
				</TD>			
				<TD nowrap>
					<logic:equal value="3" name="parinfo" property="parmtype">
					<a href="###" onclick="openWin('<%=request.getContextPath()%>/rule/t21_rule/t03_param_bsn_argEdit.do?parmvalkey=P_<bean:write name="parinfo" property="parmvalkey" />&tplakey=<bean:write name="t03_param_orgActionForm" property="tplakey" />&deployflag=<%=request.getAttribute("deployflag") %>','')" >编辑参数</a>
				</logic:equal>
				<logic:notEqual value="3" name="parinfo" property="parmtype">
					<a href="###" onclick="openWin('<%=request.getContextPath()%>/rule/t21_rule/t03_param_org_argEdit.do?parmvalkey=<bean:write name="parinfo" property="parmvalkey" />&tplakey=<bean:write name="t03_param_orgActionForm" property="tplakey" />&parmtype=<bean:write name="parinfo" property="parmtype" />&samevalue=<bean:write name="parinfo" property="samevalue" />&isOut=1&deployflag=<%=request.getAttribute("deployflag") %>','')" >编辑参数</a>
				</logic:notEqual>
				</TD>			
			</TR>
			</logic:iterate>
		</TABLE>
		</div>
	</html:form>
	</div>
</BODY>
</html:html>
