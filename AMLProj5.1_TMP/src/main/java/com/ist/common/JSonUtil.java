package com.ist.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSonUtil {
	public static final String readLoction  ="/got_data_inner/";
	public static final String writeLoction ="/got_data_outer/"; 
	public JSonUtil(){		
	}
	public static ArrayList<RequestObject> readJson(String s){
		File in = new File(readLoction+s);
		ArrayList<RequestObject> obj=new ArrayList<RequestObject>();
        String line="[";
        String msg;
	    InputStream is;
	      try {
	          is = new FileInputStream(in);
	          InputStreamReader isr = new InputStreamReader(is, "utf-8");
	          BufferedReader br = new BufferedReader(isr);
	          
	          while((msg = br.readLine()) != null){
	              msg = DESUtil.decrypt(msg, "12345678");
	              line=line+msg+",";
	          }
	          br.close();
	          line=line.substring(0,line.length()-1)+"]";
	          line=line.replaceAll("people_id", "\"people_id\"");
	          line=line.replaceAll("xm", "\"xm\"");
	          line=line.replaceAll("sfzh", "\"sfzh\"");
	          line=line.replaceAll("hz\"sfzh\"", "\"hzsfzh\"");
	          
	      } catch (FileNotFoundException e) {
	          e.printStackTrace();
	          throw new RuntimeException(e);
	      } catch (IOException e) {
	          e.printStackTrace();
	          throw new RuntimeException(e);
	      }
		ObjectMapper mapper=new ObjectMapper();
		try {
			obj=mapper.readValue(line, new TypeReference<List<RequestObject>>(){});
			return obj;
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}
    public static void writeJson(ArrayList<ReturnObject> obj,String s){
    	ObjectMapper mapper=new ObjectMapper();
    	File f=new File(writeLoction+s);
    	File f1=new File(writeLoction+"before"+s);
    	try {
			f.createNewFile();
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
    	try {
			FileOutputStream in=new FileOutputStream(f);
			OutputStreamWriter out=new OutputStreamWriter(in,"utf-8");
			PrintWriter writer=new PrintWriter(out);
			FileOutputStream in1=new FileOutputStream(f1);
			OutputStreamWriter out1=new OutputStreamWriter(in1,"utf-8");
			PrintWriter writer1=new PrintWriter(out1);
			for (int i=0;i<obj.size();i++){
				String st=mapper.writeValueAsString(obj.get(i));
				st=st.replaceAll("\"people_id\"", "People_id");
				st=st.replaceAll("\"xm\"", "xm");
				st=st.replaceAll("\"sfzh\"", "sfzh");
				st=st.replaceAll("\"r2\"", "R2");
				st=st.replaceAll("\"r3\"", "R3");
				st=st.replaceAll("\"r4\"", "R4");
				st=st.replaceAll("\"r5\"", "R5");
				st=st.replaceAll("\"r6\"", "R6");
				st=st.replaceAll("\"r7\"", "R7");
				st=st.replaceAll("\"r8\"", "R8");
				st=st.replaceAll("\"r9\"", "R9");
				st=st.replaceAll("\"r10\"", "R10");
				st=st.replaceAll("\"r11\"", "R11");
				st=st.replaceAll("\"r12\"", "R12");
				st=st.replaceAll("\"r13\"", "R13");
				st=st.replaceAll("\"r14\"", "R14");
				st=st.replaceAll("\"r15\"", "R15");				
				st=st.replaceAll("\n", "");
				st=st.replaceAll("\n\t", "");
				st=st.replaceAll("null", "\"\"");
				writer.println(DESUtil.encrypt(st, "12345678"));
				writer1.println(st);
			}
			String result=mapper.writeValueAsString(obj);
			System.out.println(result);
			writer.flush();
			writer.close();
			writer1.flush();
			writer1.close();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
