<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->	
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除选择的地区吗？')){
                isSub = true;
            }
        }
       
    }else if(type=='search' || type=='add'){
        //location.href=theUrl+"&"+Math.random();
        document.forms[0].action=theUrl;
        document.forms[0].submit();
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
	</head>

	<body leftmargin="0" topmargin="0" class="mainbg">
		<div id="main">
				<html:form action="/parameter/t87_attention_area_list.do" method="post">
		<div class="conditions">
					<div class="cond_t">
						<span> 地区维护 - 列表</span>
						<span class="buttons"> 
						 <a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onclick="dosubmit('t87_attention_area_add.do','add')" ><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png"
									/>添 加</a> <a
							href="#" onclick="dosubmit('t87_attention_area_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png"
									 />修 改</a>
							<a href="#" onclick="dosubmit('t87_attention_area_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png"
									 />删 除</a>

						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table>

							<tr>
								<td>
									地区类型：
								</td>
								<td>
									<html:select property="area_type_cd_search">
										<html:options collection="area_type_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									地区名称：
								</td>
								<td>
									<html:text property="area_id_search" 
										size="24" maxlength="12" />

								</td>
							</tr>
							<tr>
								<td>
									国家：
								</td>
								<td>
									<html:select property="country_search">
										<html:options collection="countrylMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									排序：
								</td>
								<td>
									<html:select property="orderby">
										<html:options collection="areasortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序 &nbsp;&nbsp;&nbsp;&nbsp;
									
								
								<input type="button" name="ok" value="查 询"  class="in_button1"
										onclick="dosubmit('t87_attention_area_list.do?newsearchflag=1','search')"></input>
								</td>
								</tr>
						 

						</table>
					</div>
</div>
					<div class="list">
						  <table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
								<th>地区名称</th>
								<th>国家</th>
								<th>地区类型</th>
								
							</tr>
							<logic:present name="t87_attention_areaList">
								<logic:iterate id="t87_attention_area"
									name="t87_attention_areaList"
									type="com.ist.platform.dto.T87_attention_area">
								
									<tr>
										<td >

											<html:multibox property="area_id">
												<logic:equal name="t87_attention_area" property="country"
													value="CHN">
													<bean:write name="t87_attention_area" property="area_id" />
												</logic:equal>
												<logic:notEqual name="t87_attention_area" property="country"
													value="CHN">
													<bean:write name="t87_attention_area" property="country" />
												</logic:notEqual>
											</html:multibox>
										</td>
										<td>
											<bean:write name="t87_attention_area" property="area_des" />
										</td>
										<td>
											<bean:write name="t87_attention_area" property="country_desc" />
										</td>
										<td>
											<bean:write name="t87_attention_area"
												property="area_type_cd1_disp" />
											<bean:write name="t87_attention_area"
												property="area_type_cd2_disp" />
											<bean:write name="t87_attention_area"
												property="area_type_cd3_disp" />
											<bean:write name="t87_attention_area"
												property="area_type_cd4_disp" />
											<bean:write name="t87_attention_area"
												property="area_type_cd5_disp" />
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
						</table>
					
			
			
 </div>
 <div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
 
 
   <div class="sys_warning"><strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />系统提示：</strong>
      <p>1、地区维护用于后台计算指标时设定高危地区范围，此处维护的地区都为高危地区。</p>
      </div>
		</html:form>
		</div>
	</body>
</html>
