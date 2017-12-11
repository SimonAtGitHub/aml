<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
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
		
			function _Submit(theUrl){

		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
   
			}
		</script>
		<script type="text/javascript"><!--
		



function _Click(opp_organkey,opp_orgname,opp_code_type_cd,opp_country,opp_area1,opp_area2,opp_area2name,opp_area,opp_areaname){
     

     document.forms[0].opp_organkey1.value=opp_organkey;
     document.forms[0].opp_orgname.value=opp_orgname;
     document.forms[0].opp_code_type_cd.value=opp_code_type_cd;
     document.forms[0].opp_country.value=opp_country;
     document.forms[0].opp_area1.value=opp_area1;
     document.forms[0].opp_area2.value=opp_area2;
     document.forms[0].opp_area2name.value=opp_area2name;
     document.forms[0].opp_area.value=opp_area;
     document.forms[0].opp_areaname.value=opp_areaname;
   
}
<%String newflag=(String)request.getAttribute("newflag");
System.out.println("=================="+newflag);%>
var newf=<%=newflag%>;
function _Commit(){
    if(checkRadio(document.forms[0].opp_organkey)<0){
           alert("请选择！");
           return false;
    } 
       if(opener.document.forms[0].opp_organ_type.disabled==false){
            for(i=0;i<opener.document.forms[0].opp_organ_type.options.length;i++){
                var organ_type=document.forms[0].opp_code_type_cd.value;
                if(opener.document.forms[0].opp_organ_type.options[i].value==organ_type){
                  opener.document.forms[0].opp_organ_type.options[i].selected=true;
                }
            }
              opener.document.forms[0].opp_organ_type.fireEvent('onchange');
       }
      
      
      if(opener.document.forms[0].opp_organkey.disabled==false){
     // alert(":::::;;"+document.forms[0].opp_organkey1.value);
       opener.document.forms[0].opp_organkey.value=document.forms[0].opp_organkey1.value;
         opener.document.forms[0].opp_organkey.fireEvent('onchange');
           opener.document.forms[0].opp_organkey.onblur();
      }
      if(opener.document.forms[0].opp_organname.disabled==false){
        opener.document.forms[0].opp_organname.value=document.forms[0].opp_orgname.value;
        opener.document.forms[0].opp_organname.fireEvent('onchange');
           opener.document.forms[0].opp_organname.onblur();
       }
        window.close();
     if (newf!="1"){
     
       if(opener.document.forms[0].opp_country.disabled==false){
           var organ_country=document.forms[0].opp_country.value;
           if(organ_country=="CHN"){
             opener.document.all.org.style.display="";
              opener.document.all.orgreplay.style.display="none";
           }else{
              opener.document.all.org.style.display="none";
              opener.document.all.orgreplay.style.display="";
           }
            for(i=0;i<opener.document.forms[0].opp_country.options.length;i++){
                if(opener.document.forms[0].opp_country.options[i].value==organ_country){
                  opener.document.forms[0].opp_country.options[i].selected=true;
                }
            }
       }
      }else if (newf=="1"){
      
      var organ_country=document.forms[0].opp_country.value;     
       if(organ_country=="CHN"){
            opener.document.all.orgreplay.style.display="none";
              opener.document.all.org.style.display="";
           }else{
               opener.document.all.orgreplay.style.display="";
              opener.document.all.org.style.display="none";
           }
           
           
      }
       if(opener.document.forms[0].opp_area1.disabled==false){
            for( i=0;i<opener.document.forms[0].opp_area1.options.length;i++){
                var area1=document.forms[0].opp_area1.value;
                if(opener.document.forms[0].opp_area1.options[i].value==area1){
                  opener.document.forms[0].opp_area1.options[i].selected=true;
                   opener.document.forms[0].opp_area1.fireEvent('onchange');
                   opener.document.forms[0].opp_area1.fireEvent('onblur');
                }
            }
       }
       
        if(opener.document.forms[0].opp_area2.disabled==false){
            var flag1=0;
            var area2=document.forms[0].opp_area2.value;
            var area2name=document.forms[0].opp_area2name.value;
          
            for(i=0;i<opener.document.forms[0].opp_area2.options.length;i++){
                
                if(opener.document.forms[0].opp_area2.options[i].value==area2){
                   flag1=1;
                  opener.document.forms[0].opp_area2.options[i].selected=true;
                    opener.document.forms[0].opp_area2.fireEvent('onchange');
                }
            }
           // if(flag1==0){
               // alert(opener.document.forms[0].opp_area2.length);
             //   var length2=opener.document.forms[0].opp_area2.length;
               //  for(j=length2-1;j>0;j--){
			    //       opener.document.forms[0].opp_area2.options[j]=null;
		       //  }
		       //  var oOption=opener.document.createElement("OPTION");
	            //           oOption.value=area2;
      		    //           oOption.text=area2name;
      		     //          opener.document.forms[0].opp_area2.add(oOption,length2);
      		     //    opener.document.forms[0].opp_area2.options[1].selected=true;        
		 
           // }
       }
       if(opener.document.forms[0].opp_area.disabled==false){
            var flag1=0;
            var area=document.forms[0].opp_area.value;
             var areaname=document.forms[0].opp_areaname.value;
          
            for( i=0;i<opener.document.forms[0].opp_area.options.length;i++){
                
                if(opener.document.forms[0].opp_area.options[i].value==area){
                   flag1=1;
                  opener.document.forms[0].opp_area.options[i].selected=true;
                }
            }
        //    if(flag1==0){
         //      var length1=opener.document.forms[0].opp_area.length
            //     for(j=length1-1;j>0;j--){
			  //         opener.document.forms[0].opp_area.options[j]=null;
		     //    }
		     //     var oOption1=opener.document.createElement("OPTION");
		           
	           //            oOption1.value=area;
      		  //             oOption1.text=areaname;
      		   //            opener.document.forms[0].opp_area.add(oOption1,opener.document.forms[0].length1);
      		   //          opener.document.forms[0].opp_area.options[1].selected=true;  
		     
          //  }
       }

     window.close();
}

