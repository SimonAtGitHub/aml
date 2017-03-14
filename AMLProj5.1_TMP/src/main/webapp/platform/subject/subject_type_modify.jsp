<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.util.*,com.ist.platform.dto.T87_subject"%>
<html>
<head>
<%String root=request.getContextPath();
root="\""+root+"\"";%>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="../../js/App_Select.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
		
<%

  String sItem2=""; 
  java.util.List li=(java.util.List)request.getAttribute("t87_subjectList");

  Iterator it=li.iterator();
  while(it.hasNext())
  {
  T87_subject  area=(T87_subject)it.next();
  String  upId=area.getSubjecttype();
  String  areaId=area.getSubjectkey();
  String  areaName=area.getSubjectname();
  String idname2=upId+"@"+areaId+"#"+areaName;
   sItem2= sItem2+",\""+idname2+"\"";
       }
 if(!sItem2.equals("")){
    sItem2=sItem2.substring(1);
 }

%>
<SCRIPT LANGUAGE="JavaScript">

//将字符串转化成javascript中的数组

arrItem=new Array(<%=sItem2%>);

function _Click(fromstr,tostr,toselect){

   changelocation1(fromstr,tostr,arrItem,toselect);
   filter();
}
function filter(){
  var length1=document.forms[0].fromSelect.options.length;
  var length2=document.forms[0].toselect.options.length;
 // alert("length1::::"+length1);
   // alert("length2::::"+length2);
  if(length2>0){
     for( i=0;i<length1;i++ ){
       var value=document.forms[0].fromSelect.options[i].value;
       //alert("select:::::"+value);
       for(j=0;j<length2;j++){
          var valuecmp=document.forms[0].toselect.options[j].value;
         //alert("toselect::::"+valuecmp);
          if(value==valuecmp){
            document.forms[0].fromSelect.options[i]=null;
            //alert("value:"  + value);
            i--;
           length1--;
          }
       }    
     }
      
  }
}
function dosubmit(theUrl){
document.forms[0].action=<%=root%>+theUrl;
   document.forms[0].submit();
}


function dosubmit1(theUrl){
	
	 sel=allSelect(0,"toselect","value","");
	 document.forms[0].action=<%=root%>+theUrl;
   document.forms[0].submit();
}


function $getSelectedIds(){
	return $getSelectedValues("selectedid");
}	
function $getSelectedValues(fieldName){
   	var checks=document.getElementsByName(fieldName);
   	var ret=new Array();
   	var i;
   	for (i=0 ; i<checks.length; i++){   	
   		if (checks[i].checked)
   			ret =ret.concat(checks[i].value);
   	}
   	
   	return ret;
}


function  _Commit(url){
     document.forms[0].action=url;
   document.forms[0].submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0" > 
<div id="main">
<html:form action="/subject/subject_type_modify.do" method="post" >
<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>
 科目维护-修改 </span>		
		

      
            <span class="buttons">
       <a href=" #" onClick="dosubmit1('/platform/subject/subject_keep.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保存</a>
	   <a href="#"   onclick="dosubmit('/platform/subject/subject_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
   </span>
   </div>
<div class="cond_c2">
 <table  border="0" cellpadding="0" cellspacing="0">
 
            <tr> 
              <td >科目类别：</td>
              <td>
            	   <html:select property="subject_flag" onchange="_Click('subject_flag','fromSelect','toselect')">
　　　　　　　　　　<html:options collection="subject_typeMap" property="label" labelProperty="value" />
　　　　　　　　　　</html:select>	
              </td>
              
            </tr>
          </table> 
   </div>

   
			
			
		 <div class="cond_c">
  
        <table   border="0" cellpadding="1" cellspacing="0">

          <tr > 
            <td  >科目名称:</td>
            <TD > <table width="30%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td rowspan="4">
                
                    <html:select property="fromSelect" size="8" style="width:200" multiple="true">
　　　　　　　　　　<html:options collection="reftMap" property="label" labelProperty="value" />
　　　　　　　　　　</html:select>
                  
                  </td>
                  <td>
                    <input name="button22" type="button" class="in_button1" style="cursor:hand" onClick="allSelect(0,'fromSelect','value',''),copyToList1(0,'fromSelect','toselect','null',false,false);" value=" ALL>> "   border="0">
                </td>
                  <td colspan="2" rowspan="4"><font color="red">
                  
                    <html:select property="toselect" size="8" style="width:200" multiple="true">
　　　　　　　　　　<html:options collection="rightMap" property="label" labelProperty="value" />
　　　　　　　　　　</html:select>
                  </font></td>
                </tr>
                <tr>
                  <td>
                    <input name="button1" type="button" class="in_button1" style="cursor:hand" onClick="copyToList1(0,'fromSelect','toselect','null',false,false);" value=" >> "   border="0">
                  </td>
                </tr>
                <tr>
                  <td>
                    <input name="button2" type="button" class="in_button1" style="cursor:hand"  onClick="copyToList1(0,'toselect','fromSelect','null',false,false);" value=" << "   border="0">
               </td>
                </tr>
                <tr>
                  <td>
                    <input name="button32" type="button" class="in_button1" style="cursor:hand"  onClick="allSelect(0,'toselect','value',''),copyToList1(0,'toselect','fromSelect','null',false,false);" value=" ALL<< "   border="0">
                 </td>
                </tr>
              </table>			
             <td>
             </td>
          </tr>
        </table>
   
</div>
</div>

  </html:form>
  </div>
 <SCRIPT LANGUAGE="JavaScript">

  var length1=document.forms[0].fromSelect.options.length;
  var length2=document.forms[0].toselect.options.length;
 // alert("length1::::"+length1);
   // alert("length2::::"+length2);
  if(length2>0){
     for( i=0;i<length1;i++ ){
       var value=document.forms[0].fromSelect.options[i].value;
       //alert("select:::::"+value);
       for(j=0;j<length2;j++){
          var valuecmp=document.forms[0].toselect.options[j].value;
         // alert("toselect::::"+valuecmp);
          if(value==valuecmp){
            document.forms[0].fromSelect.options[i]=null;
            i--;
            length1--;
          }
       }    
     }
      
  }
  
  </SCRIPT>
  </body>
</html>