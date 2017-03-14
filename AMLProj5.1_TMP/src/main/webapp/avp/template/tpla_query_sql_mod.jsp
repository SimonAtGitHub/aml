<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef" %>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>筛选条件</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
	function save(theUrl){
	    //alert(getLength(document.forms[0].execsql.value));
	    var errMsg="";
	    if(getLength(document.forms[0].execsql.value)==0){
	         errMsg+="执行SQL不能为空！";
             document.forms[0].execsql.focus();  
             alert(errMsg);
             return false;  
	    }
	    
	   // if(getLength(document.forms[0].execsql.value) > 4000){
	    //     errMsg+="执行SQL不能大于4000个字符！";
        //     document.forms[0].execsql.focus();  
        //     alert(errMsg);
        //     return false;  
	    //}
	    
	    
	     if(document.forms[0].execseq.value!=null&&document.forms[0].execseq.value!=''){
		     if(!checkNumber((document.forms[0].execseq.value))||getLength(document.forms[0].execseq.value)>10){
		        errMsg+="执行顺序只能输入数字,并且不能大于10位！";
		        document.forms[0].execseq.focus();  
		        alert(errMsg);
		        return false;
		      }
		 }
		//if(checkSql(document.forms[0].execsql.value)){
		if(confirm("SQL更新可能会影相应响到模型的跳转条件及跳转参数，请注意检查，您确定要更新吗？")){
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
	    //}else{
	    	//alert("对临时表的操作必须是以*_temporary_table这种格式作为临时表名！");
	    //}
	}
	
  function   savePos(oE)   
  {   
		if(oE.createTextRange){         
			oE.caretPos   =   document.selection.createRange().duplicate();  
		}
  }  
  
  function   copychar(from ,to)   
  {   
		var parvalueStr = document.getElementsByName(from)[0].value;
	    var parlength=getLength(parvalueStr);
	    var parvalue=parvalueStr.substr(0, parlength-1);
	    var partype=parvalueStr.substr(parlength-1, parlength-1);
	    var text;

		 if(parvalue !=""){
        	if(partype=="1"){
        		if(parvalue.substr(0,1)!="@"){
        			text = '<%=I_SqlSingDef.STATIC_SING%>' +parvalue+ '<%=I_SqlSingDef.STATIC_SING%>' ;
        		}else{
        			text = parvalue;
        		}
	        }
	        else {
				text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
	        }
	
			var textEl = document.getElementsByName(to)[0];
	
	        if(textEl.createTextRange   &&   textEl.caretPos)   
	        {   
	              var   caretPos   =   textEl.caretPos;   
	              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
	        }   
	        else   
	              textEl.value     =   text;   
	        
	        }  
  } 
	
	
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_exec_qry_add_do.do">
	     <html:hidden property="tplakey"/>
	     <html:hidden property="execsqlkey"/>
			
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 定义SQL查询</span></td>
						<td align="right">
							<input type=button value="保存查询SQL" name=Button223 class="input" onClick="save('t02_tp_exec_qry_modify_do.do');">
                     		<input type=button value="返 回" name=Button52 class="input" onClick="dosubmit('t02_tp_exec_qry_list.do')">				                  </td>
					</tr>
				</table>
			</div>
		
		 <html:errors/>
	     <html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle"/>
		  </html:messages>
	
		
						
    <div class='awp_detail' >
		<table  >
			<tr >
				<td ><font color="#FF0000">*</font>执行SQL：<br></td>
				<td width="55%">
				   <html:textarea property="execsql" onkeydown="savePos(this)"
											onkeyup="savePos(this)" onmousedown="savePos(this)"
											onmouseup="savePos(this)" onfocus="savePos(this)" rows="20"
											style="width:100%"></html:textarea>
				</td>
				<td width="54px">参数：</td>
				<td width="45%">
				    <html:select property="parmcd" size="20"   style="width:100%"
											ondblclick="copychar('parmcd','execsql')">
											<html:options collection="parMap" property="label"
												labelProperty="value" />
										</html:select>
				</td>
			</tr>
		
			<tr >
				<td >是否主查询SQL：</td>
				<td >
				   <input type="hidden" name="ismainqueryold" value="<bean:write name="t02_tp_exec_qryActionForm" property="ismainquery" />"/>
				   <html:radio property="ismainquery" value="1">是</html:radio>
                                     <html:radio property="ismainquery" value="0">否</html:radio>
				</td>
				<td  width="54px"> 执行顺序：</td>
				<td>
				    <html:text property="execseq" styleClass="text_white"
											size="15"></html:text>
				</td>
			</tr>
        </table>
	</div>
		
	<div class="awp_msgtab">
	  <table>
		<tr> 
        <td ><p><strong>系统提示：</strong><br>
        <UL>
							<LI>1、动态参数：SQL执行时进行动态替换（即在执行sql时被替换为?），参数标志：#参数编码#
							<LI>2、静态参数：直接替换为用户输入值，参数标志：@参数编码:数据类型@，其中数据类型包括number，char，date三种，数据类型为可选项，不输默认为number
  							<LI>3、随 机 数：awp_random，8位随机数，如：@awp_random:char@,将生成8位随机字符
  							<LI>4、用户参数：awp_userid—用户登录号、awp_username－用户登录名称、
  							<LI>5、日期参数：awp_curr_date－当前日期、awp_curr_month_end－当前月末、awp_curr_season_end－当前季末、awp_curr_year_end－当前年末
							<LI>6、in必需使用静态参数,不能使用动态参数
						</UL>
        </td>
        </tr>
      </table>
    </div>
	
	
		</html:form>
		</div>
		
		<script type="text/javascript">
		    document.forms[0].execsql.focus();
		</script>
	</BODY>
</HTML>
