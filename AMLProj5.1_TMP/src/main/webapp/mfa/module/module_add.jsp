<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
  var errMsg ="";
  var total="0";
  if(obj != null)
  {
  var obj=document.forms[0].stcrscore;
  var length=obj.length;
  if(length>=1)
	{
	  for(k=0;k<length;k++){
		  if(getFloat(document.forms[0].stcrscore[k].value)<0)
		  {
			  alert("特征不可以打负分！");
			  return false;
		  }
		  else if(checkDouble(document.forms[0].stcrscore[k].value) == 0){ 
		        alert("特征为正数且小数点后最多两位！"); 
		        return false;
		      }
	  	total = getFloat(total) + getFloat(document.forms[0].stcrscore[k].value);
	  }
	}else
	{
		if(getFloat(document.forms[0].stcrscore.value)<0)
		  {
			  alert("特征不可以打负分！");
			  return false;
		  }
		total = getFloat(total) + getFloat(document.forms[0].stcrscore.value);
	}
  }
  
  if(getLength(document.forms[0].module_name.value)==0){
      errMsg+="模型名称不能为空！";
      document.forms[0].module_name.focus();
   }
  else if(getLength(document.forms[0].module_grey.value)==0){
      errMsg+="类别不能为空！";
      document.forms[0].module_grey.focus();
	}
  else if(document.forms[0].module_name.value ==1 && getLength(document.forms[0].totalday_str.value)==0){
      errMsg+="类模型时间区间不能为空！";
      document.forms[0].totalday_str.focus();
	}
  else if(getLength(document.forms[0].module_des.value)>1000){
     errMsg+="描述内容过多！";
     document.forms[0].module_des.focus();
  }
  else if(total!=100 && obj != null){
	     errMsg+="模型特征总分必需满足100！";
	  }
  if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
 }
function _check()
{
	//var aa = document.forms[0].keys_str1.value;
	var aa = "";
	var obj=document.forms[0].keystcr;
	if(obj != undefined)
		var len=obj.length;
	if(len>=1)
	{
		for(k=0;k<len;k++)
		{
			aa = aa + document.forms[0].keystcr[k].value + '*';
		}
	}
	aa = aa.substring(0,aa.length-1);
    ymPrompt.win({message:'<%=request.getContextPath()%>/mfa/module/t21_pbcrule_search.do?keys_str='+aa,width:600,height:450,title:'特征',handler:handler,iframe:true,fixPosition:true,dragOut:false});
}
function addrow(){
	var tab=document.getElementById("tableid");
    var hid_stcrkey=document.forms[0].hid_stcrkey.value;
    var hid_pbc_des= document.forms[0].hid_pbc_des.value
    var newscore="0";
	       
		var del="delRow(this)"			
		var newRow = tab.insertRow(); 	
			
		var cell0 = newRow.insertCell();
		var newval0=hid_stcrkey+"<input type=\"hidden\"  name=\"keystcr\" id=\"keystcr\" value=\""+hid_stcrkey+"\" />";
		cell0.innerHTML=newval0;

		var cell1 = newRow.insertCell();
		var newval1=hid_pbc_des+"<input type=\"hidden\"  name=\"pbc_des\" id=\"pbc_des\" value=\""+hid_pbc_des+"\" />";
		cell1.innerHTML=newval1;
			


		var cell2 = newRow.insertCell();
		cell2.innerHTML="<input type=\"text\" size=\"10\" name=\"stcrscore\" id=\"stcrscore\" value=\""+newscore+"\" /> ";

		var cell3 = newRow.insertCell();
		var bule='<%=session.getAttribute("style")%>';
		
		var dp="<img src=\"../../images/"+bule+"/b_delete.png\" title=\"删除\" />"
		cell3.innerHTML="<a href='#' onclick='"+del+"' >"+dp+"</a>";
	   }

