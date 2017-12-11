<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
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
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		        isSub = true;
		    }else if(type=='pass'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		        isSub = true;
		    }else if(type=='del'){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('您真的要删除选择的类别吗？')){
		                isSub = true;
		            }
		        }
		    }else if(type=='search' || type=='add' || type=='bus' || type=='pre'){
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
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form method="post" action="/t00_dict/t00_dict_list.do">
				<div class="conditions">	
				 <div class="cond_t">
	               <span>系统码表管理</span>
	               <span class="buttons">
	                 <a href="#" id="hdd_display" class="bt_hidden"></a>
	               </span>
	             </div>
	             </div>
	             <div id="tab_menu">
	                <a href="#">系统码表管理</a>
	                <a href="#" onclick="dosubmit('t00_dict_list.do?newsearchflag=1','pre');return false;">码表预览</a>
	                <a href="#" onclick="dosubmit('t00_dict_list_business_type.do?newsearchflag=1','bus');return false;">业务码表管理</a>
	             </div>
	             <!--<div id="bigTab">				
					<dl class="tabm">
					    <dd  class="tabcur">系统码表管理</dd>
						<dd >
							<span onclick="javascript:dosubmit('t00_dict_list_business_type.do?newsearchflag=1','bus');return false;">业务码表管理</span>
						</dd>
						<dd>
							<span onclick="javascript:dosubmit('t00_dict_list.do?newsearchflag=1','pre');return false;">码表预览</span>
						</dd>
				  </dl>
		        </div>-->
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class='cond_c' id="searchtable" style="display: none">
					<table>
						<tr>

							<td>
								类别代码：
							</td>
							<td>
								<html:text property="disctype" styleClass="text_white" size="30" />
							</td>
							<td>
								类别名称：
							</td>
							<td>
								<html:text property="disctypename" styleClass="text_white"
									size="30" />
							</td>

						</tr>
						<tr>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td nowrap>
								<input type="button" name="button" value="查 询"
									onClick="dosubmit('t00_dict_list_by_type.do?newsearchflag=1&type=search','search')"
									class="in_button1">
							</td>
						</tr>

					</table>
				</div>
               
				<div class='list'>
					<table>
						<tr>
							<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
							<th>
								类别代码
							</th>
							<th>
								类别名称
							</th>
						</TR>
						<logic:iterate id="dict" name="t00_dictList"
							type="com.ist.platform.dto.T00_dict">

							<TR>
								<TD>
									<html:multibox property="selectedDictkey" disabled="false">
										<bean:write name="dict" property="disctype" />
									</html:multibox>
								</TD>
								<TD>
									<bean:write name="dict" property="disctype" scope="page" />
								</TD>
								<TD>
									<bean:write name="dict" property="disctypename" scope="page" />
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
