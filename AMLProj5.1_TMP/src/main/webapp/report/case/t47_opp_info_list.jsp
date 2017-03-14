<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style") %>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript">

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
function _Click(opp_sys_id,opp_party_id,opp_name,opp_acct_num,opp_card_no,card_type,opp_acct_type,opp_card_type_inf,opp_pbc_party_class_cd){
  //alert(opp_party_id);
   //alert(opp_pbc_party_class_cd);
     document.forms[0].opp_sys_id.value=opp_sys_id;
     document.forms[0].opp_party_id.value=opp_party_id;
     document.forms[0].opp_name.value=opp_name;
     document.forms[0].opp_acct_num.value=opp_acct_num;
     document.forms[0].opp_pbc_party_class_cd.value=opp_pbc_party_class_cd;
     document.forms[0].opp_acct_type.value=opp_acct_type;
     document.forms[0].opp_card_type.value=card_type;
     document.forms[0].opp_card_type_inf.value=opp_card_type_inf;
     document.forms[0].opp_card_no.value=opp_card_no;
     
}
function _Commit(){
    if(checkRadio(document.forms[0].opp_sys_id)<0){
           alert("请选择！");
           return false;
    } 
  
     if(opener.document.forms[0].opp_acct_num.disabled==false){
          opener.document.forms[0].opp_acct_num.value=document.forms[0].opp_acct_num.value;
          opener.document.forms[0].opp_acct_num.fireEvent('onchange');
          opener.document.forms[0].opp_acct_num.onblur();
       }
     
      // opener.document.forms[0].opp_sys_id.value=document.forms[0].opp_sys_id.value;
     //opener.document.forms[0].opp_party_id.value=document.forms[0].opp_party_id.value;
   
     if(opener.document.forms[0].opp_name.disabled==false){
       opener.document.forms[0].opp_name.value=document.forms[0].opp_name.value;
       opener.document.forms[0].opp_name.fireEvent('onchange');
       opener.document.forms[0].opp_name.onblur();
     }
     
     if(opener.document.forms[0].opp_card_no.disabled==false){
        opener.document.forms[0].opp_card_no.value=document.forms[0].opp_card_no.value;
        opener.document.forms[0].opp_card_no.fireEvent('onchange');
        opener.document.forms[0].opp_card_no.onblur();
     }
      card_type=document.forms[0].opp_card_type.value;
      if(opener.document.forms[0].opp_card_type.disabled==false){
        if(card_type!=""){ //alert(card_type);
            for(i=0;i<opener.document.forms[0].opp_card_type.options.length;i++){
                if(opener.document.forms[0].opp_card_type.options[i].value==card_type){
                  opener.document.forms[0].opp_card_type.options[i].selected=true;
                  var opp_card_type_inf=document.forms[0].opp_card_type_inf.value;
                  // alert(opp_card_type_inf);
                  if(opp_card_type_inf!=""){
                  opener.document.forms[0].opp_card_inf.value=opp_card_type_inf;
                  opener.document.forms[0].opp_card_inf.style.visibility='visible';
                  opener.document.forms[0].opp_card_inf.focus();
                  }else{
                   opener.document.forms[0].opp_card_inf.value=""
                  opener.document.forms[0].opp_card_inf.style.visibility='hidden';
                
                  }
                  break;
                }
            }
        
        }
       }

      
      if(opener.document.forms[0].opp_acct_type_cd.disabled==false){
          opener.document.forms[0].opp_acct_type_cd.value=document.forms[0].opp_acct_type.value;
          //opener.document.forms[0].opp_acct_type_cd.fireEvent('onchange');
          //opener.document.forms[0].opp_acct_type_cd.onblur();
   	 }
       if(opener.document.forms[0].opp_card_no.disabled==false){
           opener.document.forms[0].opp_card_no.value=document.forms[0].opp_card_no.value;
           opener.document.forms[0].opp_card_no.fireEvent('onchange');
           opener.document.forms[0].opp_card_no.onblur();
     }
       pbc_party_class_cd=document.forms[0].opp_pbc_party_class_cd.value;
      var target_party_class_cd= opener.document.forms[0].opp_pbc_party_class_cd;
      
      if(target_party_class_cd){
        if(pbc_party_class_cd!=""){
        	  var target_party_class_cd_options=opener.document.forms[0].opp_pbc_party_class_cd.options;
        	  if(target_party_class_cd_options){
		            for(i=0;i<target_party_class_cd_options.length;i++){
		                if(target_party_class_cd_options[i].value==pbc_party_class_cd){
		                	target_party_class_cd_options[i].selected=true;
		                  	break;
		                }
		            }
        	  }else 
        	  {  
        		target_party_class_cd.value=pbc_party_class_cd;        		
              }
        
        }
       }
       
     
   
     window.close();
}

