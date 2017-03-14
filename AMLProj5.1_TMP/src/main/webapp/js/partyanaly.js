function Customer() { //
	this.gp = new ShapeParam();
	this.inedges = new Array();
	this.outedges = new Array();
	
	this.party_id;
	this.name;
	this.trans_times;
	this.total_amount;
	
	this.acct_amount;
	this.teller_amount;
	this.opp_amount;
	
	this.gp.strokecolor = "purple";
	this.gp.strokeweight = 2;
}
Customer.prototype = new CRoundRect();

function Account() {
	this.gp = new ShapeParam();
	this.inedges = new Array();
	this.outedges = new Array();
	
	this.acct_num;
	this.name;
	this.organkey;
	this.organ_name;
	this.trans_times;
	this.total_amount;
	
	this.gp.strokecolor = "green";
	this.gp.strokeweight = 2;
}
Account.prototype = new CRoundRect();

function Teller() {
	this.gp = new ShapeParam();
	this.inedges = new Array();
	this.outedges = new Array();
	
	this.teller;
	this.name;
	this.organkey;
	this.organ_name;
	this.trans_times;
	this.total_amount;
	
	this.gp.strokecolor = "blue";
	this.gp.strokeweight = 2;
}
Teller.prototype = new CRoundRect();

function CDetailList() {				
	this.gp = new ShapeParam();
	this.rowCount = 0;
	//this.maxLen;
}

function getTextLen(str) {
	str = "" + str + "";
	return str.length;	
}

function createAnalysisObj(doc, p, cust, ps, amount, cls) {	
	var anaObj = findNode(cls);
	if(anaObj == null)
		anaObj = new Customer();
	else {
		anaObj.show(true);
		anaObj.showInEdges(true);
		return;
	}
	var off = 60;
	anaObj.setWidth(40);
	anaObj.setHeight(30);
	anaObj.setPS(ps);
	anaObj.setFontSize(12);
	anaObj.setFill(true);
	anaObj.setFillColor("green");
	anaObj.setFilled(true);
	anaObj.setOpacity(0.5);
	anaObj.setInset("0px,0px,0px,0px");
	
	
	anaObj.acct_amount = cust.acct_amount;
	anaObj.teller_amount = cust.teller_amount;
	anaObj.opp_amount = cust.opp_amount;						
	anaObj.trans_times = cust.trans_times;
	anaObj.total_amount = cust.total_amount;
			
	// 连线
	var edge = new CLine();
	var stpt, edpt;
	switch(cls) {
		case "accounts":
			anaObj.modifyText("<center>账户<br><center class='text_red'>" + cust.acct_amount);
			anaObj.setLeft(cust.getLeft() - anaObj.getWidth() - off);
			anaObj.setTop(cust.getTop() - anaObj.getHeight());
			anaObj.setId("accounts");
									
			edge.fromflag = 2;
			stpt = cust.getEdgeCenPt(2);
			
			edge.toflag = 4;
			edpt = anaObj.getEdgeCenPt(4);
			break;		
		case "tellers":
			anaObj.modifyText("<center>柜员<br><center class='text_red'>" + cust.teller_amount);
			anaObj.setLeft(cust.getLeft() + cust.getWidth()/2 - anaObj.getWidth()/2);
			anaObj.setTop(cust.getTop() + cust.getHeight() + off);
			anaObj.setId("tellers");
			
			edge.fromflag = 3;
			stpt = cust.getEdgeCenPt(3);

			edge.toflag = 1;
			edpt = anaObj.getEdgeCenPt(1);						
			break;
		case "opp_accounts":
			anaObj.modifyText("<center>对手<br><center class='text_red'>" + cust.opp_amount);
			anaObj.setLeft(cust.getLeft() + cust.getWidth() + off);
			anaObj.setTop(cust.getTop() - anaObj.getHeight());
			anaObj.setId("opp_accounts");
			
			edge.fromflag = 4;
			stpt = cust.getEdgeCenPt(4);
			
			edge.toflag = 2;
			edpt = anaObj.getEdgeCenPt(2);	
			break;
	}
	anaObj.draw(doc, p, true);
	addNode(anaObj);
	
	edge.setMoveTo(stpt.x, stpt.y);
	edge.setLineTo(edpt.x, edpt.y);
	edge.fromobj = cust;
	edge.toobj = anaObj;
	edge.setStrokeColor("#111");
	edge.setStrokedWeight(2);
	edge.draw(doc, p, false);
	addEdge(edge);
}

