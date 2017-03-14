<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/jquery-1.2.3.pack.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

 <SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function CheckNumber(form) { 
alert(form);
	if (form.value.match(new RegExp("^[0-9]+$"))){ 
	form.focus();
	} else{
	alert("必须输入数字"); 
	}
} 
function check1(gra)
{
	var val1 = document.forms[0].indic_table.value;
	var len1 = document.forms[0].indic_table.value.length;
	var val2 = document.forms[0].transtable.value;
	var len2 = document.forms[0].transtable.value.length;
	if(gra == "1")
	{
		val1 = val1.substring(0,len1-1) + "D";
		val2 = val2.substring(0,len2-1) + "D";
	}
	else
	{
		val1 = val1.substring(0,len1-1) + "R";
		val2 = val2.substring(0,len2-1) + "R";
	}
	document.forms[0].indic_table.value = val1;
	document.forms[0].transtable.value = val2;
}
function check2(use_type)
{
	var ss = document.forms[0].mark.value; 
	if(use_type == "2" && ss == "2")
	{
		if(document.forms[0].granularitys.value == "1")
		{
			document.forms[0].indic_table.value = "T65_F_S_"  + document.forms[0].indickey.value + "_D";
			//document.forms[0].transtable.value = "T65_R_S_P" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_D";
		}
		else
		{
			document.forms[0].indic_table.value = "T65_F_S_" + document.forms[0].indickey.value + "_M";
			//document.forms[0].transtable.value = "T65_R_S_P" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_R";
		}
	}
	else
	{
		if(document.forms[0].granularitys.value == "1")
		{
			document.forms[0].indic_table.value = "T64_F_S_"  + document.forms[0].indickey.value + "_D";
			if(document.forms[0].indic_attr.value == 'JC'){
			 document.getElementById("pj2").style.display=''; 
			document.forms[0].transtable.value = "T64_R_S_"  + document.forms[0].indickey.value + "_D";
			}else{
			 document.getElementById("pj2").style.display='none'; 
			}
		}
		else
		{
			document.forms[0].indic_table.value = "T64_F_S_"  + document.forms[0].indickey.value + "_M";
			document.getElementById("pj2").style.display='none'; 
			//document.forms[0].transtable.value = "T64_R_S_" + document.forms[0].indickey.value + "_R";
		}
		
	}
	
}
function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].indicname.value)==0){
        errMsg+="指标名称不能为空！";
        document.forms[0].indicname.focus();
    }else if(getLength(document.forms[0].indicname.value>=80)){
		 errMsg+="指标名称超长！";
        document.forms[0].indicname.focus();
	}else if(getLength(document.forms[0].indecdes.value)==0){
        errMsg+="指标描述不能为空";
        document.forms[0].indecdes.focus();
    }else if(getLength(document.forms[0].indecdes.value)>256){
        errMsg+="指标描述超长！";
        document.forms[0].indecdes.focus();
    }else if(getLength(document.forms[0].granularitys.value)==0){
        errMsg+="计算频度不能为空！";
        document.forms[0].granularitys.focus();
    }else if(getLength(document.forms[0].callayer.value)==0){
        errMsg+="所属层次不能为空！";
        document.forms[0].callayer.focus();
    }else if(getLength(document.forms[0].use_type_cd.value)==0){
        errMsg+="指标用途不能为空！";
        document.forms[0].indic_attr.focus();
    }else  if(document.forms[0].use_type_cd.value!='2'){   
      if(getLength(document.forms[0].trans_ind.value)==0){
        errMsg+="请选择是否交易！";
        document.forms[0].trans_ind.focus();
        }
        else if(document.forms[0].indic_attr.value == 'JC'&& getLength(document.forms[0].transtable.value)==0){
            errMsg+="指标类型为“基础”时,指标交易事实表不能为空！";
        	 if(getLength(document.forms[0].transtable.value)>=64)
           errMsg+="指标交易关系事实表超长！";
            document.forms[0].transtable.focus();  
         }
    }else if(getLength(document.forms[0].flag_disp.value)==0){
        errMsg+="是否启用不能为空！";
        document.forms[0].flag_disp.focus();
    }else if(getLength(document.forms[0].indic_table.value)==0){
        errMsg+="指标事实不能为空！";
        document.forms[0].indic_table.focus();
    }else if(getLength(document.forms[0].indic_table.value)>=64){
        errMsg+="指标事实表超长！";
        document.forms[0].indic_table.focus();
    } else if(document.forms[0].indic_attr.value == 'GZ'){
       if(document.forms[0].trans_ind.value=='1'){
         if(getLength(document.forms[0].gz_defkey.value)==0){
    		errMsg+="指标类型为“规则”时,交易周期参数不能为空！";
        	document.forms[0].gz_defkey.focus();
         }
       }
    }
  
    if(errMsg==""){
        selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function _onblur(use_value)
{
   if(use_value=="2"){
     document.forms[0].transtable.value="";
     document.forms[0].trans_ind.value="";
     document.forms[0].trans_sql.value="";
   	 document.getElementById("pj1").style.display='none';
     document.getElementById("pj2").style.display='none'; 
     document.getElementById("transql").style.display='none';
     document.getElementById("transform_flag").style.display='none';
   }else{
   	 document.getElementById("pj1").style.display='';
   	 document.getElementById("pj2").style.display='';
   	 if(document.forms[0].indic_attr.value=="JC"){
   	 document.getElementById("transql").style.display='';
   	 document.getElementById("transform_flag").style.display='';
   	 }else{
   	   document.getElementById("transql").style.display='none';
   	   document.getElementById("transform_flag").style.display='none';
   	 }
   }
}
function _onblur3()
{
	if(document.forms[0].indic_attr.value == "JC")
		if(document.forms[0].trans_ind.value == "1")
		{
			if(getLength(document.forms[0].indic_sql.value)>0)
    		{
				if(document.forms[0].indic_sql.value.indexOf("T47_TRANSACTION_D")< 0)
					alert("指标sql填写不标准,缺失交易表!");
			}
		}
			
}
function _onblur4()
{

	var indic_sql = document.forms[0].indic_sql.value;
	var trans_ind = document.forms[0].trans_ind.value;
	var indic_attr = document.forms[0].indic_attr.value;
	
	if(indic_sql!=""){
	
	if(document.forms[0].indic_attr.value == "JC")
	{		
		if(indic_sql != null)
		{		
                $.ajax({
	 			type:"post",
				url:"t21_indic_trans_sqlMod.do",
				data:{indic_sql:indic_sql,trans_ind:trans_ind,indic_attr:indic_attr},
				dataType:"text",
				success:function(msg){
					document.forms[0].trans_sql.value=msg;
				 }
	 		});
                
			
		}
	}
	}
	
}

function _clear_text()
{
 
   var flag=document.forms[0].trans_ind.value;
   if(flag=="0"){
   	 document.getElementById("gz_defkey").value='';
     document.getElementById("transtable").value='';
   }
   else if(flag=="1"){
     document.getElementById("transtable").value="T64_R_S_" + document.forms[0].indickey.value + "_D";
   }
}
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id="main">
			<html:form method="post" action="/t21_indic/t21_indic_modify.do">
			<html:hidden name="t21_indicActionForm" property="mark"/>
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 修改指标 </span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t21_indic_list.do');">
							<img src="../../images/blue/b_back.png" />返 回</a> 
						</span>
					</div>
					<html:errors />
					<div class="cond_c2">

						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<font color="red">*</font>指标编码：
								</td>
								<td>
									<html:text property="indickey" readonly="true" />
									<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
								</td>
								<td>
									<font color="red">*</font>指标名称：
								</td>
								<td>
									<html:text property="indicname" size="20" />

								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>指标描述：
								</td>
								<td colspan="10">
									<html:text property="indecdes" size="100" />
								</td>
								
								
							</tr>
							<tr>
								<td>
									<font color="red">*</font>计算频度：
								</td>
								<td>
									<html:select property="granularitys" onblur="check1(this.value)">
										<html:options collection="granularitysMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>所属层次：
								</td>
								<td>
									<html:select property="callayer">
									<html:options collection="callayerMap" property="label"
											labelProperty="value" />
								</html:select>
								</td>
							</tr>
							<tr>
								<td>
									指标主体：
								</td>
								<td>
									<html:select property="party_acct_cd">
										<html:options collection="party_acct_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>指标用途：
								</td>
								<td>
									<html:select property="use_type_cd" onchange="check2(this.value);_onblur(this.value);">
										<html:options collection="indic_useMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									指标类别：
								</td>
								<td>
									<html:select property="indictype">
										<html:options collection="indictypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>指标类型：
								</td>
								<td>
								<html:hidden property="indic_attr"/>
								<html:text property="indic_attr_disp" readonly="true"/>
									
									<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>指标事实表：
								</td>
								<td>
									<html:text property="indic_table" readonly="true"/>
								</td>
								<td>
									<font color="red">*</font>是否启用：
								</td>
								<td>
									<html:text property="flag_disp" readonly="true"/>
									<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
								</td>
							</tr>
							
							<tr id="pj1">
								<td>
									<font color="red">*</font>是否有交易：
								</td>
								<td>
									<html:select property="trans_ind">
										<html:options collection="trans_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<logic:equal name="indic_attr" value="GZ">
								<td>
									交易周期参数：
								</td>
								<td>
									<html:text property="gz_defkey" size="20" />
									<a href="#" title="参数" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=gz_defkey&mark=3',width:600,height:400,title:'参数',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_location.png" /></a>
								</td>
								</logic:equal>
								<logic:notEqual name="indic_attr" value="GZ">
								<td></td><td></td>
								</logic:notEqual>
							</tr>
							<tr id="pj2" >
							    <td>
									指标交易事实表：
								</td>
								<td colspan="3">
									<html:text property="transtable" maxlength="32"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<font color="red">*</font>指标sql：
								</td>
								<td colspan="3">
									<html:textarea property="indic_sql" cols="70" rows="6" onblur="_onblur3();"></html:textarea>
										<a href="#" title="参数" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=defparakey&mark=1&newsearchflag=1',width:600,height:400,title:'参数',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/modify2.gif" /></a>
									<span id="transform_flag" style="display:none">
										<a href="#" onclick="_onblur4();" ><img src="../../images/blue/b_complete.png" title="转换"  /></a>
										</span>
								</td>
							</tr>
							
							
							<tr id="transql">
								<td>
									<font color="red">*</font>指标交易sql：
								</td>
								<td colspan="3">
									
									<html:textarea property="trans_sql" cols="70" rows="6"></html:textarea>
									<a href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=defparakey&mark=2',width:600,height:400,title:'参数',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/modify2.gif" /></a>
								</td>
							</tr>
							
							<tr>
								
								</tr>
							<tr>
							<td></td>
							<td colspan="4" align="center" class="in_button"><br><html:button property="button" styleClass="input" value="提 交"
									onclick="checkForm('t21_indic_modify_do.do')"/>
							<br></td>
							</tr>
						</table>
					</div>
				</div>
			 <div class="sys_warning">
			    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />提示：</strong>
				<p>
				  1、基础指标：需要填写交易指标sql。有交易时，指标sql填写需要体现出交易表；无交易时，指标sql不能出现交易表，客户部分字段从t47_party,t47_corporation,t47_individual取得，账户部分字段从t47_agreement,t47_cp_deposit,t47_id_deposit取得。不管何种情况下，指标sql中核心部分都要以group by结尾。 <br/>
				  2、规则指标：需要用户描述“交易周期参数”，且大部分情况均是从已知的指标事实表中摘取数据 <br/>
				  3、公共部分：指标sql中需要摘取出INDICKEY,OBJKEY,INDICVAL1,STATISTIC_DT，规则指标可能还需要摘取INDICVAL2
				</p>
			  </div>
			</html:form>
		</div>
		
	</BODY>
	 <SCRIPT LANGUAGE="JavaScript">
	 var pp = document.forms[0].use_type_cd.value;
	 _onblur(pp);
	 
	 </SCRIPT>
</HTML>
