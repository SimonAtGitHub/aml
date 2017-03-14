// web绘图包 V2.0 2007-3-14

function CPoint() {
	this.x = 0;
	this.y = 0;
	
	this.locaflag = -1; // 该点如果在节点上作为选中标识，标记位置：1 上， 2 左， 3 下， 4 右
}
CPoint.prototype.toString = function() {
		return this.x + "," + this.y;
}

//================================================ 图形标识类
function CMarks() {
	this.display = "none";
	this.stroked = "f";
	
	this.arrMark = new Array(); // 标识在web中的元素对象数组
}

var _p = CMarks.prototype;


/*
功能：	
	获取鼠标拾取图形的标识中点
参数：
	x: 鼠标坐标x
	y: 鼠标坐标y
	ext：拾取范围，鼠标点击精确度
*/
_p.getSelMarkPoint = function(x, y, ext) {
	if( this.arrMark == null)
		return null;
	//alert("get pt");	
	var mark;
	var cen = new CPoint();
	var w2;
	
	for(var i=0; i<this.arrMark.length; i++) {
		mark = this.arrMark[i];
		w2 = mark.edgeWidth/2;
		cen.x = mark.getLeft() + w2;
		cen.y = mark.getTop() + w2;
		cen.locaflag = mark.flag;
		//alert("x " + x + " y " + y + "mark center " + cen.toString());
		if( mark.ptAroundIn(x, y, ext) ) {
			 
			//alert(" cx " + cen.x + " cy " + cen.y + " mark cen " + mark.center.toString());
			return cen;
		}		
	}
	return null;
}

/*
功能：	
	
参数：
  doc: document
	pane: 画板，在web中为一元素对象
	zIdx: 图形的z坐标，标识的z坐标为zIdx+1
	cen: 中点
	w: 边长
	stroked: 是否显示边线
	stroclr: 边线颜色
	filled：是否填充
	fillclr: 填充颜色
	f: 位置标记  1上（特殊：直线起点） 2左 3下（特殊：直线终点） 4右
*/
_p.addMark = function(doc, pane, zIdx, cen, w, stroked, stroclr, filled, fillclr, f) {
	//alert("addmark center x " + cen.x + " y " + cen.y + " w " + w);
	var mk = new CMark(zIdx, cen, w, stroked, stroclr, filled, fillclr, f);	
	//alert("to draw marks");
	mk.draw(doc, pane, false);
	//alert("mark l " + mk.getLeft() + " t " + mk.getTop());
	this.arrMark.push(mk);
}

/*
功能：	
	显示图形标识
参数：
	b: true 显示 false 隐藏
*/
_p.showMarks = function(b) {
	var obj;
		
	for(var i=0; i<this.arrMark.length; i++) {
		obj = this.arrMark[i];
		obj.show(b);
	}
}

/*
功能：	
	根据标识所依附的图形位置更新标识位置
参数：
	doc: document
	shape: 标识所依附的图形
*/
_p.update = function (doc, shape) {
	//alert("update");
	var mark;
	//alert("update to rect l " + shape.getWidth() + " t " + shape.getTop());
	var sw2 = shape.getStrokeWeight()/2;
	var cen = new CPoint();
	//alert("update");
	for(var i=0; i<this.arrMark.length; i++) {
		mark = this.arrMark[i];
		
		switch(mark.flag) {
			case 1:
				cen.x = shape.getLeft() + shape.getWidth()/2 + sw2;
				cen.y = shape.getTop() + sw2;
				
				break;
			case 2:
				cen.x = shape.getLeft() + sw2;
				cen.y = shape.getTop() + shape.getHeight()/2 + sw2;
				
				break;
			case 3:
				cen.x = shape.getLeft() + shape.getWidth()/2 + sw2;
				cen.y = shape.getTop() + shape.getHeight() + sw2;
				
				break;
			case 4:
				cen.x = shape.getLeft() + shape.getWidth() + sw2;
				cen.y = shape.getTop() + shape.getHeight()/2 + sw2;
				
				break;
		}
		//alert("before move");
		mark.move(cen);
		//alert("move mark " + (i+1));
	}
	
}



// 图形参数数据结构
function ShapeParam() {
	this.position = "absolute";
	this.zIndex = 0;
	this.left = 0;
	this.top = 0;
	this.width = 0;
	this.height = 0;
	this.display = "";
		
	this.stroked = true;
	this.strokecolor = "black";
	this.strokeweight = 1;
	this.dashstyle = "solid";
	this.filled = false;
	this.fillcolor = "white";
	
	this.ps = "";	
	this.id = null;
	
	this.text = "";
	this.fontsize = 12;
	this.inset = "2pt,2pt,2pt,2pt";
	this.textbox = null;
	
	this.onmousedown = "";
	this.onmousemove = "";
	this.onmouseup = "";
	this.opacity = 1;
	
	this.fillobj = null;
	this.fill = false;
	this.filltype="gradient";
	this.fillopacity=0.6;
	this.fillcolor2="white";
}

ShapeParam.prototype.toString = function() {
		return "auto left: " + this.left + " , top: " + this.top + " , width: " + this.width + " , height: " + this.height + " , to:" + this.to;
}

//================================================ 图形基类
function CShape() {
	this.gp = new ShapeParam();
	this.marks = null;
	this.webObj = null;	
}

_p = CShape.prototype;

_p.getId = function() {
	if(this.webObj == null)
		return this.gp.id;
	return this.webObj.id;
}

