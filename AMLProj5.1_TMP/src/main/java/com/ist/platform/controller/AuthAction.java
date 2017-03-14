package com.ist.platform.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;


import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.PageUtils;


import com.ist.common.base.BaseAction;

import com.ist.common.jcs.CatchManager;
import com.ist.platform.bo.AuthorizationBO;

import com.ist.platform.dao.T00_moduleDAO;
import com.ist.platform.dao.T00_organDAO;
import com.ist.platform.dao.T00_roleDAO;
import com.ist.platform.dao.T00_userDAO;
import com.ist.aml.information.controller.T07_Supervise_msgActionForm;
import com.ist.aml.information.dao.T07_Supervise_msgDAO;
import com.ist.aml.information.dto.T00_NOTICE;
import com.ist.aml.information.dto.T07_Supervise_msg;
import com.ist.platform.dto.T00_com_auth;
import com.ist.platform.dto.T00_organ;
import com.ist.platform.dto.T00_user;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.MessageDigest;
import com.ist.util.StringUtils;

//import com.ist.platform.controller.SynchUserValidate;

public class AuthAction extends BaseAction {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;

		// 退出系统
		if ("logoutPage".equalsIgnoreCase(myaction)) {
			myforward = performLogoutPage(mapping, form, request, response);
		}
		// 验证用户名、密码
		else if ("loginPage".equalsIgnoreCase(myaction)) {
			myforward = performLoginPage(mapping, form, request, response);
		}
		// 验证用户
		else if ("authUser".equalsIgnoreCase(myaction)) {
			myforward = performAuthUser(mapping, form, request, response);
		}
        // else if("changeGroup".equalsIgnoreCase(myaction)) {
		// myforward = performChangeGroup(mapping, form, request, response);
		// }
		// 验证组，切换组
		else if ("authGroup".equalsIgnoreCase(myaction)) {
			myforward = performAuthGroup(mapping, form, request, response);
		}
		// 系统的首页
		else if ("indexPage".equalsIgnoreCase(myaction)) {
			myforward = performIndexPage(mapping, form, request, response);
		}
		// 系统管理模块的首页
		else if ("pubmoduleIndexPage".equalsIgnoreCase(myaction)) {
			myforward = performPubmoduleIndexPage(mapping, form, request,
					response);
		}
		/*// 预警系统模块的首页
		else if ("alertIndexPage".equalsIgnoreCase(myaction)) {
			myforward = performAlertIndexPage(mapping, form, request, response);
		}
		// 上报系统模块的首页
		else if ("reportIndexPage".equalsIgnoreCase(myaction)) {
			myforward = performReportIndexPage(mapping, form, request, response);
		}
		// 人行报表,左页面,将默认的法人机构,设置为默认的出表机构或分区机构
		else if ("invesIndexPage".equalsIgnoreCase(myaction)) {
			myforward = performInvesIndexPage(mapping, form, request, response);
		}
*/
		// 点击左侧菜单
		else if ("urlGo".equalsIgnoreCase(myaction)) {
			myforward = performUrlGo(mapping, form, request, response);
		}
		// 主页面
		else if ("mainPage".equalsIgnoreCase(myaction)) {
			myforward = performMainPage(mapping, form, request, response);
		}
		// 主页面详细页面
		else if ("detailPage".equalsIgnoreCase(myaction)) {
			myforward = performDetailPage(mapping, form, request, response);
		}

