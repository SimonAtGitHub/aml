<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
        
<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	 
	
	function save(theUrl){ 
        
      if(getLength(document.forms[0].colename.value)==0){
          alert('列英文名称不能为空');
          document.forms[0].colename.focus(); 
          return false;
      }else{
          var Charstr=document.forms[0].colename.value;
          if(getLength(Charstr)>32){
	          alert('列英文名称不能大于32个字符！');
	          document.forms[0].colename.focus(); 
	          return false;
	      }
          
          var err=0;
          var msg='';
          for (j = 0; j <= Charstr.length - 1; j++) {
			Tempstr = Charstr.charAt(j);
			if(Tempstr==' '){
			   err=1;
			   msg='列英文名称不能包含空格！';
			   break;
			}
			if(j==0 && !((Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))){
			    err=1;
			    msg='列英文名必须以字母开头！';
			    break; 
			}
			
			if(Tempstr=='_'){
			
			}else if (!((Tempstr >= "0" && Tempstr <= "9") || (Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))) {
				 
                    err=1;
				    msg='列英文名称只能包含字母，数字和_下划线！';
				    break; 
		    }
		  }
		  
		  if(err==1){
		     alert(msg);
	         document.forms[0].colename.focus(); 
	         return false;
		  }
      
      }
      
      var colename_temp=document.forms[0].colename.value;
      var key=",asc,desc,char,varchar,date,decimal,not,null,primary,key,constraint,timestamp,create,update,commit,drop,table,view,function,procedure,from,order,by,group,select,where,and,or,";
      colename_temp = ','+colename_temp.toLowerCase()+','; 
      if(key.indexOf(colename_temp)!=-1){
          alert('列英文名称包含数据库关键字！');
          document.forms[0].colename.focus(); 
          return false;
      }
      
      if(getLength(document.forms[0].colcname.value)==0){
          alert('列中文名称不能为空');
          document.forms[0].colcname.focus(); 
          return false;
      }else if(getLength(document.forms[0].colcname.value)>32){
          alert('列中文名称不能大于16个汉字');
          document.forms[0].colcname.focus(); 
          return false;
      }
      
      if(parseInt(document.forms[0].collength.value)>4000){
	                 alert("列长度不能大于4000");
			         document.forms[0].collength.focus();  
			         return false;
	  }
      
      if(getLength(document.forms[0].collength.value)>0){
	      if(!checkNumber((document.forms[0].collength.value))||getLength(document.forms[0].collength.value)>4){
	         alert("列长度只能输入数字,并且最多4个数字！且不能大于18");
	         document.forms[0].collength.focus();  
	         return false;
	      }
	      
	      if(document.forms[0].coltype.value=='2'){ //number
	           if(parseInt(document.forms[0].collength.value)>18){
	                 alert("当字段类型为数字时，列长度不能大于18");
			         document.forms[0].collength.focus();  
			         return false;
	           }
	      }
	      
      }
      
      if(getLength(document.forms[0].numpoint.value)>0){
	      if(!checkNumber((document.forms[0].numpoint.value))||getLength(document.forms[0].numpoint.value)>4){
	         alert("列精度只能输入数字,并且最多4个数字！且不能大于18");
	         document.forms[0].numpoint.focus();  
	         return false;
	      }
	      
	      if(document.forms[0].coltype.value=='2'){ //number
	           if(parseInt(document.forms[0].numpoint.value)>18){
	                 alert("当字段类型为数字时，列精度不能大于18");
			         document.forms[0].numpoint.focus();  
			         return false;
	           }
	      }
      }
      
      if(parseInt(document.forms[0].numpoint.value)>parseInt(document.forms[0].collength.value)){
          alert("列精度必须小于列长度！");
         document.forms[0].numpoint.focus();  
         return false;
      }
      
 

      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0" onbeforeunload="leaveChk()">
 <div id="content">
 <html:form method="post" action="/entity/t03_entity_kind_man_index.do">		
 <html:hidden   property="tablekey"/> 
 <html:hidden   property="colename_old"/>
 <html:hidden   property="flag"/>
 <html:hidden   property="tableename"/>
   <div class="conditions">
    	<div class="cond_t">
    	<span>结果主体表维护 - 修改列属性</span></td>
    	<span class="buttons">
			<a href="#" onclick="save('col_t03_entity_kind_man_modify_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
 	   		<a href="#" onclick="dosubmit('col_t03_entity_kind_man_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
		</span>
		</div>
	<html:errors/>
	<div class="cond_c2"> 
       <table>
         
          <tr>
           <td><font color="#FF0000">*</font>列英文名称：</td>
           <td>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="1">
                 <html:text property="colename"  style="width:30%" readonly="true"></html:text>
             </logic:equal>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="0">
                 <html:text property="colename"  style="width:30%"></html:text>
             </logic:equal>
             
             <br>（最多32个字符，必须以字母开头，后面允许跟数字和_下划线）
           </td>
         </tr>
         <tr>
           <td><font color="#FF0000">*</font>列中文名称：</td>
           <td>
             <html:text property="colcname"  style="width:30%"></html:text>（最多16个汉字）
           </td>
         </tr>
         
         <tr>
           <td><font color="#FF0000">*</font>字段类型：</td>
           <td>
           <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="1">
                  <html:select property="coltype" disabled="true">
                    <html:options collection="coltypeMap" property="label" labelProperty="value"/>
                 </html:select>
             </logic:equal>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="0">
                    <html:select property="coltype">
                        <html:options collection="coltypeMap" property="label" labelProperty="value"/>
                    </html:select>
             </logic:equal>
             
           </td>
         </tr> 
 
         <tr>
           <td>列长度：</td>
           <td>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="1">
                <html:text property="collength" styleClass="avp_number"  style="width:30%" readonly="true"></html:text>
             </logic:equal>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="0">
                <html:text property="collength" styleClass="avp_number"  style="width:30%"></html:text>
             </logic:equal>
             （最多4个数字）
           </td>
         </tr> 
         <tr>
           <td>列精度：</td>
           <td>
              <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="1">
                 <html:text property="numpoint"  styleClass="avp_number"   style="width:30%"  readonly="true"></html:text>
             </logic:equal>
             <logic:equal name="t03_entity_kind_manActionForm" property="flag" value="0">
                 <html:text property="numpoint"  styleClass="avp_number"   style="width:30%"></html:text>
             </logic:equal>
             <br>（最多4个数字，只有字段类型为数字的列精度才有效 指小数点位数）
           </td>
         </tr>
         
       </table>
	</div>				
</div>				
		</html:form>
		</div>
		<script type="text/javascript"> 
		   var flag_one=document.forms[0].flag.value;
		   if(flag_one=='1'){
		      document.forms[0].colcname.focus(); 
		   }else{
		      document.forms[0].colename.focus(); 
		   }
		</script>
	</BODY>
</HTML>