</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form action="/case/t47case_opp_info_list.do" method="post">
			<input type="hidden" name="opp_sys_id" />
			<input type="hidden" name="opp_party_id" />
			<input type="hidden" name="opp_name" />
			<input type="hidden" name="opp_acct_num" />
			<input type="hidden" name="opp_card_no" />
			<input type="hidden" name="opp_card_type" />
			<input type="hidden" name="opp_acct_type" />
			<input type="hidden" name="opp_pbc_party_class_cd" />
			<input type="hidden" name="opp_card_type_inf" />
			<div id="main">
				<!-- conditions -->
				<form action="list.htm" method="post">
					<div class="conditions">
						<!-- title -->
						<div class="cond_t">
							<span>交易对手信息</span>
							<span class="buttons"> <a href="#" onclick="_Commit()">
									<img
										src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选
									定</a> <a href="#" onclick="javascript:window.close();"> <img
										src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关
									闭</a> </span>
						</div>
						<!-- table content -->
						<div class="cond_c">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										客户名称：
									</td>
									<td align="left">
										<html:text property="opp_name_s" size="30" />
									</td>
									<td align="right">
										客户类型：
									</td>
									<td align="left">
										<html:select property="opp_pbc_party_class_cd_s">
											<html:options collection="clienttypeMap" property="label"
												labelProperty="value" />
										</html:select>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td align="right">
										帐户类型：
									</td>
									<td align="left" colspan="3">
										<html:select property="opp_acct_type_cd_s" style="width:200">
											<html:options collection="accttypeMap" property="label"
												labelProperty="value" />
										</html:select>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td align="right">
										证件类型：
									</td>
									<td >
										<html:select property="opp_card_type_s" style="width:250">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									
									</td>
									<td align="right">
										证件号码：
									</td>
									<td align="left">
										<html:text property="opp_card_no_s" size="30" />
                              		</td>
								</tr>
								<tr>
									<td align="right">
										账号：
									</td>
									<td align="left">
										<html:text property="opp_acct_num_s" size="30" />
									</td>
									<td align="right">
										
									</td>
									<td align="left">
										
										<input type="button" name="button3" value="查 询"
											class="in_button1"
											onclick="dosubmit('t47case_opp_info_list.do?newsearchflag=1','add')" />
									</td>
								</tr>
							</table>
						</div>
					</div>
					<html:errors />
					<!-- list -->
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>
									选择
								</th>
								<th>
									序号
								</th>
								<th>
									客户名称
								</th>
								<th>
									客户类型
								</th>
								<th>
									账号
								</th>
								<th>
									帐户类型
								</th>
								<th>
									证件类型
								</th>
								<th>
									证件详细信息
								</th>
								<th>
									证件号码
								</th>
							</tr>
							<logic:iterate id="party" name="t47_opp_infoList" indexId="i"
								type="com.ist.aml.information.dto.T47_Opp_info">

								<tr>
									<td>
										<input type="radio" name="opp_sys_id"
											onclick="_Click('<bean:write name="party" property="opp_sys_id" />',
												     '<bean:write name="party" property="opp_party_id" />',
												     '<bean:write name="party" property="opp_name" />','<bean:write name="party" property="opp_acct_num" />',
												     '<bean:write name="party" property="opp_card_no" />','<bean:write name="party" property="opp_card_type" />',
												    '<bean:write name="party" property="opp_acct_type_cd" />','<bean:write name="party" property="opp_card_type_inf" />',
												    '<bean:write name="party" property="opp_pbc_party_class_cd" />')" />
									</td>

									<td><%=i.intValue() + 1%></td>
									<td>
										<bean:write name="party" property="opp_name" scope="page" />
									</td>
									<td>
										<bean:write name="party"
											property="opp_pbc_party_class_cd_disp" scope="page" />
									</td>
									<td>
										<bean:write name="party" property="opp_acct_num" scope="page" />
									</td>
									<td>
										<bean:write name="party" property="opp_acct_type_cd_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="party" property="opp_card_type_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="party" property="opp_card_type_inf"
											scope="page" />
									</td>
									<td>
										<bean:write name="party" property="opp_card_no" scope="page" />
									</td>
								</tr>
							</logic:iterate>
						</table>
					</div>
					<!-- list_page -->
					<div class="list_page">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</div>
			</div>
		</html:form>
	</body>
</html>
