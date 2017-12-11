<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.common.db.common.I_SqlSingDef" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
   	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    	
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script language="JavaScript">
	function save(theUrl){
       	var result = checkform();//校验表单
		if(result){
        	awpDoSubmit(theUrl);
        }
	}
	
	function savePos(oE){　   
		if(oE.createTextRange){         
			oE.caretPos = document.selection.createRange().duplicate();  
		}
  	}  

  	function copychar(from ,to){   
		var parvalueStr = document.getElementById(from).value;
	    var parlength=getLength(parvalueStr);
	    var parvalue=parvalueStr.substr(0, parlength);
	    var partype=parvalueStr.substr(parlength-1, parlength-1);
	    var text;

		if(partype=="1"){
			text = '<%=I_SqlSingDef.STATIC_SING%>' +parvalue+ '<%=I_SqlSingDef.STATIC_SING%>' ;
        }
        else {
			text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
        }

		var textEl = document.getElementById(to);

        if(textEl.createTextRange && textEl.caretPos){   
              var caretPos = textEl.caretPos;   
              caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == '' ? text + '' : text;   
        } else {  
              textEl.value = text;   
        }
 	} 
    </script>
  </head>
  <body>
 	<!-- 系统总体框架，占页面宽度的98％ -->
    <div id='content'>
      <html:form method="post" action="/search/t02_crlt_srch_modify.do">
        <html:hidden property="crltsrchkey" />
   	    <html:hidden property="srchengkey" />
   	    <html:hidden property="creator" />
        <html:hidden property="createdate" />
        <!-- 标题区域 -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">修改相关搜索</span></td>
			  	<td align="right">
	            <input type="button" name="Submit3" value="保 存" onClick="save('t02_crlt_srch_modify_do.do');">
	            <input type="button" name="Submit1" value="返 回" onClick="awpDoSubmit('t02_crlt_srch_list.do');">
		          &nbsp;
	          </td>
	        </tr>
	      </table>
		</div>
	    <!-- 错误信息提示区 -->
	    <html:messages id="errors" message="true">
          <bean:write name="errors" filter="fasle" />
        </html:messages>
	    <!-- 查询条件区 -->
	    <!-- 数据区 -->
 	    <div class='awp_detail'>
  	      <table>
	   	    <tr>
              <td width="10%" nowrap><font color="#FF3300">*</font>相关搜索名称：</td>
              <td colspan="3"><html:text property="crltsrchname" minlength="1" maxlength="64" warning="相关搜索名称"/>
              	（最多32个汉字）
			  </td>
	   	    </tr>
			<tr>
              <td width="10%" nowrap><font color="#FF0000">*</font>数据源：</td>
        	  <td colspan="3">
              	<html:select property="qryconncd">
					<html:options collection="qryconncdMap" property="label" labelProperty="value" />
				</html:select>
        	  </td>
     		</tr>
	   	    <tr> 
              <td width="10%" nowrap><font color="#FF3300">*</font>执行SQL：<br>（最多4000个字符）</td>
              <td width="55%">
       		    <html:textarea property="crltsrchsql" onkeydown="savePos(this)"
				  onkeyup="savePos(this)" onmousedown="savePos(this)"
				  onmouseup="savePos(this)" onfocus="savePos(this)" rows="20"
				  style="width:100%" minlength="1" maxlength="4000" warning="执行SQL"/>
              </td>
              <td width="10%" nowrap>参数：</td>
	          <td width="25%">
			    <html:select property="parmelmtcod" size="20" ondblclick="copychar('parmelmtcod','crltsrchsql')">
				  <html:options collection="parMap" property="label" labelProperty="value" />
			    </html:select>
	          </td> 
           </tr>
       	   <tr>
			<td nowrap="nowrap" align="right">
				<font color="#FF0000">*</font>相关搜索链接参数：<br>（最多512个字符）
			</td>
			<td>
				<html:textarea property="linkparm" rows="10" style="width:100%" 
				  minlength="1" maxlength="512" warning="相关搜索链接参数"></html:textarea>
			</td>
			<td nowrap="nowrap" align="right">相关搜索<br>参数列：</td>
			<td nowrap="nowrap" align="center">
				<html:select property="parmelmtcod" size="10" ondblclick="cpSelToText(this,'linkparm','')">
					<html:options collection="parMap" property="label" labelProperty="value"/>
				</html:select>
			</td>
		  </tr>
           <tr>
		     <td width="10%" nowrap>显示序号：</td>
  			 <td colspan="3"><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="显示序号"/>（最多3位数字）</td>
		   </tr>
	   	   <tr> 
             <td width="10%" nowrap>功能说明：<br>（最多2000个汉字）</td>
             <td colspan="3"> 
               <html:textarea style="width:97%" property="crltsrchdes" rows="4" maxlength="256" warning="功能说明"/>     
             </td>
           </tr>
         </table>
       </div>
      	<table border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
		</table>
		<!--系统信息提示区-->
     	<div class='awp_msgtab'>
		  	<table>
		   		<tr>
		    		<td>系统提示：</td>
		    		<td>
		    			<UL>
							<LI>1、执行SQL：SELECT的第一个项目为相关搜索链接显示名称，做为相关搜索链接参数的显示参数。
							<LI>2、相关搜索链接参数：各参数之间用&分隔，等号左侧为定义参数，右侧为执行SQL中的SELECT项目，如：#显示参数#&定义参数＝#SELECT项目#
						</UL>
		    		</td>
		   		</tr>
		  	</table>		
	    </div>
     </html:form>
   </div>
 </body>
</html>