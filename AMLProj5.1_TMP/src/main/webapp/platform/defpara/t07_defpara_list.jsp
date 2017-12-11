<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style") %>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="javascript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].selectdefparakeys)<0){
           errMsg = "请选择！";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].selectdefparakeys)<0){
                errMsg = "请选择！";
            }
            if(errMsg==''){
                if(confirm('你真的要删除所选信息吗？')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Open(url,tag){
  if(tag=="1"){
   window.open(url,'','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=yes');
  }else{
   window.open(url,'','height=300, width=500,left=100,top=100,scrollbars=yes,resizable=yes');
   }
   //window.open(url);
      
}
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}

</script>
		<script>
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全 清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全 选");
	  });
});
</script>
	</head>
	<body class="mainbg">
		<html:form action="/defpara/t07_defpara_list.do" method="post">
			<div id="main">
				<div class="conditions">
					<div class="cond_t">
						<span> 参数设定 - 指标定义参数信息 </span>

						<span class="buttons"> 
						<a href="#" id="hdd_display" class="bt_hidden"></a>
							<% String url_add = request.getContextPath();
							 	String url_del = request.getContextPath();
							 	url_add = "\"dosubmit('" + url_add
							 			+ "/platform/defpara/t07_defpara_add.do','add')\"";
							 	url_del = "\"dosubmit('" + url_del
							 			+ "/platform/defpara/t07_defpara_delete_do.do','del')\"";
 								%>
 						 <a href="#" id="checkall"><img	src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a>
 						 <a href="#" onclick=<%=url_add%>><img	src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> 						
 						 <a href="#" onclick=<%=url_del%>><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
 						 </span>
					</div>
					<div class="cond_c" id="searchtable">

						<table border=0 cellpadding=0 cellspacing=0>


							<tr>
								<td>
									参数代码：
								</td>
								<td>
									<html:text property="defparakey" size="20" />
								</td>
								<td>
									参数类型：
								</td>
								<td>
									<html:select property="paratype">
										<html:options collection="paratypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									币种：
								</td>
								<td>
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label"
											labelProperty="value" />
									</html:select>
									&nbsp;
								</td>
								<td>
									&nbsp;公私标志：
								</td>
								<td>
									<html:select property="party_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;客户/帐户：
								</td>
								<td>
									<html:select property="party_acct_cd">
										<html:options property="label" collection="party_acct_cdMap"
											labelProperty="value" />
									</html:select>
									&nbsp;
								</td>
								<td>
									是否启用：
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="statusMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									是否动态参数:
								</td>
								<td>
									<html:select property="dyna_ind">
										<html:options collection="dyna_indMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									排序：
								</td>
								<td>
									<%
											String searchurl = request.getContextPath();
											searchurl = "\"dosubmit('"
													+ searchurl
													+ "/platform/defpara/t07_defpara_list.do?newsearchflag=1','search')\"";
										%>
									<html:select property="orderby">
										<html:options collection="defparasortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick=<%=searchurl%> />

								</td>
							

							</tr>


						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr>
							<th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
							<th>
								参数代码
							</th>
							<th>
								参数名称
							</th>
							<th>
								参数类型
							</th>
							<th>
								币种
							</th>
							<th>
								公私
							</th>
							<th>
								客户/帐户
							</th>
							<th>
								参数值
							</th>
							<th>
								启用
							</th>
							<th>
								动态参数
							</th>
							<th>
								操作
							</th>

						</tr>
						<logic:iterate id="para" name="t07_defparaList" indexId="i"
							type="com.ist.platform.dto.T07_defpara">

							<tr>
								<td>
									<html:multibox property="selectdefparakeys">
										<bean:write name="para" property="defparakey" />
									</html:multibox>
								</td>
								<td>
									<a href="#"
										onclick="dosubmit('t07_defpara_disp.do?defparakey=<bean:write  name="para" property="defparakey" />','add')">
										<bean:write name="para" property="defparakey" /> </a>
								</td>
								<td>
									<bean:write name="para" property="para_des" scope="page" />
								</td>
								<td>
									<bean:write name="para" property="paratype_disp" scope="page" />
								</td>
								<td height=22>
									<bean:write name="para" property="curr_cd_disp" scope="page" />
								</td>
								<td height=22>
									<bean:write name="para" property="party_cd_disp" scope="page" />
								</td>
								<td>
									<bean:write name="para" property="party_acct_cd_disp"
										scope="page" />
								</td>

								<td>
									<bean:write name="para" property="para_val" scope="page" />
								</td>
								<td>
									<bean:write name="para" property="flag_disp" scope="page" />
								</td>
								<td>
									<bean:write name="para" property="dyna_ind_disp" scope="page" />
								</td>
								<td>
									<%
													String modiurl = request.getContextPath();
													String parakey=para.getDefparakey();
													modiurl = "\"dosubmit('" + modiurl
													+ "/platform/defpara/t07_defpara_modify.do?defparakey="+parakey + "','add')\"";
										%>
									<a href="#" onclick=<%=modiurl%>> <img src="../../images/blue/modify.gif" title="修改" /></a>
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>


				<table width="98%" border="0" align="center" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<div class="sys_warning">
					<strong><img
							src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
					<p>
						1、定义参数维护用来维护计算指标的SQL语句中用到的参数。
						<br />
						2、其中动态参数是用于向前推算天数之用。
					</p>
				</div>
			</div>

		</html:form>
	</body>
</html>
