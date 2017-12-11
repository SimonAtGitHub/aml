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
		<script src="../../js/avpfunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"> 
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    if(type=='add'){
		    	if(getLength(document.forms[0].cols_id_textarea.value)==0){
		    		errMsg = "请输入列信息！输入格式参考下面的说明";
		    	}else{
		    		errMsg = check_input(document.forms[0].cols_id_textarea.value);
		    	}		    		
		    }
		    //判断是否有错误   
		    if(errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        alert(errMsg);
		        return false;
		    }
		}		
//检查输入格式是否有误	
		function check_input(str){
			var arrcol = str.split("\n");		
			for(i=0;i<arrcol.length;i++){
				if(arrcol[i].length != 0 && arrcol[i].length != 1){				
					var col = arrcol[i].split(",");
					if(col.length != 3){
						return("输入格式有错误，请重新输入");
					}
				}				
			}		
			return("");
		}
		
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/column/metadata_cols_list.do"
			method="POST">

			<input type="hidden" name="pos" value="0" />
			<html:hidden property="tablekey" />
			<html:hidden property="colkey" />
			<div class="conditions">
            <div class="cond_t">
               <span>元数据管理 - 表 - 列信息批量维护</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_list.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			   </span>
            </div>
	        <div class="cond_t2">
	        <strong>
	         <span>
                                          表英文名：
				<bean:write name="t01_mt_property" property="tableename" />
				表中文名：
				<bean:write name="t01_mt_property" property="tablecname" />
	         </span>
			</strong>
			</div>

			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
				<table>

							<!-- 
							 <tr>
									<td>
										<html:select property="cols_id_selected"
											style="{width:250px} " multiple="true" size="5">											
											<html:options collection="colsListMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
							 -->
								<tr align="left">
									<td>
										<html:textarea property="cols_id_textarea" rows="12" cols="100"
											styleClass="text_white"></html:textarea>
									</td>
								</tr>
								<tr align="left">
									<td class="in_button">
										<html:button property="batchadd" styleClass="input"
											value="批量添加"
											onclick="dosubmit('metadata_cols_batch_add_do.do','add')" />
									</td>
								</tr>
							</table>
						</div>
						  <div class="sys_warning">
							  <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />输入格式提示：</strong>
							        <p>每行输入项包括：列英文名、列中文名、列描述，中间用','隔开<br>
									        列英文名、列中文名、列描述可以为空，但是中间的','不可省略<br>
									        输入多行时使用'回车'换行<br>
									        列英文名可以参考右侧列出的列名<br>
									</p>
						      
						      
						    </div>
						
		</html:form>
		</div>
	</BODY>
</HTML>
