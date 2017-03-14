<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
pageContext.setAttribute("ctx",request.getContextPath());
%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/jquery.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/aml.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc_report.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/calendar.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 

	function openWin(theUrl,win_name,height,width){	
		
	    var top =  (window.screen.availHeight-30-400)/2;
	    var left = (window.screen.availWidth-10-750)/2;
	    var h,w;
	    if(height==undefined){ h = 500 }else{ h = height; }
	    if(width==undefined){ w = 600 }else{ w = width; }
	   
		var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
	    window.open(theUrl,'',property);     
	}
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
          if(errMsg===""){
        	var selects = document.getElementsByName("selectdmkey");				
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
          if(errMsg===""){
        	var selects = document.getElementsByName("selectdmkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value === "1"){
		        			errMsg+=" 锁定状态不能删除！";
	    				}
						break;		
					}				
				}
        }
        if(errMsg==''){
            if(confirm('是否删除？')){
                isSub = true;
            }
        }
    }else if(type=='deploy'){
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
 			var a = document.forms[0].selectdmkey; 				
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
		if(type.parentNode.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerText == ""){ 							
			errMsg+="请生成脚本，再进行下载动作！";			
		}
		theUrl += "&tableename="+type.parentNode.firstChild.nextSibling.innerText;	
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
	     document.forms[0].action=theUrl;
		 document.forms[0].submit();
		
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

<body >
	<html:form action="/hpom/t18_dmtable_list.do" method="POST">
	<div id="main">
	<div class="conditions">
	<div class="cond_t">
	   <span>数据表管理(DM)</span>
	   <span class="buttons">
	      <a href="#" id="hdd_display" class="bt_hidden"></a>
	      <a href="javascript:void(0);" onclick="openWin('createtable.do?newsearchflag=1','');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_approve.png" />基于ODS表自动生成</a>
	      <a href="javascript:void(0);" onclick="dosubmit('t18_dmtable_add.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 建</a>
	      <a href="javascript:void(0);" onclick="dosubmit('delete_t18_dmtable_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
          <a href="javascript:void(0);" onclick="dosubmit('<bean:write name="ctx"/>/bmp/hpom/dm_batch_download.do?isgenerating=1','batchdown');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_download.png" />批量下载</a>
		  <a href="javascript:void(0);" onclick="dosubmit('t18_dmtable_deploy.do?isdeploy=1','deploy');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />部署生产</a>
		  <a href="javascript:void(0);" onclick="dosubmit('t18_dmtable_deploy.do?isdeploy=0','cancel');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_re_refused.png" />撤销部署</a>
		  
	   </span>
	</div>
  <div class='cond_c' id="searchtable"> 
    <table border="0" cellpadding="0" cellspacing="0">
  		  <tr>
            <td>表名：</td>
  		    <td><html:text property="tableename" styleClass="text_white" size="30" /></td>
  		    <td>脚本文件名：</td>
  		    <td><html:text property="shfilename" styleClass="text_white" size="30" /></td>
	      </tr>
  		  <tr>
			<td>创建方式：</td>
  		    <td><html:select property="creatmethod"  >
					<html:options collection="creatmethodmap" property="label"
						labelProperty="value" />
				</html:select>
			</td>
            <td>生成时间：</td>
  		    <td><input type="text" name="createdate" onclick="calendar.show(this);" readonly="readonly" class="calimg" size="12">
				
			</td>
			</tr>
			<tr>
  		    <td>是否人工编辑：</td>
  		    <td><html:select property="isedit"  >
					<html:options collection="map" property="label"
						labelProperty="value" />
				</html:select>
			</td>
			<td>是否已部署生产：</td>
				<td>
				<html:select property="isdeploy"  >
					<html:options collection="map" property="label"
						labelProperty="value" />
				</html:select>
				</td>
			</tr>
			<tr>
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
			<td></td>
			<td><input type="button" name="button" value="查 询"
					onClick="dosubmit('t18_dmtable_list.do?newsearchflag=1','search')"
					class="in_button1">
				</td>
			</tr>
		 </table>
	 </div>
  </div>
	<div  class='list'>
	 	<table border="0" cellspacing="0" cellpadding="0">
			<tr align="center">
				<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
				<th width="15%" nowrap>
					表英文名				
				</th>
				<th width="15%" nowrap>
					表中文名				
				</th>
				<th width="5%" nowrap>
					粒度				
				</th>
				<th width="15%" nowrap>
					脚本文件名			
				</th>
				<th width="5%" nowrap>
					创建方式			
				</th>
				<th width="5%" nowrap>
					生成时间	
				</th>
				
				<th width="5%" nowrap>
					人工编辑				
				</th>
				<th width="5%" nowrap>
					已部署生产				
				</th>
				<th width="5%" nowrap> 
					部署时间 
				</th>
				<th width="5%" nowrap>
					操作				
				</th>
				<th width="5%" nowrap>
					锁定状态				
				</th>
			</tr>
			
			<logic:notEmpty name="t18_dm_tableList">
				 <logic:iterate id="dto" name="t18_dm_tableList"
					type="com.ist.bmp.hpom.dto.T18_dm_table">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("tableename", dto.getTableename());
								map.put("selectdmkey", dto.getTableename());
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="selectdmkey" onclick="changcol(this)">
								<bean:write name="dto" property="tableename" />
							</html:multibox>
						</TD>

						<TD align="left">
							<!--<html:link name="map" page="/hpom/t18_dm_tabledisp.do">-->
							<bean:write name="dto" property="tableename" />
							<!--</html:link>-->
						</TD>
						<TD align="left">
							<bean:write name="dto" property="tablecname" />
						</TD>
						<TD>
							<bean:write name="dto" property="granularity_disp" />
						</TD>
						<TD align="left">
							<html:link name="map" page="/hpom/t18_dmtable_modify.do">
							<bean:write name="dto" property="shfilename" />
							</html:link>
							<!-- 
							<a href="javascript:void(0);"
								onClick="window.open('<bean:write name="ctx"/>/bmp/hpom/t18_Shfilename_disp.do?tableename=<bean:write name="dto" property="tableename" />','','height=500, width=850,left=280,top=180,scrollbars=yes,resizable=yes')">
								<bean:write name="dto" property="shfilename" />
							</a>
							 -->
						</TD>
						<TD>
							<bean:write name="dto" property="creatmethod_disp" />
						</TD>
						<TD>
							<bean:write name="dto" property="createdate" />
						</TD>
						<TD>
							<bean:write name="dto" property="isedit_disp"  />
						</TD>
						<TD>
							<bean:write name="dto" property="isdeploy_disp"  />
						</TD>
						<TD>
							<bean:write name="dto" property="deploytime"  />
						</TD>
						<TD>
							<a href="javascript:void(0);" onclick="dosubmit('<bean:write name="ctx"/>/bmp/hpom/dm_batch_download.do?isgenerating=1',this.parentNode)">下载</a>
						</TD>
						<TD>
							<logic:equal value="1" name="dto" property="islock">
							<img src="../../images/blue/b_lock.png" onclick="lock('t18_dmtable_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=0')">
							</logic:equal>
							<logic:equal value="0" name="dto" property="islock">
							<img src="../../images/blue/lock_unlock.png" onclick="lock('t18_dmtable_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=1')">
							</logic:equal>
							<input type="hidden" id="<bean:write name="dto" property="tableename" />"  value="<bean:write name="dto" property="islock" />"/>
						</TD>

					</TR>
				</logic:iterate>
				</logic:notEmpty>
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
	</div>
	</html:form>
</body>
</html>