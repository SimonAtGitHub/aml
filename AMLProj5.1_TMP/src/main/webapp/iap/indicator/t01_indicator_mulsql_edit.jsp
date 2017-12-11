<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ist.iap.dto.T09_indic_subitem1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <META content="MSHTML 6.00.2600.0" name=GENERATOR>
    
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    
    <script src="<%=request.getContextPath()%>/js/load_window.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
		  function locate_pop_window(load_page_path ,localname ,issingle ,forms, localset,condition){	
			 var whole_path = load_page_path+'/platform/common/location_window.do?localname='+localname+'&issingle='+issingle+'&forms='+forms+'&localset='+localset+'&condition='+condition+'&newsearchflag=1';
		    
			 var top =  (window.screen.availHeight-30-400)/2;
			 var left = (window.screen.availWidth-10-750)/2;
		     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
				
		    window.open(whole_path,localset.split(',')[0],property);     
		   }        
			function dosubmit(theUrl,type){
					if(type=='test'){
						document.forms[0].target='_blank';
					}
					else{
						document.forms[0].target='_self';
					}
					document.forms[0].totalSize.value = idTBSQL.rows.length;
					document.forms[0].action=theUrl;
					document.forms[0].submit();
			}
			function checkForm(theUrl,type){
				var errMsg ="";
				var selVal = getvalue();
				 if(!selVal)
				    {
				    	 return false;
				    }
				 var  sel = 'selsql'+selVal;
				 var selsql =  document.getElementsByName(sel)[0].value;
				if (selsql==''){
					errMsg+="主SQL表达式不能为空！";
					document.getElementsByName(sel)[0].focus();
					
				}
				else if (getLength(document.forms[0].tabename.value)==0){
					errMsg+="目标表不能为空！";
					document.forms[0].tabename.focus();
					
				}
				//else if(getLength(document.forms[0].selsql1.value)==0){
				//	errMsg+="SQL表达式不能为空！";
				//	document.forms[0].selsql1.focus();
				//}
				
				
				if(errMsg!=""){
					alert(errMsg);
					return false;
				}
				
				
				dosubmit(theUrl,type);
				
			}
			function getvalue()
			{
				var isCheck = false;
				var selVal='' ;
				var oCheck = document.getElementsByName('ismainsql');
			
			    for(var i=0; i < oCheck.length; i++ )
			    {
			    	 if(oCheck[i].checked)
			    	 {
			    		selVal = oCheck[i].value ;
			    		isCheck = true;
			    	 }
			    }
			   if(!isCheck){
				   alert("请选择主SQL！");
			       return false;
			   }
			   return(selVal);
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
				   + " <textarea name ='selsql" + tmpNum + "' onkeydown='savePos(this)' onkeyup='savePos(this)' onmousedown='savePos(this)' onmouseup='savePos(this)' onfocus='savePos(this)' rows='13' cols='60'></textarea>"
				   + " </td>"
				   + " </tr>";
					 

				textRowName = "textRow" + tmpNum;

				//eval(textRowName).innerText="第" + tmpNum + "组SQL：是否主SQL：<input name='ismainsql'"+ tmpNum +" type='radio' value='1'>";
				eval(textRowName).innerHTML="第" + tmpNum + "组SQL：是否主SQL：<input name='ismainsql' type='radio' value='"+tmpNum+"'>";
				
				document.forms[0].totalSize.value = idTBSQL.rows.length;

			}

			function delRow() {
				if (!confirm('你真的要删除页面最下方一组SQL吗？')) {
		           return false;
		        } 
				var vIndex = idTBSQL.rows.length - 1;
				//alert(vIndex);
				if (vIndex == 0){
					alert("当前没有可以删除的内容，请首先添加一组SQL！")
					return false;
				}
				if (vIndex == 1){
					alert("最少要有一组SQL！")
					return false;
				}
				idTBSQL.deleteRow(vIndex);
				document.forms[0].totalSize.value = idTBSQL.rows.length;
			}

			function   savePos(oE)   
			  {   
					if(oE.createTextRange){         
						oE.caretPos   =   document.selection.createRange().duplicate(); 
					}
					getTextareaName();
			  } 
		    
			
		
		
		  function   copychar(from ,to)   
		  {   
		  		var to = document.forms[0].textareaName.value;
				var parvalueStr = document.getElementById(from).value;
			    var parlength=getLength(parvalueStr);
			    var parvalue=parvalueStr.substr(0, parlength);
			    var partype=parvalueStr.substr(0, 1);
			    var text;
						
				if(partype=="@"){
					text = parvalue;
		        }
		        else {
					text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
		        }
		        if(to!=''){
				var textEl = document.getElementsByName(to)[0];
		        if(textEl.createTextRange   &&   textEl.caretPos)   
		        {   
		              var   caretPos   =   textEl.caretPos;   
		              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
		        }   
		        else   
		              textEl.value     =   text; 
		        }  
		  } 
		  
		  function  getTextareaName()   
			  {   
			  
					var Texreas = document.getElementById("idTBSQL").getElementsByTagName("textarea");
				         if(Texreas.length>0){
				                 for(var i=0;i<Texreas.length;i++){
				                     Texreas[i].onfocus=function() { 
				                        
									    var getname = this.getAttribute('name');
									    
									    document.forms[0].textareaName.value = getname;
									 }
				                 }
				         } 
			  } 
			
