<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
       function dosubmit(theUrl,type){
       if(type=="save"){
        if (getLength(document.forms[0].handlereport.value)==0) {
          alert( "协查结果不能为空！");
         document.forms[0].handlereport.focus();
         return false;
         }
         else if(getLength(document.forms[0].handlereport.value.replace(/[\s\u12288\u3000]*/g,''))==0){
         	alert("协查结果不能都为空格！");
         	document.forms[0].handlereport.focus();
         	return false;
         }
       
           if (!CheckStcrLeng(document.forms[0].handlereport,600) ){
             alert("协查结果不能大于600个字符，300个汉字！");  
　　　　　document.forms[0].handlereport.focus();
              return false;
           }
         }
         
        document.forms[0].action=theUrl;
        document.forms[0].submit();
       }
     

 function iFrameHeight(iframename) { 
 //alert(iframename);
var ifm= document.getElementById(iframename); 
var subWeb = document.frames ? document.frames[iframename].document : ifm.contentDocument; 
if(ifm != null && subWeb != null) {
ifm.height = subWeb.body.scrollHeight; 
} 
}

	function _Open(url){
	url=url+"&application_num="+document.forms[0].application_num.value;
	//alert(url);
 window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
// window.open(url);
      
}
		</script>

</head>
<body  class="mainbg">
<div id="main">
<html:form action="/checkcase/updateT07_case_Assis.do" method="post">
	<html:errors />
 <html:hidden property="application_num" />
 
 <input type="hidden" name="casesearchtime" value="<%=(String)request.getAttribute("casesearchtime") %>" />
 <html:hidden property="assitno" name="t07_case_Assist" />
<!-- conditions -->
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>可疑案例协查 - 协查工作台</span>
	  <span class="buttons">
      <a href="#" onclick="dosubmit('updateT07_case_AssisDo.do','save')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>&nbsp;&nbsp;
	    <a href="#" onclick="dosubmit('checkcase_list1.do','')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>&nbsp;&nbsp;
	  </span>
	</div>
    <!-- table content -->			
 <div class="cond_c2">
      <table border="0" cellpadding="0" cellspacing="0">
       <tr>
          <th colspan="4"><strong>案例信息</strong></th>
        </tr>
  
   
                  <%
                  String party_id=(String)request.getAttribute("party_id");
                   if(party_id.contains("#")){
					        	party_id = party_id.replace("#","%23");
				    }
                  String application_num=(String)request.getAttribute("application_num");
                  String casesearchtime=(String)request.getAttribute("casesearchtime");
                  String str="party_id="+party_id+"&application_num="+application_num+"&casesearchtime="+casesearchtime;
                   %>
	   <tr>
                <td >客户编号：</td>
              <td > 
              <bean:write name="t07_case_application" property="party_id" />
              </td>
               <td>客户名称：</td>
                <td> 
                <bean:write name="t07_case_application" property="party_name" />
                </td>
             </tr>
          <tr>
        <td>可疑特征：</td>
         <td colspan="3">
         <logic:iterate id="stcr" name="stcrList">
                       <bean:write name="stcr" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <br/>
                                <br/>
              </logic:iterate>
          </td>
        </tr>
           <tr >
              <td > 可疑程度：</td>
              <td colspan="3"> 
              <bean:write name="t07_case_application" property="alert_level_disp" />
              </td>
              </tr>
           
             <tr >
                <td>可疑行为描述：</td>
              <td > 
              <bean:write name="t07_case_application" property="action_descrip" />
              </td>
               <td >采取措施：</td>
                <td > 
                <bean:write name="t07_case_application" property="take_action" />
                </td>
             </tr>
              <tr>
                <td >发起机构：</td>
              <td  > 
               <bean:write name="t07_case_Assist" property="req_orgname" />
              </td>
               <td >发起时间：</td>
                <td > 
                <bean:write name="t07_case_Assist" property="req_time_disp" />
                </td>
             </tr>
             <tr >
             <td >协查原因：</td>
             <td colspan="3" style="white-space:normal;">
                 <bean:write name="t07_case_Assist" property="reasons" />
               
              </td>
              
               </tr>
            
            
            <tr>
             <td>协查结果：</td>
             <td colspan="3" >
               <html:textarea property="handlereport" name="t07_case_Assist" cols="100" rows="5">
                </html:textarea>
                <input type="hidden" name="result" value="<bean:write name="t07_case_Assist" property="handlereport" />"/> 
              </td>
               </tr>

      </table>
    </div>
   </div>
   
	<iframe src="case_transList1.do?newsearchflag=1&<%=str%>" id="iframe2" name="iframe2" frameborder=0 scrolling=no width="100%"  ></iframe>
			
		</html:form>
	</div>
</body>
</html>
