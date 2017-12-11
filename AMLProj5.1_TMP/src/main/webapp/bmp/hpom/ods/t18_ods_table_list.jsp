<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<meta http-equiv=Content-Type content="text/html; charset=gbk"/>
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<link id="skincss" href="../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/aml.js"></script>
		<script type="text/javascript" src="../js/basefunc.js"></script>
		<script type="text/javascript" src="../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../js/calendar.js"></script>
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
				 if(errMsg==""){
				 	isSub = true;
				 }
			  }
		    else if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('是否删除？')){
		                isSub = true;
		            }
        		}
		    }
		    else if(type=='add'){
		    	openWin(theUrl,'');
		    }
		    else if(type=='search'){
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
		var flag=true;
		function selectAllCheckBox(obj,fm){
			if(flag){
				for(var i=0;i<fm.select_tableename.length;i++){
					fm.select_tableename[i].checked=flag;
				}
				flag=false;
			}else{
				for(var i=0;i<fm.select_tableename.length;i++){
					fm.select_tableename[i].checked=flag;
				}
				flag=true;
			}
		}
		</SCRIPT>
	</HEAD>
	<body class="mainbg">
	<html:form action="/t18_ods_tableList.do" method="POST">
	<html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
	</html:messages>
	<div id='main'>
 		<div class="conditions">
			 <div class='cond_t'>
			  	<span>业务数据源管理(ODS)</span>
				  <span class="buttons">
					<a href="#" id="hdd_display" class="bt_hidden"></a>
					<a href="#" onclick="dosubmit('t18_ods_table_add.do','add')"><img src="../images/<%=session.getAttribute("style") %>/b_add.png" />批量导入</a>
					<a href="#" onclick="dosubmit('t18_ods_table_delete_do.do','del')"><img src="../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
				<!--<html:button property="button3" value="修 改" styleClass="input" onclick="dosubmit('t18_ods_table_modify.do','modi')" />  -->
				</span>
			</div>    
			<div class="cond_c" id="searchtable">
		 			<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								英文名：
							</td>
							<td>
								<html:text property="tableename" />
							</td>
							<td>
								中文名：
							</td>
							<td >
							<html:text property="tablecname" styleClass="text_white" size="30" />
							</td>
						</tr>
						<tr>
							<td>
								排序：
							</td>
							<td >
								<html:select property="sort">
								<html:options collection="sortMap" property="label"
										labelProperty="value" />
								</html:select>
								&nbsp;
								<html:radio property="sort_type" value="asc">升序</html:radio>
								<html:radio property="sort_type" value="desc">降序</html:radio>
								<html:radio property="sort_type" value="">不排序</html:radio>
							</td>	
							<td>
							</td>						
						<td>
								<input type="button" name="button" value="查 询"
									onClick="dosubmit('t18_ods_tableList.do?newsearchflag=1','search')"
									class="in_button1">
							</td>
						</tr>							
					</table> 	
			
		</div>
		
		<div class='list'>
			<table>
				<tr align="center">
	         		<th noWrap width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>
						全部
					</th>
				<th width="20%" nowrap>英文名</th>
				<th width="20%" nowrap>中文名</th>
				<th width="20%" nowrap>业务数据源</th>
				<th width="10%" nowrap>粒度</th>
				<th width="30%" nowrap>备注</th>	
				</TR>
				<logic:notEmpty name="t18_ods_tableList">
				 <logic:iterate id="dto" name="t18_ods_tableList"
					type="com.ist.bmp.hpom.dto.T18_ods_table">
					<%
						java.util.HashMap dsMap = (java.util.HashMap)request.getAttribute("t18_datasourceMap");									
						//
						java.util.HashMap map = new java.util.HashMap();
						map.put("select_tableename", dto.getTableename());
						pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>					
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="select_tableename" onclick="changcol(this)">
								<bean:write name="dto" property="tableename" />
							</html:multibox>						
						</TD>						
						<TD align="left">
							<html:link name="map" page="/t18_ods_table_modify.do">
							<bean:write name="dto" property="tableename"  />
							</html:link>						
						</TD>
						<TD align="left">
							<bean:write name="dto" property="tablecname"  />
						</TD>
						<TD align="left">
							<%	
								String key = dto.getDskey();
								String value = (String)dsMap.get(key);
							%>							
							<%=key+" - "+value%>
						</TD>	
						<td>
							<bean:write name="dto" property="granularity_disp"  />
						</td>					
						<TD align="left">
							<bean:write name="dto" property="des"  />
						</TD>

					</TR>
				</logic:iterate>
				</logic:notEmpty>
			</TABLE>
		</div>
		</div>
		</html:form>
					<div class = "sys_warning">
				<TABLE width="100%" border="0" align="center" cellpadding="0" >
					<TR >
						<TD align="left">
							<b>ODS表配置步骤：</b><br/>
							1、点击批量导入，确定ODS数据库中正式的数据表；<br/>
							2、点击表名，修改表的中文名称及备注信息；
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</BODY>
</HTML>
