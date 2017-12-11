<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
		    var errMsg ="";
		     if(getLength(document.forms[0].setype.value)==0){
		        errMsg+="索引类型不能为空！";
		        document.forms[0].setype.focus();
		    }else if(getLength(document.forms[0].des.value)==0){
		        errMsg+="索引块名称不能为空！";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].des.value)> 256){
		        errMsg+="索引块名称不能多于256个字符！";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].sql.value)==0){
		        errMsg+="SQL不能为空！";
		        document.forms[0].sql.focus();
		    //} 	
		    //else if(getLength(document.forms[0].block.value)==0){
		     //   errMsg+="上级索引块不能为空！";
		      //  document.forms[0].block.focus();
		    }else if(getLength(document.forms[0].sql.value)> 4000){
		        errMsg+="结果集合不能多于4000个字符！";
		        document.forms[0].sql.focus();
		    //}else if(getLength(document.forms[0].fields.value)> 500){
		    //    errMsg+="字段集合不能多于500个字符！";
		    //    document.forms[0].fields.focus();
		    }else if(getLength(document.forms[0].url.value)> 200){
		        errMsg+="访问URL不能多于200个字符！";
		        document.forms[0].url.focus();
		    } 
		    		       
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		function seturl(val){
		   var urlEle = document.forms[0].url;
			if(val == '0'){
			   urlEle.value = "cmp/attachment/t01_attachment_disp.do?attachkey=#attachkey#";
			}else{
			   urlEle.value  = "";
			}
		}
</SCRIPT>
</head>

<body>
<div id='content'>
	<html:form method="POST" action="/system_manager/t12_se_file_db/t12_se_file_db_add.do">
	
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">数据库搜索定义
								- 新 建 </span>
						</td>
						<td align="right">
							<html:button property="backbutton" styleClass="input" value="返  回"
							onclick="awpDoSubmit('t12_se_file_db_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				
<div class='awp_detail'>
		<TABLE>
			
							<tr>
								<td>
									<FONT color="#ff0000">*</FONT>索引块名称：
								</td>
								<td>
									<input type="text" name="des" size="32">
								</td>
							</tr>
							<tr>
								<td>
									<FONT color="#ff0000">*</FONT>索引类型：
								</td>
								<td>
								    <html:select  property="setype" onchange="seturl(this.value)">
										<html:options collection="seTypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<!--  <tr>
								<td>
									是否处理HTML标签：
								</td>
								<td>
									<html:select property="ishtml">
										<html:options collection="yesNoMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									上级索引块：
								</td>
								<td>
									<html:select property="block">
										<html:options collection="indexBlockMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>-->

							<tr>
								<td>
									<FONT color="#ff0000">*</FONT>SQL定义：
								</td>
								<td>
									<html:textarea property="sql" cols="60" rows="10">
									   
									</html:textarea>
								</td>
							</tr>
						<!-- 	<tr>
								<td>
									字段集合：
								</td>
								<td>
									<input type="text" name="fields" size="64">
								</td>
							</tr> -->
							<tr>
								<td>
									访问URL：
								</td>
								<td>
								    <html:textarea property="url" cols="60" rows="5">
									</html:textarea>
									<!-- 
									<input type="text" name="url" size="64">
									 -->
									
								</td>
							</tr>
							

							<tr>
								<td>
								</td>
								<td>
									<html:button property="button" styleClass="input" value="提  交"
										onclick="checkForm('t12_se_file_db_add_do.do')" />
									<html:reset styleClass="input" value="重  填" />
								</td>
							</tr>
						
		</TABLE></div>
		<div class="awp_msgtab">
			    <table>
			      <tr>
			        <td ><p><strong>说 明：</strong><br>
			            【sql定义】<br>
			                                   数据表：必须包含(TITLE： 名称,SECLEVEL： 密级 ,CONTENT： 内容)<br/>
			                                    附件：必须包含(TITLE： 名称,SECLEVEL： 密级 ,CONTENT： 附件路径) <br/> 
			            【访问URL】<br> 
			                               可用sql定义中除必须字段外的其他字段做参数<br>
			             【示例】<br/>
			                            索引类型:数据表<br/> 
			           sql定义： SELECT title AS TITLE,'1' AS SECLEVEL,DES AS CONTENT,NOTETIME,USERNAME FROM T00_CAL_NOTES<br/>
			                             访问URL： awp/bmp/platform/t00_cal_notes/t00_cal_notes_list_bytime.do?newsearchflag=1&type=2&USERNAME=#USERNAME#<br/>       
			      </tr>
			    </table>	    
			  </div>
	</html:form></div>
</body>
<script langeuage="JavaScript">
seturl('0');
</script>
</html:html>
