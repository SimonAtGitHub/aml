<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
		/**�б���"ѡ��"/"ȫ��"���л�**/
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
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
      if(!_isDateSpaceComplete(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)){
    	    document.forms[0].apply_dt_start_disp.focus();
	 		errMsg = "����д��������ʼʱ�䷶Χ��";
          }  
      else if(!_compareTwoDateForString(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)) {
   			document.forms[0].apply_dt_start_disp.focus();
	 		errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";		    
		   } 
		   isSub = true;
    }if(type=='update'){
    errMsg = CheckBoxMustChecked(document.forms[0]);
        isSub = true;
    }
    if(type== 'pro'){
    	if(confirm('ȷ�������ļ���')){
    	 isSub = true;
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






function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
		<html:form action="/pbc/getT1q_pbc_approveList.do" method="post">
			<html:errors/>
				<div class="conditions">
					<div class="cond_t">
						<span> ������ȡ������ѯ</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
							<a href="#" onclick="dosubmit('getT1q_pbc_approveSave.do','update')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_pass.png" />����ͨ��</a> 
									
									
						<!-- 	<a href="#" onclick="dosubmit('getT1q_pbc_approvePass.do','update')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_pass.png" />����ͨ��</a> -->
						</span>
						
					</div>
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							    <td>
									�����ˣ�
								</td>
								<td>
									<html:text property="apply_user" maxlength="20"/>
								</td>
								<td align="right">
										����������
									</td>
									<td bgcolor="F6F9FF">
								<html:text property="organkey" size="10" onblur="_Onblur('organName')"/>
									<html:text property="organName" size="15" readonly="true" />&nbsp;
								<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
							</tr>
							<tr>
								<td>��ȡ��ţ�</td>
								<td >
									<html:text property="tb_id" maxlength="20"/>
								</td> 
								<td>
									����ʱ�䣺
								</td>
								<td>
								<html:text property="apply_dt_start_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
								--
								<html:text property="apply_dt_end_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
								
							<input type="button" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/datacheck/pbc/getT1q_pbc_approveList.do?newsearchflag=2','search');"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
							 <TH width="3%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</TH> 
 							 <th>��ȡ���</th>     
  							 <th>��������</th> 
  							 <th>�������</th> 
  							 <th>���ݿ�ʼ����</th>   
  							 <th>���ݽ�������</th>   
  							 <th>������</th>   
  							 <th>����ʱ��</th>   
  							 <th>�����ļ�״̬</th> 
  							 <th>״̬</th> 
  							 <th>����</th>  
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
							<TD height=22>
									<html:multibox property="select_rulekey">
										<bean:write name="ta_pbc_apply" property="tb_id" />
									</html:multibox>
								</TD>
								<TD>
									<!-- <a href="#" onclick="window.open('getT1q_pbc_applyCheck.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />,'enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><bean:write name="ta_pbc_apply" property="tb_id" /></a> -->
									<a href="#" onclick="window.open('getT1q_pbc_applyCheck.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><bean:write name="ta_pbc_apply" property="tb_id" /></a>	
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="organName" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_organname" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_dt_start" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_dt_end" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_user" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_dt_disp" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="isfile_disp" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_status_disp" />
								</TD>
								<td>
								    <a href="#" onclick="window.open('getT1q_pbc_approveReturn.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><img
									src="../../images/blue/b_passnot.png" />�˻�</a>	
								</td>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