_p.setId = function(id) {
	this.gp.id = id;
}

_p.setZIndex = function(z) {
	this.gp.zIndex = 	z;
	if(this.webObj != null) {
		this.webObj.style.zIndex = z;
	}
}

_p.getZIndex = function() {
	if(this.webObj == null)
		return this.gp.zIndex;
	return parseInt(this.webObj.style.zIndex);
}

_p.getLeft = function() {
	if(this.webObj == null)
		return this.gp.left;
	return parseInt(this.webObj.style.left);
}

_p.setLeft = function(l) {
	this.gp.left = l;
	if(this.webObj != null) 
		this.webObj.style.left = l;
}

_p.getTop = function() {
	if(this.webObj == null)
		return this.gp.top;
	return parseInt(this.webObj.style.top);
}

_p.setTop = function(t) {
	this.gp.top = t;
	if(this.webObj != null) 
		this.webObj.style.top = t;
}

_p.getWidth = function() {
	if(this.webObj == null)
		return this.gp.width;
	else
		return parseInt(this.webObj.style.width);
}

_p.setWidth = function(w) {
	this.gp.width = w;
	if(this.webObj != null) 
		this.webObj.style.width = w;
}

_p.getHeight = function() {
	if(this.webObj == null)
		return this.gp.height;
	else 
		return parseInt(this.webObj.style.height);
}

_p.setHeight = function(h) {
	this.gp.height = h;
	if(this.webObj != null) 
		this.webObj.style.height = h;
}

_p.setStroked = function(stroked) {
	this.gp.stroked = stroked;
}

_p.setStrokedWeight = function(w) {
	this.gp.strokeweight = w;
}

_p.setStrokeColor = function(clr) {
	this.gp.strokecolor = clr;
	if(this.webObj != null) 
		this.webObj.style.strokedcolor = clr;
}

_p.setFilled = function(filled) {
	this.gp.filled = filled;
}

_p.setFillColor = function(c) {
	this.gp.fillcolor = c;
}

_p.setOpacity = function(o) {
	this.gp.opacity = o;
}

_p.setFill = function(fill) {
	this.gp.fill = fill;
}

_p.setPS = function(ps) {
	this.gp.ps = ps;
}

_p.getStrokeWeight = function() {
	if(this.webObj == null)
		return this.gp.strokeweight;
	else
		return this.webObj.strokeweight;
}

_p.getWebObj = function() {
	return this.webObj;
}

_p.getText = function() {
	if(this.webObj == null)
		return this.gp.text;
	else
		return this.webObj.text;
}

_p.modifyText = function(txt) {
	this.gp.text = txt;
	if(this.gp.textbox != null) {		
		this.gp.textbox.innerHTML = this.gp.text;
	}
}

_p.appendText = function(tail) {
	this.gp.text = this.gp.text + ":" +tail;
	if(this.gp.textbox != null) {		
		this.gp.textbox.innerHTML = this.gp.text;
	}
}

_p.setOnMouseDown = function(down) {
	this.gp.onmousedown = down;
	if(this.webObj != null) {		
		this.webObj.onmousedown = down;
	}
}

_p.setOnMouseMove = function(move) {
	this.gp.onmousemove = move;
	if(this.webObj != null) {		
		this.webObj.onmousemove = move;
	}
}

_p.setOnMouseUp = function(up) {
	this.gp.onmouseup = up;
	if(this.webObj != null) {		
		this.webObj.onmouseup = up;
	}
}

_p.setFontSize = function(size) {
	this.gp.fontsize = size;
	if(this.gp.textbox != null) {
		this.gp.textbox.fontSize = size;
	}
}

_p.getFontSize = function() {
	if(this.gp.textbox != null)
		return parseInt(this.gp.textbox.fontSize);
	else
		return this.gp.fontsize;
}

_p.setInset = function(ins) {
	this.gp.inset = ins;
	if(this.gp.textbox != null) {
		this.gp.textbox.inset = ins;
	}
}

_p.isShow = function() {
	if(this.webObj == null)
		return false;
	else if(this.webObj.style.display == "")
		return true;
	return false;
}
/*
功能：	
	获取鼠标拾取图形的标识中点
参数：
	x: 鼠标坐标x
	y: 鼠标坐标y
	ext：拾取范围，鼠标点击精确度
*/
_p.getSelMarkPoint = function(x, y, ext) {
	if( this.marks == null)
		return null;
		
	return this.marks.getSelMarkPoint(x, y, ext);
}

/*
功能：	
	根据参数画出图形
	注：由子类重写
参数：
	doc: document
	pane: 画板，在web中为一元素对象
	withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
}

_p.reDraw = function() {
}

/*
功能：	
	设置图形显示状态
参数：
	b: 是否显示图形
*/
_p.show = function(b) {
	
	if(this.webObj == null) 
		return;
	if(b) {		
		this.gp.display = "";	
	} else {
		this.gp.display = "none";		
	}
	this.webObj.style.display = this.gp.display; 
	this.showMarks(null, false);
}

/*
功能：	
	删除图形
参数：
*/
_p.del = function(bCascade, bDel) {
/*	if(this.webObj == null) 
		return;
	if(!bCascade)
		this.webObj.outerHTML = "";
	else {
	}*/
}