var fatherId, childPS, preId = "";
function refreshChildren(id, cls) {
	// global variable
	preId = "";
	childPS = "";
	fatherId = id;
	
	switch(cls) {
	case "accounts":
		childPS = "account";					
		NetWorkAnalysis.getAccountList(createChildren);	
		break;
	case "account":					
		childPS = "opp_account";
		preId = id + "-";
		NetWorkAnalysis.getOppAccountListByAccount(id, createChildren);
		break;				
	case "tellers":
		childPS = "teller";
		NetWorkAnalysis.getTellerList(createChildren);
		break;
	case "teller":
		childPS = "account";	
		preId = id + "-";
		NetWorkAnalysis.getAccountListByTeller(id, createChildren);
		break;
	case "opp_accounts":
		childPS = "opp_account";
		NetWorkAnalysis.getOppAccountList(createChildren);
		break;
	}
}

function setNodeContext(node, ps) {
	var maxLen = getTextLen(node.trans_times) + getTextLen(node.total_amount) + 3;
	var rowCount = 0;
	switch(ps) {
	case "customer":
		node.modifyText("<center><span class='text_red'>" + node.name + "</span>("
					   + node.trans_times + ")<br>"
					   +"<center>￥" + node.total_amount + "<br>"
					   +"<center><a href='javascript:void(0)' onClick='Expand(1)'> A </a>&nbsp;&nbsp;<a href='javascript:void(0)' onClick='Expand(2)'> T </a>&nbsp;&nbsp;<a href='javascript:void(0)' onClick='Expand(3)'> O </a>");
		rowCount = 3;
		maxLen = Math.max(getTextLen(node.name)+4, getTextLen(node.total_amount));
		break;
	/*case "accounts":
		node.modifyText("<span class='text_red'>账户数：</span> " + node.acct_amount + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");
		rowCount = 3;
		maxLen = Math.max(node.maxLen, getTextLen(node.acct_amount));					
		break;*/
		
	case "account":
		/*node.modifyText("<span class='text_red'>账户号：</span> " + node.acct_num + "<br>" 
				   +"<span class='text_red'>开户机构：</span> " + node.organ_name + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");*/
		node.modifyText("[A]<span class='text_red'>" + node.acct_num + "</span><br>" 
				   + node.organ_name + "<br>"				   
				   +"￥" + node.total_amount + " / " + node.trans_times);
		rowCount = 3;
		var temp = Math.max(getTextLen(node.acct_num)/2+3, getTextLen(node.organ_name)*1.7);
		maxLen = Math.max(maxLen, temp);
		break;
		
	/*case "tellers":
		node.modifyText("<span class='text_red'>柜员数：</span> " + node.teller_amount + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");
		rowCount = 3;
		maxLen = Math.max(maxLen, getTextLen(node.teller_amount));					
		break;*/
		
	case "teller":
		/*node.modifyText("<span class='text_red'>柜员号：</span> " + node.teller + "<br>" 
				   +"<span class='text_red'>柜员名：</span> " + node.name + "<br>"
				   +"<span class='text_red'>机构名：</span> " + node.organ_name + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");*/
		node.modifyText("[T]<span class='text_red'>" + node.teller + "</span><br>" 
				   + node.name + "<br>"
				   + node.organ_name + "<br>"
				   +"￥" + node.total_amount + " / " + + node.trans_times);
		rowCount = 4;
		var temp = Math.max(getTextLen(node.teller)/2+3, getTextLen(node.name)*1.7);
		temp = Math.max(temp, getTextLen(node.organ_name)*1.5);
		maxLen = Math.max(maxLen, temp);
		break;
		
	/*case "opp_accounts":
		node.modifyText("<span class='text_red'>对手数：</span> " + node.opp_amount + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");
		rowCount = 3;
		maxLen = Math.max(maxLen, getTextLen(node.opp_amount));
		break;*/
		
	case "opp_account":
		/*node.modifyText("<span class='text_red'>对手账号：</span> " + node.acct_num + "<br>" 
				   +"<span class='text_red'>对手名：</span> " + node.name + "<br>"
				   +"<span class='text_red'>开户机构：</span> " + node.organ_name + "<br>"
				   +"<span class='text_red'>交易数：</span> " + node.trans_times + "<br>"
				   +"<span class='text_red'>交易额：</span> ￥" + node.total_amount + "<br>");*/
		node.modifyText("[O]<span class='text_red'>" + node.acct_num + "</span><br>" 
				   + node.name + "<br>"
				   + node.organ_name + "<br>"
				   +"￥" + node.total_amount + " / " + node.trans_times);
		rowCount = 4;
		var temp = Math.max(getTextLen(node.acct_num)/2+3, getTextLen(node.name)*1.5);
		temp = Math.max(temp, getTextLen(node.organ_name));
		maxLen = Math.max(maxLen, temp);
		break;
		
	default:
		break;
	}
	// 位置设置
	//alert(this.getFontSize());
	node.setWidth((maxLen)*12);
	node.setHeight(17*rowCount);
}

