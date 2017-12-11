<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>自定义SQL菜单</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/dtreeStyle.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript"src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
		
	var tplakey = <%=request.getParameter("tplakey")%>;
	var rsltdisptype = <%=request.getParameter("rsltdisptype")%>;  //图表模式  代码=5  展示设置报表参数及设置图形参数
	var root = '<%=request.getContextPath()%>';
	var tree = new MzTreeView("tree");
	tree.setIconPath(root+"/images/mztree/");
	tree.setTarget("mainFrame1");
	
	tree.nodes["-1_10"]="text:模型管理;#;";

	if(!tplakey){
		tree.nodes["10_100000"]="text:基本属性;url:<%=request.getContextPath()%>/avp/template/t02_tp_bas_inf_base_attr.do;";
	} else {	 
		tree.nodes["10_100000"]="text:基本属性;url:"+root+"/avp/template/t02_tp_bas_inf_base_attr.do?tplakey=" + tplakey;
		
		tree.nodes["10_200000"]="text:定义输入参数;url:"+root+"/avp/template/t02_tp_in_parm_list.do?tplakey=" + tplakey;
		
		tree.nodes["10_300000"]="text:定义查询SQL;url:"+root+"/avp/template/t02_tp_exec_qry_list.do?tplakey=" + tplakey;
		
		tree.nodes["10_400000"]="text:调整输出结果;url:"+root+"/avp/template/t02_tp_disp_rst_list.do?tplakey=" + tplakey;
		tree.nodes["10_500000"]="text:定义跳转模型;url:"+root+"/avp/template/t02_jump_tp_list.do?tplakey=" + tplakey;
		tree.nodes["10_600000"]="text:定义模型动作;url:"+root+"/avp/template/t02_tp_cus_action_list.do?tplakey=" + tplakey;

		if(rsltdisptype == '0'){
			tree.nodes["10_700000"]="text:数据展现管理;url:"+root+"/avp/template/t02_tp_manager_list.do?newsearchflag=1&tplakey=" + tplakey;
			tree.nodes["10_800000"]="text:定义图表展现;url:"+root+"/avp/template/t02_tp_show_list.do?newsearchflag=1&tplakey=" + tplakey;
		}
		
		tree.nodes["10_900000"]="text:模型信息汇总;url:"+root+"/avp/template/tpla_alltmpalt_info.do?tplakey=" + tplakey;
	}
	document.write(tree.toString()); 
	</script>    
		</script>

	</body>
</html>