function delRow(obj) {//删除一行
	var row = obj.parentElement.parentElement.rowIndex-1;
	var row = obj.parentElement.parentElement.rowIndex-1;
	var aaa = document.forms[0].keystcr[row].value;
	aaa = aaa + '*';

	var val = document.forms[0].keys_str1.value + '*';
	val = val.substring(0,val.indexOf(aaa)) + val.substring(val.indexOf(aaa)+aaa.length);
	val = val.substring(0,val.length-1);
	document.forms[0].keys_str1.value = val;
	
       var tab=document.getElementById("tableid");
       tab.deleteRow(row+1);
       
}
function _onblur(val)
{
	if(val == "1")
	{
		document.getElementById("dayflag").style.display='';
	}
	else
	{
		document.getElementById("dayflag").style.display='none';
	}
	
}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/module/module_add_do.do">
<input type="hidden" name="hid_stcrkey"/>
<input type="hidden" name="hid_pbc_des"/>
<input type="hidden" name="keys_str1" value="<bean:write name="keys_str"/>"/>
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>新建高级模型</span>
	   <span class="buttons">
	    <a href="#" onclick="dosubmit('module_list.do')"><img src="../../images/blue/b_back.png" />返回</a>
	   </span>
	 </div>
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            
            <td><font color="#FF0000">*</font>模型名称：</td>
            <td>
             <html:text property="module_name"/>
            </td>
           <td><font color="#FF0000">*</font>模型类型：</td>
            <td>
               <html:select property="module_type">
	       		   <html:options collection="module_typeMap" property="label"
			      labelProperty="value" />
	       	   </html:select>
            </td>
          </tr>
          
          <tr>
          	 <td><font color="#FF0000">*</font>模型类别：</td>
            <td>
               <html:select property="module_grey" onchange="_onblur(this.value);">
	       		   <html:options collection="module_greyMap" property="label"
			      labelProperty="value" />
	       	   </html:select>
            </td>
            <td>可疑交易行为代码：</td>
			<td>
				<html:text property="actioncode" styleClass="text_white" readonly="true"/>
				<a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t21_actioncodeLocation','radio','forms[0]','actioncode','');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
          </tr>
          <tr id="dayflag" >
            <td><font color="#FF0000">*</font>模型时间区间：</td>
            <td><html:text property="totalday_str"/></td> <td></td><td></td>
          </tr>
          <tr> 
          	<td>模型描述和指引：</td>
            <td colspan="3"  >
              <html:textarea property="module_des" styleId="module_des" rows="4" cols="70"></html:textarea>
            </td>
            
          </tr>
		   </table>
      </div>
      
     <div class="conditions">     
     <div class="cond_t">
     <span><font color="#FF0000">*</font>特征</span>
     <span class="buttons">
     	<a href="#" onClick="_check();"><img src="../../images/blue/b_add.png" />增加</a>
	 </span>
     </div>
     </div>
     
     <div class="list">
        <table border="0" cellpadding="0" cellspacing="0" id="tableid">
        	<tr>
          		<th nowrap align="center">特征编号</th>
          		<th nowrap align="center" >特征名称</th>
          		<th noWrap align="center">得分</th>
          		<th noWrap align="center">操作</th>
       		</tr>
        
          </tr>
          <logic:iterate id="t23_module_stcr" name="t23_module_stcrList" type="com.ist.mfa.dto.T23_module_stcr">
          <tr>
          	<td><bean:write name="t23_module_stcr" property="keystcr" scope="page" />
          		<input type="hidden" name="keystcr" value="<bean:write name="t23_module_stcr" property="keystcr" />"/>
          	</td>
          	<td><bean:write name="t23_module_stcr" property="pbc_des" scope="page" />
				<input type="hidden" name="pbc_des" value="<bean:write name="t23_module_stcr" property="pbc_des" />"/>
          	</td>
          	<td><input type="text" name="stcrscore" size="10" value="<bean:write name="t23_module_stcr" property="stcrscore" />"/></td>
          	<td><a href="#" onclick="delRow(this)">
				   <img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
			</td>
          </tr>
          </logic:iterate>
          </table>
          <tr>
            <td align="center" colspan="4"><input name="" type="button" class="in_button1" value="提 交" onclick="checkForm('module_add_do.do')" />
              <input name="" type="reset" class="in_button1" value="重 置" />
            </td>
          </tr>
        </table>
     </div> 
      
    </div>
    <!-- all end -->
  </div>
</html:form>
</body>
</html>
