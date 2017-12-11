package com.ist.common;

import java.util.ArrayList;

public class MatchController {
	public static void match(String s){
		String dt=s.substring(0, s.indexOf("_"));
		String date=dt.substring(1,5)+"-"+dt.substring(5,7)+"-"+dt.substring(7);
		String ver=s.substring(s.indexOf("_")+1,s.lastIndexOf("_"));
		String seq=s.substring(s.lastIndexOf("_")+1,s.lastIndexOf("."));
		ArrayList<RequestObject> obj=new ArrayList<RequestObject>();
        obj=JSonUtil.readJson(s);
        ArrayList<InnerDao> in=CopyBean.copyIn(obj,s);
        for(int i=0;i<in.size();i++){        	
        	in.get(i).setVerification_dt(date);
        	in.get(i).setVerification_batch(ver);
        	in.get(i).setVerification_seq(seq);
        }
        
	}
}
