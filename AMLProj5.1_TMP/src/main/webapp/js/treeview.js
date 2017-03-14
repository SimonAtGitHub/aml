//***********************************************************
//
//  创建一棵树, 树对象名为"TREE".
//
//
//***********************************************************
function CreateTree() {
	TREE = new _TreeView_Object();
}
//
//  树对象响应点击事件函数, 一般调用为 onclick="clickTree(this);" .
//
function clickTree(obj) {
	TREE.onClick(obj.id);
}
//***********************************************************
//
//  树对象定义.
//
//***********************************************************
function _TreeView_Object() {
	//图标起始参考位置
	var path= '';

	var codebase = '../../images/img/';

	this.ICON_BASE=codebase;

	//通用树节点描述图标
	//微软标准风格树结构图标
	this.TEXT_NORMAL=null;
	this.TEXT_BRIGHT=null;

	this.TREE_ROOT=this.ICON_BASE+'web.gif';
	this.TREE_BLANK=this.ICON_BASE+'empty.gif';
	this.TREE_BRANCH_BOTTOM=this.ICON_BASE+'L1.gif';
	this.TREE_BRANCH_MIDDLE=this.ICON_BASE+'T1.gif';
	this.TREE_BRANCH_NONE=this.ICON_BASE+'I1.gif';
	this.TREE_CLOSED_BOTTOM=this.ICON_BASE+'plus_end.gif';
	this.TREE_CLOSED_MIDDLE=this.ICON_BASE+'Tplus.gif';
	this.TREE_OPEN_BOTTOM=this.ICON_BASE+'minus_end.gif';
	this.TREE_OPEN_MIDDLE=this.ICON_BASE+'Tminus.gif';
	this.TREE_FOLDER_OPEN=this.ICON_BASE+'open.gif';
	this.TREE_FOLDER_CLOSED=this.ICON_BASE+'close.gif';
	this.TREE_LEAF=this.ICON_BASE+'file2.gif';

	this.baseId=null;
	this.targetId=null;
	this.targetWin=null;
	this.queryString='';

	// 当前光标所在节点
	this.selectedNode=null;

	this.nodeList=new Array();

        this.nodeListLength=0;

        this.nodeListIndex=new Array();

	this.insertNode=_tv_insertNode;  // 插入新的节点
        this.add=_tv_addNode;  // 插入新的节点
	this.show=_tv_show; // 显示树
	this.onClick=_tv_onClick;  // 响应树上发生的点击事件
	this.findNode=_tv_findNode; // 根据ID 查找节点

	this.setTarget=_tv_setTarget;  // 设置查询的输出目标
	this.setQueryString=_tv_setQueryString; // 设置查询字符串

}
//
// 设置查询字符串
//
function _tv_setQueryString(s) {
	this.queryString=s;
}
//
//  插入一个新节点.
//
function _tv_insertNode(nd) {
	var idx;
	//if(nd.type==null)
		idx=nd.id;
	//else
	//	idx=nd.type+nd.id;
	this.nodeList[idx]=nd;

        this.nodeListIndex[idx]=this.nodeListLength;
        this.nodeListLength=eval(this.nodeListLength+1);


}

