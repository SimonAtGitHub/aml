<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/load_window.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;   
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg===""){
        	var selects = document.getElementsByName("selectftpkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value === "1"){
		        			errMsg+=" 锁定状态不能修改！";
	    				}else{
        					isSub = true;
        				} 
						break;		
					}				
				}
        }
 
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('是否删除？')){
                isSub = true;
            }
        }
    }
    else if(type=='deploy'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('确定要部署吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='cancel'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('确定要撤销部署吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='batch'){
      errMsg = CheckBoxMustChecked(document.forms[0]);      
    }
    else if(type=='batchdown'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
 			var a = document.forms[0].selectftpkey; 				
 			for(var i=0; i<a.length; i++){
				if(a[i].checked){     							
					b = a[i];
					if(b.parentNode.nextSibling.nextSibling.innerHTML == ""){ 							
						errMsg+="请生成脚本，再进行下载动作！";
						isSub = false; 		
						break;	
 					}
					isSub = true; 							
				}				
 			} 		 	
      	}
    }   
    else if(type=="[object]"){            
		if(type.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML == ""){ 							
			errMsg+="请生成脚本，再进行下载动作！";			
		}
		theUrl += "?tableename="+type.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.firstChild.value;		
		isSub = true;
    }
    else if(type=='copy'){
        if(checkRadio(document.forms[0].selectTrpkeys)<0){
            errMsg = "请选择!";
        }
        isSub = true;
    }else if(type=='search' || type=='add'){
        isSub = true;
    }
    else if(type=='release'){
     		errMsg = CheckBoxMustChecked(document.forms[0]);
     		if(errMsg==''){
     			var a = document.forms[0].selectrsltkey;  		
     			for(var i=0; i<a.length; i++){
     					if(a[i].checked){     							
     						
     					}     					
     			}
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
	function lock(theUrl){
	var isSub = false;
		var  errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		if(errMsg == ''){
			var selects = document.getElementsByName("selectftpkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value==="0"){	
							selects[i].parentNode.parentNode.lastChild.innerHTML = "<img src = \"../../skin/blue/images/icon/lock.png\">";
							isSub=true;	
							theUrl=theUrl+"?islock=1"	
							
						}else{
							selects[i].parentNode.parentNode.lastChild.innerHTML = "<img src = \"../../skin/blue/images/icon/lock_unlock.png\">";
							isSub=true;	
							theUrl=theUrl+"?islock=0"	
						}	
						if(isSub && errMsg==''){
					        document.forms[0].action=theUrl;
					        document.forms[0].submit();
					    }				
					}				
				}
			
			}else{				
				  alert(errMsg);
				  return false;
			}
	}
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
</head>