/*
功能：	
	在图形上添加文本	
参数：
	txt: 要添加的文本
*/
_p.addText = function(txt) {		
	this.gp.text = txt;
	
	this.gp.textbox = document.createElement("<v:textbox style='font-size:"+ this.gp.fontsize+"px;v-text-anchor:top-right-baseline;color:" + this.gp.strokecolor + "'></v:textbox>");										
	this.gp.textbox.inset = this.gp.inset;
	this.gp.textbox.innerHTML = txt;
	this.webObj.appendChild(this.gp.textbox);
}

_p.addFill = function(doc, fill, type, opacity, color2) {
	if(opacity != 1) {
		this.gp.fillobj = doc.createElement("<v:fill opacity=" + opacity + " />");
		this.webObj.appendChild( this.gp.fillobj );
	}
	
	if(fill) {
		if(this.gp.fillobj == null) {
			this.gp.fillobj = doc.createElement("<v:fill type="+ type +" opacity=" + opacity + " color2="+ color2+" />");
			this.webObj.appendChild(this.gp.fillobj);
		} else {
			this.gp.fillobj.type = type;
			this.gp.fillobj.color2 = color2;
		}
	}
}

/*
功能：	
	设置边线
参数：
	b：是否显示图形边线
	clr: 边线颜色
*/
_p.setStrokeClr = function(b, clr) {	
	this.stroked = b;
	this.strokecolor = clr;
		
	if(this.webObj != null) {
		this.webObj.stroked = b;
		this.webObj.strokecolor = clr;
	}
}

/*
功能：	
	设置填充
参数：
	b：是否填充
	clr: 填充颜色
*/
_p.setFillClr = function(b, clr) {
	this.filled = b;
	this.fillcolor = clr;
		
	if(this.webObj != null) {
		this.webObj.filled = b;
		this.webObj.fillcolor = clr;
	}
}

/*
功能：	
	图形闪烁
参数：
	clr：交替颜色
*/
_p.flash = function(clr) {
}
	
/*
功能：	
	创建图形标识
	注：直线子类重写	
参数：
	doc: document
	pane: 画板，在web中为一元素对象	
	stroked: 是否显示边线
	strokeclr: 边颜色
	filled: 是否填充
	fillclr: 填充色	
*/
_p.createMarks = function(doc, pane, stroked, strokeclr, filled, fillclr) {
	if(this.marks != null) 
		return;
	
	this.marks = new CMarks();
	var cen = new CPoint();
	var w = 3*this.getStrokeWeight();
	var sw2 = this.getStrokeWeight()/2;
	// 上
	cen.x = this.getLeft() + this.getWidth()/2 + sw2;
	cen.y = this.getTop() + sw2;	
	this.marks.addMark(doc, pane, this.getZIndex(), cen, w, stroked, strokeclr, filled, fillclr, 1);
	// 左
	cen.x = this.getLeft() + sw2;
	cen.y = this.getTop() + this.getHeight()/2 + sw2;
	this.marks.addMark(doc, pane, this.getZIndex(), cen, w, stroked, strokeclr, filled, fillclr, 2);
	// 下
	cen.x = this.getLeft() + this.getWidth()/2 + sw2;
	cen.y = this.getTop() + this.getHeight() + sw2;
	this.marks.addMark(doc, pane, this.getZIndex(), cen, w, stroked, strokeclr, filled, fillclr, 3);
	// 左
	cen.x = this.getLeft() + this.getWidth() + sw2;
	cen.y = this.getTop() + this.getHeight()/2 + sw2;
	this.marks.addMark(doc, pane, this.getZIndex(), cen, w, stroked, strokeclr, filled, fillclr, 4);
		
}

/*
功能：	
	修改图形标识显示状态
参数：
	b: true 显示  false 隐藏
*/

_p.showMarks = function(doc, b) {	
	if(this.marks != null) {
		if(b) {			
			this.marks.update(doc, this);						
		}
		this.marks.showMarks(b); 
		return true;
	} else {		
		return false;	
	}
}

/*
功能：	
	在页面上移动图形
参数：
	doc: document
	offx: 移动水平位置
	offy: 移动垂直位置	
*/
_p.translate = function(doc, offx, offy) {	
	/*var id = this.gp.id;
	if(id == null) 
		return;*/

	var obj = this.webObj;//doc.getElementById(id);	
	if(obj != null && obj.style.display != "none") {
		this.move(parseInt(obj.style.left) + offx, parseInt(obj.style.top) + offy);
		/*obj.style.left = parseInt(obj.style.left) + offx;
		obj.style.top = parseInt(obj.style.top) + offy;
		
		this.gp.left = obj.style.left;
		this.gp.top = obj.style.top;*/
	}
}

/*
功能：	
	在页面上移动图形
参数：
	doc: document
	x: 移动至x坐标
	y: 移动至y坐标
*/
_p.move = function(x, y) {	
	/*var id = this.gp.id;
	if(id == null) 
		return;*/
	
	var obj = this.webObj;//doc.getElementById(id);
	this.gp.left = x;
	this.gp.top = y;
	if(obj != null && obj.style.display != "none") {
		obj.style.left = x;
		obj.style.top = y;
		
		
	}
}
/*
功能：	
	图形放大缩小
参数：
	doc: document
	bili: 放大缩小比例
	cx: 图形画板中点x坐标
	cy: 图形画板中点y坐标
	trsY: 放大缩小后垂直移动的距离
*/
_p.scale = function(doc, bili, cx, cy, trsY) {
	//alert("scale node");
	var obj = this.webObj;
	//alert(obj);
	//alert("scale l:"+getNodePos(node, "left")+",b:"+getNodePos(node, "bottom")+",r:"+getNodePos(node, "right")+",t:"+getNodePos(node, "top"));
	var relaX = this.gp.left - cx, relaY = this.gp.top - cy;
	//alert("here");
	var offx = relaX*bili, offy = relaY*bili;
	obj.style.left = cx + offx;
	obj.style.top = cy + offy + trsY;
	//alert(" org rela: "+relaX + ", " + relaY +"\n center: " +cx+","+cy+"\n now rela: " + offx+","+offy + "\n now: " + obj.style.left + ", " + obj.style.top);
	obj.style.width = this.gp.width*bili;
	obj.style.height = this.gp.height*bili;
	obj.style.fontSize = 12*bili;
	//alert("scale node ned");
}