//
//  插入一个新节点.
//
function _tv_addNode(id,parentId,title,remark) {
	var nd=new Node(id,title,null,null,parentId,remark,null,null);
        this.insertNode(nd);
}
//
//  响应点击事件.
//
function _tv_onClick(srcElementId) {
	id=srcElementId.substring(3);
	region=srcElementId.substring(0,3);

	var nd=this.nodeList[id];

	if(region=="TB_") {
		nd.startExpand();
	}
	else if(region=="TT_" || region=="TI_") {
		if(!(nd.status=='opened')){//打开状态则不用调用展开方式
			nd.expand();
		}
		nd.startQuery();
	}
}
//
// 根据ID 查找节点
//
function _tv_findNode(id) {
	var idx;
	for(idx in this.nodeList) {
		if(this.nodeList[idx].id==id)
			return this.nodeList[idx];
	}
	return null;
}
//
//  树所在区域: baseId;
//  树输出区域: targetId(适用于NoFrame 输出形式,如果是Frame ,则设为 null);
//  树输出窗口: targetWin(适用于Frame 输出形式,如果是NoFrame ,则设为 null);
//
function _tv_setTarget(baseId,targetId,targetWin) {
	this.baseId=baseId;
	this.targetId=targetId;
	this.targetWin=targetWin;
}
//
//  显示树,自动展开根节点及其下一级.
//
function _tv_show() {
	// 如果没有节点插入,则返回


	if(this.nodeList.length==0)
		return false;

	// 查找根节点
	var found=false;
	var idx;



	for (idx in this.nodeList){
		if(this.nodeList[idx].parentId==null) {
			found=true;
			break;
		}
	}
	// 如果没有找到根节点,则返回
	if(!found)
		return false;



	// 得到根节点,只有一个根节点
	var nd=this.nodeList[idx];
	var id=nd.id;
	var name=nd.title;

	//
	// TB=Tree Branch;  TI=Tree node Image;  TT=Tree branch Text;  TX=Tree eXpand tree
	//
	s="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\">"+
//		"<nobr><img style=\"cursor:hand\" id=\"TB_"+id+"\" onClick=\"clickTree(this);\" src=\""+this.TREE_ROOT+"\" border=0 align=absmiddle>"+
		"<span style=\"cursor:hand\" id=TT_"+id+" onClick=\"clickTree(this);\" color=\""+this.TEXT_NORMAL+"\">"+name+"</span></nobr></div>";
	s+="<font style=\"font-size:9pt;\" id=TX_"+id+"></font></nobr>";
	//
	// 输出树.
	//
	eval('document.all["'+this.baseId+'"].innerHTML=s');

	nd.startExpand();
	nd.setFocus();
}

//
// 树节点对象定义:
//    id          : 节点的ID
//    title       : 节点的文字
//    type        : 节点的类别（自定义）
//    flag        : 节点状态（自定义）
//    selected    : 节点是否被选中
//    parentId    : 节点的父节点ID
//    remark      : 备注
//    iconOpen    : 对分支节点,表示节点打开的图标，对叶子节点表示光标所在位置
//    iconClose   : 对分支节点,表示节点关闭的图标，对叶子节点表示光标离去
//
// 相关事件或方法:
//    startExpand : 节点下子树的展开/关闭
//    startQuery  : 节点查询
//    setFocus    : 设置节点光标状态
//    locate      : 查询与定位
//    expand      : 展开子树
//    collapse    : 关闭子树
//
// 填充方法,由程序员填写:
//    getChildren   : 返回当前节点孩子们节点数组,向下两级,到孙子节点.
//    getQuery      : 返回当前节点查询结果,如果是NoFrame方式,则为格式化HTML 字符串,否则为URL 格式的字符串.
//
function Node(id,title,type,flag,parentId,remark,iconOpen,iconClose) {
	// 节点属性初始化设置

	this.id=id;
	this.title=title;
	this.type=type;
	this.flag=flag;
        this.parentId=parentId;
	this.remark=remark;
	this.status="closed"; // expand set to "opened"

	// 节点自定义图标
	if(iconOpen != null && iconClose != null) {
		this.NODE_FOLDER_OPEN=iconOpen;
		this.NODE_FOLDER_CLOSED=iconClose;
	}
	else { // 默认
		if(parentId==null) {
			this.NODE_FOLDER_OPEN=TREE.TREE_ROOT;
			this.NODE_FOLDER_CLOSED=TREE.TREE_ROOT;
		}
		else {
			//this.NODE_FOLDER_OPEN=TREE.TREE_FOLDER_OPEN;
			//this.NODE_FOLDER_CLOSED=TREE.TREE_FOLDER_CLOSED;
			this.NODE_FOLDER_OPEN=null;
			this.NODE_FOLDER_CLOSED=null;
		}
	}

	// 节点对象方法设置
	this.locate=_nd_locate;
	this.startExpand=_nd_startExpand;
	this.startQuery=_nd_startQuery;
	this.setFocus=_nd_setFocus;
	this.expand=_nd_expand;
	this.collapse=_nd_collapse;

	this.getChildren=_getChildren;
	this.getQuery=_getQuery;

//        alert(this.id);

}

