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
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
  var errMsg ="";
  if(getLength(document.forms[0].statistic_dt_disp.value)==0){
      errMsg+="请选择日期！";
      document.forms[0].statistic_dt_disp.focus();
  }
  else if(getLength(document.forms[0].querycount_n.value)==0){
      errMsg+="查询笔数不能为空！";
      document.forms[0].querycount_n.focus();
   }
  else if(formatNum(document.forms[0].querycount_n.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].querycount_n.focus();
   }
  else if(getLength(document.forms[0].partycount_n.value)==0){
      errMsg+="涉及客户数不能为空！";
      document.forms[0].partycount_n.focus();
   }
  else if(formatNum(document.forms[0].partycount_n.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].partycount_n.focus();
  } 
  else if(getLength(document.forms[0].acctcount_n.value)==0){
      errMsg+="涉及账户数不能为空！";
      document.forms[0].acctcount_n.focus();
   }
  else if(formatNum(document.forms[0].acctcount_n.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].acctcount_n.focus();
  }else if(getLength(document.forms[0].kycount_n.value)==0){
      errMsg+="发现异常或可疑线索数不能为空！";
      document.forms[0].kycount_n.focus();
   }
  else if(formatNum(document.forms[0].kycount_n.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].kycount_n.focus();
  }else if(getLength(document.forms[0].querycount_r.value)==0){
      errMsg+="查询笔数不能为空！";
      document.forms[0].querycount_r.focus();
   }
  else if(formatNum(document.forms[0].querycount_r.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].querycount_r.focus();
  }else if(getLength(document.forms[0].partycount_r.value)==0){
      errMsg+="涉及客户数不能为空！";
      document.forms[0].partycount_r.focus();
   }
  else if(formatNum(document.forms[0].partycount_r.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].partycount_r.focus();
  }
  else if(getLength(document.forms[0].acctcount_r.value)==0){
      errMsg+="涉及账户数不能为空！";
      document.forms[0].acctcount_r.focus();
   }
  else if(formatNum(document.forms[0].acctcount_r.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].acctcount_r.focus();
  }
  else if(getLength(document.forms[0].kycount_r.value)==0){
      errMsg+="发现异常或可疑线索数不能为空！";
      document.forms[0].kycount_r.focus();
   }
  else if(formatNum(document.forms[0].kycount_r.value,0,null,null,false)==false){
      errMsg+="请输入整数！";
      document.forms[0].kycount_r.focus();
  }
   
  if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
 }
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/cust_identify/modifyT10_party_cretal.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>修改机构信用代码应用表</span>
	   <span class="buttons">
	    <a href="#" onclick="dosubmit('t10_party_cretal_managelist.do')"><img src="../../images/blue/b_back.png" />返回</a>
	   </span>
	 </div>
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><font color="#FF0000">*</font> 统计日期：</td>
            <td>
             <html:hidden name="t10_party_cretal" property="organkey"/>
             <html:text name="t10_party_cretal" property="statistic_dt_disp"  readonly="true"  size="6" />
            </td>
            <td><font color="#FF0000">*</font>查询笔数(重新客户识别)：</td>
            <td>
               <html:text name="t10_party_cretal" property="querycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font>查询笔数(新开客户)：</td>
            <td>
               <html:text name="t10_party_cretal" property="querycount_n"/>
            </td>
            <td><font color="#FF0000">*</font> 涉及客户数(重新客户识别)：</td>
            <td>
             <html:text name="t10_party_cretal" property="partycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font> 涉及客户数(新开客户)：</td>
            <td>
             <html:text name="t10_party_cretal" property="partycount_n"/>
            </td>
            <td><font color="#FF0000">*</font>涉及账户数(重新客户识别)：</td>
            <td>
               <html:text name="t10_party_cretal" property="acctcount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font>涉及账户数(新开客户)：</td>
            <td>
               <html:text name="t10_party_cretal" property="acctcount_n"/>
            </td>
            <td><font color="#FF0000">*</font> 发现异常或可疑线索数(重新客户识别)：</td>
            <td>
             <html:text name="t10_party_cretal" property="kycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font> 发现异常或可疑线索数(新开客户)：</td>
            <td colspan="3">
             <html:text name="t10_party_cretal" property="kycount_n"/>
            </td>
            
            
          </tr>
          <tr>
            <td align="center" colspan="4"><input name="" type="button" class="in_button1" value="提 交" onclick="checkForm('modifyT10_party_cretal.do')" />
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
