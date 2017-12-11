package com.ist.server.cal.aml.jrules.rules;

import java.io.File;
import java.io.FilenameFilter;
import java.net.URL;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.aml.common.Constants;
import com.ist.server.cal.aml.jrules.action.RuleAction;
import com.ist.server.cal.aml.jrules.dto.RuleSearchObj;

public class RuleNS {
	private static Logger logger = LogUtils.getLogger(RuleNS.class.getName());

	private static RuleNS ruleNS = null;

	/**
	 * 获取规则命名空间对象
	 * @param className
	 * @return 
	 */
	public static RuleNS getInstance(String className) {
		if (ruleNS == null) {
			synchronized (RuleNS.class) {
				Class ruleNSClass;
				try {
					ruleNSClass = Class.forName(className);
					if (ruleNSClass != null) {
						ruleNS = (RuleNS) ruleNSClass.newInstance();
					}
				} catch (Exception e) {
					logger.error("未能找到规则命名类！className=" + className);
				}
			}
		}
		return ruleNS;
	}

	/**
	 * 
	 * @param className
	 * @return
	 */
	public Class getClass(String className) {
		Object instance = null;
		try {
			// String className = DrlConfig.getProperty("drlengine.class");
			synchronized (RuleNS.class) {
				// 如果类名为空，返回当前类
				if (className == null || className.equals("")) {
					return RuleNS.class;
				}
				if (ruleNS == null)
					getInstance(className);
				// 根据名称装载实例
				/*
				Class conClass = Class.forName(className);
				instance = conClass.newInstance();
				*/
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return ruleNS.getClass();
	}

	/**
	 * 获得路径下的规则文件
	 * @param FilePath 路径
	 * @return
	 */
	public HashMap getRuleFiles(RuleSearchObj searchObj) {
		//获得路径
		//String FilePath = this.getRuleFileDir();
		HashMap hash;
		RuleAction ruleAction = new RuleAction();
		hash = ruleAction.getSysRulesHash(searchObj);
		return hash;
	}

	/**
	 * 在类中取得当前文件所在的相对路径与绝对路径
	 * @return String
	 */
	public String getRuleFileDir() {
		//获取文件名
		String strClassName = getClass().getName();
		//获取包名
		String strPackageName = "";
		if (getClass().getPackage() != null) {
			strPackageName = getClass().getPackage().getName();
		}

		String strClassFileName = "";
		if (!"".equals(strPackageName)) {
			strClassFileName = strClassName.substring(
					strPackageName.length() + 1, strClassName.length());
		} else {
			strClassFileName = strClassName;
		}
		//System.out.println("ClassFileName:" + strClassFileName);

		URL url = null;
		url = getClass().getResource(strClassFileName + ".class");
		String strURL = url.toString();
		//System.out.println(strURL);
		try {
			strURL = java.net.URLDecoder.decode(strURL, "UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		int num =strURL.indexOf("/");
		if(num>-1)
			strURL = strURL.substring(strURL.indexOf('/')+1 , strURL.lastIndexOf('/'));
		else 
			strURL = strURL.substring(strURL.indexOf('\\')+1, strURL.lastIndexOf('\\'));
		num=strURL.indexOf(":");
		if(num>-1)return  strURL;
		else return "//"+strURL;
	}

	/**
	 * 获得路径下的规则文件
	 * @param FilePath 路径
	 * @return
	 */
	public HashMap getRuleFiles(Class RuleNS) {
		//获得路径
		String FilePath = getRuleFileDir();
		HashMap hash = new HashMap();
		File file = new File(FilePath);
		//文件扩展名过滤对象，只要扩展名为Constants.RULE_EXT的
		FilenameFilter filter = new Filter(Constants.RULE_EXT);
		//文件数组
		File[] tmpfiles = file.listFiles(filter);

		for (int i = 0; i < tmpfiles.length; i++) {
			if (tmpfiles[i].isFile()) {
				//key-文件名，value-完整路径
				hash.put(tmpfiles[i].getName(), tmpfiles[i].getAbsolutePath());
			}
		}
		return hash;
	}

	/**
	 * 按文件名进行过滤
	 * @author Administrator
	 *
	 */
	public class Filter implements FilenameFilter {
		String ext;

		private Filter(String ext) {
			this.ext = "." + ext;
		}

		public boolean accept(File dir, String name) {
			return name.endsWith(ext);
		}

	}

	public static void main(String[] args) {
		RuleNS ruleNS = new RuleNS();
		String path = ruleNS.getRuleFileDir();
		System.out.println("path:" + path);

		HashMap hash = ruleNS.getRuleFiles(ruleNS.getClass());
		System.out.println("hash:" + hash);
	}
}