--></script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form action="/case/t47case_opp_bank_list.do" method="post">
			<input type="hidden" name="opp_organkey1" value="" />
			<input type="hidden" name="opp_orgname" />
			<input type="hidden" name="opp_code_type_cd" />
			<input type="hidden" name="opp_country" />
			<input type="hidden" name="opp_area1" />
			<input type="hidden" name="opp_area2" />
			<input type="hidden" name="opp_area2name" />
			<input type="hidden" name="opp_area" />
			<input type="hidden" name="newflag"
				value="<bean:write name="newflag" />" />
			<input type="hidden" name="opp_areaname" />
			<div id="main">
				<!-- conditions -->
				<form action="list.htm" method="post">
					<div class="conditions">
						<!-- title -->
						<div class="cond_t">
							<span>交易对方金融机构信息</span>
							<span class="buttons"> <a href="#" onclick="_Commit()">
									<img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a> <a href="#"
								onclick="javascript:window.close();"> <img
										src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a> </span>
						</div>
						<!-- table content -->
						<div class="cond_c">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										金融机构代码：
									</td>
									<td align="left">
										<html:text property="opp_organkey_s" size="30" />
									</td>
									<td align="right">
										金融机构名称：
									</td>
									<td align="left">
										<html:text property="opp_orgname_s" size="30" />
									</td>
								</tr>
								<tr>
									<td align="right">
										金融机构代码类型：
									</td>
									<td align="left">
										<html:select property="opp_code_type_cd_s">
											<html:options collection="organtypeMap" property="label"
												labelProperty="value" />
										</html:select>
										&nbsp;
									</td>
									<td align="right">
										金融机构国家：
									</td>
									<td align="left">
										<html:select property="opp_country_s">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
										<input type="button"  name="button3" value="查 询"
											      class="in_button1"  
											      onclick="_Submit('t47case_opp_bank_list.do?newsearchflag=1')"/>
									
											
									</td>
								</tr>
							</table>
						</div>
					</div>
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
									金融机构代码
								</th>
								<th>
									金融机构名称
								</th>
								<th>
									金融机构代码类型
								</th>
								<th>
									金融机构国家
								</th>
								<th>
									金融机构地区
								</th>
							</tr>
							<logic:iterate id="t47_opp_bank" name="t47_opp_bankList"
								indexId="i" type="com.ist.aml.information.dto.T47_OPP_bank">

								<tr>
									<td>
										<input type="radio" name="opp_organkey"
											onclick="_Click('<bean:write name="t47_opp_bank" property="unionorgkey" />',
										     '<bean:write name="t47_opp_bank" property="union_name" />','<bean:write name="t47_opp_bank" property="union_type" />',
										     '<bean:write name="t47_opp_bank" property="country_cd" />','<bean:write name="t47_opp_bank" property="opp_area1" />','<bean:write name="t47_opp_bank" property="opp_area2" />',
										     '<bean:write name="t47_opp_bank" property="opp_area2name" />','<bean:write name="t47_opp_bank" property="opp_area" />',
										     '<bean:write name="t47_opp_bank" property="opp_areaname" />')" />
									</td>
									<td><%=i.intValue() + 1%></td>
									<td>
										<bean:write name="t47_opp_bank" property="unionorgkey" />
									</td>
									<td>
										<bean:write name="t47_opp_bank" property="union_name" />
									</td>
									<td>
										<bean:write name="t47_opp_bank"
											property="opp_code_type_cd_disp" />
									</td>
									<td>
										<bean:write name="t47_opp_bank" property="opp_country_disp" />
									</td>
									<td>
										<bean:write name="t47_opp_bank" property="opp_areaname" />
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

