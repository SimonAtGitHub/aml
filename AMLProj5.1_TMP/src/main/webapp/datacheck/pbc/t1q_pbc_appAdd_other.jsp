<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������ȡ����</title>
 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
  	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>
      <script type="text/javascript" >
     function dosubmit(theUrl){
    	    var errMsg = "";//��ʾ��Ϣ
    	    var isSub = true;//ȷ�ϲ���
    	   
    	    if(isSub && errMsg==''){
    	            document.forms[0].action=theUrl;
    	            document.forms[0].submit();
    	    }else{
    	        if(errMsg!='')
    	            alert(errMsg);
    	        return false;
    	    }
    	}
function lock(theUrl){
		
       document.forms[0].action=theUrl;
       document.forms[0].submit();
				
	}

     function doback(){
 	            document.forms[0].action='getT1q_pbc_application.do?newsearchflag=1';
 	            document.forms[0].submit();
 	}
     function jumpTabPanel(theUrl, frm){    
	frm.action=theUrl;
	frm.submit();
	return true;    
}
     </script>
</head>
<body>
<html:form  method="post" action="/pbc/getT1q_pbc_app_add.do" target="_self">
  <div id='main'>
 <div class="conditions">
 <html:errors/>
	<!-- �������� -->
  <div class='cond_t'>
          <span><strong>������ȡ����</strong></span>
			<span class="buttons">
			<a href="#" onclick="doback();">
							<img src="../../images/blue/b_back.png" />�� ��</a>
							<html:hidden property="tb_id" />
			</span>
	</div>
        <div id="bigTab">
			<dl class="tabm">
             <dd class="ruledef">
                 <span><a href="javascript:void(0);" onclick="jumpTabPanel('getT1q_pbc_app_modify.do?tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />',document.forms[0])">������Ϣ</a></span>
              </dd>
               <dd id="tabcur">
					<span ><strong>�����Ϣ</strong></span>
				</dd>
			</dl>
        </div>
		<div class="list">
					<TABLE >
							<TR align=center  style="font-size: 18px">
							
 							 <th nowrap bgcolor="#6799CC" class="t_White">��Ӣ������</th>     
  							 <th nowrap bgcolor="#6799CC" class="t_White">����������</th>
  							 <th nowrap bgcolor="#6799CC" class="t_White">����</th> 
  							 <th nowrap bgcolor="#6799CC" class="t_White">�Ƿ���ȡ</th>
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							
							<TR align="center">
							
								<TD>
									<bean:write name="ta_pbc_apply" property="table_ename" />
								</TD>
								<TD style="text-align:center">
									<bean:write name="ta_pbc_apply" property="table_cname" />
								</TD>
								<TD>
									<a href="#" onclick="window.open('t1q_apply_field_definition_modify.do?table_ename=<bean:write name="ta_pbc_apply" property="table_ename" />&tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >�ֶζ���</a>	
								</TD>
								<td style="text-align:center">
									<logic:equal value="1" name="ta_pbc_apply" property="flag">
									<a href="#" onclick="lock('t1q_pbc_table_lock_modify.do?tableename=<bean:write name="ta_pbc_apply" property="table_ename" />&flag=1')" ><bean:write name="ta_pbc_apply" property="flag_disp" /></a>
									</logic:equal>
									<logic:equal value="0" name="ta_pbc_apply" property="flag">
									<a href="#" onclick="lock('t1q_pbc_table_lock_modify.do?tableename=<bean:write name="ta_pbc_apply" property="table_ename" />&flag=0')" ><bean:write name="ta_pbc_apply" property="flag_disp" /></a>
									</logic:equal>
								</td>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
		<div class="sys_warning">
				<strong><img src="../../images/blue/warning.png" />ϵͳ��ʾ��</strong>�ֶζ���Ĭ����ȡ��ȫ���ֶ�
		</div>
	</div>
</div>
</html:form>
</body>
</html:html>