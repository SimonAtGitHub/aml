package com.ist.common;

import java.util.ArrayList;

public class CopyBean {
	public static ArrayList<InnerDao> copyIn(ArrayList<RequestObject> request,String s){
		String dt=s.substring(0, s.indexOf("_"));
		String date=dt.substring(0,4)+"-"+dt.substring(4,6)+"-"+dt.substring(6);
		String ver=s.substring(s.indexOf("_")+1,s.lastIndexOf("_"));
		String seq=s.substring(s.lastIndexOf("_")+1,s.lastIndexOf("."));
		ArrayList<InnerDao> inner=new ArrayList<InnerDao>();		
		for(int i=0;i<request.size();i++){
			InnerDao in=new InnerDao();
			in.setPeople_id(request.get(i).getPeople_id());
			in.setHzsfzh(request.get(i).getHzsfzh());
			in.setSfzh(request.get(i).getSfzh());
			in.setXm(request.get(i).getXm());
			in.setVerification_dt(date);
			in.setVerification_batch(ver);
			in.setVerification_seq(seq);
			inner.add(in);
		}
		return inner;
	}
    public static ArrayList<ReturnObject> copyOut(ArrayList<OuterDao> outer){
		ArrayList<ReturnObject> obj=new ArrayList<ReturnObject>();
		for(int i=0;i<outer.size();i++){
		    ReturnObject re=new ReturnObject();
		    re.setPeople_id(outer.get(i).getPeople_id());
		    re.setXm(outer.get(i).getXm());
		    re.setSfzh(outer.get(i).getSfzh());
		    re.setR2(outer.get(i).getR2());
		    re.setR3(outer.get(i).getR3());
		    re.setR4(outer.get(i).getR4());
		    re.setR5(outer.get(i).getR5());
		    re.setR6(outer.get(i).getR6());
		    re.setR7(outer.get(i).getR7());
		    re.setR8(outer.get(i).getR8());
		    re.setR9(outer.get(i).getR9());
		    re.setR10(outer.get(i).getR10());
		    re.setR11(outer.get(i).getR11());
		    re.setR12(outer.get(i).getR12());
		    re.setR13(outer.get(i).getR13());
		    re.setR14(outer.get(i).getR14());
		    re.setR15(outer.get(i).getR15());
		    obj.add(re);		    		    
		}
		return obj;
	}

}
