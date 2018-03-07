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
    	    var apply_reason=document.forms[0].apply_reason.value;
    	   if(!is_inRange(document.forms[0].organkey.value,1,128)){
     	        errMsg = "提数机构不能为空！";
     	        document.forms[0].organkey.focus();
     	    }else if(getLength(document.forms[0].apply_dt_start_disp.value )== 0){
		   		document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "起始时间不能为空！";	
		   	} else if(getLength(document.forms[0].apply_dt_end_disp.value) == 0){
		   		document.forms[0].apply_dt_end_disp.focus();
		 		errMsg = "结束时间不能为空！";	
		 	}else if(!_isDateSpaceComplete(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)){
	    	    document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "请填写完整的起始时间范围！";
        	} else if(!_compareTwoDateForString(document.forms[0].apply_dt_start_disp.value, document.forms[0].apply_dt_end_disp.value)) {
	   			document.forms[0].apply_dt_start_disp.focus();
		 		errMsg = "开始时间不能大于结束时间！";		    
		   	} else if(!is_inRange(trim(apply_reason),1,254)){
		   		document.forms[0].apply_reason.focus();
		 		errMsg = "申请原因不能为空！";	
		   	}
    	    if(isSub && errMsg==''){
    	            if(confirm('确认保存此信息！')){
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
 
  <!-- 标题区域 -->
  <div class='cond_t'>
          <span><strong>数据提取申请</strong></span>
			<span class="buttons">
			<a href="javascript:void(0);" onclick="doback();">
							<img src="../../images/blue/b_back.png" />返 回</a>
			</span>
	</div>
	 <div id="bigTab">
			<dl class="tabm">
             <dd class="tabcur">
                 <span><strong>基本信息</strong></span>
              </dd>
               <dd id="ruledef">
					<span >
						<a href="javascript:void(0);" onclick="jumpTabPanel('getT1q_pbc_app_add_other.do?tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />',document.forms[0])">相关信息</a>
               </span>
				</dd>
				</dl>
        </div>
    	 
		<div class="cond_c2">
								<table border="0" cellpadding="0" cellspacing="0">
								  <tr>
									<td><font color="red">*</font>提取日期范围：</td>
									<td>
									 <html:text property="apply_dt_start_disp"  readonly='true'/>
									<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onclick="new Calendar().show(document.forms[0].apply_dt_start_disp);">
									--
									<html:text property="apply_dt_end_disp"  readonly='true'/>
									<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onclick="new Calendar().show(document.forms[0].apply_dt_end_disp);">
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>提数机构：</td>
									<td bgcolor="F6F9FF">
										<html:text property="organkey" size="10" onblur="_Onblur('organName')" styleId="organkey" readonly="true"/>
										<html:text property="organName" size="15" readonly="true" />&nbsp;
										<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>导出格式：</td>
									<td >
									<html:select  property="file_type" style="width:100px;" onmouseover="FixWidth(this);">
										<html:options collection="file_typeMap" property="label" labelProperty="value"/>
									</html:select>
									</td>
									</tr>
									<tr>
									<td><font color="red">*</font>数据提取原因：</td>
									<td>
									<html:textarea styleId="apply_reason" property="apply_reason" cols="70" rows="10" maxlength="124"></html:textarea>
									</td>
									</tr>
									<tr>
									<td></td>
							<td  align="left" class="in_button">
								<input type=button value="保 存" name=Button52  onClick="dosubmit('getT1q_pbc_app_modify_do.do');">
								<input name="Submit2" type="reset" value="重 填">  
							</td>
							</tr>
								</table>
							</div>
							<div class="sys_warning">
								<strong><img src="../../images/blue/warning.png" />系统提示：</strong>提数机构为当前机构以及其下属机构
							</div>
	</div>
</div>
</html:form>
</body>
</html:html>