/*
功能：	
	在页面上缩放图形
	注：如有不同，子类可重写缩放方式（如：直线）
参数：
	doc: document
	w: 修改web元素对象的宽度
	h: 移动web元素对象的高度
*/
_p.extendTo = function(doc, w, h) {	
	var id = this.gp.id;
	if(id == null) 
		return;
		
	var obj = doc.getElementById(id);
	if(obj != null && obj.style.display != "none") {
		obj.style.width = w;
		obj.style.height = h;
	}
}

/*
功能：	
	设置图形边线类型
参数：
	doc: document
	t: 线型
*/
_p.setDashStyle = function(doc, t) {	
	this.gp.dashstyle = t;
	if(this.webObj != null)
		this.webObj.dashStyle = t;
	//this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + t + " />") );
}

/*
功能：	
	设置图形透明度
参数：
	o: 透明度值
*/
_p.setOpacity = function(o) {		
	this.gp.opacity = o;
	if(this.webObj != null)
		this.webObj.opacity = o;
	//this.webObj.appendChild( doc.createElement("<v:fill opacity=" + o + " />") );
}

/*
功能：	
	判断本图形矩形轮廓是否在某矩形中
参数：
	rect：某矩形框
*/
_p.isInRectObj = function(rect) {
	if(this.getLeft() >= rect.getLeft() && this.getTop() >= rect.getTop()
	   && this.getLeft()+this.getWidth() <= rect.getLeft()+rect.getWidth()
	   && this.getTop()+this.getHeight() <= rect.getTop()+rect.getHeight() ) 
	   return true;
	else
		return false;
}

/*
功能：	
	获取本图形矩形轮廓某边中点
参数：
	flag: 边标识 1上 2左 3下 4右 
*/
_p.getEdgeCenPt = function(flag) {
	var t = this.getTop(), l = this.getLeft(), w = this.getWidth(), h = this.getHeight();
	//alert("t " + t + " l " + l + " flag " + flag);
	var pt = new CPoint();
	pt.locaflag = flag;
	
	switch(flag) {
		case 1: // top
			pt.x = l + w/2;
			pt.y = t;
		break; 
		case 2: // left
			pt.x = l;
			pt.y = t + h/2;
		break; 
		case 3: // bottom
			pt.x = l + w/2;
			pt.y = t + h;
		break;
		case 4: // right
			pt.x = l + w;
			pt.y = t + h/2;
		break;
	}
	//alert("pt " + pt.toString());
	return pt;
}

// ================================================ 非直线平面图形类：节点
function CNode() {
	this.gp = new ShapeParam();
	
	this.inedges = new Array();
	this.outedges = new Array();
	
	this.deleted = false;
}

CNode.prototype = new CShape();

_p = CNode.prototype;

_p.addOutEdge = function(edge) {
	this.outedges.push(edge);
}

_p.addInEdge = function(edge) {
	this.inedges.push(edge);
}

_p.getInEdge = function(i) {
	return this.inedges[i];
}

_p.getOutEdge = function(i) {
	return this.outedges[i];
}

/*
功能：	
	删除图形
参数：
	bCanRedo: 是否可撤销
	bDel: true 删除 false 反删除
*/
_p.del = function(bCanRedo, bDel) {
	if(this.webObj == null) 
		return;
	if(!bCanRedo)
		this.webObj.outerHTML = "";
	else {
			for(var i=0; i<this.inedges.length; i++) {
					this.inedges[i].show(!bDel);
			}

			this.show(!bDel);
		
			for(var i=0; i<this.outedges.length; i++) {
				this.outedges[i].del(bCanRedo, bDel);
			}		

	}
}

_p.delSubTree = function(bCanRedo, bDel) {
	if(this.webObj == null) 
		return;
	if(!bCanRedo)
		this.webObj.outerHTML = "";
			
	for(var i=0; i<this.outedges.length; i++) {
		this.outedges[i].del(bCanRedo, bDel);
	}	
	
}

_p.showInEdges = function(b) {
	if(this.webObj == null) 
		return;
			
	for(var i=0; i<this.inedges.length; i++) {
		this.inedges[i].show(b);
	}	
}

_p.show = function(b) {
	if(this.webObj == null) 
		return;
	if(b) {		
		this.gp.display = "";	
	} else {
		this.gp.display = "none";		
	}
	this.webObj.style.display = this.gp.display;
	this.showMarks(null, false);
	this.deleted = !b;
}

