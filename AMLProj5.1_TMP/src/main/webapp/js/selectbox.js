// ===================================================================
// Author: Matt Kruse <matt@mattkruse.com>
// WWW: http://www.mattkruse.com/
//
// NOTICE: You may use this code for any purpose, commercial or
// private, without any further permission from the author. You may
// remove this notice from your final code if you wish, however it is
// appreciated by the author if at least my web site address is kept.
//
// You may *NOT* re-distribute this code in any way except through its
// use. That means, you can include it in your product, or your web
// site, or any other form where the code is actually being used. You
// may not put the plain javascript up on your site for download or
// include it in your javascript libraries for download.
// If you wish to share this code with others, please just point them
// to the URL instead.
// Please DO NOT link directly to my .js files from your site. Copy
// the files to your server and use them there. Thank you.
// ===================================================================

// HISTORY
// ------------------------------------------------------------------
// June 12, 2003: Modified up and down functions to support more than
//                selected option
/*
DESCRIPTION: These are general functions to deal with and manipulate
select boxes. Also see the OptionTransfer library to more easily
handle transferring options between two lists

COMPATABILITY: These are fairly basic functions - they should work on
all browsers that support Javascript.
*/

// -------------------------------------------------------------------
// selectUnselectMatchingOptions(select_object,regex,select/unselect,true/false)
//  This is a general function used by the select functions below, to
//  avoid code duplication
// -------------------------------------------------------------------
function selectUnselectMatchingOptions(obj,regex,which,only) {
    if (window.RegExp) {
        if (which == "select") {
            var selected1=true;
            var selected2=false;
        }
        else if (which == "unselect") {
            var selected1=false;
            var selected2=true;
        }
        else {
            return;
        }
        var re = new RegExp(regex);
        for (var i=0; i<obj.options.length; i++) {
            if (re.test(obj.options[i].text)) {
                obj.options[i].selected = selected1;
            }
            else {
                if (only == true) {
                    obj.options[i].selected = selected2;
                }
            }
        }
    }
}

// -------------------------------------------------------------------
// selectMatchingOptions(select_object,regex)
//  This function selects all options that match the regular expression
//  passed in. Currently-selected options will not be changed.
// -------------------------------------------------------------------
function selectMatchingOptions(obj,regex) {
    selectUnselectMatchingOptions(obj,regex,"select",false);
}
// -------------------------------------------------------------------
// selectOnlyMatchingOptions(select_object,regex)
//  This function selects all options that match the regular expression
//  passed in. Selected options that don't match will be un-selected.
// -------------------------------------------------------------------
function selectOnlyMatchingOptions(obj,regex) {
    selectUnselectMatchingOptions(obj,regex,"select",true);
}
// -------------------------------------------------------------------
// unSelectMatchingOptions(select_object,regex)
//  This function Unselects all options that match the regular expression
//  passed in.
// -------------------------------------------------------------------
function unSelectMatchingOptions(obj,regex) {
    selectUnselectMatchingOptions(obj,regex,"unselect",false);
}

// -------------------------------------------------------------------
// sortSelect(select_object)
//   Pass this function a SELECT object and the options will be sorted
//   by their text (display) values
// -------------------------------------------------------------------
function sortSelect(obj) {
    //不排序
//	var o = new Array();
//	if (obj.options==null) { return; }
//	for (var i=0; i<obj.options.length; i++) {
//		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
//		}
//	if (o.length==0) { return; }
//	o = o.sort(
//		function(a,b) {
//			if ((a.text+"") < (b.text+"")) { return -1; }
//			if ((a.text+"") > (b.text+"")) { return 1; }
//			return 0;
//			}
//		);
//
//	for (var i=0; i<o.length; i++) {
//		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
//		}
}

