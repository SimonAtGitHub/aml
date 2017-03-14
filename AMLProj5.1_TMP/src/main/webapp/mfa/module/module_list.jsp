<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
    function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        var form=document.forms[0];
         if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择的模型吗？')){
                    isSub = true;
                }
            }
        }
        else if(type=='rel'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要申请发布所选择模型吗？')){
                var status_cd;
                for(var i=0;i< form.elements.length;i++){
                	if(form.elements[i].type == 'checkbox'){
                		if (true==form.elements[i].checked){
                			var str=form.elements[i].value;
                			if(str!='0'){
                				var strs= new Array(); //定义一数组
                                strs=str.split(","); //字符分割  
                                status_cd=strs[1];
                                if(status_cd!='0'){
                                	alert("请选择未处理的模型申请发布！");
                                    return false;
                                    }
                    			}
                    		}
                    	}
                    }
                isSub = true;
            }
        }
      }
       else if(type=='add'){
        isSub = true;
       }
       else if(type=='search'){
        _Date1 = document.forms[0].create_dt_start_disp.value;
    	_Date2 = document.forms[0].create_dt_end_disp.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";		  		
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
</script>
	</head>
	<body class="mainbg">
		<html:form action="/module/module_list.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
						<span>高级模型管理</span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('module_applyRelease.do?status_cd=2','rel')"><img
									src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />申请发布</a>
							<a href="#" onclick="dosubmit('module_add.do','add')"><img
									src="../../images/<%=session.getAttribute("style")%>/b_add.png" />新建</a>
							<a href="#" onclick="dosubmit('module_delete_do.do','del')"><img
									src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删
								除</a> </span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									模型名称：
								</td>
								<td>
									<html:text property="module_name" maxlength="100"/>
								</td>

								<td nowrap>
									类型：
								</td>
								<td>
									<html:select property="module_type">
										<html:options collection="module_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>

								<td>
									状态：
								</td>
								<td>
									<html:select property="status_cd">
										<html:options collection="status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									创建日期：
								</td>
								<td>
									<html:text property="create_dt_start_disp" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									<!--<html:text property="create_dt" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />-->
									--
									<html:text property="create_dt_end_disp" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
								</td>

							</tr>
							<tr>
								<td>类别：</td>
								<td><html:select property="module_grey">
										<html:options collection="module_greyMap" property="label"
											labelProperty="value" />
									</html:select></td>
								<td>
									&nbsp;
								</td>
								<td>
									<input type="button" class="in_button1" name="search"
										value="查 询"
										onclick="dosubmit('module_list.do?newsearchflag=1&flag=0&status=0,1,2','search')" />
								</td>
							</tr>


						</table>

					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th width="2%">选择</th>
							<th>
								模型编号
							</th>
							<th>
								模型名称
							</th>
							<th>
								类型
							</th>
							
							<!-- <th>
								模型描述
							</th> -->
							<th>
								创建人
							</th>
							<th>
								创建日期
							</th>
							<th>
								状态
							</th>
							<th>
								类别
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="t23_rule_module" name="t23_rule_moduleList"
							type="com.ist.mfa.dto.T23_rule_module">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("module_no", t23_rule_module.getModule_no());
										pageContext
												.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedModuleno">
										<bean:write name="t23_rule_module" property="module_no" />,<bean:write name="t23_rule_module" property="status_cd" />
									</html:multibox>
								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_no"
										scope="page" />
								</td>
								<td>
									<html:link name="map" page="/module/module_disp.do">
										<bean:write name="t23_rule_module" property="module_name"
											scope="page" />
									</html:link>
								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_type"
										scope="page" />
								</td>
								<!-- 
								<td>
								<div algin="left" style="table-layout:fixed;word-wrap:break-word; overflow:hidden;">
								<pre><bean:write name="t23_rule_module" property="module_des"
										scope="page" /></pre></div>	
								</td> -->
								<td>
									<bean:write name="t23_rule_module" property="create_user"
										scope="page" />
								</td>
								<td>
									<bean:write name="t23_rule_module" property="create_dt_disp"
										scope="page" />


								</td>
								<td>
									<bean:write name="t23_rule_module" property="status_cd_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_grey_disp"
										scope="page" />
								</td>
								<td>
									<html:link name="map" page="/module/module_modify_main.do">
										<img src="../../images/blue/modify.gif" title="修改" />
									</html:link>
									&nbsp;&nbsp;
									<html:link name="map" page="/module/module_delete.do" onclick="return confirm('你真的要删除吗？');">
										<img src="../../images/blue/b_delete.png" title="删除" />
									</html:link>
								</td>
							</tr>
						</logic:iterate>

					</table>
				</div>

				<!-- all end -->
				<div class="list_page">
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</body>
</html>