function createChildren(children) {	
	// global variable: preId childPS fatherId
				
	var node = findNode(fatherId);
	if(node == null) {
		return;
	}
	
	var edge = node.getInEdge(0);
	var fromflag = edge.getFromFlag(), toflag = edge.getToFlag();
	// 2->4 左 3->1 下 4->2 右
					
	var child, childNode = null, flag, id;
	var total = children.length;
	var childExist = false;

	for(var i=0; i<children.length; i++) {
		child = children[i];
								
		//childNode = new Account();
		switch(childPS) {
		case "account": case "opp_account":
			id = preId + child.acct_num;
			childNode = findNode(id);
			if(childNode == null) {
				childNode = new Account();
				childNode.setId(id);
				childNode.acct_num = child.acct_num;
				childExist = false;
			} else {
				childExist = true;
			}
			flag = "<center>[<span class='text_red'>A</span>]";
			break;
		
		case "teller":
			id = preId + child.teller;
			childNode = findNode(id);
			if(childNode == null) {
				childNode = new Teller();
				childNode.setId(id);
				childNode.teller = child.teller;
				childExist = false;
			} else {
				childExist = true;
			}
			flag = "<center>[<span class='text_red'>T</span>]";
			break;
		
		default:
			return;
		}
		childNode.trans_times = child.trans_times;
		childNode.total_amount = child.total_amount;
		
		if(!childExist) {
			childNode.setPS(childPS);		
			childNode.name = child.name;
			childNode.organkey = child.organkey;
			childNode.organ_name = child.organ_name;
			//anaObj.setWidth(40);
			//anaObj.setHeight(20);
			childNode.setFontSize(12);
			childNode.setFill(true);
			childNode.setFillColor("yellow");
			childNode.setFilled(true);
			childNode.setOpacity(0.5);
			childNode.setInset("3px,3px,3px,3px");
		}
		//childNode.modifyText(flag + childNode.total_amount + "/" + childNode.trans_times);	

		setNodeContext(childNode, childPS);

		var interOff = 20, off = 40, inter;
		var bsL = node.getLeft(), bsT = node.getTop(), bsW = node.getWidth(), bsH = node.getHeight();
		var cellW = childNode.getWidth(), cellH = childNode.getHeight();	
		//cellW = getTextLen(childNode.getText())*2;
		//alert(cellW + " " + cellH);
		//childNode.setWidth(cellW);
		//childNode.setHeight(cellH);
		
		if(fromflag == 1 || fromflag == 3) {
			if(fromflag == 1) {							
				bsT = bsT - off;
			} else {							
				bsT = bsT + bsH + off;
			}
			
			bsL = bsL + bsW/2 - (total * cellW + (total-1) * interOff)/2;
			inter = cellW + interOff;
		} else if(fromflag == 2 || fromflag == 4) {
			
			if(fromflag==2) {
				bsL = bsL - off - cellW;
			} else {
				bsL = bsL + bsW + off;
			}
			
			bsT = bsT + bsH/2 - (total * cellH + (total-1) * interOff)/2;
			inter = cellH + interOff;
		} 
		
		//placeChild(fromflag, toflag, node, childNode, bsL, bsT, i, inter);	
		var cellL, cellT;
					
		if(fromflag == 1 || fromflag == 3) {
			cellL = bsL + i*inter;
			cellT = bsT;
		} else if(fromflag == 2 || fromflag == 4) {					
			cellL = bsL;
			cellT = bsT + i*inter;
		} 
	
		childNode.setLeft(cellL);
		childNode.setTop(cellT);
	//alert("5");					
		if(childExist) {
			childNode.show(true);
			childNode.showInEdges(true);			
		} else {
			childNode.draw(document, pane, true);
			addNode(childNode);
		
			var edge = new CLine();
			var stpt = node.getEdgeCenPt(fromflag), edpt = childNode.getEdgeCenPt(toflag);	
			edge.setMoveTo(stpt.x, stpt.y);				
			edge.setLineTo(edpt.x, edpt.y);
			edge.fromobj = node;
			edge.toobj = childNode;
			edge.fromflag = fromflag;
			edge.toflag = toflag;
			
			edge.setStrokeColor("#111");
			edge.setStrokedWeight(2);
			edge.draw(document, pane, false);
			addEdge(edge);	
		}
	
	}
}

function placeChild(f, t, father, child, bsL, bsT, pos, inter) {
	var cellL, cellT;
					
	if(f == 1 || f == 3) {
		cellL = bsL + pos*inter;
		cellT = bsT;
	} else if(f == 2 || f == 4) {					
		cellL = bsL;
		cellT = bsT + pos*inter;
	} 
	
	child.setLeft(cellL);
	child.setTop(cellT);
	
	child.draw(document, pane, true);
	addNode(child);
	
	var edge = new CLine();
	var stpt = father.getEdgeCenPt(f), edpt = child.getEdgeCenPt(t);	
	edge.setMoveTo(stpt.x, stpt.y);				
	edge.setLineTo(edpt.x, edpt.y);
	edge.fromobj = father;
	edge.toobj = child;
	edge.fromflag = f;
	edge.toflag = t;
	edge.draw(document, pane, false);
	addEdge(edge);
}