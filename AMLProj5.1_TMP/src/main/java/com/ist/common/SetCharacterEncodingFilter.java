package com.ist.common;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.core.io.FileSystemResource;

import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;

/**
 * <p>Filter that sets the character encoding to be used in parsing the
 * incoming request, either unconditionally or only if the client did not
 * specify a character encoding. Configuration of this filter is based on
 * the following initialization parameters:</p>
 * <ul>
 * <li><strong>encoding</strong> - The character encoding to be configured
 * for this request, either conditionally or unconditionally based on
 * the <code>ignore</code> initialization parameter. This parameter
 * is required, so there is no default.</li>
 * <li><strong>ignore</strong> - If set to "true", any character encoding
 * specified by the client is ignored, and the value returned by the
 * <code>selectEncoding()</code> method is set. If set to "false,
 * <code>selectEncoding()</code> is called <strong>only</strong> if the
 * client has not already specified an encoding. By default, this
 * parameter is set to "true".</li>
 * </ul>
 *
 * <p>Although this filter can be used unchanged, it is also easy to
 * subclass it and make the <code>selectEncoding()</code> method more
 * intelligent about what encoding to choose, based on characteristics of
 * the incoming request (such as the values of the <code>Accept-Language</code>
 * and <code>User-Agent</code> headers, or a value stashed in the current
 * user's session.</p>
 *
 * @author <a href="mailto:jwtronics@yahoo.com">John Wong</a>
 *
 * @version $Id: SetCharacterEncodingFilter.java,v 1.3 2008/02/01 05:36:12 hubaiqing Exp $
 */
