<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

<script language="JavaScript">

function dosubmit(theUrl,type){
 
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
  
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要停止发布选择的信息吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        //location.href=theUrl+"&"+Math.random();
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        
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

function _open(ctrlobj)
{ 
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval = window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey_search&input_name_disp=organName','', 'height=400, width=600,left=100,top=100');
	
	if( retval != null ){
		ctrlobj.value = retval;
		 
	}else{
		 
	}
}

function checkMoreForm(theUrl,type){
	var errMsg = ''
	var isSub = false;
	if(type=='mod'){
	 	errMsg = CheckBoxMustChecked(document.forms[0]);
	 	
	 	if(typeof(document.forms[0].noteice_no)=="undefined"){
		 	alert("请选择");
	 		return false;
	 	}	 	
	 	
	 	for(var i=0;i<document.forms[0].noteice_no.length;i++){
	 			
            	var obj = document.forms[0].noteice_no[i];
            	//alert("flag_" + obj.value);
            	
            	if(obj.checked){
            		if(document.getElementById("flag_" + obj.value).value=='0'){
            			errMsg+="发布信息为无效请重新选择！";
            		}
            		if(document.getElementById("flag_" + obj.value).value=='2'){
            			errMsg+="所选信息已发布，请重新选择！";
            		}
            	}
            }
         
         
            
            
        isSub = true;
	 }
	 
    if(isSub && errMsg==''){
    
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
    else{
        if(errMsg!='')
        	alert(errMsg);
        return false;
    }
}

</script>
</head>
<body  class="mainbg">
<html:form action="/t00_notice/t00_notice_list.do" method="post"  >
		 <div id="main">
		        <div class="conditions">
				<div class="cond_t">
				<span>信息公告维护 </span>
				<span class="buttons">
				<a href="#" id="hdd_display" class="bt_hidden"></a>
				<a href="#" onclick="checkMoreForm('t00_notice_delete_do.do?status=2','mod')"><img src="../../images/<%=session.getAttribute("style") %>/b_publish.png"/>发 布</a>
                <a href="#" onclick="dosubmit('t00_notice_add.do','add')" ><img src="../../images/<%=session.getAttribute("style") %>/b_add.png"/>添 加</a> 
                <a href="#" onclick="dosubmit('t00_notice_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png"/>修 改</a>
				<a href="#" onclick="dosubmit('t00_notice_delete_do.do?status=0','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png"/>无 效</a>
		
				</span>
				</div>
                <div class="cond_c" id="searchtable">
				<table>
<tr>
								<td>
									标题:
								</td>
								<td>
									<html:text property="title_s"  /> 
								</td>
								<td>
									 类别:
								</td>
								<td>
									<html:select property="notice_gory_s">
										<html:options collection="typeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
</tr>
<tr>
								<td>
									发布机构:
								</td>
								<td>
								<html:text property="createorgan_s" size="9" maxlength="9" /> 
								<html:text property="organame"></html:text>
						 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=createorgan_s&input_name_disp=organame','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
						
								</td>
								<td>
									 状态： 
								</td>
								<td>
								<html:select property="flag">
								<html:options collection="flagMap" property="label" labelProperty="value" />
								</html:select>
								 &nbsp;&nbsp;&nbsp;&nbsp;
								  <input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('t00_notice_list.do?newsearchflag=1','search')"/>
								</td>
</tr>
</table>
</div>
</div>
<div class="list">
	<table >
<tr>
		<th>选择</th>
		<th>编号</th>
		<th>标题</th>
		<th>失效日期</th>
		<th>附件</th>
		<th>状态</th>
		<th>发布人</th>
		<th>发布机构</th>
		<th>发布日期</th>
</tr>

							<logic:iterate id="t00_notice" name="t00_noticeList" type="com.ist.aml.information.dto.T00_NOTICE">
<tr>
										<td >
											<html:multibox property="noteice_no" >
												 
											<bean:write name="t00_notice" property="noteice_no" />
												
											</html:multibox>
											<input type="hidden"
													id="flag_<bean:write name="t00_notice" property="noteice_no"/>"
											value="<bean:write name="t00_notice" property="flag" />">
										</td>
										
										
										
										
										<td>
											<bean:write name="t00_notice" property="noteice_no" />
										</td>
										<td>	<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/information/t00_notice/t00_notice_disp.do?noteice_no=<bean:write name="t00_notice" property="noteice_no"/>','','height=400, width=600,left=100,top=100');">
											<bean:write name="t00_notice" property="title" />
										</a>
										</td>
									
										<td>
											<bean:write name="t00_notice" property="infactdate" />
										</td>
											<td>
											<logic:notEmpty name="t00_notice" property="filepath">
											<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(t00_notice.getFilepath())%>','','height=160, width=300,left=100,top=100');">
                                             <bean:write name="t00_notice" property="filename"/></a>
										 	</logic:notEmpty>
										</td>
										 <td>
											<bean:write name="t00_notice" property="flag_disp" />
										    </td>
										     <td>
											<bean:write name="t00_notice" property="creator" />
										    </td>
										    <td>
					                        <bean:write name="t00_notice" property="organame" />
										    </td>
									       
											<td>
											<bean:write name="t00_notice" property="createdate" />
										    </td>
</tr>
							</logic:iterate>

						    </table>
  </div>		
	
	<!-- list_page --> 
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
<!-- all end -->   
</div>
 </html:form>

</body>
</html>