/*
功能：	
	在页面上移动图形
参数：
	doc: document
	offx: 移动水平位置
	offy: 移动垂直位置	
*/
/*_p.translate = function(doc, offx, offy) {	


	var obj = this.webObj;//doc.getElementById(id);	
	if(obj != null && obj.style.display != "none") {
		//alert("translate " + offx + " " + offy);
		this.move(parseInt(obj.style.left) + offx, parseInt(obj.style.top) + offy);
		
	}
}*/

/*
功能：	
	在页面上移动图形
参数：
	doc: document
	x: 移动至x坐标
	y: 移动至y坐标
*/
_p.move = function(x, y) {	
	/*var id = this.gp.id;
	if(id == null) 
		return;*/
	
	var obj = this.webObj;//doc.getElementById(id);
	this.gp.left = x;
	this.gp.top = y;
	if(obj != null && obj.style.display != "none") {
		obj.style.left = x;
		obj.style.top = y;
		
		this.reDrawEdges();
	}
}

/*
功能：	
	图形放大缩小
参数：
	doc: document
	bili: 放大缩小比例
	cx: 图形画板中点x坐标
	cy: 图形画板中点y坐标
	trsY: 放大缩小后垂直移动的距离
*/
_p.scale = function(doc, bili, cx, cy, trsY) {
	//alert("scale node");
	var obj = this.getWebObj();
	//alert(obj);
	//alert("scale l:"+getNodePos(node, "left")+",b:"+getNodePos(node, "bottom")+",r:"+getNodePos(node, "right")+",t:"+getNodePos(node, "top"));
	var relaX = this.gp.left - cx, relaY = this.gp.top - cy;
	//alert("here");
	var offx = relaX*bili, offy = relaY*bili;
	//alert(obj + ": " + cx + " " + offx);
	obj.style.left = cx + offx;
	obj.style.top = cy + offy + trsY;
	//alert("1");
	//alert(" org rela: "+relaX + ", " + relaY +"\n center: " +cx+","+cy+"\n now rela: " + offx+","+offy + "\n now: " + obj.style.left + ", " + obj.style.top);
	obj.style.width = this.gp.width*bili;
	obj.style.height = this.gp.height*bili;
	obj.style.fontSize = 12*bili;
	//alert("scale node ned");
	
	this.reDrawEdges();
}

_p.reDrawEdges = function() {
	for(j=0; j<this.inedges.length; j++) {
			this.inedges[j].reDraw();				
		}
		// 修改出边
		for(j=0; j<this.outedges.length; j++) {
			this.outedges[j].reDraw();		
		}
}
/*
功能：	
	判断本节点的入边是否全都删除
参数：
*/
_p.isAllInEdgesDeleted = function() {
	var edge = null;
	//alert("inedges c " + list.length);
	for(var i=0; i<this.inedges.length; i++) {		
		//edge = findEdge(this.inedgs[i]);
		if(this.inedges[i] != null) {
			//alert(list[i].id + ", " + list[i].deleted);
			if(!this.inedges[i].deleted) {
				//alert(list[i] + " not del");
				return false;
			}
			
		}
	}
	return true;
}

_p.isAllEdgesShow = function() {
	var edge = null;
	for(var i=0; i<this.inedges.length; i++) {		
		//edge = findEdge(this.inedgs[i]);
		if(this.inedges[i] != null) {
			//alert(list[i].id + ", " + list[i].deleted);
			if(this.inedges[i].deleted) {
				return false;
			}
			
		}
	}
	return true;
}
// ================================================ 连接节点的边线类
function CEdge() {
	this.fromobj = null;
	this.toobj = null;
	this.fromflag = 3;		// 起始端点从节点出来的位置
	this.toflag = 1;
	
	this.isdirect = true;
	
	this.deleted = false;
}

CEdge.prototype = new CShape();

_p = CEdge.prototype;

/*
功能：	
	删除图形
参数：
	bCanRedo: 是否可撤销
	bDel: true 删除 false 反删除
*/
_p.del = function(bCanRedo, bDel) {
	if(this.webObj == null) 
		return;
	if(!bCanRedo)
		this.webObj.outerHTML = "";
	else {
		//this.deleted = bDel;
		//var edgeObj = document.getElementById(edge.id);
		//edgeObj.style.display = n;
		this.show(!bDel);
		var nextNode = this.toobj;
		
		if(bDel && nextNode.isAllInEdgesDeleted()) {
			
			nextNode.del(bCanRedo, bDel);
		}
		if(!bDel && nextNode.isAllEdgesShow()) {
			nextNode.del(bCanRedo, bDel);
			
		}
	}
}

_p.show = function(b) {
	if(this.webObj == null) 
		return;
	if(b) {		
		this.gp.display = "";	
	} else {
		this.gp.display = "none";		
	}
	this.webObj.style.display = this.gp.display; 
	this.deleted = !b;
	this.showMarks(null, false);
}

_p.setFromFlag = function(f) {
	this.fromflag = f;
}

_p.setToFlag = function(t) {
	this.toflag = t;
}

_p.getFromFlag = function() {
	return this.fromflag;
}

_p.getToFlag = function() {
	return this.toflag;
}
// ================================================ 直线类
function CLine() {
	this.gp = new ShapeParam();
	//CShape.call(this);
	//this.base = CShape;
	//this.base();
	
	this.ptTo = new CPoint();
	
	this.bWithStartArrow = false;
	this.bWithEndArrow = false;
	this.startArrow = "classic";
	this.endArrow = "classic";	
}
CLine.prototype = new CEdge();
_p = CLine.prototype;
//CLine.prototype.constructor = new CShape();