public class SetCharacterEncodingFilter
    implements Filter {
    /**
     * The default character encoding to set for requests that pass through
     * this filter.
     */
    protected String encoding = null;

    /**
     * The filter configuration object we are associated with. If this value
     * is null, this filter instance is not currently configured.
     */
    protected FilterConfig filterConfig = null;

    /**
     * Should a character encoding specified by the client be ignored?
     */
    protected boolean ignore = true;

    //没有权限时，跳转的页面
    protected String privpage = "";

    //session超时时，跳转的页面
    protected String timeoutpage = "";
    // 当用户再次登录，跳转的页面
	protected String otherlogin = "";
	// 文件存储路径
	protected String authtextstorepath = "";
	// 是否控制单点登陆
	protected String use_sinuserctrl = "0";

	//system-config配置文件
	protected XMLProperties sysConfig=null;
	
	//数据源
	protected DataSource ds=null;
	
	//缓存
	protected CatchManager cm=null;
	
	
    /**
     * Take this filter out of service.
     */
    public void destroy() {
        this.encoding = null;
        this.filterConfig = null;
    }
    
    /**
    * Request.java 对 HttpServletRequestWrapper 进行扩充, 不影响原来的功能并能提供所有的
    * HttpServletRequest 接口中的功能. 它可以统一的对 Tomcat 默认设置下的中文问题进行解决而只需要用新的 Request
    * 对象替换页面中的 request 对象即可.
    */

    class Request extends HttpServletRequestWrapper {
      
       private String encoding = null;

       public Request(HttpServletRequest request) {
        super(request);
        encoding = SetCharacterEncodingFilter.this.encoding;
       }

       /**
       * 转换由表单读取的数据的内码. 从 ISO 字符转到 在web.xml中设置的encoding.
       */
       public String toChi(String input) {
        if(input == null) {
         return null;
        } else {
         try {
          byte[] bytes = input.getBytes("ISO8859-1");
          return new String(bytes, encoding);
         } catch (Exception ex) {

         }
         return null;
        }      
       }

       /**
       * Return the HttpServletRequest holded by this object.
       */
       private HttpServletRequest getHttpServletRequest() {
        return (HttpServletRequest) super.getRequest();
       }

       /**
       * 读取参数 -- 修正了中文问题.
       */
       public String getParameter(String name) {
        return  toChi(super.getParameter(name));
       }

       /**
       * 读取参数列表 - 修正了中文问题.
       */
       public String[] getParameterValues(String name) {
        String values[] = super.getParameterValues(name);
        if (values != null) {
         for (int i = 0; i < values.length; i++) {
          values[i] = toChi(values[i]);
         }
        }
        return values;
       }
    }

   

    /**
     * Select and set (if specified) the character encoding to be used to
     * interpret request parameters for this request.
     *
     * @param request The servlet request we are processing
     * @param result The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
        FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

 //       HttpSession hs = req.getSession();
//        System.out.println(req.getPathInfo());
//        System.out.println(req.getRequestURI());
//        System.out.println(req.getQueryString());
        
        String contextPath= req.getContextPath();
        String path = req.getServletPath();
        path = path.substring(0, path.lastIndexOf("."));
        
        Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
        //后台跑任务时是否控制用户登录        
        String isContrl=paraMap.get(Constans.PARA_SERVER_CAL_IS_CONTRL);
        if(isContrl==null)
        {
        	isContrl="0";
        }
        
        try {
          
//            if (!ignore) {
//                String encoding = this.selectEncoding(request);
//                HttpServletRequest httpreq = (HttpServletRequest) request; 
//               if (httpreq.getMethod().equals("POST")) { 
//                 request.setCharacterEncoding(encoding); 
//              } else { 
//                request = new Request(httpreq); 
//                } 
//               
//            }
        	
        	 if (!ignore) {
	                String encoding = this.selectEncoding(request);
	                if (encoding != null)
	                    request.setCharacterEncoding(encoding);
	            }
            
         


            
            //System.out.println("path==="+path);
            
            //用户第一次登陆
            if (path.equalsIgnoreCase("/login")
                    || path.equalsIgnoreCase("/authuser")
                    || path.equalsIgnoreCase("/modify_passwd")
                    || path.equalsIgnoreCase("/modify_passwd_do")
                    || path.equalsIgnoreCase("/authgroup")
                    || path.equalsIgnoreCase("/logout")) 
            {
                //不做权限和session验证
                chain.doFilter(request, response);
            }
            //用户其他的访问
            else {
                //session验证
                HttpSession session = req.getSession();
                AuthBean authBean = (AuthBean) session.getAttribute("authBean");
                
                String msg="";
                if(authBean == null){
                    System.out.println("authBean 没有从session中取到！！！");
                    res.sendRedirect(contextPath+this.timeoutpage);
                }else if(!authBean.isInitialized()){
                    System.out.println("authBean 权限未初始化！！！");
                    res.sendRedirect(contextPath+this.timeoutpage);
                }
                //modify by qiuyun 2013-12-25
                //在后台计算时间范围内，如果前台已登录则强制退出系统
                
                else if("1".equals(isContrl)&&!isExceptUser(authBean)&&this.isCaling())
                {
                	 msg="后台有正在计算的任务，强制退出系统！";
                	 session.setAttribute("msg", msg);
                     res.sendRedirect(contextPath+this.otherlogin);
                }
                else{
                	LinkedHashMap sysparaMap = new LinkedHashMap();
                	sysparaMap.put(Constans.USE_SINUSERCTRL,use_sinuserctrl);
                	sysparaMap.put(Constans.AUTHTXT, authtextstorepath);
                	Authorization auth = authBean.getAuthToken();
                	 String sinUserCtrl = (String)sysparaMap.get(Constans.USE_SINUSERCTRL); // 是否需要控制一个用户名同时只能登录一个
		                
		                if("1".equals(sinUserCtrl)) {
		                	String loginPwd = auth.getLoginPwd()+"\n";
		                	String authTextStorepath = (String)sysparaMap.get(Constans.AUTHTXT);  
		                	String name=authTextStorepath+auth.getT00_user().getUsername()+".txt";
		                	String newLoginPwd= FileUtils.readFile(name);
		                    if(!"".equals(loginPwd) && !"".equals(newLoginPwd) && !loginPwd.equalsIgnoreCase(newLoginPwd)) {
		                    	msg="当前用户已在其它地方登录！";
		                   	    session.setAttribute("msg", msg);
		                    	res.sendRedirect(contextPath+this.otherlogin);
		                    }
		                }
                    chain.doFilter(request, response);
                }
                
//                //操作权限验证（功能权限）
//                /**
//                 * 系统缓存了每个modulekey所对应的ActionPath
//                 * 用户登录后可知该用户可以访问系统多少页面
//                 * 在本处可以判断当前用户访问的页面是否是权限范围内的。
//                 */
//                Authorization auth = authBean.getAuthToken();
//                if(!auth.havePagerAccessPower(path)){
//                    //path = req.getContextPath() + File.separator + this.privpage;
//                    //res.sendRedirect(path);
//                    res.sendRedirect(this.privpage);
//                }


            }

            // Pass control on to the next filter
            //chain.doFilter(request, response);

        }
        catch (Exception ee) {
            ee.printStackTrace();
        }

    }

    /**
     * Place this filter into service.
     *
     * @param filterConfig The filter configuration object
     */
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        this.privpage = filterConfig.getInitParameter("privpage");
        this.timeoutpage = filterConfig.getInitParameter("timeoutpage");
        this.otherlogin = filterConfig.getInitParameter("otherlogin");
        this.authtextstorepath = filterConfig.getInitParameter("authTextStorepath");
        this.use_sinuserctrl = filterConfig.getInitParameter("use_sinUserValue");
        this.encoding = filterConfig.getInitParameter("encoding");
        String value = filterConfig.getInitParameter("ignore");

        if (value == null)
            this.ignore = true;
        else if (value.equalsIgnoreCase("true"))
            this.ignore = true;
        else if (value.equalsIgnoreCase("yes"))
            this.ignore = true;
        else
            this.ignore = false;
        
       //modify by qiuyun 增加其他对象的初始化
        this.initOther();

    }

    /**
     * Select an appropriate character encoding to be used, based on the
     * characteristics of the current request and/or filter initialization
     * parameters. If no character encoding should be set, return
     * <code>null</code>.
     * <p>
     * The default implementation unconditionally returns the value configured
     * by the <strong>encoding</strong> initialization parameter for this
     * filter.
     *
     * @param request The servlet request we are processing
     */
    protected String selectEncoding(ServletRequest request) {

        return (this.encoding);

    }
    /**
     * 初始化其他对象
     * @return
     */
	protected void initOther() {
		
		String strClasspath = this.getClass().getResource("").getPath();
		String SysHomeDir = "";
		try {
			SysHomeDir = URLDecoder.decode(strClasspath, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//取得真实的系统目录
		SysHomeDir = SysHomeDir.substring(0, SysHomeDir.indexOf("/WEB-INF/"));

		FileSystemResource resource = new FileSystemResource(SysHomeDir
				+ "/WEB-INF/system-config.xml");
		
		//初始化system_config.xml对象
		sysConfig = new XMLProperties(resource);
		
		//从配置文件中读取JDNI名字		
		String jndiName=sysConfig.getProperty("jndi_name");		
		if(jndiName==null||"".equals(jndiName))
		{
			System.out.println("*********注意system_config.xml配置文件有错误，请检查jndi_name节点的配置**************");
		}
		
		try {
			Context ctx = new InitialContext();
			//根据JDNI名字初始化数据源	
			
			ds = (DataSource) ctx.lookup(jndiName);

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //初始化缓存
		cm = new CatchManager(sysConfig, ds, new HashMap());
		

	}
	
	 /**
     * 后台是否在计算中
     * @return
     */
	protected boolean isCaling()
	{		
		boolean isQuery=false;//是否去查询t18_task_fact表有正在执行的任务
		//后台计算开始的时间和结束时间
		Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
		String startTime_str=paraMap.get(Constans.PARA_SERVER_CAL_BEGIN);
		String endTime_str=paraMap.get(Constans.PARA_SERVER_CAL_END);
		if(startTime_str==null||"".equals(startTime_str))
		{
			startTime_str=Constans.SERVER_CAL_BEGIN_TIME;//默认值晚八点20:00
		}
		if(endTime_str==null||"".equals(endTime_str))
		{
			endTime_str=Constans.SERVER_CAL_END_TIME;//默认值早八点08:00
		}
		
		Date currTime=new Date();//当前时间
		String currDate=DateUtils.dateToStringShort(currTime);//当前日期
		
		Date startTime_date=DateUtils.stringToDate(currDate+" "+startTime_str+":00");//后台计算开始时间
		Date endTime_date=DateUtils.stringToDate(currDate+" "+endTime_str+":00");//后台计算结束时间
		
		//开始时间在结束时间之前说明不是跨天的时间范围
		if(startTime_date.before(endTime_date))
		{   
			//当前时间在开始时间和结束时间的中间
			if(currTime.after(startTime_date)&&currTime.before(endTime_date))
			{
				isQuery=true;
			}
		}else{//跨天
			
			//当前时间在开始时间之后或结束时间之前
			if(currTime.after(startTime_date)||currTime.before(endTime_date))
			{
				isQuery=true;
			}
			
		}
		
		boolean isCaling=false;
		
		if(isQuery)
		{
			Connection conn=null;
			Statement stmt=null;
			ResultSet result=null;
			try {
				conn=ds.getConnection();
				stmt=conn.createStatement();
				String sql="select count(*) from t18_task_fact t where  t.calstatus="+Constans.SERVER_CAL_STATUS;
				result=stmt.executeQuery(sql);
				while(result.next())
				{
					int count=result.getInt(1);
					if(count>0)
					{
						isCaling=true;
						
					}
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				try {
					if(result!=null)
					{
						result.close();//数据库先开后关
					}
					if(stmt!=null)
					{
						stmt.close();
					}
					if(conn!=null)
					{
						conn.close();//关闭数据库
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
				
			}
			
			
		}
		
		
		return isCaling;
		
	}
	/**
     * 是否是例外的用户
     * @return
     */
	protected boolean isExceptUser(AuthBean authBean)
	{
	    boolean	isExceptUser=false;
		Authorization auth=authBean.getAuthToken();
		String currUser=auth.getT00_user().getUsername();
		Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
		String exceptUser= paraMap.get(Constans.PARA_SERVER_CAL_CONTRL_USER);
		String[] users=exceptUser.split(",");
	 
		for(String user :users)
		{
			if(currUser.equals(user))
			{
				isExceptUser=true;
				break;
			}
			
		}
		
		return isExceptUser;
	
	}
		

}