// -------------------------------------------------------------------
// selectAllOptions(select_object)
//  This function takes a select box and selects all options (in a
//  multiple select object). This is used when passing values between
//  two select boxes. Select all options in the right box before
//  submitting the form so the values will be sent to the server.
// -------------------------------------------------------------------
function selectAllOptions(obj) {
    for (var i=0; i<obj.options.length; i++) {
        obj.options[i].selected = true;
    }
}

//lkp
function repeatCheck(value,to){
    for (var i=0; i<to.options.length;i++){
        var o=to.options[i];
        if(value==o.value){
            return true;
        }
    }
    return false;
}
//lkp
function OrganinCheck(value){
    var toall = window.hiddenFrame;
    for (var i=0; i<length; i++) {
        if(value==toall.getOkey(i)) {
            return true;
        }
    }
    return false;
}
//lkp
function moveSelectedOptionsField(from,to) {
    // Unselect matching options, if required
    if (arguments.length>3) {
        var regex = arguments[3];
        if (regex != "") {
            unSelectMatchingOptions(from,regex);
        }
    }
    // Move them over
    for (var i=0; i<from.options.length; i++) {
        var o = from.options[i];
        if (o.selected && !repeatCheck(o.value,to) && FieldinCheck(o.value)) {
            to.options[to.options.length] = new Option( o.text, o.value, false, false);
        }
    }
    // Delete them from original
    for (var i=(from.options.length-1); i>=0; i--) {
        var o = from.options[i];
        if (o.selected) {
            from.options[i] = null;
        }
    }
    if ((arguments.length<3) || (arguments[2]==true)) {
        sortSelect(from);
        sortSelect(to);
    }
    from.selectedIndex = -1;
    to.selectedIndex = -1;
}
//lkp
function FieldinCheck(value){
    var toall = window.hiddenFrame;
    for (var i=0; i<length; i++) {
        if(value==toall.getFieldkey(i)) {
            return true;
        }
    }
    return false;
}
// right to left
//lkp
function moveSelectedOptionsOrg(from,to) {
    // Unselect matching options, if required
    if (arguments.length>3) {
        var regex = arguments[3];
        if (regex != "") {
            unSelectMatchingOptions(from,regex);
        }
    }
    // Move them over
    for (var i=0; i<from.options.length; i++) {
        var o = from.options[i];
        if (o.selected && !repeatCheck(o.value,to) && OrganinCheck(o.value)) {

            to.options[to.options.length] = new Option( o.text, o.value, false, false);
        }
    }
    // Delete them from original
    for (var i=(from.options.length-1); i>=0; i--) {
        var o = from.options[i];
        if (o.selected) {
            from.options[i] = null;
        }
    }
    if ((arguments.length<3) || (arguments[2]==true)) {
        sortSelect(from);
        sortSelect(to);
    }
    from.selectedIndex = -1;
    to.selectedIndex = -1;
}


// -------------------------------------------------------------------
// moveSelectedOptions(select_object,select_object[,autosort(true/false)[,regex]])
//  This function moves options between select boxes. Works best with
//  multi-select boxes to create the common Windows control effect.
//  Passes all selected values from the first object to the second
//  object and re-sorts each box.
//  If a third argument of 'false' is passed, then the lists are not
//  sorted after the move.
//  If a fourth string argument is passed, this will function as a
//  Regular Expression to match against the TEXT or the options. If
//  the text of an option matches the pattern, it will NOT be moved.
//  It will be treated as an unmoveable option.
//  You can also put this into the <SELECT> object as follows:
//    onDblClick="moveSelectedOptions(this,this.form.target)
//  This way, when the user double-clicks on a value in one box, it
//  will be transferred to the other (in browsers that support the
//  onDblClick() event handler).
// -------------------------------------------------------------------
function moveSelectedOptions(from,to) {
    // Unselect matching options, if required
    if (arguments.length>3) {
        var regex = arguments[3];
        if (regex != "") {
            unSelectMatchingOptions(from,regex);
        }
    }
    // Move them over
    for (var i=0; i<from.options.length; i++) {
        var o = from.options[i];
        if (o.selected && !repeatCheck(o.value,to)) {
            to.options[to.options.length] = new Option( o.text, o.value, false, false);
        }
    }
    // Delete them from original
    for (var i=(from.options.length-1); i>=0; i--) {
        var o = from.options[i];
        if (o.selected) {
            from.options[i] = null;
        }
    }
    if ((arguments.length<3) || (arguments[2]==true)) {
        sortSelect(from);
        sortSelect(to);
    }
    from.selectedIndex = -1;
    to.selectedIndex = -1;
}

