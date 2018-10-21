<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>������</title>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
	function dosubmit(theUrl,type){
		var errMsg = "";
	     if(type=='del'){
            if(confirm('�����Ҫɾ���˼����')){
                document.forms[0].action=theUrl;
        		document.forms[0].submit();
            }
        }else if(type=='add'){
       		document.forms[0].action=theUrl;
            document.forms[0].submit();
        } if(type=='mod'){
                document.forms[0].action=theUrl;
        		document.forms[0].submit();
        }
	}
</SCRIPT>

</HEAD>
<body leftmargin="0" topmargin="0">
	<html:form action="/check/t3r_checkList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>������ </span>
					<span class="buttons">
					<a id="hdd_display" class="bt_hidden"></a> 
					<a href="#" onClick="dosubmit('t3r_check_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
				  </span>
				</div>
				<!-- table content -->
<div class="cond_c" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
         <td>������ƣ�</td>
         <td>
         	<html:text property="chk_name_s"  styleClass="text_white" size="10" maxlength="64"/>
         </td>
         <td>״̬��</td>
			<td>
			<html:select  property="chk_status" >
				<html:options collection="statusMap" property="label" labelProperty="value"/>
			</html:select>
			</td>
		</tr>
        <tr>
        
        <td>&nbsp;&nbsp;</td>
         <td>&nbsp;&nbsp;</td>
		<td><input name="Button522" type="button" class="in_button1" value="��ѯ"
					 onClick="dosubmit('t3r_checkList.do?newsearchflag=1','mod')" />
		</td><td>&nbsp;&nbsp;</td>
		</tr>
	  </table>
	</div>
			</div>

			
			<html:errors />
			<div class="list">
				<TABLE border="0" cellspacing="0" cellpadding="0">
					<TR>
						<th width="15%">
							�������
						</th>
						<th width="15%">
							��������
						</th>
						<th width="15%">
							�����ʱ���
						</th>
						<th width="10%">
						           ״̬
						</th >
						<th width="10%">
							������
						</th>
						<th width="15%">
							��������
						</th>
						<th width="10%">
							����ʱ��
						</th>
						<th width="15%">
							����
						</th>
					</TR>
					
					<logic:iterate id="check" name="t3r_checkList"
						type="com.ist.bmp.pbc.dto.T3r_check">

						<TR>
						<TD>
						<a href="#" onclick="window.open('t3r_checkDisp.do?chk_no=<bean:write name="check" property="chk_no" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><bean:write name="check" property="chk_name"></bean:write></a>
						</TD>
							<TD>
								<bean:write name="check" property="chk_org_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="check" property="chk_dt_bt"/>-<bean:write name="check" property="chk_dt_et"/>
							</TD>
							<TD>
								<bean:write name="check" property="chk_status_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="check" property="create_user_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="check" property="create_org_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="check" property="create_dt"></bean:write>
							</TD>
							<TD>
							   <logic:equal value="1" property="chk_status" name="check">
							   		 <logic:equal value="0" property="logcount" name="check">
								     	<a href="<%=request.getContextPath()%>/datacheck/check/t3r_check_modify_status.do?chk_no=<bean:write name="check" property="chk_no" />&chk_status=0"><img src='../../images/blue/b_re_refused.png' title="ȡ������"/></a>
									 </logic:equal>
								</logic:equal>
								<logic:equal value="0" property="chk_status" name="check">
									<a href="<%=request.getContextPath()%>/datacheck/check/t3r_check_modify.do?chk_no=<bean:write name="check" property="chk_no" />"><img src='../../images/blue/b_edit.png' title="�� ��"/></a>&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/datacheck/check/t3r_check_delete_do.do?chk_no=<bean:write name="check" property="chk_no" />"><img src='../../images/blue/b_delete.png' title="ɾ ��"/></a>&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/datacheck/check/t3r_check_modify_status.do?chk_no=<bean:write name="check" property="chk_no" />&chk_status=1"><img src='../../images/blue/b_add.png' title="�� ��"/></a>
								</logic:equal>
							</TD>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
			 <div class="list_page">
						<logic:present name="pageInfo" scope="request">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">									
										<bean:write name="pageInfo" scope="request" filter="false" />								
									</td>
								</tr>
							</table>
						</logic:present>
					</div>
		</div>
	</html:form>
</body>
</html:html>