/*
功能：		
	设置直线起始箭头
参数：
	b: 是否有起始箭头
	t: 起始箭头类型
*/
_p.setStartArrow = function(b, t) {
	this.bWithStartArrow = b;
	if(b) {		
		this.startArrow = t;
	}
}

/*
功能：		
	设置直线终止箭头
参数：
	b: 是否有终止箭头
	t: 终止箭头类型
*/
_p.setEndArrow = function(b, t) {
	this.bWithEndArrow = b;
	if(b) {		
		this.endArrow = t;
	}
}

_p.setMoveTo = function(x, y) {
	this.gp.left = x;
	this.gp.top = y;
}

_p.setLineTo = function(x, y) {
	this.ptTo.x = x;
	this.ptTo.y = y;
}

/*
功能：		
	画直线
参数：
  doc: document
  pane: 画板，在web中为一元素对象
  withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
	this.webObj = doc.createElement("<v:line />");

	if(this.gp.ps != "") 
		this.webObj.ps = this.gp.ps;
	this.webObj.style.zIndex = this.gp.zIndex;
	this.webObj.style.position = this.gp.position;
	this.moveTo(this.gp.left, this.gp.top);	
	this.lineTo(this.ptTo);
	this.webObj.style.display = this.gp.display;
	
	this.webObj.strokecolor = this.gp.strokecolor;
	this.webObj.strokeweight = this.gp.strokeweight;
	this.setDashStyle(doc, this.gp.dashstyle);
	
	this.webObj.id = this.gp.id;
	
	if(this.bWithStartArrow)
		this.webObj.appendChild(doc.createElement("<v:stroke startarrow="+this.startArrow+"/>"));
	if(this.bWithEndArrow)
		this.webObj.appendChild(doc.createElement("<v:stroke endarrow="+this.endArrow+"/>"));
		
	if(withText)
		this.addText(this.gp.text);
	
	this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + this.gp.dashstyle + " />") );
	//this.webObj.appendChild( doc.createElement("<v:fill opacity=" + this.gp.opacity + " />") );
	
	pane.appendChild(this.webObj);
	//alert("here " + this.gp.toString());
	
	return this.webObj;
}

_p.reDraw = function() {	
	var stpt = new CPoint(), edpt = new CPoint();
	//alert("fromf " + edge.fromflag + " tof " + edge.toflag);
	stpt = this.fromobj.getEdgeCenPt(this.fromflag);		
	edpt = this.toobj.getEdgeCenPt(this.toflag);
	//alert("org fx " + edge.getLeft() + " fy " + edge.getTop() + " to " + edge.gp.to + " modify fx " + stpt.x + " fy " + stpt.y + " tox " + edpt.x + " toy " + edpt.y);
	this.moveTo(stpt.x, stpt.y);
	this.lineTo(edpt);		
}

_p.moveTo = function(x, y) {
	if(this.webObj != null) {
		this.gp.left = x;
		this.gp.top = y;
		this.webObj.style.left = x;
		this.webObj.style.top = y;
	}
}

_p.lineTo = function(pt) {
	if(this.webObj != null) {
		this.setLineTo(pt.x, pt.y);
		this.gp.to = (pt.x-this.gp.left) + "," + (pt.y-this.gp.top);
		this.webObj.to = this.gp.to;
	}
}

/*
功能：	
	创建直线标识，起止端点		
参数：
	doc: document
	pane: 画板，在web中为一元素对象	
	stroked: 是否显示边线
	strokeclr: 边颜色
	filled: 是否填充
	fillclr: 填充色		
*/
_p.createMarks = function(doc, pane, stroked, strokeclr, filled, fillclr) {
	if(this.marks != null) 
		return;
	this.marks = new CMarks();
	var cen = new CPoint();
	var edge = 3*this.getStrokeWeight();
	//var weight2 = this.gp.strokeweight/2;
	// from
	cen.x = this.getLeft();
	cen.y = this.getTop();	
	this.marks.addMark(doc, pane, this.getZIndex(), cen, edge, stroked, strokeclr, filled, fillclr, 1);
	
	// to
	cen.x = this.getLeft() + this.getWidth()/2;
	cen.y = this.getTop() + this.getHeight();
	this.marks.addMark(doc, pane, this.getZIndex(), cen, edge, stroked, strokeclr, filled, fillclr, 3);
	
}