// -------------------------------------------------------------------
// copySelectedOptions(select_object,select_object[,autosort(true/false)])
//  This function copies options between select boxes instead of
//  moving items. Duplicates in the target list are not allowed.
// -------------------------------------------------------------------
function copySelectedOptions(from,to) {
    var options = new Object();
    for (var i=0; i<to.options.length; i++) {
        options[to.options[i].value] = to.options[i].text;
    }
    for (var i=0; i<from.options.length; i++) {
        var o = from.options[i];
        if (o.selected) {
            if (options[o.value] == null || options[o.value] == "undefined" || options[o.value]!=o.text) {
                to.options[to.options.length] = new Option( o.text, o.value, false, false);
            }
        }
    }
    if ((arguments.length<3) || (arguments[2]==true)) {
        sortSelect(to);
    }
    from.selectedIndex = -1;
    to.selectedIndex = -1;
}

// -------------------------------------------------------------------
// moveAllOptions(select_object,select_object[,autosort(true/false)[,regex]])
//  Move all options from one select box to another.
// -------------------------------------------------------------------
function moveAllOptions(from,to) {
    selectAllOptions(from);
    if (arguments.length==2) {
        moveSelectedOptions(from,to);
    }
    else if (arguments.length==3) {
        moveSelectedOptions(from,to,arguments[2]);
    }
    else if (arguments.length==4) {
        moveSelectedOptions(from,to,arguments[2],arguments[3]);
    }
}
//lkp
function moveAllOptionsOrg(from,to) {
    selectAllOptions(from);
    if (arguments.length==2) {
        moveSelectedOptions(from,to);
    }
    else if (arguments.length==3) {
        moveSelectedOptions(from,to,arguments[2]);
    }
    else if (arguments.length==4) {
        moveSelectedOptionsOrg(from,to,arguments[2],arguments[3]);
    }
}
//lkp
function moveAllOptionsField(from,to) {
    selectAllOptions(from);
    if (arguments.length==2) {
        moveSelectedOptions(from,to);
    }
    else if (arguments.length==3) {
        moveSelectedOptions(from,to,arguments[2]);
    }
    else if (arguments.length==4) {
        moveSelectedOptionsField(from,to,arguments[2],arguments[3]);
    }
}
// -------------------------------------------------------------------
// copyAllOptions(select_object,select_object[,autosort(true/false)])
//  Copy all options from one select box to another, instead of
//  removing items. Duplicates in the target list are not allowed.
// -------------------------------------------------------------------
function copyAllOptions(from,to) {
    selectAllOptions(from);
    if (arguments.length==2) {
        copySelectedOptions(from,to);
    }
    else if (arguments.length==3) {
        copySelectedOptions(from,to,arguments[2]);
    }
}

// -------------------------------------------------------------------
// swapOptions(select_object,option1,option2)
//  Swap positions of two options in a select list
// -------------------------------------------------------------------
function swapOptions(obj,i,j) {
    var o = obj.options;
    var i_selected = o[i].selected;
    var j_selected = o[j].selected;
    var temp = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
    var temp2= new Option(o[j].text, o[j].value, o[j].defaultSelected, o[j].selected);
    o[i] = temp2;
    o[j] = temp;
    o[i].selected = j_selected;
    o[j].selected = i_selected;
}

