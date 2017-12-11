<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><c:out value="${t02_tp_bas_inf.tplaname}" escapeXml="false">_测试</c:out></title>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
 		<script language="JavaScript" src="../../js/load_window.js"></script>
		<script src="../../js/jquery-1.6.min.js">
		<script src="../../js/jquery-ui-1.8.14.custom.min.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/Calendar.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">
		function onLoadPage() {
            var tableId = document.getElementById("tbl");
			var i = 0;
			 
			if(tableId == null) {
                return;
            }
		    for (var row in tableId.rows) {
			    if(tableId.rows[row].className == "hiddenRow") {
				    i = i + 1;
				   
			    }
		    }
		    if(i == 0){
		    	var oButton = document.getElementById("viewCondId");
		    	if (oButton) {
		    		oButton.style.display = "none";;
		    	}
		    }
		}
		
			<!-- 模型自定义脚本 -->
			<c:out value="${t02_tp_bas_inf.scriptcd}" escapeXml="false"></c:out>
			
			<!-- 自定义动作脚本和主调方法 -->
			<c:out value="${script}" escapeXml="false"></c:out>

			 var jqy=jQuery.noConflict();
				jqy(document).ready(function(){jq('input:button').addClass('in_button1');});

				var jq = jQuery.noConflict();
		         jq(document).ready(function(){
		        	 jq('#data_table a[name=pop]').click(function(){
		        		 jq('#data_table a[name=pop]').attr('id','');
		        		 jq(this).attr('id','1');
		        		 jq('input[id=btnID]').val(jq(this).attr('id'))
							});
		        	 jq('#data_table a[name=verify]').click(function(){
		        		 jq('#data_table a[name=verify]').attr('id','');
		        		 jq(this).attr('id','2');
		        		 jq('input[id=verify_btnID]').val(jq(this).attr('id'))
							});	
						});	

	         function _OpenE(url){
	        	 //window.parent.ymPrompt.win({message:url,width:600,height:400,title:'指标',handler:handler,iframe:true,fixPosition:true,dragOut:false});
	        	 window.open(url,'tranadviadd','height=280,width=600,left=300,top=200,scrollbars=yes, resizable=yes');
				}
	        function _OpenV(url){
	        	 //window.parent.ymPrompt.win({message:url,width:600,height:400,title:'指标',handler:handler,iframe:true,fixPosition:true,dragOut:false});
	        	 window.open(url,'tranadviadd','height=500,width=800,left=300,top=200,scrollbars=yes, resizable=yes');
				}	

	        function dosubmit(theUrl){
	        	   document.forms[0].action=theUrl;
	        	   document.forms[0].submit();
	        	}			
        </script>
	</head>

	<body class="mainbg">
	<!-- 系统总体框架，占页面宽度的98％ -->
	  <div class="main">
		<html:form method="post" action="/template/tpla_chk_main_test.do">
		 
			<!-- 标题区域 -->
			
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			 <% 
		    String dataStr=(String)request.getAttribute("rsltHtmlStr");
			String condHtmlStr=(String)request.getAttribute("condHtmlStr");
			String new_condHtmlStr="";
			//处理隐藏值
			if(condHtmlStr!=null && !"".equals(condHtmlStr)){
				int cond_s=condHtmlStr.indexOf("<input");
				int cond_e=condHtmlStr.indexOf("<tr>");
				new_condHtmlStr=condHtmlStr.substring(cond_s,cond_e);
			}
		    String new_rsltHtmlStr="";
		    if(dataStr!=null && !"".equals(dataStr)){
		    	String[] divStrs=dataStr.split("</div>");
		    	if(divStrs.length>1){
		    		String divPage=divStrs[1];
		    		//System.out.println("divStrs[0]::::::;"+divStrs[0]);
			    	String[] dataStrs=divStrs[0].split("</tr>");
			    	String title=dataStrs[0];
			    	new_rsltHtmlStr=dataStrs[0]+"</tr>";
			    	
			  
			    	
				    	for(int i=1;i<dataStrs.length-1;i++){
				    		String trStr=dataStrs[i];
				    		//处理连接中客户号含有#的情况
				    		if(trStr.contains("#") && trStr.contains("party_id=") 
				    				&& trStr.contains("party_class_cd=")){
				    			int repl_s = trStr.indexOf("party_id=");
				    			int repl_e = trStr.indexOf("party_class_cd=");
				    			if(repl_e > repl_s){
				    				String replace_cont = trStr.substring(repl_s,repl_e);
				    				//System.out.println("replace_cont::::::::::"+replace_cont);
					    			if(replace_cont.contains("#")){
					    				String newReplace_cont = replace_cont.replace("#","%23");
					    				trStr = trStr.replace(replace_cont,newReplace_cont);
					    			}
				    			}	
				    		}
				    		String tr_midStr="";
				    		//对可疑编辑岗的交易"排除"动作做处理
				    		if((trStr.contains("排除") || trStr.contains("恢复")) 
				    				&& trStr.contains("/report/case/addt07_stcr_trans_advi")){
				    			int e=0;
				    			if(trStr.contains("排除")){ 
				    				e=trStr.lastIndexOf("排除");
				    			}
				    			if(trStr.contains("恢复")){
				    				e=trStr.lastIndexOf("恢复");
				    			}
					    	    int s=trStr.indexOf("/report/case/addt07_stcr_trans_advi");
					    	    String beforestr=trStr.substring(0,s);
					    	   //System.out.println("beforestr:::::::::"+beforestr);
					    	    int bindex=0;
					    	    if(beforestr.lastIndexOf("<a")!=-1){
					    	    	 bindex=beforestr.lastIndexOf("<a");
					    	    	//System.out.println("beforestr1:::::::::"+beforestr.substring(0,bindex));
					    	    }
					    	    String leavestr=trStr.substring(e);
					    	   //System.out.println("leavestr:::::::::"+leavestr);
					    	    int index=0;
					    	    if(leavestr.indexOf("</a>")!=-1){
					    	    	 index=leavestr.indexOf("</a>");
					    	    	//System.out.println("leavestr1:::::::::"+leavestr.substring(index));
					    	    }
					    	    String	oldCon=trStr.substring(bindex,e+index+4);
					    	     //System.out.println("oldCon::::::::::"+oldCon);
					    		String oldFont=trStr.substring(e,e+index).trim();
					    		//System.out.println("oldFont::::::::::"+oldFont);
					    		int as=oldCon.indexOf("href=\"");
					    		int ae=oldCon.indexOf("&flag=");
					    		String af=oldCon.substring(as+6,ae+7);
					    		//System.out.println("af::::::::::"+af);
					    		if(af.contains("#")){
					    			af = af.replace("#","%23");
					    		}
					    		
					    		String newtrStr=trStr.replace(oldCon,"<a  href=\"javascript:void(0);\" name=\"pop\" onclick=\"_OpenE(\'"+af+"\');\" />"+oldFont+"</a>");
					    		
					    		tr_midStr+=newtrStr;
					    		//System.out.println("newtrStr::::::::::"+newtrStr);
				    		}else{
				    			tr_midStr+=trStr;
				    		}
				    		//add lizb 20130929 start
				    		if(tr_midStr.contains("未通过")&& tr_midStr.contains("/report/case/t47_transaction_se_verify")){
				    			int v_e = tr_midStr.lastIndexOf("未通过");
				    			int v_s=tr_midStr.indexOf("/report/case/t47_transaction_se_verify");
				    			String v_bStr = tr_midStr.substring(0,v_s);
				    			int v_bindex=0;
					    	    if(v_bStr.lastIndexOf("<a")!=-1){
					    	    	v_bindex=v_bStr.lastIndexOf("<a");
					    	    }
					    	    String v_leavestr=tr_midStr.substring(v_e);
					    	    int v_index=0;
					    	    if(v_leavestr.indexOf("</a>")!=-1){
					    	    	v_index=v_leavestr.indexOf("</a>");
					    	    }
					    	    String	v_oldCon=tr_midStr.substring(v_bindex,v_e+v_index+4);
					    	    //System.out.println("v_oldCon::::::::::"+v_oldCon);
					    	    String v_oldFont=tr_midStr.substring(v_e,v_e+v_index).trim();
					    		//System.out.println("v_oldFont::::::::::"+v_oldFont);
					    		int v_as=v_oldCon.indexOf("href=\"");
					    		int v_ae=v_oldCon.indexOf("title=");
					    		String v_af=v_oldCon.substring(v_as+6,v_ae - 2);
					    		//System.out.println("v_af::::::::::"+v_af);
					    		String v_newtrStr=tr_midStr.replace(v_oldCon,"<a  href=\"javascript:void(0);\" name=\"verify\" onclick=\"_OpenV(\'"+v_af+"\');\" />"+v_oldFont+"</a>");
					    		//System.out.println("v_newtrStr::::::::::"+v_newtrStr);
					    		new_rsltHtmlStr+=v_newtrStr+"</tr>";
				    		}else{
				    			new_rsltHtmlStr+=tr_midStr+"</tr>";
				    		}
				    		//add lizb 20130929 end
				    		//System.out.println("new_rsltHtmlStr::::::::::"+new_rsltHtmlStr);
				    	}
				    	new_rsltHtmlStr+="</table></div>";
				    	new_rsltHtmlStr+=divPage+"</div>";
			    	
		    	}else{
		    		new_rsltHtmlStr=dataStr;
		    	}
		    	
		    }
		    
		  %>
			<input type="hidden" id="btnID"/>
			<input type="hidden" id="verify_btnID"/>
		    <input type="hidden" id="check_flag"  value="check"/>
		    <!-- 查询条件区 -->
			<%=new_condHtmlStr %>
		    <!-- 自定义动作在上的HTML -->
		    <div align="right">
		      <c:out value="${up}" escapeXml="false"></c:out>
		    </div>
				
			<!-- 数据区 -->
			<%=new_rsltHtmlStr %>
			
			<!-- 隐藏数据区 -->
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			
			
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>

		</html:form>
	</div>
	</body>
	<script language="JavaScript">onLoadPage();</script>
</html>
		
			