// ================================================ 矩形类
function CRectangle() {
	this.gp = new ShapeParam();
	//CShape.call(this);
	//this.base = CShape;
	//this.base();
	this.inedges = new Array();
	this.outedges = new Array();
}
CRectangle.prototype = new CNode();
_p = CRectangle.prototype;
//CRectangle.prototype.constructor = new CShape();
/*
功能：		
	画矩形
参数：
  doc: document
  pane: 画板，在web中为一元素对象
  withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
		
	this.webObj = doc.createElement("<v:rect />");
	
	
	
	if(this.gp.ps != "") 
		this.webObj.ps = this.gp.ps;
	
	
	this.webObj.style.zIndex = this.gp.zIndex;
	this.webObj.style.position = this.gp.position;
	this.webObj.style.left = this.gp.left;	
	this.webObj.style.top = this.gp.top;
	
	this.webObj.style.width = this.gp.width;
	this.webObj.style.height = this.gp.height;
	this.webObj.style.display = this.gp.display;
	
	this.webObj.stroked = this.gp.stroked;
	this.webObj.strokecolor = this.gp.strokecolor;
	this.webObj.strokeweight = this.gp.strokeweight;
	this.setDashStyle(doc, this.gp.dashstyle);
	
	
	this.webObj.filled = this.gp.filled;
	this.webObj.fillcolor = this.gp.fillcolor;
	
	this.webObj.id = this.gp.id;
	
	if(withText)
		this.addText(this.gp.text);
		
	this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + this.gp.dashstyle + " />") );
	
	
	if(this.gp.onmousedown != "")
		this.webObj.onmousedown = this.gp.onmousedown;
	if(this.gp.onmousemove != "")
		this.webObj.onmousemove = this.gp.onmousemove;
	if(this.gp.onmouseup != "")
		this.webObj.onmouseup = this.gp.onmouseup;
	
	this.addFill(doc, this.gp.fill, this.gp.filltype, this.gp.opacity, this.gp.fillcolor2);
			
	pane.appendChild(this.webObj);

	return this.webObj;
}

// ================================================ 圆矩形类
function CRoundRect() {
	this.gp = new ShapeParam();
	this.arcsize = 0.15;
	this.inedges = new Array();
	this.outedges = new Array();
}

CRoundRect.prototype = new CNode();
_p = CRoundRect.prototype;

_p.setArcsize = function(size) {
	this.arcsize = size;
}

/*
功能：		
	画圆矩形
参数：
  doc: document
  pane: 画板，在web中为一元素对象
  withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
		
	this.webObj = doc.createElement("<v:roundrect />");
	
	if(this.gp.ps != "") 
		this.webObj.ps = this.gp.ps;
	
	
	this.webObj.style.zIndex = this.gp.zIndex;
	this.webObj.style.position = this.gp.position;
	this.webObj.style.left = this.gp.left;	
	this.webObj.style.top = this.gp.top;
	
	this.webObj.style.width = this.gp.width;
	this.webObj.style.height = this.gp.height;
	this.webObj.style.display = this.gp.display;
	
	this.webObj.stroked = this.gp.stroked;
	this.webObj.strokecolor = this.gp.strokecolor;
	this.webObj.strokeweight = this.gp.strokeweight;
	this.setDashStyle(doc, this.gp.dashstyle);
	
	this.webObj.arcsize = this.arcsize;
	
	this.webObj.filled = this.gp.filled;
	this.webObj.fillcolor = this.gp.fillcolor;
	
	this.webObj.id = this.gp.id;
	
	if(withText)
		this.addText(this.gp.text);
		
	this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + this.gp.dashstyle + " />") );
	
	
	if(this.gp.onmousedown != "")
		this.webObj.onmousedown = this.gp.onmousedown;
	if(this.gp.onmousemove != "")
		this.webObj.onmousemove = this.gp.onmousemove;
	if(this.gp.onmouseup != "")
		this.webObj.onmouseup = this.gp.onmouseup;
	/*if(this.gp.opacity != 1) {
		this.gp.fillobj = doc.createElement("<v:fill opacity=" + this.gp.opacity + " />");
		this.webObj.appendChild( this.gp.fillobj );
	}
	
	if(this.gp.fill) {
		if(this.gp.fillobj == null) {
			this.gp.fillobj = doc.createElement("<v:fill type="+ this.gp.filltype +" opacity=" + this.gp.opacity + " color2="+ this.gp.fillcolor2+" />");
		} else {
			this.gp.fillobj.type = this.gp.filltype;
			this.gp.fillobj.color2 = this.gp.fillcolor2;
		}
	}*/
	this.addFill(doc, this.gp.fill, this.gp.filltype, this.gp.opacity, this.gp.fillcolor2);
		
	pane.appendChild(this.webObj);

	return this.webObj;
}

// ================================================ 方形类
function CSquare() {
	this.gp = new ShapeParam();
	//CRectangle.call(this);	
	//this.base = CRectangle;
	//this.base();
	this.inedges = new Array();
	this.outedges = new Array();
	
	//this.center = new CPoint();
	this.edgeWidth = 0;
	
	//this.w  = 0;
}

CSquare.prototype = new CRectangle();
_p = CSquare.prototype;

_p.move = function(cen) {

	var obj = this.webObj;
	var w2 = this.edgeWidth/2;

	//this.center = cen;
	this.gp.left = cen.x - w2;
	this.gp.top = cen.y - w2;
	
	if(obj != null && obj.style.display != "none") {
		
		obj.style.left = this.gp.left;
		obj.style.top = this.gp.top;
	}

	
}

/*
功能：	
	单个标识的构造函数
参数：
  zIdx: 标识所依附图形的z坐标
	cen: 标识中点
	w: 标识边长（正方形）
	stroked: 是否显示边线
	stroclr: 边颜色
	filled: 是否填充
	fillclr: 填充色
	f: 标识在图形中的位置标志 1上（特殊：直线起点） 2左 3下（特殊：直线终点） 4右
*/
function CMark(zIdx, cen, w, stroked, stroclr, filled, fillclr, f) {
	this.gp = new ShapeParam();
	
	this.flag = f;

	this.edgeWidth = w;
	//alert("edgeWidth in cmark constructor " + w);
	this.gp.zIndex = zIdx + 1;
	this.gp.left = cen.x - w/2;
	this.gp.top = cen.y - w/2;
	this.gp.width = w;
	this.gp.height = w;
	//alert("mark l = " + this.gp.left + " t " + this.gp.top + " w " + this.gp.width);
	this.gp.stroked = stroked;
	this.gp.strokecolor = stroclr;
	this.gp.filled = filled;
	this.gp.fillcolor = fillclr;
	//alert("constructor end");
}