// -------------------------------------------------------------------
// moveOptionUp(select_object)
//  Move selected option in a select list up one
// -------------------------------------------------------------------
function moveOptionUp(obj) {
    for (i=0; i<obj.options.length; i++) {
        if (obj.options[i].selected) {
            if (i != 0 && !obj.options[i-1].selected) {
                swapOptions(obj,i,i-1);
                obj.options[i-1].selected = true;
            }
        }
    }
}

// -------------------------------------------------------------------
// moveOptionDown(select_object)
//  Move selected option in a select list down one
// -------------------------------------------------------------------
function moveOptionDown(obj) {
    for (i=obj.options.length-1; i>=0; i--) {
        if (obj.options[i].selected) {
            if (i != (obj.options.length-1) && ! obj.options[i+1].selected) {
                swapOptions(obj,i,i+1);
                obj.options[i+1].selected = true;
            }
        }
    }
}

// -------------------------------------------------------------------
// removeSelectedOptions(select_object)
//  Remove all selected options from a list
//  (Thanks to Gene Ninestein)
// -------------------------------------------------------------------
function removeSelectedOptions(from) {
    for (var i=(from.options.length-1); i>=0; i--) {
        var o=from.options[i];
        if (o.selected) {
            from.options[i] = null;
        }
    }
    from.selectedIndex = -1;
}

// -------------------------------------------------------------------
// removeAllOptions(select_object)
//  Remove all options from a list
// -------------------------------------------------------------------
function removeAllOptions(from) {
    for (var i=(from.options.length-1); i>=0; i--) {
        from.options[i] = null;
    }
    from.selectedIndex = -1;
}

// -------------------------------------------------------------------
// addOption(select_object,display_text,value,selected)
//  Add an option to a list
// -------------------------------------------------------------------
function addOption(obj,text,value,selected) {
    if (obj!=null && obj.options!=null) {
        obj.options[obj.options.length] = new Option(text, value, false, selected);
    }
}



function subHiddenFrame(hiddenFrame, uporganObj){
		tempObj = uporganObj
		tempFrame = hiddenFrame
		if (hiddenFrame.document.forms[0] == null || hiddenFrame.document.forms[0].uporgankey == null)
		{
			setTimeout('_delay(tempFrame, tempObj)', '10000');
		}else{
			_delay(tempFrame, tempObj);
		}
}
function _delay(hiddenFrame, uporganObj){
	var uporgankey = uporganObj.value;
    hiddenFrame.document.forms[0].uporgankey.value=uporgankey;
    hiddenFrame.document.forms[0].submit();
}
function getOrgInfo(hiddenFrame, len, listLeft, listRight){
    var length=len;
    for (var i=(listLeft.options.length-1); i>=0; i--) {
        var o=listLeft.options[i];
        listLeft.options[i] = null;
    }
    var to = listLeft;
    var from = hiddenFrame
    //显示list1中的元素时，需要去除已经在list2中选择的
    //
    var list_seq = 0;
    for (var i=0; i<len; i++) {
        var haveExist = 0;
        //取出重复的
        for (var j=(listRight.options.length-1); j>=0; j--) {
            var o=listRight.options[j];
            if(o.value==from.getOkey(i)){
                haveExist = 1;
                break;
            }
        }
        if(haveExist == 0){
            to.options[list_seq] = new Option( from.getOvalue(i), from.getOkey(i), false, false);
            list_seq++;
        }
    }
}
function _queryOptions(hiddenFrame, obj, queryValue, listLeft, listRight, uporganObj){
	if (queryValue == "")
	{
		subHiddenFrame(hiddenFrame,uporganObj);
		return ;
	}
	uporganObj.options.selectedIndex = 0;
	//
	var length=hiddenFrame.allorgkey.length;
    for (var i=(listLeft.options.length-1); i>=0; i--) {
        var o=listLeft.options[i];
        listLeft.options[i] = null;
    }
    var to = obj
    var from = hiddenFrame
    //显示list1中的元素时，需要去除已经在list2中选择的
    var list_seq = 0;
    for (var i=0; i<length; i++) {
        var haveExist = 0;
        //取出重复的
        for (var j=(listRight.options.length-1); j>=0; j--) {
            var o=listRight.options[j];
            if(o.value==from.getAllOkey(i)){
                haveExist = 1;
                break;
            }
        }
        if(haveExist == 0){
			temp = from.getAllOvalue(i)
			if (temp.indexOf(queryValue) != -1)
			{
				to.options[list_seq] = new Option( from.getAllOvalue(i), from.getAllOkey(i), false, false);
				list_seq++;
			}
        }
    }
}
//在文本框回车点击指定button
function _KeyDown(obj)
{
    if (event.keyCode == 13)
    {
        obj.click();
    }
}

