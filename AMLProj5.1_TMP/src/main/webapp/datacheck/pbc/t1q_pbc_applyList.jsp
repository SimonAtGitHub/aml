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

		<script language="JavaScript">
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
		
		function dosubmitIs(theUrl){
				if(confirm('ȷ�������ļ�������')){
					 document.forms[0].action=theUrl;
				     document.forms[0].submit();
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
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/pbc/getT1q_pbc_applyList.do" method="post">
			<html:errors />
				<div class="conditions">
					<div class="cond_t">
						<span>������ȡ���Ȳ�ѯ</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
						</span>
					</div>
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							   <td>
									��ȡ��ţ�
								</td>
								<td>
									<html:text property="tb_id" maxlength="20"/>
								</td>
								<td align="right">
										����������
									</td>
									<td bgcolor="F6F9FF">
								<html:text property="organkey" size="10" onblur="_Onblur('organName')"/>
									<html:text property="organName" size="15" readonly="true" />&nbsp;
								<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								</td>
							</tr>
							<tr>
								<td>״̬��</td>
								<td >
									<html:select  property="apply_status" style="width:100px;" onmouseover="FixWidth(this);">
										<html:options collection="applyStatusMap" property="label" labelProperty="value"/>
									</html:select>
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
							onClick="dosubmit('<%=request.getContextPath()%>/datacheck/pbc/getT1q_pbc_applyList.do?newsearchflag=2','search');"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
 							 <th>��ȡ���</th>     
  							 <th>��������</th> 
  							 <th>�������</th> 
  							 <th>���ݿ�ʼ����</th>   
  							 <th>���ݽ�������</th> 
  							 <th>�����ļ�״̬</th>     
  							 <th>������</th>   
  							 <th>����ʱ��</th>   
  							 <th>״̬</th>   
  							 <th>����</th>   
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
							
								<TD>
									<bean:write name="ta_pbc_apply" property="tb_id" />
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
									<bean:write name="ta_pbc_apply" property="isfile_disp" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_user" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="apply_dt_disp" />
								</TD>
								<TD>
										<bean:write name="ta_pbc_apply" property="apply_status_disp" />	
								</TD>
							<TD>
							<logic:equal value="7" property="apply_status" name="ta_pbc_apply">
									<a href="#" onclick="window.open('t1q_apply_result_file_zip.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
									<img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" title="�������ļ�" /></a>	&nbsp;&nbsp;&nbsp;&nbsp;
									    <a href="#" onclick="window.open('getT1q_pbc_approve_download.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><img src="../../images/blue/b_download.png" />����</a>
							</logic:equal>
							<logic:equal value="6" property="apply_status" name="ta_pbc_apply">
								<logic:equal value="0" name="ta_pbc_apply" property="isfile" >
									<a href="#" onclick="dosubmitIs('getT1q_pbc_approveIsFile.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_pass.png" />�����ļ�</a> 
								</logic:equal>
							</logic:equal>	
							</TD>
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