CMark.prototype = new CSquare();
_p = CMark.prototype;

/*
功能：	
	判断某点是否在标识一定范围类
参数：
	x: 点坐标x
	y: 点坐标y
	ext：范围
*/
_p.ptAroundIn = function(x, y, ext) {
	var w2 = this.edgeWidth/2;
	
	var cx = this.getLeft() + w2;
	var cy = this.getTop() + w2;
	//alert("cx " + this.center.x + " cy " + this.center.y + " px " + x + " py " + y);
	if( (Math.abs(cx - x) <= (w2+ext)) && (Math.abs(cy - y) <= (w2+ext)) ) {	
		return true;
	}
	else 
		return false;
}

// ================================================ 菱形类
function CDiamond() {
	this.gp = new ShapeParam();
	//CShape.call(this);
	//this.base = CShape;
	//this.base();
	this.inedges = new Array();
	this.outedges = new Array();
	this.coordSize = "100,28";
	this.path = "m ,14 l 50,0 100,14 50,28 0,14 e";
}
CDiamond.prototype = new CNode();
_p = CDiamond.prototype;
//CDiamond.prototype.constructor = new CShape();
/*_p.setCoordSize = function(coord) {
	
}*/
/*
_p.setPath = function(path) {
}
*/
/*
功能：		
	画菱形
参数：
  doc: document
  pane: 画板，在web中为一元素对象
  withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
	this.webObj = doc.createElement("<v:shape />");
	
	if(this.gp.ps != "") 
		this.webObj.ps = this.gp.ps;
	this.webObj.style.zIndex = this.gp.zIndex;
	this.webObj.style.position = this.gp.position;
	this.webObj.style.left = this.gp.left;
	this.webObj.style.top = this.gp.top;
	this.webObj.style.width = 100;//this.gp.width;
	this.webObj.style.height = 28;//this.gp.height;	
	this.webObj.style.display = this.gp.display;
	
	this.webObj.coordsize = this.coordSize;
	this.webObj.path = this.path;
	
	this.webObj.stroked = this.gp.stroked;
	this.webObj.strokecolor = this.gp.strokecolor;
	this.webObj.strokeweight = this.gp.strokeweight;
	this.setDashStyle(doc, this.gp.dashstyle);
	
	this.webObj.filled = this.gp.filled;
	this.webObj.fillcolor = this.gp.fillcolor;
	
	this.webObj.id = this.gp.id;
	
	if(withText)
		this.addText(this.gp.text);
	
	this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + this.gp.dashstyle + " />") );
	
	if(this.gp.onmousedown != "")
		this.webObj.onmousedown = this.gp.onmousedown;
	if(this.gp.onmousemove != "")
		this.webObj.onmousemove = this.gp.onmousemove;
	if(this.gp.onmouseup != "")
		this.webObj.onmouseup = this.gp.onmouseup;
	
	this.addFill(doc,this.gp.fill, this.gp.filltype, this.gp.opacity, this.gp.fillcolor2);
	
	pane.appendChild(this.webObj);
	return this.webObj;
}

// ================================================ 椭圆形类
function CEllipse() {
	this.gp = new ShapeParam();
	//CShape.call(this);
	//this.base = CShape;
	//this.base();
	this.inedges = new Array();
	this.outedges = new Array();
}
CEllipse.prototype = new CNode();
_p = CEllipse.prototype;
//CEllipse.prototype.constructor = new CShape();
/*
功能：		
	画椭圆形
参数：
  doc: document
  pane: 画板，在web中为一元素对象
  withText: 是否显示文本
*/
_p.draw = function(doc, pane, withText) {
	this.webObj = doc.createElement("<v:oval />");
	
	if(this.gp.ps != "") 
		this.webObj.ps = this.gp.ps;
		
	this.webObj.style.zIndex = this.gp.zIndex;
	this.webObj.style.position = this.gp.position;
	
	this.webObj.style.left = this.gp.left;
	this.webObj.style.top = this.gp.top;
	this.webObj.style.width = this.gp.width;
	this.webObj.style.height = this.gp.height;
	this.webObj.style.display = this.gp.display;
	
	this.webObj.stroked = this.gp.stroked;
	this.webObj.strokecolor = this.gp.strokecolor;
	this.webObj.strokeweight = this.gp.strokeweight;
	this.setDashStyle(doc, this.gp.dashstyle);
	
	if(this.gp.filled) {
		this.webObj.filled = true;
		this.webObj.fillcolor = this.gp.fillcolor;
	} else {
		this.webObj.filled = false;
	}
	this.webObj.id = this.gp.id;
	
	if(withText)
		this.addText(this.gp.text);
	
	this.webObj.appendChild( doc.createElement("<v:stroke dashstyle=" + this.gp.dashstyle + " />") );
	
	if(this.gp.onmousedown != "")
		this.webObj.onmousedown = this.gp.onmousedown;
	if(this.gp.onmousemove != "")
		this.webObj.onmousemove = this.gp.onmousemove;
	if(this.gp.onmouseup != "")
		this.webObj.onmouseup = this.gp.onmouseup;
	
	this.addFill(doc, this.gp.fill, this.gp.filltype, this.gp.opacity, this.gp.fillcolor2);
	
	pane.appendChild(this.webObj);
	return this.webObj;
}