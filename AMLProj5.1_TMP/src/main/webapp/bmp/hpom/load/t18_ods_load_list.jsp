<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gb2312"/>

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg === ""){
			var selects = document.getElementsByName("selectloadkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value==="1"){
							errMsg+='锁定状态不能修改！';								
						}else{
							isSub=true;
						}
						break;
					}				
				}
			
			}
    }
    else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
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
    else if(type=='generate'){
			errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	        	 isSub = true;	
	      	}
     } 
    else if(type=='batchdown'){
  			errMsg = CheckBoxMustChecked(document.forms[0]);
  	        if(errMsg==''){
  	 			var a = document.forms[0].selectloadkey; 				
  	 			for(var i=0; i<a.length; i++){
  					if(a[i].checked){     							
  						b = a[i];
  						if(get_firstchild(get_nextsibling(get_nextsibling(get_nextsibling(b.parentNode)))).innerHTML == ""){ 							
  							errMsg+="请生成脚本，再进行下载动作！";
  							isSub = false; 		
  							break;	
  	 					}
  						isSub = true; 							
  					}				
  	 			} 		 	
  	      	}
         } 
    else if(typeof(type) == 'object'){
 		if(get_firstchild(get_nextsibling(get_nextsibling(get_nextsibling(get_firstchild(type.parentNode))))).innerHTML == ""){ 							
 			errMsg+="请生成脚本，再进行下载动作！";			
 		}
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
	function get_nextsibling(n) {
		var x = n.nextSibling;
		while (x.nodeType != 1) {
			x = x.nextSibling;
		}
		return x;
	}
	
	function get_firstchild(n) {
		var x = n.firstChild;
		while (x.nodeType != 1) {
			x = x.nextSibling;
		}
		return x;
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
	<html:form action="/hpom/t18_ods_load_list.do" method="POST">
	<div id="mian">
	<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>数据装载(LOAD)</span>
	  <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a href="#" onclick="dosubmit('t18_ods_load_deploy.do?isdeploy=1','deploy')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />部署生产</a>
	  <a href="#" onclick="dosubmit('t18_ods_load_deploy.do?isdeploy=0','cancel')"><img src="../../images/<%=session.getAttribute("style") %>/b_re_refused.png" />撤销部署</a>
	  <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/generate_script.do?isDo=1','generate')"><img src="../../images/<%=session.getAttribute("style") %>/b_agencyinfo.png" />批量生成脚本</a>
	  <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/load_batch_download.do','batchdown')"><img src="../../images/<%=session.getAttribute("style") %>/b_download.png" />批量下载</a>
	  </span>
	</div>
	
  <div class='cond_c' id="searchtable"> 
    <table border="0" cellspacing="0" cellpadding="0">
  		  <tr>
            <td>表名：</td>
  		    <td><html:text property="tableename" styleClass="text_white" size="30" /></td>
  		    <td>脚本文件名：</td>
  		    <td><html:text property="shfilename" styleClass="text_white" size="30" /></td>
	      </tr>
  		  <tr>
            <td>生成时间：</td>
  		    <td><input type="text" name="createdate" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
				</td>
  		    <td>是否人工编辑：</td>
  		    <td><html:select property="isedit"  >
					<html:options collection="map" property="label"
						labelProperty="value" />
				</html:select>
			</td>
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
			<td></td><td></td><td></td>
			<td><input type="button" name="button" value="查 询"
					onClick="dosubmit('t18_ods_load_list.do?newsearchflag=1','search')"
					class="in_button1"/>
				</td>
			</tr>
		 </table>
	 </div>
	 </div>
  	<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
  
	<div  class='list'>
	 	<table>
			<tr align="center">
				<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
				
				<th width="10%" nowrap>
					表名				
				</th>
				<th width="5%" nowrap>
					粒度			
				</th>
				<th width="15%" nowrap>
					脚本文件名			
				</th>
				<th width="10%" nowrap>
					数据源名称			
				</th>
				<th width="5%" nowrap>
					创建时间	
				</th>
				
				<th width="5%" nowrap>
					是否人工编辑				
				</th>
				<th width="5%" nowrap>
					是否已部署生产				
				</th>
				<th width="5%" nowrap>
					操作				
				</th>
				<th width="5%" nowrap>
					锁定状态				
				</th>
			</tr>
			
			<logic:notEmpty name="t18_ods_loadList">
				 <logic:iterate id="dto" name="t18_ods_loadList"
					type="com.ist.bmp.hpom.dto.T18_ods_load">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("tableename", dto.getTableename());
								map.put("selectloadkey", dto.getTableename());
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="selectloadkey">
								<bean:write name="dto" property="tableename" />
							</html:multibox>
						</TD>
						<TD noWrap align="left">
							<html:link name="map" page="/hpom/maintain_cols.do">
							<bean:write name="dto" property="tableename" />
							</html:link>
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="granularity_disp" />
						</TD>
						<TD noWrap align="left">
							<html:link name="map" page="/hpom/t18_ods_load_modify.do">
							<bean:write name="dto" property="shfilename" />
							</html:link>
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="dsname" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="createdate" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="isedit_disp"  />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="isdeploy_disp"  />
						</TD>
						<TD noWrap>
							<a href="javascript:void(0);" onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/load_batch_download.do?isDo=1&tableename=<bean:write name="dto" property="tableename" />',this.parentNode)">下载</a>
						</TD>
						<TD noWrap>
							<logic:equal value="1" name="dto" property="islock">
							<img src="../../images/blue/b_lock.png" onclick="lock('t18_ods_load_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=0')"/>
							</logic:equal>
							<logic:equal value="0" name="dto" property="islock">
							<img src="../../images/blue/lock_unlock.png" onclick="lock('t18_ods_load_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=1')"/>
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
			<div class = "sys_warning">
				<TABLE width="100%" border="0" align="center" cellpadding="0" >
					<TR >
						<TD align="left">
							数据装载配置步骤：<br/>
							1、点击表名，配置该表的列信息（针对列上需要进行特殊处理的表）；<br/>
							2、批量生成脚本，自动根据选择表的属性及数据源的配置信息，生成装载和执行脚本；<br/>
							3、点击脚本名称，根据需要配置该表的装载方式和加载模式；<br/>
							4、点击下载脚本，部署在服务器指定目录（依据数据源配置路径放置）；
						</TD>
					</TR>
				</TABLE>
			</div>
			
			
			</div>
	</html:form>
</body>
</html>