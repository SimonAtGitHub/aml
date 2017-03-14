<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="JavaScript">	
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		 
	}
}
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
          if(checkRadio(document.forms[0].opp_sys_ids)<0){
           errMsg = "请选择！";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].opp_sys_ids)<0){
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
function checkForm(theUrl){
    var errMsg ="";
    if(!checkFloat(document.forms[0].para_val.value)){
		errMsg+= "参数值必须为数字！";
        document.forms[0].upper_limit.focus();
	}
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
    
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</script>
</head>

<body leftmargin=0 topmargin=0>
<div id="main">
<div class="conditions">
<html:form method="post" action="/defpara/t07_defpara_add_do.do">
<div class="cond_t">
<span>参数设定-查看指标定义参数 </span>
	<%String url = request.getContextPath();
	 url = "\"dosubmit('"+url+"/platform/defpara/t07_defpara_list.do','add')\"";%>
					 <span class="buttons">
	 <a href="#"onclick=<%=url%>><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a></span></div>
		 
 <div class="cond_c2">
 <table border=0 cellPadding=0 cellSpacing=0 >
 <tr>
								<td>
									参数代码：
								</td>
								<td>
									<bean:write name="t07_defpara" property="defparakey" />
								</td>
								<td>
									参数类型：
								</td>
								<td>
									<bean:write name="t07_defpara" property="paratype_disp" />
								</td>
</tr>
<tr>
								<td>
									币种：
								</td>
								<td>
									<bean:write name="t07_defpara" property="curr_cd_disp" />
								</td>
								<td>
									公私：
								</td>
								<td>
									<bean:write name="t07_defpara" property="party_cd_disp" />
								</td>
</tr>
<tr>
								<td>
									客户/帐户：
								</td>
								<td>
									<bean:write name="t07_defpara" property="party_acct_cd_disp" />
								</td>
								<td>
									参数值：
								</td>
								<td>
									<bean:write name="t07_defpara" property="para_val" />
								</td>
</tr>
<tr>
								<td>
									参数描述：
								</td>
								<td>
									<bean:write name="t07_defpara" property="para_des" />
								</td>
								<td>
									是否动态参数：
								</td>
								<td>
									<bean:write name="t07_defpara" property="dyna_ind_disp" />
								</td>
</tr>
<tr>
								<td>
									生效时间：
								</td>
								<td>
									<bean:write name="t07_defpara" property="validate_dt_disp" />
								</td>
								<td>
									是否启用：
								</td>
								<td>
									<bean:write name="t07_defpara" property="flag_disp" />
								</td>
</tr>
<tr>
								<td>
									失效时间：
								</td>
								<td>
									<bean:write name="t07_defpara" property="invalidate_dt_disp" />
								</td>
								<td>

								</td>
								<td>
								</td>
</tr>
</table>
</div>
</html:form>

<div class="cond_t">
<span>使用该参数的指标信息</span></div>
<div class="list">
<table   border=0   cellpadding="0" cellspacing="0"  >
<tr>
			<th >
				指标名称
			</th>
			<th>
				指标单位
			</th>
			<th>
				计算频度
			</th>
			<th>
				币种
			</th>
			<th>
				公私
			</th>
			<th>
				客户类型
			</th>
			<th>
				指标类型
			</th>
			<th>
				指标类别
			</th>
			<th>
				指标属性
			</th>
			<th>
				生效时间
			</th>
</tr>
		<logic:iterate id="indic" name="t07_indic_defparaList"
			type="com.ist.platform.dto.T07_defpara">
			<tr align="center" bgcolor="#ffffff">
				<td>
					<bean:write name="indic" property="indicname" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="unit" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="granularitys_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="curr_cd_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="party_cd_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="party_acct_cd_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="indictype_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="category_disp" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="indic_attr" scope="page" />
				</td>
				<td>
					<bean:write name="indic" property="validate_dt_disp" scope="page" />
				</td>
			</tr>
		</logic:iterate>
</table>
</div>
</div> 
</div>
</body> 
</html:html>