<%--			function getPos(){ --%>
<%--				var txb = document.forms[0].selsql1; //获得对象 (表达式)--%>
<%--			    var pos = 0;--%>
<%--			--%>
<%--			    txb.focus();//输入框获得焦点--%>
<%--			    var s = txb.scrollTop;--%>
<%--			--%>
<%--			    var r = document.selection.createRange();--%>
<%--			    var t = txb.createTextRange();//创建输入框文本对象 --%>
<%--			--%>
<%--			    t.collapse(true);--%>
<%--			    t.select();//显示光标，将光标移到头--%>
<%--			    var j = document.selection.createRange();--%>
<%--			    r.setEndPoint("StartToStart",j);--%>
<%--			    var str = r.text;--%>
<%--			--%>
<%--			    var re = new RegExp("[\\n]","g");//过滤掉换行符,否则得到的数字怎么比实际长度要长. --%>
<%--			    str = str.replace(re,"");//过滤 --%>
<%--			    pos = str.length;--%>
<%--			    r.collapse(false); --%>
<%--			    r.select();--%>
<%--			    txb.scrollTop = s;--%>
<%--			--%>
<%--				return pos;--%>
<%--			}--%>
<%--			--%>
<%--			function editFomular(tag,type){--%>
<%--				var f=document.forms[0];--%>
<%--				--%>
<%--				var text=f.selsql1.value;  //表达式--%>
<%--				//alert(text);--%>
<%--				var pos=parseInt(f.pos.value);// 定位光标--%>
<%--				var index=parseInt(f.pos.value);--%>
<%--		--%>
<%--				var preStr=text.substring(0,pos);--%>
<%--				var appStr=text.substring(pos,text.length);--%>
<%--				var newStr=preStr+appStr;--%>
<%--				if(type=='sysfunction'){--%>
<%--					newStr=preStr+f.sysfunctions.value+appStr;--%>
<%--					index=pos+f.sysfunctions.value.length;--%>
<%--				}--%>
<%----%>
<%--				f.selsql1.value=newStr;--%>
<%--				movePoint(index);--%>
<%--				return;--%>
<%--			}--%>
<%--		--%>
<%--			function movePoint(pos){--%>
<%--				var pn = parseInt(pos); --%>
<%--				if(isNaN(pn)){ --%>
<%--					 return; --%>
<%--		 		}--%>
<%--				var rng = document.forms[0].selsql1.createTextRange(); --%>
<%--				rng.moveStart("character",pn); --%>
<%--				rng.collapse(true); --%>
<%--				rng.select(); --%>
<%--		--%>
<%--				document.forms[0].pos.value=pos;--%>
<%--				document.forms[0].selsql1.focus();--%>
<%--				return;--%>
<%--			}--%>
<%--			--%>
<%--			function setPos(){--%>
<%--				var f=document.forms[0];--%>
<%--				f.pos.value=getPos();--%>
<%--			}--%>
<%--		--%>
<%--			function addTextEvent(){--%>
<%--		    	var obj=event.srcElement;--%>
<%--				var mn_expreObj=document.getElementById("selsql1");--%>
<%--				--%>
<%--				// 添加事件--%>
<%--				if(mn_expreObj==obj){--%>
<%--					mn_expreObj.attachEvent("onclick",setPos);--%>
<%--					mn_expreObj.attachEvent("onchange",setPos);--%>
<%--				}--%>
<%--			}--%>
<%--		--%>
		
			//document.onclick=addTextEvent;
			
			/** 内容解析 */
			function contentParser(){

				var selVal = getvalue();
				 if(!selVal)
				    {
				    	 return false;
				    }
				 var  sel = 'selsql'+selVal;
				 var content =  document.getElementsByName(sel)[0].value;
				
				//var content = document.forms[0].selsql1.value;
				
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
			
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_mulsql_edit_do.do">
            <input type="hidden" name="pos" value="0" />
            <input type="hidden" name="textareaName" value="" />
             <div class="conditions">
	            <div class='cond_t'>
	              <span>指标定义 - 编辑SQL</span>
				  <span class="buttons">
				    <a href="javascript:void(0);" onClick="addRow();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />增加SQL语句</a>
				    <a href="javascript:void(0);" onClick="delRow();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删除SQL语句</a>
	                          
                    <%if(!"inedit".equals((String)request.getAttribute("type"))){ %>
                    <a href="javascript:void(0);" onClick="dosubmit('indicator_list.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
                    <%} %>
				  </span>
	            </div>
			</div>

            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

                <table height="30" width="98%" border="0" align="center" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td valign="bottom" class="td1">
                            <html:hidden property="indickey" />
                            <strong><bean:write name="t09_indicatorActionForm" property="indickey"
                                scope="request" />
                            --
                            <bean:write name="t09_indicatorActionForm" property="indicname"
                                scope="request" />
                            ; 指标类别：
                            <bean:write name="t09_indicatorActionForm" property="indictype_disp"
                                scope="request" />
                            定义方式：
                            <bean:write name="t09_indicatorActionForm" property="calmode_disp"
                                scope="request" /></strong>
                        </td>
                    </tr>
                </table>
                
 

            <div calss="cond_c2">
                <TABLE>
                    <tr>
                        <td align="left" nowrap colspan="2">
                            <table>
                                <tr>
                                    <td width="8%" align="left" nowrap>
                                        <font color="red">*</font>指标结果表：
                                    </td>
                                    <td width="92%" align="left" align="center">
                                    <input type="hidden" name="type" value="<%=(String)request.getAttribute("type") %>"/> 
                                        <html:hidden property="tabkey" />
                                        <html:text property="tabename" size="30"></html:text>
                                        <a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t01_mt_propertyLocation','radio','forms[0]','tabkey,tabename','(tabtype=\'2\' or tabtype=\'3\')');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <TR>
                        <TD align="center" valign="top">
                         
                            <table id="idTBSQL">
                                <tr>
                                    <td align="left">
                                        执行顺序
                                    </td>
                                    <td align="left">
                                        SQL表达式
                                    </td>
                                </tr>
                                <%
                                                    ArrayList indicator_mulsqlList = (ArrayList) request
                                                    .getAttribute("indicator_mulsqlList");

                                            for (int i = 0; i < indicator_mulsqlList.size(); i++) {
                                                T09_indic_subitem1 t01_indic_subitem1 = (T09_indic_subitem1) indicator_mulsqlList
                                                        .get(i);
                                                String checkedRadio = "";
                                                if (t01_indic_subitem1.getIsmainsql().equals("1")) {
                                                    checkedRadio = "checked";
                                                }
                                %>
                                <tr>
                                    <td align='left' valign='center'>
                                        <br>
                                        <input name="exeseq<%=i + 1%>" size='2'
                                            value="<%=t01_indic_subitem1.getExeseq()%>" readonly>
                                    </td>
                                    <td align='left' valign='top'>
                                        第
                                        <%=i + 1%>
                                        组SQL：是否主SQL：
                                        <input name='ismainsql' <%=checkedRadio%> type='radio'
                                            value='<%=i + 1%>'>
                                        <br>
                                        <textarea name="selsql<%=i + 1%>" onkeydown="savePos(this)"
											onkeyup="savePos(this)" onmousedown="savePos(this)"
											onmouseup="savePos(this)"  onfocus='savePos(this)' rows="13" cols="60"><%=t01_indic_subitem1.getExecsql()%></textarea>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </table>
                            </div>
                        </TD>
                        <TD align="center" valign="top">
                            <table>
                                
                                <tr>
                                    <td align="left" valign="top">
                                        <b>系统函数：</b>
                                        <br>
                                        <html:select property="sysfunctions" multiple="true"
                                            size="8" ondblclick="copychar('sysfunctions','selsql1');">
                                            <html:options collection="sysfunctionMap"
                                                property="label" labelProperty="value" />
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
									<td align="left" valign="top">
										<b>参数：</b>
										<br>
										<html:select property="parmcd" size="15" style="{width:220px} "
											ondblclick="copychar('parmcd','selsql1');">
											<html:options collection="parMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
                            </table>
                        </TD>
                    </TR>
                    <TR>
                        <TD align="center" valign="top" colspan="2">
                        <div calss="cond_c2">
                            <table>
                                <tr>
                                    <td align="left">
                                        <input type="hidden" name="totalSize" value="0" />
                                        <input type="button" name="button" value="提 交"
                                            onClick="checkForm('indicator_mulsql_edit_do.do')"
                                            class="in_button1">
                                        <html:reset styleClass="in_button1" value="重 填" />
                                    </td>
                                    <td align="center">
                                    </td>
                                </tr>
                            </table>
                            </div>
                        </TD>
                    </TR>
                </TABLE>
            </div>
        </html:form>
    </div>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
var count = idTBSQL.rows.length;
if(count < 2){
 addRow();
}

</SCRIPT>
</html:html>
