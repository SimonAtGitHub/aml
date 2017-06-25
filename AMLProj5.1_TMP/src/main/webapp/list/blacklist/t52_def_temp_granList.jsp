<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>

		
		<SCRIPT LANGUAGE="JavaScript">
function fPopUpCalendarDlg1(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function selectORClearBox(_form,_setval){
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	

function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    
    }else if(type=='add'|| type=='search'){
        isSub = true;
    }
    else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要禁用该模板？')){
                isSub = true;
            }
        }
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
function selectORClearBox(_form,_setval){
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}

function _Commit(tempname,theUrl)
{
	document.forms[0].templatename.value=tempname;
	
	 document.forms[0].action=theUrl;
        document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<body class="mainbg">
	<html:form action="/blacklist/t52_def_temp_gran.do" method="post">
	<html:hidden property="templatekey" />
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
			<!-- title -->
				<div class="cond_t">
					<span>模板SQL定义</span>
						
					<span class="buttons"> 
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onClick="dosubmit('t52_def_temp_gran_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />添 加</a> 
						<a href="#" onClick="dosubmit('t52_def_temp_gran_mod.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
						<a href="#" onClick="dosubmit('t52_def_temp_gran_del.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_copy.png" />删 除</a>
					</span>
				</div>
				
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>
									选择
								</th>
								<th>
									sql编码
								</th>
								<th>
									查看sql
								</th>
							</tr>
							<logic:present name="granList">
								<logic:iterate id="gran" name="granList" type="com.ist.aml.blacklist.dto.T52_def_temp">
									<tr>
										<td>
											<html:multibox property="sqlkeys">
												<bean:write name="gran" property="sqlkey" />
											</html:multibox>
										</td>
										<td>
											<bean:write name="gran" property="sqlkey" />
										</td>
										<td>
											<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/list/blacklist/t52_def_temp_sqlList.do?sqlkey=<bean:write name="gran" property="sqlkey" />','search')"><img src="../../images/<%=session.getAttribute("style")%>/b_caseinfo.png" title="详细信息" /></a> 
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
						</table>
					</div>
				</div>
				</div>
		</html:form>
	</body>
</HTML>
