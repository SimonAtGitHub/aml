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
		<SCRIPT LANGUAGE="JavaScript"> 
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		        isSub = true;
		    }
		    else if(type=='del'){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('你真的要删除选择的表吗？')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type='add'){
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
		
		function checkForm(theUrl){
		    var errMsg ="";
		    document.forms[0].tableename.value=trim(document.forms[0].tableename.value);
		    document.forms[0].tablecname.value=trim(document.forms[0].tablecname.value);
		    
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
	   /**列表中"选择"/"全部"的切换**/
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
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/table/metadata_tab_list.do" method="POST">
		
		    <div class="conditions">
					<div class="cond_t">
					   <span>元数据管理 - 列表</span>
					   <span class="buttons">
					                <a href="#" id="hdd_display" class="bt_hidden"></a>
					                <logic:notEqual value="1" name="isroot">
								    <a href="javascript:void(0);" onclick="dosubmit('metadata_tab_add.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 建</a>
								    </logic:notEqual>
									<a href="javascript:void(0);" onclick="dosubmit('metadata_tab_modify.do','modi');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
								    <a href="javascript:void(0);" onclick="dosubmit('metadata_tab_delete_logic_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
							    	<a href="javascript:void(0);" onclick="dosubmit('metadata_tab_batch_add1.do?isroot=1','add');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_add2.png" />批量维护</a>
					   </span>
					</div>
			<input type="hidden" name="isroot" value="<bean:write name="isroot"/>"/>
			<input type="hidden" name="isnew" value="<bean:write name="isnew"/>"/>			
<html:messages id="errors" message="true">
<bean:write name="errors" filter="fasle"/>
</html:messages>
<html:hidden property="categorykey"/>

			<div class='cond_c' id="searchtable"> 
		 <table>
	
								<tr >
									<td >
										表英文名称：
									</td>
									<td >
										<html:text property="tableename" styleClass="text_white" size="20" maxlength="30"/>
									</td>
									<td >
										表中文名称：
									</td>
									<td >
										<html:text property="tablecname" styleClass="text_white" size="20" maxlength="15"/>										
									</td>
								</tr>
									  <tr>

									<td >
										数据连接：
									</td>
									<td>
										<html:select property="dblinkkey">
											<html:options collection="metadata_linkMap" property="label"
												labelProperty="value" />
								  </html:select></td>
								  <td >
										排序：
									</td>
									<td >
										 <html:select property="sort">
						                    <html:options collection="sortMap" property="label" labelProperty="value"/>
						                 </html:select>
										<html:radio property="sort_type" value="asc">升序</html:radio>
										<html:radio property="sort_type" value="desc">降序</html:radio>
										<html:radio property="sort_type" value="">不排序</html:radio>
									</td>
								</tr>
								<tr >
									<td ></td>
									<td ></td>
									<td></td>
									<td >									
										<html:button property="button" styleClass="in_button1" value="查  询"
											onclick="checkForm('metadata_tab_list.do?newsearchflag=1')" />
									</td>
								</tr>
								

							</table>
						</div>
			           </div>
			<div class='list'>
			<table>
		<tr align="center">
	          <th width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>

					<th noWrap>
						表英文名称
					</th>
					<th noWrap>
						表中文名称
					</th>
					<th noWrap>
						业务类别
					</th>

					<th noWrap>
						数据连接
					</th>
					<th noWrap>
						状态
					</th>
				</TR>

				<logic:iterate id="dto" name="t01_mt_propertyList"
					type="com.ist.common.metadata.dto.T01_mt_property">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("tablekey", ""+dto.getTablekey());
								map.put("categorykey",""+dto.getCategorykey());
								map.put("newsearchflag","1");
								map.put("isroot",request.getParameter("isroot"));
								pageContext
								.setAttribute("map", map, PageContext.PAGE_SCOPE);
								
					%>
					<TR align="center">
						<TD>
							<html:multibox property="selectedtable">
								<bean:write name="dto" property="tablekey" />
							</html:multibox>
						</TD>

						<TD>
							<bean:write name="dto" property="tableename" />
						</TD>

						<TD>
							<html:link name="map"
								page="/column/metadata_cols_list.do">
								<bean:write name="dto" property="tablecname" scope="page" />
							</html:link>							
						</TD>
						<TD>
							<bean:write name="dto" property="categorykey_disp" scope="page" />
						</TD>


						<TD>
							<bean:write name="dto" property="dblinkkey_disp" scope="page" />
						</TD>

						<TD>
							<bean:write name="dto" property="flag_disp" scope="page" />
						</TD>
					</TR>
				</logic:iterate>
			</TABLE>
			</div>
			<div class='list_page'>
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
			</div>
		</html:form>
		</div>
	</BODY>
</HTML>