function _getChildren() {
	return null;
}
//
//  展开.
//
function _nd_expand() {
	if(this.status=='opened')
		return true;

        //最后的叶子节点，不进行展开操作
        var yy=eval('document.all["TB_'+this.id+'"]');
    	if(yy!=null){
        	var src=yy.src;
                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_BRANCH_MIDDLE.substring(TREE.TREE_BRANCH_MIDDLE.lastIndexOf('/')) || src.substring(src.lastIndexOf('/'))==TREE.TREE_BRANCH_BOTTOM.substring(TREE.TREE_BRANCH_BOTTOM.lastIndexOf('/'))){
                    	this.status=='opened';
                	return true;
                }
        }

        var xx=eval('document.all["TX_'+this.id+'"]');
//	xx.innerHTML='';

	if(xx.style.display!='none'){



	var middleNodeList=new Array();
	var k=0;
	middleNodeList[k]=this;
	var nd=null;
	// 查找相关的到根节点的链路,包含根节点
	while(this.parentId!=null) {
		for(idx in TREE.nodeList) {
			nd=TREE.nodeList[idx];
			if(nd.id==middleNodeList[k].parentId) {
				middleNodeList[k+1]=nd;
				k++;
				break;
			}
		}
		if(nd.parentId==null)
			break;
	}
	// 得到展开的子节点前面的图样,存在字符串s1 中
	var ww=0;
	var s1='';
	for(ww=0;ww<middleNodeList.length-1;ww++){
		var hasUncle=false;
		idx="0";
		for(idx in TREE.nodeList) {
			nd=TREE.nodeList[idx];
			if(nd.parentId==middleNodeList[ww].parentId && TREE.nodeListIndex[nd.id]>TREE.nodeListIndex[middleNodeList[ww].id]) {
				hasUncle=true;
				break;
			}
		}

		if(hasUncle){//上级部门不是最后一个部门；
			s1="<img align=absmiddle src=\""+TREE.TREE_BRANCH_NONE+"\" border=0>"+s1;

		}
		else{//上级部门是最后一个部门；
			s1="<img align=absmiddle src=\""+TREE.TREE_BLANK+"\" border=0>"+s1;
		}
	}
	// 准备孩子节点,孙子节点的数据
	var ndLst=this.getChildren();
	// 将所查到的孩子节点插入树中
	//alert('before new node:'+TREE.nodeList.length);
	if(ndLst!=null) {
		idx="0";
		for(idx in ndLst) {
			TREE.insertNode(ndLst[idx]);
		}
	}
	//alert('after new node:'+TREE.nodeList.length);

	var s='';
	var idx,idx2;
	s='';
	idx="0";
	for(idx in TREE.nodeList){
		nd=TREE.nodeList[idx];
		// 非叶子节点,进行展开操作
		if(nd.parentId==this.id){
			nd.status='closed';
			haveSub=false;
			haveNext=false;
			for(idx2 in TREE.nodeList){ //判断是否还有下级
				nd2=TREE.nodeList[idx2];
				if(nd2.parentId==nd.id){
					haveSub=true;
				}
				if(nd2.parentId==this.id && TREE.nodeListIndex[idx2]>TREE.nodeListIndex[idx]) { // 判断是否还有后续的兄弟节点
					haveNext=true;
				}
				if(haveSub && haveNext)
					break;
			}
			if(haveSub){
				if(nd.NODE_FOLDER_OPEN==null) nd.NODE_FOLDER_OPEN=TREE.TREE_FOLDER_OPEN;
				if(nd.NODE_FOLDER_CLOSED==null) nd.NODE_FOLDER_CLOSED=TREE.TREE_FOLDER_CLOSED;

				if(haveNext){
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_CLOSED_MIDDLE+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
				else{
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_CLOSED_BOTTOM+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
			}
			else{
				if(nd.NODE_FOLDER_OPEN==null) nd.NODE_FOLDER_OPEN=TREE.TREE_LEAF;
				if(nd.NODE_FOLDER_CLOSED==null) nd.NODE_FOLDER_CLOSED=TREE.TREE_LEAF;

				if(haveNext){
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_BRANCH_MIDDLE+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
				else{
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_BRANCH_BOTTOM+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
			}
		} // 非叶子节点展开操作结束
	}


        xx.innerHTML=s;


	}
	else{
    		xx.style.display='';

   	}


	this.status='opened';

	// 处理树分支的图形式样
	if(this.parentId==null) // 树节点忽略
		return true;


    	var yy=eval('document.all["TB_'+this.id+'"]');
    	if(yy!=null){
        	var src=yy.src;

                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_CLOSED_MIDDLE.substring(TREE.TREE_CLOSED_MIDDLE.lastIndexOf('/'))){
                	src=TREE.TREE_OPEN_MIDDLE;
                }
                else if(src.substring(src.lastIndexOf('/'))==TREE.TREE_CLOSED_BOTTOM.substring(TREE.TREE_CLOSED_BOTTOM.lastIndexOf('/'))){
                	src=TREE.TREE_OPEN_BOTTOM;
                }
                yy.src=src;
        }

        /*
	haveSub=false;
	haveNext=false;
	idx="0";
	for(idx in TREE.nodeList) { // 查找当前对象下标
		nd=TREE.nodeList[idx];
		if(nd.id==this.id)
			break;
	}
	idx2="0";
	for(idx2 in TREE.nodeList){ //判断是否还有下级
		nd2=TREE.nodeList[idx2];
		if(nd2.parentId==this.id){
			haveSub=true;
		}
		if(nd2.parentId==this.parentId && idx2>idx) { // 判断是否还有后续的兄弟节点
			haveNext=true;
		}
		if(haveSub && haveNext)
			break;
	}
	var src;
	if(haveSub) {
		if(haveNext) {
			src=TREE.TREE_OPEN_MIDDLE;
		}
		else {
			src=TREE.TREE_OPEN_BOTTOM;
		}
		yy=eval('document.all["TB_'+this.id+'"]');
		if(yy!=null)
			yy.src=src;
	}
        */

	return true;
}
//
//  关闭
//
function _nd_collapse() {
	var nd=null;
	if(this.status=='closed')
		return true;
	this.status='closed';
	// 首先,进行光标处理
	if(TREE.selectedNode!=null) {
		nd=TREE.selectedNode;
		while(nd.parentId!=null && nd.parentId!=this.id) {
			nd=TREE.findNode(nd.parentId);
		}
		if(nd.parentId==this.id) {
			this.setFocus();
		}
	}
	//var xx=eval('window.TX_'+this.id);
	var xx=eval('document.all["TX_'+this.id+'"]');
//	xx.innerHTML='';

	xx.style.display='none';



	// 修改树分支图标式样
	if(this.parentId==null) // 树节点忽略
		return true;

        var yy=eval('document.all["TB_'+this.id+'"]');

        if(yy!=null){
        	var src=yy.src;

                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_OPEN_MIDDLE.substring(TREE.TREE_OPEN_MIDDLE.lastIndexOf('/'))){
                	src=TREE.TREE_CLOSED_MIDDLE;
                }
                else if(src.substring(src.lastIndexOf('/'))==TREE.TREE_OPEN_BOTTOM.substring(TREE.TREE_OPEN_BOTTOM.lastIndexOf('/'))){
                	src=TREE.TREE_CLOSED_BOTTOM;
                }
                yy.src=src;
        }

        /*
	haveSub=false;
	haveNext=false;
	for(idx in TREE.nodeList) { // 查找当前对象下标
		nd=TREE.nodeList[idx];
		if(nd.id==this.id)
			break;
	}
	for(idx2 in TREE.nodeList){ //判断是否还有下级
		nd2=TREE.nodeList[idx2];
		if(nd2.parentId==this.id){
			haveSub=true;
		}
		if(nd2.parentId==this.parentId && idx2>idx) { // 判断是否还有后续的兄弟节点
			haveNext=true;
		}
		if(haveSub && haveNext)
			break;
	}
	var src;
	if(haveSub) {
		if(haveNext) {
			src=TREE.TREE_CLOSED_MIDDLE;
		}
		else {
			src=TREE.TREE_CLOSED_BOTTOM;
		}
		//yy=eval('window.TB_'+this.id);
		yy=eval('document.all["TB_'+this.id+'"]');
		if(yy!=null)
			yy.src=src;
	}
        */
	this.status='closed';
}
//
//  展开/关闭,以响应鼠标点击事件
//
function _nd_startExpand() {
	if(this.status=='opened')
		return this.collapse();
	else if(this.status=='closed')
		return this.expand();
}
//
//  定位节点
//
function _nd_locate() {
	var k=0;
	var middleNodeList = new Array();
	middleNodeList[k]=this;
	while(middleNodeList[k].parentId!=null) {
		k++;
		middleNodeList[k]=TREE.nodeList[middleNodeList[k-1].parentId];
	}
	for(i=k;i>=0;i--) {
		middleNodeList[i].expand();
	}
	this.setFocus();
}
//
//  进行节点数据查询
//
function _nd_startQuery() {
	//alert("this is _nd_startQuery:"+this.title);
	var s=this.getQuery();
	if(TREE.targetId!=null && s!=null) {
		//eval("window."+TREE.targetId+".innerHTML=s;");
		eval('document.all["'+TREE.targetId+'"].innerHTML=s;');
	}
	else if(TREE.targetWin!=null && s!=null) {
		eval("parent."+TREE.targetWin+".location=\""+s+"\"");
	//	eval("parent."+TREE.targetWin+".location.reload();");
	}
	// then, set focus on the node
	this.setFocus();
}
//
// 设置光标置于指定节点
//
function _nd_setFocus() {

	var tt_id;
	var tt_obj;
	// 取消前次光标所在节点醒目状态
	if(TREE.selectedNode!=null) {
		var nd=TREE.selectedNode;
		tt_id='TT_'+nd.id;
		tt_obj=eval('document.all["'+tt_id+'"].style');
		if(tt_obj!=null && tt_obj!='undefined'){  // BUG
//			tt_obj.color=TREE.TEXT_NORMAL;
//			tt_obj.fontWeight='';

			tt_obj.background='';
                         tt_obj.color='';

		}

                //将当前打开状态的分支节点图标设为关闭状态
		var nd=TREE.selectedNode;
		var yy=eval('document.all["TI_'+nd.id+'"]');
		if(yy!=null){
			yy.src=nd.NODE_FOLDER_CLOSED;
		}

	}

	tt_id='TT_'+this.id;
	tt_obj=eval('document.all["'+tt_id+'"].style');
	if(tt_obj!=null){
//		tt_obj.color=TREE.TEXT_BRIGHT;
//		tt_obj.fontWeight='bold';

		tt_obj.background='#001177';
                tt_obj.color='#ffffff';

	}
	// 设置当前选中节点为当前节点
	TREE.selectedNode=this;

//	// 将所有打开状态的分支节点图标设为关闭状态
//	for(idx in TREE.nodeList) {
//		var nd=TREE.nodeList[idx];
//		var yy=eval('document.all["TI_'+nd.id+'"]');
//		if(yy!=null){
//			yy.src=nd.NODE_FOLDER_CLOSED;
//		}
//	}
	// 将当前展开节点图标设置为打开状态
	var yy=eval('document.all["TI_'+this.id+'"]');
	if(yy!=null) {
		yy.src=this.NODE_FOLDER_OPEN;
	}
}

