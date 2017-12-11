
 var	page_size=15;//每页显示数量
 var	total_num=null;//总记录数 
 var	total_page=null;//总页数
 var	page_num=1;//页号,默认显示第一页数据 
function accDiv(arg1,arg2){ 
	  var t1=0,t2=0,r1,r2; 
	   try{
	   		t1=arg1.toString().split(".")[1].length
	   }catch(e){}
	   try{
	   		t2=arg2.toString().split(".")[1].length
	   	}catch(e){
	   	} 
	    with(Math){ 
	     	r1=Number(arg1.toString().replace(".","")); 
	     	r2=Number(arg2.toString().replace(".","")); 
	      	return (r1/r2)*pow(10,t2-t1); 
	     	}  
	   } 

//获得指定页起始行索引
function	getStartAndEndIndex(intpage,page_size,total_page,total_num){
	var	start_index=(intpage-1)*page_size;//显示页起始行 
		var	end_index=null;
		if(intpage==1){//第一页数据
			if(total_page==1){//只有一页数据 
				if((total_num%page_size)!=0)
				{
					end_index=start_index+(total_num%page_size)-1;
				}else{
					end_index=start_index+page_size-1;
				}
			}else{//不止一页数据 
				end_index=start_index+page_size-1;
			}
		}
		if(1<intpage&&intpage<total_page){//中间页数据
			end_index=start_index+page_size-1;//整页数据 
		}else if(intpage==total_page){//最后一页数据1.最后一页数据不足page_size,2.最后一页数据刚好是page_size
			if((total_num%page_size)!=0){
				end_index=start_index+(total_num%page_size)-1;
			}else{
				end_index=start_index+page_size-1;
			}
		}
	return  start_index+"-"+end_index;
}
//obj为集合对象
function	init_page_param(obj){
 	var	total_num=obj.length;
 	var	total_page=null;
 	var	temp_page=accDiv(total_num,page_size);
 	var	point_index=temp_page.toString().indexOf(".");
 	if(point_index<0){//刚好整除 
 		total_page=temp_page;	
 	}else{//总页数等于temp_page整数部分加1
 		total_page=Number(temp_page.toString().split(".")[0])+1;
 	}
 	return	total_num+"-"+total_page;
 }
