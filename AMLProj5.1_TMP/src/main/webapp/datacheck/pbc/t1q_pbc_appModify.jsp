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
    	    var apply_reason=document.forms[0].apply_reason.value;
    	   if(!is_inRange(document.forms[0].organkey.value,1,128)){
     	        errMsg = "������������Ϊ�գ�";
     	        document.forms[0].organkey.focus();
     	    }else if(getLength(document.forms[0].apply_dt_start_disp.value )== 0){
		   		document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "��ʼʱ�䲻��Ϊ�գ�";	
		   	} else if(getLength(document.forms[0].apply_dt_end_disp.value) == 0){
		   		document.forms[0].apply_dt_end_disp.focus();
		 		errMsg = "����ʱ�䲻��Ϊ�գ�";	
		 	}else if(!_isDateSpaceComplete(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)){
	    	    document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "����д��������ʼʱ�䷶Χ��";
        	} else if(!_compareTwoDateForString(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)) {
	   			document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";		    
		   	} else if(!is_inRange(trim(apply_reason),1,254)){
		   		document.forms[0].apply_reason.focus();
		 		errMsg = "����ԭ����Ϊ�գ�";	
		   	}
    	    if(isSub && errMsg==''){
    	            if(confirm('ȷ�ϱ������Ϣ��')){
    	            var tb_id='<bean:write name="t1q_pbc_applyActionForm" property="tb_id" />';
			 		document.forms[0].action=theUrl+'?tb_id='+tb_id;
	       		 	document.forms[0].submit();
			 }
    	    }else{
    	        if(errMsg!='')
    	            alert(errMsg);
    	        return false;
    	    }
    	}

function is_inRange(formValue,mix,max){
 	    var length=0;
 	    for(var i=0;i<formValue.length;i++){
 	        if(formValue.charAt(i)>'~'){
 	            length+=2;
 	        } else{
 	            length++;
 	        }
 	    }
 	     if(length>=mix&&length<=max){
           return true;
           }else{
           return false;
           }
 	}
     function doback(){
 	            document.forms[0].action='getT1q_pbc_application.do';
 	            document.forms[0].submit();
 	}
     function _Onblur(pname){
		   var obj=eval("document.forms[0]."+pname);
		   obj.value="";
		}
     function jumpTabPanel(theUrl, frm){    
		frm.action=theUrl;
		frm.submit();
		return true;    
		}
     </script>
</head>
<body>
<html:form  method="post" action="/pbc/getT1q_pbc_app_modify.do" >
 <div id='main'>
 <div class="conditions">
 <html:errors/>
 
  <!-- �������� -->
  <div class='cond_t'>
          <span><strong>������ȡ����</strong></span>
			<span class="buttons">
			<a href="javascript:void(0);" onclick="doback();">
							<img src="../../images/blue/b_back.png" />�� ��</a>
			</span>
	</div>
	 <div id="bigTab">
			<dl class="tabm">
             <dd class="tabcur">
                 <span><strong>������Ϣ</strong></span>
              </dd>
               <dd id="ruledef">
					<span >
						<a href="javascript:void(0);" onclick="jumpTabPanel('getT1q_pbc_app_add_other.do?tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />',document.forms[0])">�����Ϣ</a>
               </span>
				</dd>
				</dl>
        </div>
    	 
		<div class="cond_c2">
								<table border="0" cellpadding="0" cellspacing="0">
								  <tr>
									<td><font color="red">*</font>��ȡ���ڷ�Χ��</td>
									<td>
									 <html:text property="apply_dt_start_disp"  readonly='true'/>
									<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].apply_dt_start_disp);">
									--
									<html:text property="apply_dt_end_disp"  readonly='true'/>
									<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].apply_dt_end_disp);">
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>����������</td>
									<td bgcolor="F6F9FF">
										<html:text property="organkey" size="10" onblur="_Onblur('organName')" styleId="organkey" readonly="true"/>
										<html:text property="organName" size="15" readonly="true" />&nbsp;
										<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>������ʽ��</td>
									<td >
									<html:select  property="file_type" style="width:100px;" onmouseover="FixWidth(this);">
										<html:options collection="file_typeMap" property="label" labelProperty="value"/>
									</html:select>
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>������ȡԭ��</td>
									<td>
									<html:textarea styleId="apply_reason" property="apply_reason" cols="70" rows="10" maxlength="124"></html:textarea>
									</td>
									</tr>
									<tr>
									<td></td>
							<td  align="left" class="in_button">
								<input type=button value="�� ��" name=Button52  onClick="dosubmit('getT1q_pbc_app_modify_do.do');">
								<input name="Submit2" type="reset" value="�� ��">  
							</td>
							</tr>
								</table>
							</div>
							<div class="sys_warning">
								<strong><img src="../../images/blue/warning.png" />ϵͳ��ʾ��</strong>��������Ϊ��ǰ�����Լ�����������
							</div>
	</div>
</div>
</html:form>
</body>
</html:html>