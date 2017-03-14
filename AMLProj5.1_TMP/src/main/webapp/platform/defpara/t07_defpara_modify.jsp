<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
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
		//alert("canceled");
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
   
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function checkForm(theUrl){
 
	var errMsg = "";
    if(!checkFloat(document.forms[0].para_val.value)){
 
		errMsg+= "参数值必须为数字！";
        document.forms[0].para_val.focus();
         
	}else if(document.forms[0].dyna_ind.value==''){
		errMsg+="是否动态参数必须选择";
	}else if(document.forms[0].defparakey.value==''){
		errMsg+="参数代码不能为空";
	}else if(document.forms[0].para_val.value.length >10){
		errMsg+="参数值不能大于10";
	//}else if(document.forms[0].para_val.value.length <5){
	//    errMsg+="参数值长度不能小于5"
	}else if(getLength(document.forms[0].para_des.value)>64){
	    errMsg+="参数名称长度小于64"
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

<body leftmargin=0 topmargin=0 class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
<div id="main">
	 
	<html:form method="post" action="/defpara/t07_defpara_modify_do.do">
	 <div class="conditions">
	 <div class="cond_t">
	 <span>参数设定- 修改指标定义参数 </span>
	 <span class="buttons">
					<%String backurl1 = request.getContextPath();
					  backurl1 = "\"dosubmit('"+backurl1+"/platform/defpara/t07_defpara_list.do','add')\"";
					 %>
					  <a href="#"    onClick=<%=backurl1%> ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>	
				 
		<html:errors />
			<div class="cond_c">
		<table    border=0 cellPadding=0  
			cellSpacing=0>
<tr  >
								<td  >
									参数代码：
								</td>
								<td >
									<html:text property="defparakey" styleClass="text_white" size="25" readonly="true" />
									<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="内容不允许修 改"></html:img>
								</td>
							 
								<td  >
									参数类型：
								</td>
								<td  >
									<html:select property="paratype">
										<html:options collection="paratypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr  >
								<td  >
									币种：
								</td>
								<td  >
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							 
								<td  >
									公私：
								</td>
								<td  >
									<html:select property="party_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr >
								<td  >
									客户/帐户：
								</td>
								<td  >
									<html:select property="party_acct_cd">
										<html:options property="label" collection="party_acct_cdMap"
											labelProperty="value" />
									</html:select>
								</td>
							 
								<td >
									参数名称：
								</td>
								<td  >
									<html:text property="para_des" styleClass="text_white"
										size="25" />
								</td>
							</tr>
							<tr  >
								<td  >
									参数值：
								</td>
								<td  >
									<html:text property="para_val"  styleClass="text_white" size="25" />
									<font color="red">*请输入数字</font>
								</td>
							 
								<td  >
									是否动态参数：
								</td>
								<td  >
									<html:select property="dyna_ind">
										<html:options collection="dyna_indMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr  >
								<td  >
									是否启用：
								</td>
								<td  ><html:select property="flag"><html:options collection="statusMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							 
								<td  >
									生效时间：
								</td>
								<td  >
								<html:text property="validate_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
							</tr>
							<tr >
								<td >
									失效时间：
								</td>
								<td  >
								<html:text property="invalidate_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
							 
								<td colspan="2">									
								</td>
						
							</tr>
							<tr>
								<td colspan="4" align="center" class="in_button">
									<input type="button" value="提 交" onclick="checkForm('t07_defpara_modify_do.do')" />
									<html:reset styleClass="input" value="重 置" />
								</td>
							</tr>

				 
</table>
</div>
</div> 
</html:form>
</div> 
</body>
</html:html>
