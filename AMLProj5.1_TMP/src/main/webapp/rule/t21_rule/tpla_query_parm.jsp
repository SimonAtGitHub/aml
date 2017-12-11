<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
function win_edit(url){
	var	property = 'height=650, width=600,left=100,top=200,scrollbars=yes,resizable=yes';
     window.open(url,'',property);   
}

/**列表中"选择"/"全部"的切换**/
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
	<html:form method="post" action="/t21_rule/t03_page_in_parm_list.do">
	<html:hidden property="tplakey"/>
	<div class="conditions">
		<div class='cond_t'>
		        <span>规则管理 - 参数列表</span>
				<span class="buttons">
	                <a href="javascript:void(0);" onclick="dosubmit('t03_page_in_parm_add.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 建</a>
					<a href="javascript:void(0);" onclick="dosubmit('t03_page_in_parm_modify.do','mod');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
				    <a href="javascript:void(0);" onclick="dosubmit('t03_page_in_parm_delete_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
			    	<a href="javascript:void(0);" onclick="win_edit('get_rule_param_list_in.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />参数编辑</a>
				</span>
			</div>
          </div>
<div class="list">
		<TABLE>
			<TR>
				<TH width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</TH>
				<TH width="18%" align="center" nowrap>
					参数代码
				</TH>
				<TH width="26%" noWrap>
					显示名称
				</TH>
				<TH width="17%" noWrap>
					输入参数类型
				</TH>
				<TH width="11%" noWrap>
					是否必输
				</TH>
				<TH width="9%" noWrap>
					显示序号
				</TH>
			</TR>

            <logic:iterate id="parinfo" name="t03_page_in_parmList"  type="com.ist.aml.rule.dto.T03_page_in_parm">
			<TR >
				<TD height=22 nowrap >
					 <html:multibox property="parmkeys">
								<bean:write name="parinfo" property="parmkey" />
				     </html:multibox>
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
		
		</div>
	</html:form>
	</div>
</BODY>
</html>
