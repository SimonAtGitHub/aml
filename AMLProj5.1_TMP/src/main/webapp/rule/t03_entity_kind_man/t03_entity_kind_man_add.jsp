<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>		
		<title>添加输入参数</title>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript">
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
          if(getLength(Charstr)>22){
	          alert('表英文名称不能大于22个字符！');
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
			if(j==0 && !((Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))){
			    err=1;
			    msg='表英文名称必须以字母开头！';
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
      
      if(getLength(document.forms[0].memo.value)>512){
          alert('描述不能大于256个汉字');
          document.forms[0].des.focus(); 
          return false;
      }
     // setChangeFalse(); 
      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
	
</SCRIPT>
</HEAD>
 <BODY leftmargin="0" topmargin="0"   onbeforeunload="leaveChk()"	>
<div id="main">
<html:form method="post" action="/entity/t03_entity_kind_man_add.do">
	<div class="conditions">
		<div class="cond_t">	
			  <span>结果主体维护 - 添加表属性</span>
			  <span class="buttons">
				<a href="#" onclick="save('t03_entity_kind_man_add_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
 	   			<a href="#" onclick="dosubmit('t03_entity_kind_man_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
			  </span>
		</div>
	<html:errors/>
	<div class="cond_c2">
       <table>
         <tr>
           <td><font color="#FF0000">*</font>表英文名称：</td>
           <td>
             <html:text property="tableename" style="width:30%"></html:text><br>（最多22个字符，必须以字母开头，后面允许跟数字和_下划线,默认表名以t69_alert_开头）
           </td>
         </tr>
         <tr>
           <td><font color="#FF0000">*</font>表中文名称：</td>
           <td>
             <html:text property="tablecname"  style="width:30%"></html:text>（最多16个汉字）
           </td>
         </tr>
          <tr>
           <td>描述：<br>（最多256个汉字）</td>
           <td>
            <html:textarea property="memo" rows="10" style="width:95%"></html:textarea>
           </td>
         </tr>
           
       </table>
	</div>				
	</div>	
		</html:form>
		</div>
		<script type="text/javascript"> 
		  document.forms[0].tableename.focus(); 
		</script>
	</BODY>
</HTML>
