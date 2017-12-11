<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		
		
<script type="text/javascript">
 function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        
        if(type=='search' || type=='add'){
       
            isSub = true;
        } 
  		 else if(type=='mod'){
  
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
           
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('确定要删除选择的资金网络吗？')){
                    isSub = true;
                }
            }
        }
 	if(isSub && errMsg=='')
    {
        document.forms[0].action=theUrl;
       
        if(jQuery('#form0').validateAll()){
        
	          document.forms[0].submit()
	         }
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function getSelectId(){
 var errMsg = "";
  errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	var selected_id2=document.getElementsByName("selectedNetId");
	var net_id = "";
	for (var i=0;i<selected_id2.length;i++){
	  if(selected_id2[i].checked){
	     net_id=selected_id2[i].value;
	     break;}
	}
	 if(errMsg!='')
            alert(errMsg);
     if(errMsg==''){
	window.open('<%=request.getContextPath()%>/report/nb/t47_transaction_search.do?searchtype=all&net_id='+net_id,'enter2','height=400, width=1100,left=100,top=100,scrollbars=yes,resizable=yes');
	}
}


</script>
<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全 清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全 选");
	  });
});
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/nb/t13_mfa_nb_search.do" method="post"  styleId="form0" enctype="multipart/form-data">

<div class="main">
	<div class="conditions">
	<!-- title -->
					<div class="cond_t">
						<span>资金网络管理</span>			
					</div>
					<div class="cond_t2">
						<span class="buttons">
						 <a href="#" id="hdd_display" class="bt_hidden"></a>  
						  <span class="buttons"> <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a>
						 <a href="#"
							onClick="dosubmit('t13_mfa_nbadd.do','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> 
						 <a href="#" onClick="dosubmit('t13_mfa_nbmodify.do','mod')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a> 
						<a href="#" onClick="dosubmit('t13_mfa_nbdelete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
<!--						<a href="#"-->
<!--							onClick="window.open('<%=request.getContextPath()%>/report/nb/t47_transaction_search.do?searchtype=all&net_id=<%=request.getAttribute("net_id") %>','enter2','height=400, width=1100,left=100,top=100,scrollbars=yes,resizable=yes')"><img-->
<!--									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添加交易</a> -->
						<a href="#"
							onClick="getSelectId()"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添加交易</a> 
						</span>
					</div>

	<div class="cond_c" id="searchtable">
    <table border="0" cellpadding="0" cellspacing="0">
   		
		 <tr>
		 	<td width="10%" height="22" align="right">网络编号：</td>
		 	<td width="40%" bgcolor="F6F9FF"> <html:text property="net_id" styleClass="text_white"/></td>
		    
            <td width="10%" height="22" align="right">网络名称：</td>
            <td width="40%" bgcolor="F6F9FF"> <html:text property="net_name" styleClass="text_white" /></td>
         </tr>
            <tr>
            <td width="10%" height="22" align="right">归属机构：</td>     
            <td>
									<html:text property="organkey" size="7" onblur="_Onblur('organkey_disp')" require="false" datatype="number|limit_max" max="9" msg="请输入数字|不能超过9个数字" />
									<html:text property="organkey_disp" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organkey_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
           <td>
           <input type="button" name="button1" class="in_button1"
										value="查 询"
										onclick="dosubmit('t13_mfa_nb_search.do?newsearchflag=1','search')" />
           	 
             	
           </td>
         </tr>
    </table>
    </div>
   
   
    <div class="list">
    <table>
    <tr>
      <th>选择</th>
<%--      <th>网络编号</th>--%>
	  <th>网络名称</th>
	  <th>视图模式</th>
	  <th>显示模式</th>
<%--	  <th>是否新增</th>--%>
	  <th>归属机构</th>
    </tr>
   
    <logic:iterate id="t13_mfa_nb" name="t13_mfa_nblist" type="com.ist.aml.nb.dto.T13_mfa_nb" indexId="i" scope="request">
    
								<%
											java.util.HashMap map = new java.util.HashMap();
											String url = "/report/nb/t13_mfa_nb_list.do?newsearch="
																+ request.getParameter("newsearch");
														map.put("url", url);
											map.put("net_id", t13_mfa_nb.getNet_id());
														map.put("intPage", request
																.getParameter("intPage"));
											pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
								%>
	<tr align="center" class="interval"
									onmouseover="this.className='interval2'"
									onmouseout="this.className='interval'">
	     <TD>
	     <html:multibox property="selectedNetId" > <bean:write name="t13_mfa_nb" property="net_id"  scope="page"/></html:multibox> 
													
		</TD>
<%--		<TD align="center" height=22>--%>
<%--		<a href="#" onclick="window.open('<%=request.getContextPath()%>/mfa/mfa_issue/MFA.html?isCustom=1&net_id=<bean:write name="t13_mfa_nb" property="net_id" />','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" /><bean:write name="t13_mfa_nb" property="net_id" scope="page"/></span></a>--%>
<%--			--%>
<%--		</TD>--%>
		<TD align="center" align="center">		
			
			<a href="#" onclick="window.open('<%=request.getContextPath()%>/mfa/mfa_issue/MFA.html?isCustom=1&net_id=<bean:write name="t13_mfa_nb" property="net_id" />','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><bean:write name="t13_mfa_nb" property="net_name" scope="page" /></a>
		</TD>
		<TD align="center" align="center">
			<bean:write name="t13_mfa_nb" property="view_mode_disp" scope="page" />
		</TD>
		<TD align="center" align="center">
			<bean:write name="t13_mfa_nb" property="display_mode_disp" scope="page" />
		</TD>
<%--		<TD align="center" align="center">--%>
<%--			<bean:write name="t13_mfa_nb" property="is_new" scope="page" />--%>
<%--		</TD>--%>
		<TD align="center" align="center">
			<bean:write name="t13_mfa_nb" property="organkey" scope="page" />
		</TD>
	</tr>
	</logic:iterate>
    </table>
    
    </div>
    
    <div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
	 </div>
     </div>
     </div>
    </html:form>
</body>
</html>