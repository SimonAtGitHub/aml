<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
    
    <title><c:out value="${labelStr}" escapeXml="false"></c:out>_定义行列转换</title>
    <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    
    <script src="<%=request.getContextPath()%>/js/load_window.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/selectbox.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    
    <script language="JavaScript">
      // 定位按钮按下时调用，在新窗口中打开定位画面
      function locate_pop_window_col_set(load_page_path, areatype){
          var whole_path = load_page_path+'/avp/template/location_window_col_set_report.do?&areatype='+areatype;
          var col_selObj = document.getElementById("colAreaSelect");
          var row_selObj = document.getElementById("rowAreaSelect");
          var data_selObj = document.getElementById("dataAreaSelect");
          selectAllOptions(col_selObj);
          selectAllOptions(row_selObj);
          selectAllOptions(data_selObj);
          avpSubmitPopUpSameNameWindow("", "selectField", whole_path, "600", "450");
      }
      // 点击“查看结果”按钮时，验证（行区域，列区域及数据区域均进行了选择）成功后，设定提交的URL
      function doSubmit(theUrl){
          var col_selObj = document.getElementById("colAreaSelect");
          var row_selObj = document.getElementById("rowAreaSelect");
          var data_selObj = document.getElementById("dataAreaSelect");
          if(col_selObj.length == 0 || row_selObj.length == 0 || data_selObj.length == 0) {
              alert("请分别对列区域、行区域和数据区域进行列标题的添加！");
              return;
          }
          selectAllOptions(col_selObj);
          selectAllOptions(row_selObj);
          selectAllOptions(data_selObj);

		  avpSubmitPopUpFullScreenAndSameWindow("", "viewResult" , theUrl);
      }
      // 定位子页面向本页面的行区域，列区域及数据区域设定选定的列标题时用
      function setSelectOption(elementName, value, text) {
          var oSelect = document.getElementById(elementName);
          var option = document.createElement("option");
          option.text = text;
          option.value = value;
          oSelect.add(option);
      }
      // 点击“重选”按钮时，清空行区域，列区域，数据区域及是否行列汇总的RADIO时用
      function resetAreaAndRadio() {
          removeAllOptions(document.getElementById("colAreaSelect"));
          removeAllOptions(document.getElementById("rowAreaSelect"));
          removeAllOptions(document.getElementById("dataAreaSelect"));
          var colElememts = document.getElementsByName("colsum");
          if(colElememts[0].checked == true) {
              colElememts[1].checked = true;
          }
          var rowElememts = document.getElementsByName("rowsum");
          if(rowElememts[0].checked == true) {
              rowElememts[1].checked = true;
          }
      }
      function dosubmit(theUrl,type){
  		
  	    var errMsg = "";
  	    var isSub = false;
  	    if(type == 'save'){
  	  	    var reportname = document.getElementsByName('reportname')[0].value;
			if (getLength(reportname) == 0) {
				alert("报表名称不能为空！");
                return;
			}
  	    	var col_selObj = document.getElementById("colAreaSelect");
            var row_selObj = document.getElementById("rowAreaSelect");
            var data_selObj = document.getElementById("dataAreaSelect");
            if(col_selObj.length == 0 || row_selObj.length == 0 || data_selObj.length == 0) {
                alert("请分别对列区域、行区域和数据区域进行列标题的添加！");
                return;
            }
            selectAllOptions(col_selObj);
            selectAllOptions(row_selObj);
            selectAllOptions(data_selObj);
  	    	isSub = true;
  	    }
  	    if(type == 'back'){
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
  </head>
  <body>
    <!-- 系统总体框架，占页面宽度的98％ -->
    <div id='content'>
      <html:form method="post" action="/template/t02_tp_report_add.do">
      	<html:hidden property="tplakey"/>
      	<html:hidden property="reportkey"/>
        <!-- 标题区域 -->
        <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}" escapeXml="false"></c:out>_定义行列转换</span></td>
						<td align="right">
							<input type=button value="返 回" name=Button52 class="input"	onClick="dosubmit('t02_tp_manager_list.do','back')" />
			             </td>
					</tr>
				</table>
			</div> 
        
       
        <!-- 错误信息提示区 -->
        <!-- 查询条件区 -->
        <!-- 数据区 -->
        <div class="awp_detail">
          <table>
          	<tr>
          		<td align="center">
          			<font color="#FF0000">*</font>报表名称：
          		</td>
          		<td align="center" colspan="4">
          			<html:text property="reportname"></html:text>
          		</td>
          	</tr>
            <tr>
              <td width="*" align=""></td>
              <td width="250" align="center"><font color="#FF0000">*</font>行区域</td>
              <td width="*" align=""></td>
              <td width="250"  align="center"><font color="#FF0000">*</font>列区域</td>
              <td width="*" align=""></td>
            </tr>
            <tr>
              <td width="*" align="right"></td>
              <td width="250" align="center"><select id="rowAreaSelect" name="row_cond" style="{width:210px}" size="15"  multiple="multiple">
              </select>
              </td>
              <td align="left">
                <input type="button" name="locate"  value="定 位" onClick="locate_pop_window_col_set('<%=request.getContextPath()%>','2');"/>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
				<br>
                <br>
                <input type="button" onClick="moveOptionUp(this.form['row_cond'])" value="上移↑">
                <br>
                <br>
                <input type="button" onClick="moveOptionDown(this.form['row_cond'])" value="下移↓">
                <br>
                <br>
                <input type="button" onClick="removeSelectedOptions(this.form['row_cond'])" value="删 除">
              </td>
              <td width="250" align="center">
                <select id="colAreaSelect" name="disp_cond" style="{width:210px}" size="15"  multiple="multiple">
                </select>
              </td>
              <td align="left">
                <input type="button" name="locate"  value="定 位" onClick="locate_pop_window_col_set('<%=request.getContextPath()%>','1');"/>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
				<br>
                <br>
                <br>
                <input type=button onClick="moveOptionUp(this.form['disp_cond'])" value="上移↑">
                <br>
                <br>
                <input type="button" onClick="moveOptionDown(this.form['disp_cond'])" value="下移↓">
                <br>
                <br>
                <input type="button" onClick="removeSelectedOptions(this.form['disp_cond'])" value="删 除">
              </td>
            </tr>
            <tr>
              <td width="*" align=""></td>
              <td width="250" align="center"><font color="#FF0000">*</font>数据区域</td>
              <td width="*" align=""></td>
              <td width="250"  align=""></td>
              <td width="*" align=""></td>
            </tr>
            <tr>
              <td width="*" align="right"></td>
              <td width="250" align="center">
                <select id="dataAreaSelect" name="data_cond" style="{width:210px}" size="15"  multiple="multiple">
                </select>
              </td>
              <td align="left">
                <input type="button" name="locate"  value="定 位" onclick="locate_pop_window_col_set('<%=request.getContextPath()%>','3');"/>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <input type="button" onClick="moveOptionUp(this.form['data_cond'])" value="上移↑">
                <br>
                <br>
                <input type="button" onClick="moveOptionDown(this.form['data_cond'])" value="下移↓">
                <br>
                <br>
                <input type="button" onClick="removeSelectedOptions(this.form['data_cond'])" value="删 除">
              </td>
              <td align="center" colspan="2">
                <font color="#FF0000">*</font>是否列汇总:<html:radio property="colsum" value="1">是</html:radio><html:radio property="colsum" value="0">否</html:radio><br>
                <font color="#FF0000">*</font>是否行汇总:<html:radio property="rowsum" value="1">是</html:radio><html:radio property="rowsum" value="0">否</html:radio>     
              </td>
            </tr>
            <tr>
              <td width="*" align=""></td>
              <td width="250" align=""></td>
              <td width="*" align=""></td>
              <td width="250"  colspan=2 align="left">
<%--                <input type="button" value="查看结果" onClick="doSubmit('tpla_row_col_convert_result.do')">--%>
				<input type="button" value="保 存" onClick="dosubmit('t02_tp_report_modify_do.do','save')">
                <input type="button" value="重 选" onClick="resetAreaAndRadio()"/>
              </td>
            </tr>
          </table>
        </div>
        <c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
      </html:form>
    </div>
  </body>
  <script type="text/javascript">
	var row_cond = "<c:out value="${t02_tp_reportActionForm.row_cond}"/>";
	var disp_cond =  "<c:out value="${t02_tp_reportActionForm.disp_cond}" />";
	var data_cond =  "<c:out value="${t02_tp_reportActionForm.data_cond}" />";
	var row_conds = row_cond.split("#");
	var disp_conds = disp_cond.split("#");
	var data_conds = data_cond.split("#");
	for(var i=0; i<row_conds.length; i++){
		var array_value = row_conds[i].split(",")
		setSelectOption("rowAreaSelect",row_conds[i],array_value[1]);
	}
	for(var i=0; i<disp_conds.length; i++){
		var array_value = disp_conds[i].split(",")
		setSelectOption("colAreaSelect",disp_conds[i],array_value[1]);
	}
	for(var i=0; i<data_conds.length; i++){
		var array_value = data_conds[i].split(",")
		setSelectOption("dataAreaSelect",data_conds[i],array_value[1]);
	}
	
  </script>
</html>