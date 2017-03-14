<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>添加输入参数</title>
		<SCRIPT LANGUAGE="JavaScript" src="<%= request.getContextPath() %>/js/basefunc.js"></script> 
		
<script language="JavaScript" src="<%= request.getContextPath() %>/js/avpfunc.js"></script>
<script language="javascript" src="<%= request.getContextPath() %>/js/awp_base.js"></script>
<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
     function save(theUrl){ 
        
      if(getLength(document.forms[0].tableename.value)==0){
          alert('表英文名称不能为空');
          document.forms[0].tableename.focus(); 
          return false;
      }else{
          var Charstr=document.forms[0].tableename.value;
          if(getLength(Charstr)>25){
	          alert('表英文名称不能大于25个字符！');
	          document.forms[0].tableename.focus(); 
	          return false;
	      }
          
          var err=0;
          var msg='';
          for (j = 0; j <= Charstr.length - 1; j++) {
			Tempstr = Charstr.charAt(j);
			if(Tempstr==' '){
			   err=1;
			   msg='表英文名不能包含空格！';
			   break;
			}
			 
			
			if(Tempstr=='_'){
			
			}else if (!((Tempstr >= "0" && Tempstr <= "9") || (Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))) {
				 
                    err=1;
				    msg='表英文名称只能包含字母，数字和_下划线！';
				    break; 
		    }
		  }
		  
		  if(err==1){
		     alert(msg);
	         document.forms[0].tableename.focus(); 
	         return false;
		  }
      
      }
      
      
      if(getLength(document.forms[0].tablecname.value)==0){
          alert('表中文名称不能为空');
          document.forms[0].tablecname.focus(); 
          return false;
      }else if(getLength(document.forms[0].tablecname.value)>32){
          alert('表中文名称不能大于16个汉字');
          document.forms[0].tablecname.focus(); 
          return false;
      }
      
      if(getLength(document.forms[0].sql.value)==0){
          alert('创建字段语句不能为空');
          document.forms[0].sql.focus(); 
          return false;
      }else if(getLength(document.forms[0].sql.value)>4000){
          alert('创建字段语句不能大于4000个字符');
          document.forms[0].sql.focus(); 
          return false;
      }
      
      if(getLength(document.forms[0].des.value)>256){
          alert('描述不能大于128个汉字');
          document.forms[0].des.focus(); 
          return false;
      }
      //setChangeFalse(); 
      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0" >
 <div id="content">
 <html:form method="post" action="/template/addT01_mt_property_tmp.do">
        <html:hidden property="dblinkkey"/>
		<html:hidden property="tplakey"/>
<div class='awp_title'>
	  <table >		
			  <tr>
			    <td  align='left'>临时表管理 - 添加</td>
			    <td align="right">
			         <input type=button value="保 存" name=Button223  onClick="save('addT01_mt_property_tmpDo.do');">
                      <input type=button value="返 回" name=Button223  onClick="dosubmit('t01_mt_property_tmp_list.do');">
			    </td>
			  </tr>				
					
	  </table>
	</div>
	<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
    </html:messages>
	 <div class='awp_detail'>
       <table>
         <tr>
           <td><font color="#FF0000">*</font>表英文名称：</td>
           <td>
             tmp<html:text property="tableename" style="width:30%"></html:text><br>（最多25个字符，默认以tmp开头，后面允许跟数字和_下划线）
           </td>
         </tr>
         <tr>
           <td><font color="#FF0000">*</font>表中文名称：</td>
           <td>
             <html:text property="tablecname"  style="width:30%"></html:text>（最多16个汉字）
           </td>
         </tr>
           <tr >
					<td>
						<font color="#FF0000">*</font>创建字段语句：<br>（最多4000个字符）
					</td>
					<td>
						<html:textarea property="sql" style="width:95%" rows="10"></html:textarea>
					</td>
				</tr>
         <tr>
           <td>描述：<br>（最多128个汉字）</td>
           <td>
             <html:textarea property="des" rows="5" style="width:95%"></html:textarea>
           </td>
         </tr>
       </table>
	</div>		
	<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
	 </table>
	<!--数据提示区-->
	<div class='awp_msgtab'>
		<table>
			<tr>
		 		<td>系统提示：</td>
		 		<td>
		 			<ol>
						<li> 创建字段语句: 字段之间要用","逗号分开(字段名称A 字段类型,字段名称B 字段类型)
						<li> 例如: REALNAME   VARCHAR(64),USERNAME VARCHAR(64)
					</ol>
		 		</td>
			</tr>
		</table>		
	</div> 
		</html:form>
		</div>
		<script type="text/javascript"> 
		  document.forms[0].tableename.focus();  
		  
		</script>
	</BODY>
</HTML>