<body class="mainbg">
	<html:form action="/hpom/t18_ods_ftp_list.do" method="POST">
	<html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
	</html:messages>
	<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
		    	<span>数据抽取(FTP)</span>
			  	<span class="buttons">
					<a href="#" id="hdd_display" class="bt_hidden"></a>
					<a href="#" onclick="dosubmit('t18_ods_ftp_save.do','search')"><img src="../../images/<bean:write name="style" scope="session"/>/b_save.png" />保 存</a>
					<a href="#" onclick="dosubmit('t18_ods_ftp_deploy.do?isdeploy=1','deploy')"><img src="../../images/<bean:write name="style" scope="session"/>/b_edit.png" />部署生产</a>
					<a href="#" onclick="dosubmit('t18_ods_ftp_deploy.do?isdeploy=0','cancel')"><img src="../../images/<bean:write name="style" scope="session"/>/b_re_refused.png" />撤销部署</a>
					<a href="#" onclick="dosubmit('t18_ods_ftp_synchro.do','search')"><img src="../../images/<bean:write name="style" scope="session"/>/b_excluded.png" />同 步</a>
			 	</span>
			</div>
			<div class="cond_c" id="searchtable">
			  	 <table border="0" cellspacing="0" cellpadding="0">
			    	  <tr>
			            <td>数据源名称：</td>
			  		    <td><html:text property="dsname" styleClass="text_white" size="30" /></td>
			            <td>ftp文件名称：</td>
			  		    <td><html:text property="shfilename" styleClass="text_white" size="30" /></td>
					  </tr>
			  		  <tr>
			            <td>表名：</td>
			  		    <td><html:text property="tableename" styleClass="text_white" size="30" /></td>
			            <td>部署时间：</td>
			  		    <td>
			  		    <html:text property="deploytime" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> 
						</tr>
						<tr>
							<td>是否已部署生产：</td>
							<td>
							<html:select property="isdeploy"  >
								<html:options collection="map" property="label"
									labelProperty="value" />
							</html:select>
							</td>
						<td align="right" nowrap>
							排序：
						</td>
						<td nowrap>
							<html:select property="sort">
								<html:options collection="sortMap" property="label"
									labelProperty="value" />
							</html:select>
							&nbsp;
							<html:radio property="sort_type" value="asc">升序</html:radio>
							<html:radio property="sort_type" value="desc">降序</html:radio>
							<html:radio property="sort_type" value="">不排序</html:radio>
						</td>
						</tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="button" name="button" value="查 询"
								onClick="dosubmit('t18_ods_ftp_list.do?newsearchflag=1','search')"
								class="in_button1">
							</td>
						</tr>
					 </table>
				 </div>
				<div class="list">
			  	 <table border="0" cellspacing="0" cellpadding="0">
						<tr align="center">
							<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
							<th width="8%" nowrap>
								数据源名称			
							</th>
							<th width="8%" nowrap>
								表名			
							</th>
							<th width="3%" nowrap>
								粒度	
							</th>
							<th width="15%" nowrap>
								ftp文件名称			
							</th>
							
							<th width="8%" nowrap>
								部署时间	
							</th>
							
							<%-- <th width="5%" nowrap>
								是否人工编辑				
							</th>--%>
							<th width="5%" nowrap>
								是否已部署生产				
							</th>
							<%--<th width="5%" nowrap>
								操作				
							</th>
							<th width="5%" nowrap>
								锁定状态				
							</>--%>
						</tr>
						
						<logic:notEmpty name="t18_ods_ftpList">
							 <logic:iterate id="dto" name="t18_ods_ftpList"
								type="com.ist.bmp.hpom.dto.T18_ods_ftp">
								<TR align="center" >
									<TD noWrap>
										<html:multibox property="selectftpkey" onclick="changcol(this)">
											<bean:write name="dto" property="tableename" />
										</html:multibox>
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="dsname" />
									</TD>
									<TD noWrap align="left">
										<bean:write name="dto" property="tableename" />
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="granularity_disp" />
									</TD>
									<TD noWrap>
										<input type='text' name='<bean:write name="dto" property="tableename" />' value='<bean:write name="dto" property="shfilename" />'/>.<bean:write name="dto" property="db2filetype" />
									</TD>
									
									<TD noWrap>
										<bean:write name="dto" property="deploytime" />
									</TD>
									<%-- <TD noWrap>
										<bean:write name="dto" property="isedit_disp"  />
									</TD>--%>
									<TD noWrap>
										<bean:write name="dto" property="isdeploy_disp"  />
									</TD>
									<%--<TD noWrap>
										<a href="javascript:void(0);" onclick="dosubmit('../bmp/hpom/ftp_batch_download.do',this.parentNode)">下载</a>
									</TD>
									<TD noWrap>
									<logic:equal value="1" name="dto" property="islock" >
										<img src="../../skin/blue/images/icon/lock.png" >
									</logic:equal>
									<logic:equal value="0" name="dto" property="islock" >
										<img src="../../skin/blue/images/icon/lock_unlock.png" >
									</logic:equal>
									<input type="hidden" name="islock" id="<bean:write name="dto" property="tableename" />" value="<bean:write name="dto" property="islock" />"/>
									--%></TD>
			
								</TR>
							</logic:iterate>
							</logic:notEmpty>
					</table>
				</div>
			</div>
		</div>
	</html:form>
</body>
</html>