<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@page import="java.util.ArrayList"%>
<html>
    <HEAD>
        <META http-equiv=Content-Type content="text/html; charset=gb2312">
        <META content="MSHTML 6.00.2600.0" name=GENERATOR>
       <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
       <script language="JavaScript" src="../../js/basefunc.js"></script>
       <script type="text/javascript" src="../../js/jquery.js"></script>
       <script type="text/javascript" src="../../js/aml.js"></script>
        <SCRIPT LANGUAGE="JavaScript"> 
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='del'){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('你真的要删除选择的参数值吗？')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type=='add'){
		    	isSub = true;
		    }
		    else if(type=='back'){
		     
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
		function addRow(){
			var oTR    = table.insertRow(table.rows.length);
			var tmpNum = oTR.rowIndex;
			var temp = tmpNum -1 +1 -1;
			var oTD1   = oTR.insertCell(0);
			oTD1.setAttribute("bgColor","#ffffff");
			oTD1.setAttribute("hight","22");
			oTD1.setAttribute("align","center");
			
			
			var oInput1 = document.createElement("input");
			oInput1.size = 20;
			oInput1.type = "checkbox";
			oInput1.name = "subitemkeys";
			oInput1.id = "subitemkeys";
			//oInput1.attachEvent("onblur",getValue(this));
			oTD1.appendChild(oInput1);
			
			var oTD2   = oTR.insertCell(1);
			oTD2.setAttribute("bgColor","#ffffff");
			oTD2.setAttribute("hight","22");
			oTD2.setAttribute("align","center");
			
			
			var oInput2 = document.createElement("input");
			oInput2.size = "30";
			oInput2.type = "text";
			oInput2.className = "text_white";
			oInput2.name = "name"+temp;
			oTD2.appendChild(oInput2);
			
			var oTD3   = oTR.insertCell(2);
			oTD3.setAttribute("bgColor","#ffffff");
			oTD3.setAttribute("hight","22");
			oTD3.setAttribute("align","left");
			
			var oInput3 = document.createElement("input");
			oInput3.size = "15";
		    oInput3.name = "value1" + temp;
		    oInput3.className = "text_white";
			oInput3.type = "text";
			oTD3.appendChild(oInput3);		
			  var oTD4   = oTR.insertCell(3);
			oTD4.setAttribute("bgColor","#ffffff");
			oTD4.setAttribute("hight","22");
			oTD4.setAttribute("align","left");
			
			var oInput4 = document.createElement("input");
			oInput4.size = "15";
		    oInput4.name = "value2" + temp;
		    oInput4.className = "text_white";
			oInput4.type = "text";
			oTD4.appendChild(oInput4);
			
			document.forms[0].totalSize.value = table.rows.length-1;
			
  			}
  			
  			function deleteRow(){
  	  			var len = table.rows.length;
  	  			if(len == 2){
  	  				table.deleteRow(1);
  	  	  		}else{
				    for ( var i=0; i < document.forms[0].subitemkeys.length; i++ ){
				       if(document.forms[0].subitemkeys[i].checked){
				       table.deleteRow(i+1);
				       i=i-1;}
				    }
  	  	  		}
		}
  			function disabledAll(){
  				var flag = document.getElementsByName('deployflag')[0].value;
  				if('2' == flag){
  					var inputs = document.getElementsByTagName('input');
  					for(var i=0; i < inputs.length; i++){
  						if(inputs[i].name != 'button3'){
  							inputs[i].disabled = true;
  						}
  					}
  					
  				}
  			}
		</SCRIPT>
    </HEAD>
    <BODY leftmargin="0" topmargin="0">
        <div id='content'>
            <html:form action="/t21_rule/t03_param_bsn_argEdit.do" method="POST">
            <input type="hidden" value="<%=request.getAttribute("deployflag") %>" name="deployflag" />
                <div class="conditions">
					<div class="cond_t">
						<span>规则定义</span>
						<span class="buttons">
							<a href="javascript:void(0);" onclick="addRow();return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />新增</a>
							<a href="javascript:void(0);" onclick="deleteRow();return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删除</a>
							<a href="javascript:void(0);" onClick="dosubmit('t03_param_listSave.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
				            <a href="javascript:void(0);" onClick="window.close();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
						</span>
					</div>
                </div>

                <html:messages id="errors" message="true">
                    <bean:write name="errors" filter="fasle" />
                </html:messages>
			

                <div class='list'>
                    <TABLE id="table">                       
                      	<html:hidden property="tplakey"/>
                      	<html:hidden property="parmvalkey"/>
                        <TR align="center">
                            <TH noWrap>
                                选择
                            </TH>
                            <TH noWrap>
                                名称
                            </TH>
                            <TH noWrap>
                                参数值A
                            </TH>
                                <TH noWrap>
                                    参数值B
                                </TH>
                        </TR>        
                      
                        
                        
                           <%
                                    int i = 0;
                                    ArrayList list = new ArrayList();
                                    list = (ArrayList) request.getAttribute("t03_param_List");
                                    int totalRow = list.size();
                        %>
                        <input type="hidden" name="totalSize" value=<%=totalRow%>>
                        <logic:iterate id="dto" name="t03_param_List"
                            type="com.ist.aml.rule.dto.T03_param_list">
                            <TR align="center">
                                <TD noWrap>                                   
                                    <html:multibox property="subitemkeys">
                                        <bean:write name="dto" property="subitemkey" />
                                    </html:multibox>
                                </TD>
                                <%
                                                String name = "name" + i;
                                                String value1 = "value1" + i;
                                                String value2 = "value2" + i;
                                                String subitemkey = "subitemkey" + i;
                                %>
                                <TD noWrap>
                                    <input name="<%=name%>" type="text" class="text_white"
                                        size="30" value=<%=dto.getSubitemname()%>>
                                </TD>
                                <TD align="left" noWrap>
                                    <input name="<%=value1%>" type="text" class="text_white"
                                        size="15" value="<%=dto.getParam()%>">

                                </TD>                            
                                 <TD align="left" noWrap>
                                     <input name="<%=value2%>" type="text" class="text_white"
                                         size="15" value=<%=dto.getParam2()%>>
                                 </TD>                               
                            </TR>
                            <%
                            i = i + 1;
                            %>
                        </logic:iterate>
                    </TABLE>
                </div>
                
            </html:form>
        </div>
    </BODY>
    <script LANGUAGE="JavaScript">
	disabledAll();
</script>
</HTML>
