<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <html:base />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script> 
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/selectbox.js"></script>

		<script language="JavaScript">
		function dosubmit(theUrl){
		    document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		function checkForm(theUrl){
			selectAllOptions(document.forms[0].righttablist);
		    document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		
		function queryInfo(){
				selectAllOptions(document.forms[0].righttablist);
				dosubmit('metadata_tab_batch_add1.do');
		}
		
		</script>
	</head>

	<body leftmargin="0" topmargin="0">
		<html:form action="/table/metadata_tab_batch_add2.do" method="POST">
		<div class="conditions">
		<div class="cond_t">
               <span>元数据管理- 元数据连接 - 选择表</span>
			   <span class="buttons">
			   <logic:notEqual value="1" name="isroot">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_tab_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			    </logic:notEqual>
			    <logic:equal value="1" name="isroot">
			     <a href="javascript:void(0);" onclick="dosubmit('metadata_tab_list.do?isroot=1');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			    </logic:equal>
			   </span>
            </div>
            </div>
<html:hidden property="categorykey"/>			
<html:messages id="errors" message="true">
<bean:write name="errors" filter="fasle"/>
</html:messages>


			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr style="display:none">

									<td >
										<FONT color="#ff0000">*</FONT>数据连接：
									</td>
									<td >
										<html:select property="dblinkkey">
											<html:options collection="metadata_linkMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>

								<tr >
									<td >
										过滤条件：
									</td>
									<td >
										表名称：
										<html:text property="tablename" styleClass="text_white"
											size="20" />
										类型：
										<html:select property="tableview_type">
											<html:options collection="tableviewMap" property="label"
												labelProperty="value" />
										</html:select>

										<input type="button" name="button" value="查  询"
											onClick="queryInfo()" class="in_button1">
									</td>
								</tr>

								<tr >
									<td width="160" >
									</td>
									<td >
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr >
												<TD width="160" height="30" align="left">
													原始表：
												</TD>
												<TD width="50" height="30" align="center">
												</TD>
												<TD height="30" align="left">
													已选择表：
												</TD>
											</tr>
											<tr >
												<TD height="30" align="center">
													<html:select property="lefttablist" style="{width:250px} " multiple="true" size="15" ondblclick="moveSelectedOptions(this.form['lefttablist'],this.form['righttablist'])">
														<html:options collection="leftTabMap" property="label" labelProperty="value" />
													</html:select>
												</TD>
												<TD width="50" height="30" align="center">
													<INPUT type="Button" name="" value=" >> " Class="input"  onClick="moveSelectedOptions(this.form['lefttablist'],this.form['righttablist'])" />
													<BR><BR>
													<INPUT type="Button" name="" value="ALL >>" Class="input" onClick="moveAllOptions(this.form['lefttablist'],this.form['righttablist'])" />
													<BR><BR>
													<INPUT type="Button" name="" value=" &lt;&lt; " Class="input" onClick="moveSelectedOptions(this.form['righttablist'] , this.form['lefttablist'])" />
													<BR><BR>
													<INPUT type="Button" name="" value="ALL &lt;&lt;" Class="input" onClick="moveAllOptions(this.form['righttablist'] , this.form['lefttablist'])" />
												</TD>
												<TD height="30">
													<html:select property="righttablist" style="{width:250px}" multiple="true" size="15" ondblclick="moveSelectedOptions(this.form['righttablist'] , this.form['lefttablist'])">
														<html:options collection="rightTabMap" property="label" labelProperty="value" />
													</html:select>
												</TD>
											</tr>
										</table>
								</tr>


								<tr >
									<td >
									</td>
									<td >
									<logic:notEqual value="1" name="isroot">
										<html:button property="button" styleClass="in_button1" value="提  交" onclick="checkForm('metadata_tab_batch_add_do.do')" />
									</logic:notEqual>
									<logic:equal value="1" name="isroot">
										<html:button property="button" styleClass="in_button1" value="提  交" onclick="checkForm('metadata_tab_batch_add_do.do?isroot=1')" />
									</logic:equal>
										<html:reset styleClass="in_button1" value="重  填" />
									</td>
								</tr>
							</table>
					</div>
		</html:form>
	</body>
</html>