		return myforward;

	}

	/**
	 * 退出系统
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	 public ActionForward performLogoutPage(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) {
	     
	        AuthorizationBO authBO = (AuthorizationBO)context.getBean("authorizationBO");
	        HttpSession session = request.getSession();
	        AuthBean authBean = new AuthBean();
	        Authorization auth = new Authorization();

	        try {
	            authBean = (AuthBean) session.getAttribute("authBean");
	            auth = authBean.getAuthToken();
	            //=================================================
	            //写入退出日志
	            authBO.writeSystemLog(sqlMap, auth, "2");
	            //=================================================
	        }
	        catch (Exception e) {
	            //e.printStackTrace();logger.error(e);
	        }
//	        session.removeAttribute("authBean");
	        session.invalidate(); 
        return actionMapping.findForward("success");
	    }

	/**
	 * 显示登录界面
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performLoginPage(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		// 默认登录用户名和密码，开发完毕要注释

		String status = "1";
		String message = "";
		String specusers = "";
		try {
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			String ctrl = (String) sysparaMap.get(Constans.USE_LOGINCTRL); // 1
			// 需要控制后台跑批登录

			if ("1".equals(ctrl)) {
				/* 系统状态status: 
				      0 后台批量过程，只允许特殊用户登录（通过将“登录”按钮不可用阻止）
				      1 正常
				 */
				AuthorizationBO bo = new AuthorizationBO();
				// 后台状态 -1 数据库异常； 0 无后台任务运行； >0 后台跑批
				if (!bo.isFreeTime(cm)) {
					int count = bo.getBackRunningStatus(sqlMap);
					if (count == -1) { // 数据库异常，无特殊用户，
						status = "0";
						message = "数据库异常,无法登录！";
					} else if (count == 0) { // 无后台任务运行，系统正常
						status = "1";
						message = "";
					} else { // 后台跑批，只允许特殊用户登录
						status = "0";
						message = "后台跑批过程，无法登录！"; //        		
						specusers = (String) sysparaMap
								.get(Constans.PARA_SPECUSERS);
						if (specusers == null)
							specusers = "admin";
					}
				}
			}

				request.setAttribute("status", status);
				/*
				 * 提示信息，当不为空时显示
				 */
				request.setAttribute("message", message);
				/*
				 * 特殊用户名称，“,”分隔
				 */
				request.setAttribute("specusers", specusers);
			

			request.setAttribute("loginctrl", ctrl);
			
			//start add lixx 2011.10.09 添加换肤功能
			
	        String style = "blue";
			if("1".equals(sysparaMap.get("406"))){ 
		        //读Cookie
		        Cookie[] cookies = request.getCookies();
		        if(cookies!=null)
		        {
		            for (int i = 0; i < cookies.length; i++)
		            {
		               Cookie c = cookies[i];
		               if(c.getName().equalsIgnoreCase("showStyle"))
		               {
		                   style = c.getValue();
		                }
		            }
		         }
		        if("".equals(style)){
		            style = "blue";
		        }
			}
	        request.getSession().setAttribute("style", style);
	        
	      //start add lixx 2011.10.09 添加换肤功能
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}

		return actionMapping.findForward("success");
	}

	/**
	 * 认证用户登录信息(用户名密码)是否正确
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performAuthUser(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		AuthActionForm form = (AuthActionForm) actionForm;
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();

		String username = StringUtils.null2String(form.getUsername());
		String password = StringUtils.null2String(form.getPassword());
		username = username.toLowerCase();
		T00_userDAO t00_userDao=(T00_userDAO)context.getBean("t00_userDAO");
	
        String PortalFlag="0";  
		try {
			MessageDigest md = new MessageDigest();        
            
//          取得用户详细信息
			T00_user t00_user1 = new T00_user();
			t00_user1.setUsername(username);           
			t00_user1.setFlag("1");
          
            if (t00_user1.getUsername().trim().equals("")) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"用户不存在或被禁用"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			T00_user t00_user = t00_userDao.getT00_userDisp1(this.sqlMap,
					t00_user1);
			if(t00_user==null || t00_user.getUsername().equals("")) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"用户不存在或被禁用"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String password_md5 = md.getMD5Digest(password);
			// 密码为空时不能通过加密后的字符串比较
            
            if (PortalFlag.equals("0")) {// 从Portal登陆不验证密码,从平台验证需要验证密码
                if (password.equals(""))
                    password_md5 = "";
                if (!StringUtils.null2String(t00_user.getPassword()).equals(
                        password_md5)) {
                    errors.add(errors.GLOBAL_ERROR, new ActionError(
                            "error.common", "密码不正确，请重新输入"));
                    saveErrors(request, errors);
                    return actionMapping.findForward("failure");
                }
            }
           
			// 用户认证通过===========================================================================
	

			// 1、设置用户信息
			auth.setT00_user(t00_user);
			// 2、判断用户是否是第一次登录
			if (t00_user.getIsnewuser().trim().equals("1")) {
				auth.setIsFirstLogin(false);
			}
			// 3、IP地址
			auth.setIpAddress(request.getRemoteAddr());
			// 5、当前登录用户密钥
			Date d = DateUtils.getCurrDateTime();
			auth.setLoginPwd(t00_user.getUsername() + DateUtils.getMinute(d)+ DateUtils.getSecond(d));
			//auth.setLoginPwd(t00_user.getUsername());
			authBean.setAuthToken(auth);
			session.setAttribute("authBean", authBean);

			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			String sinUserCtrl = (String) sysparaMap
					.get(Constans.USE_SINUSERCTRL); // 是否需要控制一个用户名同时只能登录一个

			if ("1".equals(sinUserCtrl)) {

				String authTextStorepath = (String) sysparaMap
						.get(Constans.AUTHTXT);
				String Content = auth.getLoginPwd();
				String authTextName = t00_user.getUsername() + ".txt"; // 文件名
				
				 File filepath = new File(authTextStorepath);
				 FileUtils.writeFile(authTextStorepath, authTextName, Content);
					/**else{
						File[] files = filepath.listFiles();
						if(files.length==0){
							FileUtils.writeFile(authTextStorepath, authTextName, Content);	
						}else{
			    String loginPwd = auth.getLoginPwd()+"\n";
             	String newLoginPwd= FileUtils.readFile(authTextStorepath+files[0].getName());
                 if(!"".equals(loginPwd) && !"".equals(newLoginPwd) && !loginPwd.equalsIgnoreCase(newLoginPwd)) {
                	 errors.add(errors.GLOBAL_ERROR, new ActionError(
                             "error.common", "只允许一个人登陆"));
                     saveErrors(request, errors);
                	 
                	 return actionMapping.findForward("failure");
                     }
						}
				}**/        
			}
		    //判断后台跑批是否允许登陆
	        String status = StringUtils.null2String(request.getParameter("status"));
	        String specusers =(String)sysparaMap.get("100");
	        if ((status.equals("0")) && (!specusers.contains(username))) {
	          errors.add("org.apache.struts.action.GLOBAL_ERROR", 
	          new ActionError("error.common", "后台跑批过程，无法登录！"));
	          saveErrors(request, errors);
	          return actionMapping.findForward("failure");
	        }
			
			
			// 写登录日志
			// AuthorizationBO authBO = (AuthorizationBO)context.getBean("authorizationBO");
			//authBO.writeSystemLog(sqlMap, auth, "1");
			// =================================================
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 认证组信息 用于登录的第二步
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performAuthGroup(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		AuthActionForm form = (AuthActionForm) actionForm;
		HttpSession session = request.getSession();
		AuthorizationBO authBO=(AuthorizationBO)context.getBean("authorizationBO");
		ActionErrors errors = new ActionErrors();
		// 判断用户是否登录,或者登录认证是否合法
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		
		T00_roleDAO t00_roleDao = (T00_roleDAO)context.getBean("t00_roleDAO");
		T00_organDAO t00_organDao = (T00_organDAO)context.getBean("t00_organDAO");
		T00_moduleDAO t00_moduleDao = (T00_moduleDAO)context.getBean("t00_moduleDAO");
		
		try {
			// 取得用户在组内的全部角色信息
			T00_com_auth t00_com_auth = new T00_com_auth();
			t00_com_auth.setUsername(auth.getT00_user().getUsername());
			boolean is_flag = true;
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			if ("1".equals(t87_sysparaMap.get("802"))) {//0:用户登录通过t00_group_organ获得数据组权限1:通过T87_ORGAN_MAP获得机构权限
				is_flag = false;
			}
			 String groupkey = form.getGroupkey();
			 if(groupkey==null || groupkey.equals("")){
				 groupkey="1";
			 }
		        //切换组后需要重新设置当前的组
		        auth.setCurrGroupkey(groupkey);
			ArrayList roleList = t00_roleDao.getT00_roleListByUsernameGroupkey(
					sqlMap, t00_com_auth);
			if (roleList.size() == 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"当前用户没有角色！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// 取得用户全部功能模块
			HashMap newMap = t00_moduleDao
					.getT00_moduleListByUsernameGroupkey(sqlMap, t00_com_auth);
			ArrayList moduleList=(ArrayList)newMap.get("1");
			if (moduleList.size() == 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"当前用户在所登录组内没有功能权限！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// 取得用户全部的数据机构
			ArrayList organList = new ArrayList();
			if(is_flag)
				organList = t00_organDao.getT00_organListByUserOrgankey0(sqlMap, auth.getT00_user().getUsername());
			else
				organList = t00_organDao.getT00_organListByUserOrgankey1(sqlMap, auth.getT00_user().getOrgankey());
			if (organList.size() == 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"当前用户没有数据权限！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			
			//取得用户的岗位信息
			String postStr=t00_roleDao.getT00_PostStrByUsername(
					sqlMap, t00_com_auth);
			auth.setPostStr(postStr);
			//取得子系统信息
			String  systemkey=(String)newMap.get("3");
		    request.setAttribute("systemkey", systemkey);
			auth.setSystemMap((LinkedHashMap)newMap.get("2"));
			
			// 组织查询需要的机构信息
			String org_str = "";
			// 2、全部角色信息
			auth.setRoleList(roleList);
			// 3、全部可操作功能模块
			auth.setModuleList(moduleList);
			// 4、全部可操作机构信息（数据权限）
			auth.setOrganList(organList);
			// 5.有操作权限的默认法人机构
			// auth.setT84_organ(defaultPorgan);
			// 4、全部可操作机构信息（数据权限）
			//控制查证定位机构是否必输
			auth.setCheckOrgAuth(false);
			if(is_flag)
			{
			
				if (organList.size() < 10) {
					for (int i = 0; i < organList.size(); i++) {
						T00_organ t00_organ = (T00_organ) organList.get(i);
						org_str = org_str + ",'" + t00_organ.getOrgankey()
								+ "'";
					}
					if (!org_str.equals("")) {
						org_str = org_str.substring(1);
					}
				} else {
					org_str = "SELECT  distinct b.ORGANKEY FROM T00_COM_AUTH a,T00_GROUP_ORGAN b WHERE a.GROUPKEY=b.GROUPKEY "
							+ " AND a.USERNAME='"
							+ auth.getT00_user().getUsername() + "'";
				}
				auth.setOrganstr(org_str);
			}
			else
			{
				String org_id = "";
				org_id = "SELECT SUBORGANKEY FROM T87_ORGAN_MAP WHERE ORGANKEY='" + auth.getT00_user().getOrgankey() + "'";
				auth.setOrganstr(org_id);
			}
			
			 HashMap authGroupMap = new HashMap();
			 authGroupMap.put("roleList",roleList);    //角色
             authGroupMap.put("moduleList",moduleList);//菜单
             authGroupMap.put("organList",organList);  //数据权限
             HashMap haveAuthGroupHash = auth.getHaveAuthGroupHash();
             haveAuthGroupHash.put(groupkey, authGroupMap);
             auth.setHaveAuthGroupHash(haveAuthGroupHash);
             
         	authBean.setAuthToken(auth);
			session.setAttribute("authBean", authBean);
            
  /*          if("1".equals(session.getAttribute("PortalFlag"))){ 
                String out = SysConfig.getProperty("portal.out");               
                File file=new File(out);                   
              FileOutputStream fos=new FileOutputStream(file);
              ObjectOutputStream oos=new ObjectOutputStream(fos);              
                 oos.writeObject(authBean);
                 oos.flush();
                 oos.close();}*/
			// =================================================
			// 写登录日志
			authBO.writeSystemLog(sqlMap, auth, "1");
			// =================================================
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			if("1".equals(sysparaMap.get("406"))){ 
				String color = auth.getT00_user().getColor();
				if("".equals(color) || color == null){
					color = "blue";
				}
				session.setAttribute("style", color);
				
		        //读Cookie
		        Cookie[] cookies = request.getCookies();
		        String style = "";
		        if(cookies!=null)
		        {
		            for (int i = 0; i < cookies.length; i++)
		            {
		               Cookie c = cookies[i];
		               if(c.getName().equalsIgnoreCase("showStyle"))
		               {
		                   style = c.getValue();
		                }
		            }
		         }
				
	            //写cookie
	            Cookie stylecookie = new Cookie("showStyle",color);
	            //生命周期
	            stylecookie.setMaxAge(60*60*24*365);
	            stylecookie.setPath("/");
	            response.addCookie(stylecookie);
			}else{
				session.setAttribute("style", "blue");
			}
		

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

	
	private static HashMap<String, T00_user> hUserName = new java.util.HashMap<String, T00_user>();//保存sessionID和username的映射    
    
	   /**以下是实现HttpSessionListener中的方法**/  
	    public void sessionCreated(HttpSessionEvent se) {          
	    }   
	  
	    public void sessionDestroyed(HttpSessionEvent se) {   
	        hUserName.remove(se.getSession().getId());   
	    }   
	       
	    /*  
	     * isAlreadyEnter-用于判断用户是否已经登录以及相应的处理方法  
	     * @param sUserName String-登录的用户名称  
	     * @return boolean-该用户是否已经登录过的标志  
	     */       
	    public static boolean isAlreadyEnter(T00_user vo){   
	        boolean flag = false;   
	       if(hUserName.containsValue(vo)){   
	            flag = true;   
	       }else{//如果该用户没登录过，直接添加现在的sessionID和username   
	            flag = false;   
	        }   
	       return flag;   
	    }   
	       
	    /*  
	     * isAlreadyEnter-用于判断用户是否已经登录以及相应的处理方法  
	     * @param sUserName String-登录的用户名称  
	     * @return boolean-该用户是否已经登录过的标志  
	     */       
	    public static boolean updateAlreadyEnter(HttpSession session,T00_user vo){   
	        boolean flag = false;   
	        if(hUserName.containsValue(vo)){//如果该用户已经登录过，则使上次登录的用户掉线(依据使用户名是否在hUserName中)   
	            //遍历原来的hUserName，删除原用户名对应的sessionID(即删除原来的sessionID和username)   
	           Iterator iter = hUserName.entrySet().iterator();   
	            while (iter.hasNext()) {   
	               Map.Entry entry = (Map.Entry)iter.next();              
	                //Object key = entry.getKey();   
	                Object val = entry.getValue();   
            if(val.equals(vo)){   
	                   iter.remove();   
	               }   
	           }   
	            hUserName.put(session.getId(),vo);//添加现在的sessionID和username   
	            flag = true;   
	        }else{//如果该用户没登录过，直接添加现在的sessionID和username   
	            flag = false;   
	            hUserName.put(session.getId(),vo);   
	       }   
	        return flag;   
	    }   
	    /*  
	    * isOnline-用于判断用户是否在线  
	     * @param session HttpSession-登录的用户名称  
	    * @return boolean-该用户是否在线的标志  
	     */  
	    public static boolean isOnline(HttpSession session){   
	        boolean flag = true;   
	       if( hUserName.containsKey(session.getId())){   
	            flag = true;   
	        }   
	        else{   
	           flag = false;   
	        }   
	        return flag;   
 }    
	
	
	
	/**
	 * 显示当前登录组所属的子系统的首页 注：一个组必定属于唯一的一子系统
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performIndexPage(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		//TreeMap SystemMap = cm.getCodeTable2HashCatch("t00_system_for_url",true);
		LinkedHashMap SystemMap = cm.getMapFromCache("t00_system_for_url");

		// String homepage = "/pubmodule/index.do";
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
//		String homepage = (String) SystemMap.get(auth.getT00_group()
//				.getSystemkey());
		String homepage = (String) SystemMap.get("1");
		if(homepage==null || "".equals(homepage)) {
			homepage = "/pubmodule/index.do";
		}
		String root = request.getContextPath();
		homepage = root + homepage;
		request.setAttribute("homepage", homepage);

		return actionMapping.findForward("success");
	}

	/**
	 * 系统管理首页
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performPubmoduleIndexPage(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
         String systemkey=(String)request.getAttribute("systemkey");
		request.setAttribute("systemkey", systemkey);
		return actionMapping.findForward("success");
	}

	



	/**
	 * 点击左侧菜单公共显示页面
	 * 
	 * @param actionMapping
	 *            ActionMapping
	 * @param actionForm
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performUrlGo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		AuthorizationBO authBO=(AuthorizationBO)context.getBean("authorizationBO");
		//
		String go_url = (String) request.getParameter("go_url");
		String modulekey = (String) request.getParameter("modulekey");
		String modulename = (String) request.getParameter("modulename");
		/*		String systemkey = (String) request.getParameter("systemkey");*/
		// =================================================
		// 写点击功能模块菜单日志
		authBO.writeSystemLog(sqlMap,auth, modulekey, modulename);
		// =================================================
		String root = request.getContextPath();
		go_url = root + go_url;

		if (go_url.indexOf("?") > 0) {
			go_url = go_url + "&ram=" + StringUtils.getRandomString(10);
		} else {
			go_url = go_url + "?ram=" + StringUtils.getRandomString(10);
		}
		try {
			response.sendRedirect(go_url);
			return null;
		} catch (Exception e) {
		}
		return actionMapping.findForward("success");
	}
	public ActionForward performMainPage(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bpost="0";
		String spost="0";
		String ppost="0";
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organlevel=auth.getT00_user().getOrganlevel();
		String poststr=auth.getPostStr();
		String organkey=auth.getT00_user().getOrgankey();
		request.setAttribute("organkey", organkey);
		String organkeys=auth.getOrganstr();
		int iStartRec=0;
		int iPageSize=20;
		T07_Supervise_msgDAO t07_supervise_msgDAO = (T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		try{
		 if(poststr.indexOf("P0102")!=-1){
			 bpost="1" ;
		 }
		 if(poststr.indexOf("P0103")!=-1){
			 spost="1" ;
		 }
		 if(poststr.indexOf("P0104")!=-1){
			 ppost="1" ;
		 }
		
		
		 LinkedHashMap levelMap=cm.getMapFromCache("maxorganlevel");
		 
		 String maxorganlevel=(String)levelMap.get("organlevel");
		// ArrayList sysList=cm.getListFromCache("getT07_Sysdate");
		 ArrayList sysList=new ArrayList();
		 //查询案例时间和交易时间
		HashMap dateMap=t07_supervise_msgDAO.getT07_Sysdate(sqlMap, sysList);
		//查询代办事项表
		T07_Supervise_msg t07_supervise_msg=new T07_Supervise_msg();
		t07_supervise_msg.setOrgankeys(organkeys);
		ArrayList worklist = (ArrayList) sqlMap.queryForList("getT07_Writeoper_totalList", t07_supervise_msg);
		//ArrayList worklist=cm.getCodeTable2ListCatchByOrgankey(sqlMap,t07_supervise_msg,"getT07_Writeoper_totalList", organkey, true);
		//ArrayList worklist=new ArrayList();
	    HashMap operMap=t07_supervise_msgDAO.getT07_Writeoper_totalList(sqlMap, t07_supervise_msg,worklist);
		//查询督办信息表
		t07_supervise_msg.setVoer_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
		ArrayList superList=(ArrayList)t07_supervise_msgDAO.getT07_Supervise_msgList1(sqlMap, t07_supervise_msg, iStartRec, iPageSize);
		//查询公告信息表
		T00_NOTICE t00_notice = new T00_NOTICE();
		t00_notice.setInfactdate(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
		ArrayList  noticeList=(ArrayList)t07_supervise_msgDAO.getT00_NoticeList(sqlMap, t00_notice, iStartRec, 5);
		//added by shane at 140904 for 查询未协查案例信息 start
		int noHelpCheckAppCount = t07_supervise_msgDAO.getT07_case_assistCount(sqlMap,organkeys);
		request.setAttribute("noHelpCheckAppCount", noHelpCheckAppCount);
		//added by shane at 140904 for 查询未协查案例信息 end
        //查询风险评级未调整数
		//String riskcount=t07_supervise_msgDAO.getT07_RiskAuditCount(sqlMap, t07_supervise_msg);
		//dateMap.put("3", riskcount);
	//	request.setAttribute("maxorganlevel", maxorganlevel);
		
		//新增机构信息处理提醒
		T00_organDAO t00_organDAO=new T00_organDAO();
		T00_organ t00_organ=new T00_organ();
		DateUtils dt=new DateUtils();
		t00_organ.setCreatedate(dt.dateToStringShort(dt.getDateChangeTime(dt.getCurrDateTime(), "d", -1)));
		ArrayList organList=t00_organDAO.getT00_organMainList(sqlMap,t00_organ);
		String organStrDisp="";
		for(int i=0;i<organList.size();i++){
			T00_organ organ=(T00_organ)organList.get(i);
			if("1".equals(organ.getOname())){
				organStrDisp="新增机构数:<span>"+organ.getOkey()+"</span>   ";
			}
			if("2".equals(organ.getOname())){
				organStrDisp+="未填写行政区划机构数:<span>"+organ.getOkey()+"</span>  ";
			}
		}
		request.setAttribute("organStrDisp", organStrDisp);
		request.setAttribute("dateMap", dateMap);
		request.setAttribute("operMap", operMap);
		request.setAttribute("superList", superList);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("organlevel", organlevel);
		request.setAttribute("bpost", bpost);
		request.setAttribute("spost", spost);
		request.setAttribute("ppost", ppost);
		if(organlevel.equals("1")||(maxorganlevel.endsWith("3")&&organlevel.equals("2"))){
			return actionMapping.findForward("success1");
		}
		if(organlevel.equals("0")){
			return actionMapping.findForward("success0");
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return actionMapping.findForward("success");
	}
	public ActionForward performDetailPage(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
		String organlevel=(String)request.getParameter("organlevel");
		String organkey=(String)request.getParameter("organkey");
		 
		LinkedHashMap levelMap=cm.getMapFromCache("maxorganlevel");
		 String maxorganlevel=(String)levelMap.get("organlevel");
		String msg_type=(String)request.getParameter("msg_type");
		String create_dt=StringUtils.null2String(request.getParameter("create_dt"));
		String post_id=StringUtils.null2String(request.getParameter("post_id"));
		String newsearchflag = StringUtils.nullObject2String(request
				.getParameter("newsearchflag"));
		T07_Supervise_msgDAO t07_supervise_msgDAO = new T07_Supervise_msgDAO();
		String pageInfo = "";
		try{
			int intPage = PageUtils.intPage(request, newsearchflag);
			T07_Supervise_msg t07_supervise_msg=new T07_Supervise_msg();
		if (newsearchflag.equals("1")) { //新的查询
			t07_supervise_msg.setOrgankey(organkey);	
			t07_supervise_msg.setOrganlevel(organlevel);
			t07_supervise_msg.setMsg_type(msg_type);
			t07_supervise_msg.setCreate_dt(create_dt);
			t07_supervise_msg.setPost_id(post_id);
			t07_supervise_msg.setMaxorganlevel("'"+maxorganlevel+"'");
			if(form.getMsg_org()!=null && !form.getMsg_org().equals("")){
				t07_supervise_msg.setMsg_org(form.getMsg_org())	;
			}
			if(form.getMsg_org_name()!=null && !form.getMsg_org_name().equals("")){
				t07_supervise_msg.setMsg_org_name("%"+form.getMsg_org_name()+"%")	;
			}
		    if(create_dt!=null && !create_dt.equals("")){
		    	t07_supervise_msg.setDate_dt(DateUtils.stringToDateShort(create_dt));
		    }
				session.setAttribute(organlevel+"t07_subSearchObj", t07_supervise_msg);
		} else { //翻页
			t07_supervise_msg = (T07_Supervise_msg) session
					.getAttribute(organlevel+"t07_subSearchObj");
		}
		//查询待处理信息表
		t07_supervise_msg.setVoer_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
		ArrayList superList=(ArrayList)t07_supervise_msgDAO.getT07_Writeoper_DetailList(sqlMap, t07_supervise_msg, this.getStartRec(intPage), this
				.getIntPageSize());
		int totalRow=t07_supervise_msgDAO.getT07_Writeoper_DetailListCount(sqlMap, t07_supervise_msg);
		String url = request.getContextPath() + "/pubmodule"
		+ actionMapping.getPath() + ".do";

       pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		request.setAttribute("superList", superList);
        request.setAttribute("organlevel", t07_supervise_msg.getOrganlevel());
		request.setAttribute("msg_type", t07_supervise_msg.getMsg_type());
		request.setAttribute("organkey", t07_supervise_msg.getOrgankey());
		request.setAttribute("maxorganlevel", t07_supervise_msg.getMaxorganlevel());
		request.setAttribute("post_id", t07_supervise_msg.getPost_id());
		request.setAttribute("create_dt", t07_supervise_msg.getCreate_dt());
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}

	

}
