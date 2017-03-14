<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("必须输入数字"); 
	form.focus(); 
	
	}
} 


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(trim(document.forms[0].risk_table.value))==0){
        errMsg+="数据表名不能为空！";
        document.forms[0].risk_table.focus();
    }else if(checkChinese(document.forms[0].risk_table.value)){
     	errMsg="数据表名不能含有汉字！";
     	document.forms[0].risk_table.focus();
    }else if(getLength(document.forms[0].risk_table.value)>20){
        errMsg+="数据表名不能超过20位！";
        document.forms[0].risk_table.focus();
    }
   
    
    if(errMsg==""){
    	document.forms[0].totalSize.value = TBSQL.rows.length-1;
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function addRow() {
				oTR    = TBSQL.insertRow(TBSQL.rows.length);
				tmpNum = oTR.rowIndex;
				
				oTD   = oTR.insertCell(0);
				oTD.innerHTML =
				     " <tr>"
				   + " <td align='left' valign='top'>"
				   + " <input name ='exeseq" + tmpNum + "' size='2' value='" + tmpNum + "' readonly>"
				   + " </td>";

				oTD1   = oTR.insertCell(1);
				oTD1.innerHTML=
				     " <td align='left' valign='top'>"
				   + " <a id = 'textRow" + tmpNum + "'></a> <br>"
				   + " <textarea name ='selsql" + tmpNum + "' rows='4' cols='80' onClick=\"addTextEvent('"+tmpNum+"')\"></textarea>"
				   + " </td>"
				   + " </tr>";
				textRowName = "textRow" + tmpNum;

				document.forms[0].totalSize.value = TBSQL.rows.length;

			}

function delRow() {
	if (!confirm('你真的要删除页面最下方一组SQL吗？')) {
		 return false;
	} 
	var vIndex = TBSQL.rows.length - 1;
	if (vIndex == 0){
		alert("没有可删除的SQL！")
		return false;
	}
	TBSQL.deleteRow(vIndex);
	document.forms[0].totalSize.value = TBSQL.rows.length;
}

function addTextEvent(sqlnum){
			
		    	var obj=event.srcElement;
				var mn_expreObj=document.getElementById("selsql"+sqlnum);
				document.forms[0].currsqlnum.value=sqlnum;
				
				// 添加事件
				if(mn_expreObj==obj){
				  setPos(); 
				}
				
				
}
function setPos(){
			  
				var f=document.forms[0];
				sqlnum=document.forms[0].currsqlnum.value;
				f.pos.value=getPos();
}
function getPos(){ 
			   sqlnum=document.forms[0].currsqlnum.value;
				var txb = eval("document.forms[0].selsql"+sqlnum); //获得对象 (表达式)
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

</SCRIPT>
</HEAD>
<body class="mainbg">
<html:form method="post" action="/t31_def_temp/t31_def_temp_gran_mod.do">
<input type="hidden" name="totalSize" value="0" />
<input type="hidden" name="currsqlnum" value="0" />
<input type="hidden" name="pos" value="0" />
<html:hidden property="templatekey" />
<div id="main">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>修改SQL执行粒度</span>
        <span class="buttons">
 	   		<a href="#" onclick="dosubmit('t31_def_temp_gran.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
		</span>
	</div>
  <html:errors/>
	<div class="cond_c2">
  		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<div align="right">
						<font color="red">*</font>SQL编码：
					</div>
				</td>
				<td>
					<html:text property="sqlkey" styleClass="text_white" size="20" readonly="true" />
					<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
				</td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right"><font color="red">*</font>SQL执行粒度：</div>
				</td>
				<td>
					<html:select property="sqlgranularity">
						<html:options collection="data_granularityMap" property="label" labelProperty="value" />
					</html:select>
				</td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right"><font color="red">*</font>数据表名：</div>
				</td>
				<td>
					<html:text property="risk_table" styleClass="text_white" size="20" />
				</td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right"><font color="red">*</font>数据粒度：</div>
				</td>
				<td>
					<html:select property="datagranularity">
						<html:options collection="data_granularityMap" property="label" labelProperty="value" />
					</html:select>
				</td>
			</tr>


			<tr>
			<table id="TBSQL" cellspacing="0" cellpadding="0">
				 <tr>
				 	<td align="left" width="15%">计算顺序</td>
                    <td align="left" width="35%">评级对象(执行sql)
                    	<a href="#" onclick="addRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />添加SQL</a>
						<a href="#" onclick="delRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删除SQL</a>
                    </td>
                    <td></td><td></td>
                 </tr>
                 <% int i=0; %>
                 <logic:iterate id="list" name="sqlList" type="com.ist.aml.newrisk.dto.T31_def_temp" >
                 <tr>
                    <td align="left">
                                      <% 
                                       i=i+1;
                                      String j=String.valueOf(i);
                                      String exesql1="exeseq"+j; 
                                      String selsql1="selsql"+j; 
                                      String gs_sql_num=list.getCalsql();
                                      if(gs_sql_num==null || gs_sql_num.equals("")){
                                      gs_sql_num="1";
                                      }
                                    %>
                           <input name ="<%=exesql1%>" size="2" value="<%=gs_sql_num%>" readonly="true">
                     </td>
                     <td  colspan="3">
                          <textarea name ="<%=selsql1%>" rows='4' cols='80' styleClass="text_white"><bean:write name="list" property="sql_str"/></textarea>
                      </td>
                   </tr>
                   </logic:iterate>
                                
			</table>
			</tr>
			

			<tr>
				<td></td>
				<td align="right" colspan="3">
					<input type="button" name="button1" class="in_button1" value="提 交" onclick="checkForm('t31_def_temp_gran_mod_do.do')" />
					<input type="reset" name="button1" class="in_button1" value="重 置" />
				</td>
			</tr>
		</table>
    </div>
  </div>
</div>   
</html:form>
</BODY>
</HTML>