function selectAll(obj){
	if (obj.options.length == 0)
	{
		return "空!"
	}
    for (var i=(obj.options.length-1); i>=0; i--) {
        var o=obj.options[i];
        o.selected = true;
    }
	return ""
}

//把<select>中选择的值填入到文本框中
function _setSelectedOptions(from, toName, toValue){
	toName.value = from.options[from.options.selectedIndex].text
	toValue.value = from.options[from.options.selectedIndex].value
}

//-----------------------avp begin gaosen modify---------------------------------------------
/**
 *移动并检查另外是否被选中
 *
 */
function moveAvpAllOptions(org_From,org_To,chk_From,chk_To) {
    var orgFrom = document.getElementById(org_From);
    selectAllOptions(orgFrom);
    moveAvpSelectedOptions(org_From,org_To,chk_From,chk_To);
}

function moveAvpSelectedOptions(org_From,org_To,chk_From,chk_To) {
    var orgFrom= document.getElementById(org_From);
    var orgTo= document.getElementById(org_To);
    var chkFrom= document.getElementById(chk_From);
    var chkTo= document.getElementById(chk_To);
	
	// Move them over
    for (var i=0; i<orgFrom.options.length; i++) {
        var o = orgFrom.options[i];
        if (o.selected) {
            if(!repeatCheck(o.value,orgTo)){
	            orgTo.options[orgTo.options.length] = new Option( o.text, o.value, false, false);
            }
        
	       	for (var j=0; j<chkTo.options.length;j++){
    		    if(chkTo.options[j].value==o.value){
        		 	chkTo.options[j] = null;
		       		 	if(!repeatCheck(o.value,chkFrom)){
	    		        	chkFrom.options[chkFrom.options.length] = new Option( o.text, o.value, false, false);
       		 			}
       			 }
    		}
    	}
    }

	 // Delete them from original
    for (var i=(orgFrom.options.length-1); i>=0; i--) {
        var o = orgFrom.options[i];
        if (o.selected) {
            orgFrom.options[i] = null;
        }
    }

    orgFrom.selectedIndex = -1;
    orgTo.selectedIndex = -1;
    chkFrom.selectedIndex = -1;
    chkTo.selectedIndex = -1;
}
//将选中的option设为升序  
function setOptionDesc(obj){
	for (i=0; i<obj.options.length; i++) {
        if (obj.options[i].selected) {
			var orgValue = obj.options[i].value.split(" ")[0];
			var orgText = obj.options[i].text.split(" ")[0];
            obj.options[i].value = orgValue + " desc";
			obj.options[i].text = orgText + " (降序)";
			obj.options[i].selected = true;
        }
    }
	
}
//将选中的option设为降序  
function setOptionAsc(obj){
	for (i=0; i<obj.options.length; i++) {
        if (obj.options[i].selected) {
			var orgValue = obj.options[i].value.split(" ")[0];
			var orgText = obj.options[i].text.split(" ")[0];
            obj.options[i].value = orgValue + " asc";
			obj.options[i].text = orgText + " (升序)";
			obj.options[i].selected = true;
        }
    }
	obj.focus();
}

//------------------------avp end------------------------------------------