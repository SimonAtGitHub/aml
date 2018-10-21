<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>数据提取申请</title>
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
    	    var errMsg = "";//提示信息
    	    var isSub = true;//确认操作
    	   
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
	<!-- 标题区域 -->
  <div class='cond_t'>
          <span><strong>数据提取申请</strong></span>
			<span class="buttons">
			<a href="#" onclick="doback();">
							<img src="../../images/blue/b_back.png" />返 回</a>
							<html:hidden property="tb_id" />
			</span>
	</div>
        <div id="bigTab">
			<dl class="tabm">
             <dd class="ruledef">
                 <span><a href="javascript:void(0);" onclick="jumpTabPanel('getT1q_pbc_app_modify.do?tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />',document.forms[0])">基本信息</a></span>
              </dd>
               <dd id="tabcur">
					<span ><strong>相关信息</strong></span>
				</dd>
			</dl>
        </div>
		<div class="list">
					<TABLE >
							<TR align=center  style="font-size: 18px">
							
 							 <th nowrap bgcolor="#6799CC" class="t_White">表英文名称</th>     
  							 <th nowrap bgcolor="#6799CC" class="t_White">表中文名称</th>
  							 <th nowrap bgcolor="#6799CC" class="t_White">操作</th> 
  							 <th nowrap bgcolor="#6799CC" class="t_White">是否提取</th>
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
									<a href="#" onclick="window.open('t1q_apply_field_definition_modify.do?table_ename=<bean:write name="ta_pbc_apply" property="table_ename" />&tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >字段定义</a>	
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
				<strong><img src="../../images/blue/warning.png" />系统提示：</strong>字段定义默认提取表全部字段
		</div>
	</div>
</div>
</html:form>
</body>
</html:html>