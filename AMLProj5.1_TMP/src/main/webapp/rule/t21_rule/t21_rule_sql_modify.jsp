<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 	
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>


<script language="JavaScript">
function dosubmit(theUrl){
					document.forms[0].totalSize.value = idTBSQL.rows.length-1;
					document.forms[0].action=theUrl;
					document.forms[0].submit();
	}
	function _Click(theUrl){
				var currsqlnum=document.forms[0].currsqlnum.value;
				var rulekey=document.forms[0].rulekey.value;
				theUrl=theUrl+"?rulekey="+rulekey+"&currsqlnum="+currsqlnum;
					document.forms[0].action=theUrl;
					document.forms[0].submit();
	}
			
			function addRow() {
				oTR    = idTBSQL.insertRow(idTBSQL.rows.length);
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
				   + " <textarea name ='selsql" + tmpNum + "' rows='13' cols='60' onClick=\"addTextEvent('"+tmpNum+"')\"></textarea>"
				   + " </td>"
				   + " </tr>";
				textRowName = "textRow" + tmpNum;

				//eval(textRowName).innerHTML="第" + tmpNum + "组SQL：是否主SQL：<input name='ismainsql' type='radio' value='"+tmpNum+"'>";
				
				document.forms[0].totalSize.value = idTBSQL.rows.length;

			}

			function delRow() {
				if (!confirm('你真的要删除页面最下方一组SQL吗？')) {
		           return false;
		        } 
				var vIndex = idTBSQL.rows.length - 1;
				if (vIndex == 1){
					alert("最少要有一组SQL！")
					return false;
				}
				idTBSQL.deleteRow(vIndex);
				document.forms[0].totalSize.value = idTBSQL.rows.length;
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
			
			function editFomular(obj){
				var f=document.forms[0];
				
				//modif by zhangqj 2010-2-20 begin
				if(typeof(f.selsql1)==='undefined'){
					alert('请先增加SQL语句！');
					return;
				}//modif by zhangqj 2010-2-20 end
				var currsqlnum=document.forms[0].currsqlnum.value;
			//	alert("currsqlnum"+currsqlnum);
				var sqlobj=eval("document.forms[0].selsql"+currsqlnum);
				var text=sqlobj.value;  //表达式
				var pos=parseInt(f.pos.value);// 定位光标
				var index=parseInt(f.pos.value);
		
				var preStr=text.substring(0,pos);
				var appStr=text.substring(pos,text.length);
				var newStr=preStr+obj.value+appStr;
				sqlobj.value=newStr;
				movePoint(index,currsqlnum);
				return;
			}
		
			function movePoint(pos,currsqlnum){
				var pn = parseInt(pos); 
				if(isNaN(pn)){ 
					 return; 
		 		}
		 		var sqlobj=eval("document.forms[0].selsql"+currsqlnum);
				var rng = sqlobj.createTextRange(); 
				rng.moveStart("character",pn); 
				rng.collapse(true); 
				rng.select(); 
		
				document.forms[0].pos.value=pos;
				sqlobj.focus();
				return;
			}
			
			function setPos(){
			  
				var f=document.forms[0];
				sqlnum=document.forms[0].currsqlnum.value;
				f.pos.value=getPos();
				  //alert("n"+f.pos.value);
				
			}
		
			function addTextEvent(sqlnum){
			
		    	var obj=event.srcElement;
				var mn_expreObj=document.getElementById("selsql"+sqlnum);
				document.forms[0].currsqlnum.value=sqlnum;
				
				// 添加事件
				if(mn_expreObj==obj){
				  setPos(); 
				//	mn_expreObj.attachEvent("onclick",setPos());
				//	mn_expreObj.attachEvent("onchange",setPos());
				}
				
				
			}
		
		
			//document.onclick=addTextEvent;
			
			/** 内容解析 */
			function contentParser(){
				
				var content = document.forms[0].selsql1.value;
				
				var liduObj = document.forms[0].test_lidu;
				//alert(liduObj.selectedIndex);
				var test_lidu = liduObj[liduObj.selectedIndex].value;
				
				var test_datadate = document.forms[0].test_datadate.value;
				//alert(content);
				parserFrame.document.forms[0].content.value = content;
				parserFrame.document.forms[0].test_lidu.value = test_lidu;
				parserFrame.document.forms[0].test_datadate.value = test_datadate;
				parserFrame.document.forms[0].parsetype.value = "sql";
				
				parserFrame.document.forms[0].submit();
			}

</script>
</head>
<body class="mainbg">
<div id="main">
	<html:form method="post" action="/t21_rule/modify_rule_sql.do">
	  <input type="hidden" name="totalSize" value="0" />
	    <input type="hidden" name="pos" value="0" />
	     <input type="hidden" name="currsqlnum" value="0" />
	    <input type="hidden" name="rulekey" value="<bean:write name="rulekey"/>" />
		<div class="conditions">
			<div class="cond_t">
						<span>编辑SQL </span>
						<span class="buttons">
						<a href="#" onclick="addRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />添加SQL</a>
						<a href="#" onclick="delRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删除SQL</a>
						</span>
			</div>
			<html:errors />
			
			<div class="cond_c">
			<table width="100%">
				<tr>
					<td>
						<table id="idTBSQL">
                                <tr>
                                    <td align="left">
                                      	  执行顺序
                                    </td>
                                    <td align="left">
                                        SQL表达式
                                    </td>
                                </tr>
                                <% int i=0; %>
                                <logic:iterate id="list" name="sqlList" type="com.ist.aml.rule.dto.T21_rule" >
                                <tr>
                                    <td align="left">
                                      <% 
                                       i=i+1;
                                      String j=String.valueOf(i);
                                      String exesql1="exeseq"+j; 
                                      String selsql1="selsql"+j; 
                                      String gs_sql_num=list.getGs_sql_num();
                                      if(gs_sql_num==null || gs_sql_num.equals("")){
                                      gs_sql_num="1";
                                      }
                                    %>
                                      	<input name ="<%=exesql1%>" size="2" value="<%=gs_sql_num%>" readonly="true">
                                    </td>
                                    <td align="left">
                                       <textarea name ="<%=selsql1%>" rows='13' cols='60' onClick="addTextEvent('<%=j%>')">
                                       <bean:write name="list" property="gs_sql"/>
                                       </textarea>
                                    </td>
                                </tr>
                                </logic:iterate>
                                 
                         </table>
                         <table >
                              
                                 <tr>
                                    <td>
                                      <input type="button" class="in_button1" value="提 交" onclick="dosubmit('modify_rule_sql_do.do')"/>	
                                    </td>
                                   
                                </tr>
                         </table>
					</td>
					<td>
					<table>
						<tr>
						 <td align="left" valign="top">
						 <b>系统参数：</b>
						 <br>
							<html:select property="syspara" style="width:300" size="10" onchange="editFomular(this)">
									<html:options collection="sysparaMap" property="label"
										labelProperty="value" />
							</html:select>
						 </td>	
						</tr>
						
						<tr>
						<td align="left" valign="top">
							<b>规则参数：</b>
                        	<br>
                        	<iframe src="<%=request.getContextPath()%>/rule/t21_rule/t21_rulepara_list.do?rulekey=<%=(String)request.getAttribute("rulekey")%>"
                        	 frameborder=0 scrolling=auto width="350" name="paramFrame" height=300></iframe>
                        </td>
						</tr>
					</table>
					</td>
				</tr>
      			
			</table>
			</div>
			
			<td>/</td>
		</div>
	</html:form>
	</div>
</BODY>
</HTML>
