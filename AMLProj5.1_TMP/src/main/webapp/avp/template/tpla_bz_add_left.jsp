<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>自定义SQL菜单</title>
		 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="<%= request.getContextPath() %>/js/treeview2.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<form id="xform" name="xform" method="post" action=""
			target="mainFramex">
			<table width="100%" border="0">
				<tr align="center">
					<td align="center">
						<input type="button" name="Submit3" value=".....刷  新....."
							class="text_white" onClick="javascript:window.location.reload();">
					</td>
					
				</tr>
				<tr>
					<td colspan="2">

						<div id="MENUTREE"></DIV>

					</td>
				</tr>
			</table>
		</form>

		<script language="javascript">
		function strReplace(str,s,d){
			var len=s.length;
			var i=str.indexOf(s);
			while(i>0){
				str=str.substring(0,i)+d+str.substring(i+len,str.length);
				i=str.indexOf(s);
			}
			return str;
		}
		
		function _getQuery() {
			var urlStr=this.remark;
			top.status=this.title;
			if(urlStr=='' || urlStr==null || urlStr.length==0 || urlStr =='#'){
				return null;
			}
	        var f=document.forms(0);
	        var d=new Date();
	        urlStr=strReplace(urlStr,"&amp;","&");
	        if(urlStr.indexOf('?')>-1){
	            	urlStr=urlStr+"&temp_seq_ram="+d.getTime();
	        }
	        else{
	         	urlStr=urlStr+"?temp_seq_ram="+d.getTime();
	        }
	
	        f.action=urlStr;
	        f.target="mainFrame1";
	        if(f.target=='' || f.target=='null' ||  f.target.length==0){
	        	window.open(urlStr,'','');
	        }
	        else{
	        	f.submit();
	        }

			return null;
		}
		
		CreateTree();
		
		// 设置树的显示参数
		TREE.setTarget('MENUTREE',null,'mainFrame1');
	    TREE.add('10'    ,null   ,'模型管理','#'); 
	    TREE.add('100','10' ,"基本属性",'<%=request.getContextPath()%>/avp/template/t02_tp_bas_inf_base_attr.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>&tplatype=1');    
	    TREE.add('200','10' ,"定义输入参数",'<%=request.getContextPath()%>/avp/template/t02_tp_in_parm_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('300','10' ,"选择数据表",'<%=request.getContextPath()%>/avp/template/t02_tp_tab_rel_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>&newsearchflag=1');    
	    TREE.add('500','10' ,"调整输出列",'<%=request.getContextPath()%>/avp/template/t02_bztp_disp_rst_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('510','10' ,"定义复杂列",'<%=request.getContextPath()%>/avp/template/t02_tp_exec_rst_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>&newsearchflag=1');  
	    TREE.add('520','10' ,"定义关联条件",'<%=request.getContextPath()%>/avp/template/tpla_rela_cond.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('530','10' ,"定义分组条件",'<%=request.getContextPath()%>/avp/template/tpla_group_cond.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('540','10' ,"定义排序条件",'<%=request.getContextPath()%>/avp/template/tpla_order_cond.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('550','10' ,"定义跳转模型",'<%=request.getContextPath()%>/avp/template/t02_jump_tp_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');    
	    TREE.add('600','10' ,"模型信息汇总",'<%=request.getContextPath()%>/avp/template/t02_tp_exec_qry_addstd_do.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd") %>');     
		TREE.show();    
		</script>

	</body>
</html>
