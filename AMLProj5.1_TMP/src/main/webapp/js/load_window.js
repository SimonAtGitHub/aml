
//如何调用例如locate_org_single('<%= request.getContextPath()%>','organname','organkey','')
//机构单选
function locate_pop_window(load_page_path ,localname ,issingle ,forms, localset,condition){	
	var whole_path = load_page_path+'/platform/common/location_window.do?localname='+localname+'&issingle='+issingle+'&forms='+forms+'&localset='+localset+'&condition='+condition+'&newsearchflag=1';
	 var top =  (window.screen.availHeight-30-400)/2;
	 var left = (window.screen.availWidth-10-750)/2;
     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
    window.open(whole_path,localset.split(',')[0],property);     
}
//无查询条件的界面
function locate_pop_window_noquery(load_page_path ,localname ,issingle ,forms, localset,condition){	
	var whole_path = load_page_path+'/common/location_window_noquery.do?localname='+localname+'&issingle='+issingle+'&forms='+forms+'&localset='+localset+'&condition='+condition+'&newsearchflag=1';
    
	 var top =  (window.screen.availHeight-30-400)/2;
	 var left = (window.screen.availWidth-10-750)/2;
     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
    window.open(whole_path,localset.split(',')[0],property);     
}

function locate_tree_window(load_page_path,menuid,forms,localset,format,term){
	var condition = localset.split(',')[0];
	//var keys = window.document.getElementById(condition).value;
	var keys = window.document.getElementsByName(condition)[0].value;
	var whole_path = load_page_path+'/common/location_commontreewindow.do?menuid='+menuid+'&forms='+forms+'&localset='+localset+'&keys='+keys+'&format='+format+'&newsearchflag=1'+term;
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
    //window.open(whole_path,condition,property);  
    window.open("about:blank",condition,property);    //
    //改成post方式提交   参数 condition 必须一致；
    locate_submitByPost(whole_path,condition);
}

function locate_submitByPost(url,condition){
	document.forms[0].method= "post";
	document.forms[0].target = condition;
    document.forms[0].action= url;
    document.forms[0].submit();
    document.forms[0].target = "";
}

function locate_tree_display_window(load_page_path,menuid,color,position){
	whole_path = load_page_path+'/pub/menu_tree_display.do?menu_id='+menuid+'&color='+color+'&position='+position;
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
    window.open(whole_path,'',property);     
}
function locate_radiotree_window(load_page_path,menuid,forms,localset){
	var condition = localset.split(',')[0];
	var keys = window.document.getElementById(condition).value;
	var whole_path = load_page_path+'/common/location_commontreewindow1.do?menuid='+menuid+'&forms='+forms+'&localset='+localset+'&keys='+keys+'&newsearchflag=1';
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(whole_path,condition,property);     
}

//左边树
function locate_org_muti(load_page_path, sqlMapid, property){
	var whole_path = load_page_path+'/platform/module/menu_common_left.do?sqlMapid='+sqlMapid+'&newsearchflag=1';
	
	var p ;
	if(property===null||property.length===0){
	 	p = 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
	}else{
		p=property;
	}
	
    window.open(whole_path,'',p);     
}

//用户单选
function locate_user_single(load_page_path, disp_id, hid_id, property){
	var whole_path = load_page_path+'/common/t00_user_search.do?input_name='+hid_id+'&input_name_disp='+disp_id+'&newsearchflag=1';
	
	
	var p ;
	if(property===null||property.length===0){
	 	p = 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
	}else{
		p=property;
	}
	
    window.open(whole_path,'',p);     
}

function emptyall()
{
	 document.getElementById("100").value="";
	 document.getElementById("200").value="";
	
}

function locate_proj_window(load_page_path ,localname ,issingle ,forms, localset,condition){	
	var whole_path = load_page_path+'/common/location_windowproj.do?localname='+localname+'&issingle='+issingle+'&forms='+forms+'&localset='+localset+'&condition='+condition+'&newsearchflag=1';
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(whole_path,'',property);     
}

function locate_sms_window(load_page_path ,receiver ,smscontent){	
	var whole_path = load_page_path+'/cmp/platform/t00_sms/t00_sms_add_send.do?receiver='+receiver+'&smscontent='+smscontent;
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(whole_path,'',property);     
}

function locate_rootradiotree_window(load_page_path,menuid,forms,localset,term){
	var condition = localset.split(',')[0];
	var condition1 = localset.split(',')[1];
	var keys = window.document.getElementById(condition).value;
	var names = window.document.getElementById(condition1).value;
	var whole_path = load_page_path+'/common/location_rootradiotreewindow.do?menuid='+menuid+'&forms='+forms+'&localset='+localset+'&keys='+keys+'&names='+names+'&newsearchflag=1'+term;
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	window.open(whole_path,'',property); 
}

