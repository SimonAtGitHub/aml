<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

<script language="JavaScript">

function getPos(field){ 
				//var txb = parent.document.forms[0].drlcontent; //获得对象 (表达式)
				var txb = eval("parent.document.forms[0]." + field);
			    var pos = 0;
			
			    txb.focus();//输入框获得焦点
			    var s = txb.scrollTop;
			
			    var r = document.selection.createRange();
			    var t = txb.createTextRange();//创建输入框文本对象 
			
			    t.collapse(true);
			    t.select();//显示光标，将光标移到头
			    var j = document.selection.createRange();
			    r.setEndPoint("StartToStart",j);
			    var str = r.text;
			
			    var re = new RegExp("[\\n]","g");//过滤掉换行符,否则得到的数字怎么比实际长度要长. 
			    str = str.replace(re,"");//过滤 
			    pos = str.length;
			    r.collapse(false); 
			    r.select();
			    txb.scrollTop = s;
			
				return pos;
			}
			
function editFomular(tag,type,fieldName){
				var f = parent.document.forms[0];
		
				var field = eval("parent.document.forms[0]." + fieldName);			
				//modify by zhangqj 2010-2-20
				if(typeof(field)==='undefined'){
					alert('请先增加SQL语句！');
					return;
				}
				var text=field.value;  //表达式
				var pos=parseInt(f.pos.value);// 定位光标
				var index=parseInt(f.pos.value);
		
				var preStr=text.substring(0,pos);
				var appStr=text.substring(pos,text.length);
				var newStr=preStr+appStr;
				
		
				if(type=='param'){
					newStr=preStr+tag+appStr;
					index=pos+tag.length;
				}
				
				field.value=newStr;
				
				movePoint(index,fieldName);
				return;
			}
		
			function movePoint(pos,fieldName){
				var f = "parent.document.forms[0]." + fieldName;
				var pn = parseInt(pos); 
				if(isNaN(pn)){ 
					 return; 
		 		}
				//var rng = parent.document.forms[0].drlcontent.createTextRange(); 
				var rng = eval(f).createTextRange(); 
				rng.moveStart("character",pn); 
				rng.collapse(true); 
				rng.select(); 
		
				parent.document.forms[0].pos.value=pos;
				eval(f).focus();
				return;
			}
			
			function setPos(field){
				var f=parent.document.forms[0];
				f.pos.value=getPos(field);
			}
		
function checkForm(theUrl)
{
	var errMsg = '';
    if(getLength(document.forms[0].para_des.value)==0){
        errMsg+="参数名称不能为空！";
        document.forms[0].para_des.focus();
    }
    if(getLength(document.forms[0].paratype.value)==0){
        errMsg+="参数类型不能为空！";
        document.forms[0].paratype.focus();
    }
    if(getLength(document.forms[0].para_min_val.value)==0){
        errMsg+="参数值不能为空！";
        document.forms[0].para_min_val.focus();
    }
    
    if(getLength(document.forms[0].para_des.value)>100){
        errMsg+="参数描述长度不能大于100个字符！";
        document.forms[0].para_des.focus();
    }
    
    if( errMsg=='')
    {
    	document.forms[0].action=theUrl;
    	document.forms[0].submit();
    }
    else
    {
    	if(errMsg!='')
		   alert(errMsg);
		return false;
    }
}
			
function _onchange()
{
	if(document.forms[0].paratype.value == "2")
	{
		 document.all.max.style.display='';
	}
	else
	{
		document.all.max.style.display='none';
	}
}
</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/t21_rule/t21_rulepara_modify.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>规则参数</span>
	   <span class="buttons">
			<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />关闭</a>
	   </span>
	    <html:hidden property="parakey" />
	    <html:hidden property="rulekey" />
					
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="#FF0000">*</font>参数编码：</td>
         <td>
         	<html:text name="t21_rule" property="parakey" readonly="true"/>
         	<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
         </td>
         <td><font color="#FF0000">*</font>参数名称：</td>
         <td> <html:text name="t21_rule" property="para_des" /></td>
       </tr>
       
       <tr>
         <td>参数类型</td>
         <td > 
         <html:select name="t21_rule" property="paratype"  onchange="_onchange();">
			<html:options collection="para_typeMap" property="label" labelProperty="value" />
		</html:select>
         </td>
        <td><font color="#FF0000">*</font>值：</td>
         <td>
           <html:text name="t21_rule" property="para_min_val"/> <span id="max" style="display:none">---<html:text name="t21_rule" property="para_max_val"/></span>
         </td>
       </tr>
       
       
       
       <tr>
         <td>参数值类型</td>
         <td > 
         <html:select name="t21_rule" property="paravaltype">
			<html:options collection="para_typevalMap" property="label" labelProperty="value" />
		 </html:select>
         </td>
         <td>是否启用</td>
         <td>
         <html:select name="t21_rule" property="para_flag">
			<html:options collection="para_flagMap" property="label" labelProperty="value" />
		 </html:select>
         </td>
       </tr>
       
       <tr>
         <td></td>
         <td colspan="4" align="center" class="in_button" >
         <html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t21_rulepara_modify_do.do')"/>
         <input name="" type="reset" value="重 置" />
		 </td>
	   </tr>
	  </table>
	</div>
  </div>
</html:form>
</div>
</BODY>
</HTML>