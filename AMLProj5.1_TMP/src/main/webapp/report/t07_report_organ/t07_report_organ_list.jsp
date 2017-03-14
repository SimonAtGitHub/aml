<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript">
 function dosubmit(theUrl,type){
      var errMsg = "";
      var isSub = false;
      if(type=='del'){
         if(confirm('你真的要删除吗？')){
             isSub = true;
         }
      }
      else if(type=='del_s'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择的人行机构吗？')){
                    isSub = true;
                }
            }
        }
     else if(type=='add'||type=='modi'||type=='search'){
      isSub = true;
     }
     if(isSub && errMsg==''){
          document.forms[0].action=theUrl;
          document.forms[0].submit();
      }else{
          if(errMsg!='')
              alert(errMsg);
          return false;
      }
   }
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/t07_report_organ/t07_report_organ_list.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>人行机构管理</span>
	  <span class="buttons">
	    <a href="#" id="hdd_display" class="bt_hidden"></a>
	    <a href="#" onclick="dosubmit('t07_report_organ_add.do','add')"><img
			src="../../images/<%=session.getAttribute("style")%>/b_add.png" />新建</a>
		<a href="#" onclick="dosubmit('t07_report_organ_delete_checkBox_do.do','del_s')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>	
	  </span>  
 	</div>
 	<div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
            <td>人行机构编号：</td>
         	<td>
				<html:text property="report_organkey"/>
				
			</td>
         	<td>人行机构名称：</td>
         	<td>
         	    <html:text property="organname"/>&nbsp;&nbsp;
         	    <input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/t07_report_organ/t07_report_organ_list.do?newsearchflag=1','search')"/>
			</td>
           </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <th>选择</th>
	  <th>人行机构编号</th>
	  <th>人行机构名称</th>
	  <th>机构序列表</th>
	  <th>创建机构</th>
	  <th>操作</th>
	 </tr>
    <logic:iterate id="t07_report_organ" name="t07_report_organList" indexId="i" type="com.ist.aml.report.dto.T07_report_organ">
    <tr>
       <td>
         <html:multibox property="selectedReport_organkey">
           <bean:write name="t07_report_organ" property="report_organkey" scope="page"/>
         </html:multibox>
       </td>
       <td>
        <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/report/t07_report_organ/t07_report_organ_disp.do?report_organkey=<bean:write name="t07_report_organ" property="report_organkey" scope="page"/>&newsearchflag=1','search');">
         <bean:write name="t07_report_organ" property="report_organkey" scope="page" />
        </a>
       </td>
	     <td>
         <bean:write name="t07_report_organ" property="organname" scope="page" />
       </td>
	     <td>
         <bean:write name="t07_report_organ" property="seq_tablename" scope="page" />
       </td>
        <td>
         <bean:write name="t07_report_organ" property="inner_organkey" scope="page" />
       </td> 
       
       <td>
	       <a href="#" onclick="dosubmit('t07_report_organ_modify.do?report_organkey=<bean:write name="t07_report_organ" property="report_organkey" />','modi')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="修改" /></a>&nbsp;&nbsp;
		   <a href="#" onclick="dosubmit('t07_report_organ_delete_do.do?report_organkey=<bean:write name="t07_report_organ" property="report_organkey" />','del')">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
       </td>

    </tr>
	</logic:iterate>
	</table>
  </div>
</html:form>
<div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
		</div> 
</div>
</body>
</html>