function locate_roottree_window(load_page_path,menuid,forms,localset,term){
	var condition = localset.split(',')[0];
	var condition1 = localset.split(',')[1];
	var keys = window.document.getElementById(condition).value;
	var names = window.document.getElementById(condition1).value;
	var whole_path = load_page_path+'/common/location_roottreewindow.do?menuid='+menuid+'&forms='+forms+'&localset='+localset+'&keys='+keys+'&names='+names+'&newsearchflag=1'+term;
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
	window.open(whole_path,'',property);    
}


function locate_radiotree_usergroup(load_page_path,menuid,localset,condition1){
	var condition = localset.split(',')[0];

	var keys = window.document.getElementById(condition).value;

	var whole_path = load_page_path+'/bmp/platform/group/rela_usergrp_radioindex.do?localset='+localset+'&condition='+condition1+'&keys='+keys+'&menuid='+menuid+'&newsearchflag=1';
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
	var	property = 'height=500, width=900,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	window.open(whole_path,'',property);	

 }
 
 function locate_checkboxtree_usergroup(load_page_path,menuid,localset,condition1){
	var condition = localset.split(',')[0];

	var keys = window.document.getElementById(condition).value;

	var whole_path = load_page_path+'/bmp/platform/group/rela_usergrp_agilityindex.do?localset='+localset+'&condition='+condition1+'&keys='+keys+'&menuid='+menuid+'&newsearchflag=1';
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
	var	property = 'height=500, width=900,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	window.open(whole_path,'',property);
 }
 
 
 function locate_assigntree_usergroup(load_page_path,menuid,localset,condition1){
	var condition = localset.split(',')[0];

	var keys = window.document.getElementById(condition).value;

	var whole_path = load_page_path+'/bmp/platform/group/rela_usergrp_assignindex.do?localset='+localset+'&condition='+condition1+'&keys='+keys+'&menuid='+menuid+'&newsearchflag=1';
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
	var	property = 'height=500, width=900,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	window.open(whole_path,'',property);
 }
 
 function locate_colpara_window(load_page_path ,localname ,issingle ,forms, localset,condition){	
	var whole_path = load_page_path+'/common/location_colpara_window.do?localname='+localname+'&issingle='+issingle+'&forms='+forms+'&localset='+localset+'&condition='+condition+'&newsearchflag=1';
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(whole_path,'',property);     
}

var l_o_win = null;
function locate_order_window(load_page_path,id,name,tablename,keyname,seqname,type){	
//	var whole_path = load_page_path+'/common/location_orderwindow.do?id='+id+'&name='+name+'&tablename='+tablename+'&keyname='+keyname+'&seqname='+seqname;
	//type 为keyname的数据类型 (var,int)
	var whole_path = load_page_path+'/platform/common/location_orderwindow.do?';
	var org_path = '/aml/platform/pub/blank.jsp';
    
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
   if(l_o_win == null ||l_o_win.closed ){
    	l_o_win = window.open(org_path,'l_o_win',property);

		var bgObj=document.createElement("div");
		bgObj.innerHTML = "<form name='sub' id ='sub' method='post' action='"+ whole_path +"' >"+
			"<input type='hidden' name='id'  value = '"+id+"'>"+
 			"<input type='hidden' name='name' value = '"+name+"'>"+
 			"<input type='hidden' name='tablename' value = '"+tablename+"'>"+
 			"<input type='hidden' name='keyname' value = '"+keyname+"'>"+
 			"<input type='hidden' name='seqname' value = '"+seqname+"'>"+
 			"<input type='hidden' name='type' value = '"+type+"'>"+
 			"</form>";
		document.body.appendChild(bgObj);		
		document.forms['sub'].target = 'l_o_win' ;
		document.forms['sub'].submit();
		
    	l_o_win.focus();
    	bgObj.innerHTML = "";
    }else{
    	l_o_win.focus();
    }     
}



//图片定位
function locate_icon_window(load_page_path,localset){	
	var whole_path = load_page_path+'/bmp/icon_do.do?localset='+localset;
    
	var top =  (window.screen.availHeight-30-400)/2;
	var left = (window.screen.availWidth-10-750)/2;
    var	property = 'height=500, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(whole_path,'',property);   
}
//问题词条定位  ----展示列表
function locate_question_entry_window(load_page_path,menuid,forms,localset,format,term){
	var condition = localset.split(',')[0];
	//var keys = window.document.getElementById(condition).value;
	var keys = "";
	var whole_path = load_page_path+'/common/location_qestion_entrytreewindow.do?menuid='+menuid+'&forms='+forms+'&localset='+localset+'&keys='+keys+'&format='+format+'&newsearchflag=1'+term;
    
	var	property = 'height=450, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
	
    window.open(whole_path,'',property);     
}
//码表单选
function locate_dict_window(load_page_path ,type,localset){	
	 var whole_path = load_page_path+'/platform/t00_dict/location_window_dict.do?newsearchflag=1&type='+type+'&localset='+localset;
	 var top =  (window.screen.availHeight-30-400)/2;
	 var left = (window.screen.availWidth-10-750)/2;
     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
     window.open(whole_path,'',property);     
}