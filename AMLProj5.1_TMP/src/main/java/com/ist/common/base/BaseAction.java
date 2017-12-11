package com.ist.common.base;

/**
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: 北京银丰新融科技开发有限公司</p>
 * @author not attributable
 * @version 1.0
 */

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.LabelValueBean;
import org.springframework.context.ApplicationContext;
import org.springframework.web.struts.ActionSupport;

import com.google.gson.Gson;
import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.impfile.bmp.platform.dto.Statistic;
import com.ist.impfile.bmp.platform.dao.T00_operate_logDAO;
import com.ist.impfile.bmp.platform.dto.T00_operate_log;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.StaticVariable;
import com.ist.common.attachment.bo.AttachmentManage;
import com.ist.common.attachment.dao.T01_attachmentDAO;
import com.ist.common.attachment.dto.T01_attachment;
import com.ist.common.data.importing.ConstantImporting;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.common.util.DateUtils;
import com.ist.common.sequence.SeqMgr;

public class BaseAction extends ActionSupport implements java.io.Serializable {

    public Logger logger = LogUtils.getLogger(this.getClass().getName());

    public ApplicationContext context = null;

    public SqlMapClient sqlMap = null;

    public CatchManager cm = null;
    
    private XMLProperties  sysConfig;

    /* 每页的记录数 */
    public int intPageSize = 15;

    /* 总页数 */
    public int intPageCount = 1;

    /* 总记录数 */
    public int intRowCount = 0;

    /* 当前的页数 */
    public int intPage = 1;

    public BaseAction() {
        super();
    }

    /*
     * 重写Spring ActionSupport 的方法 将上下文关系传入，才能获取ApplicationContext (non-Javadoc)
     *
     * @see org.springframework.web.struts.ActionSupport#setServlet(org.apache.struts.action.ActionServlet)
     */
    public void setServlet(ActionServlet actionServlet) {
        // TODO Auto-generated method stub
        super.setServlet(actionServlet);
        context = getWebApplicationContext();
        sqlMap = (SqlMapClient) context.getBean("sqlMapClient");
        cm = (CatchManager) context.getBean("catchManager");
        sysConfig =  (XMLProperties) context.getBean("sysConfig");
    }

    /**
     * 对Action的预处理动作，目前执行对add动作的令牌设置、判断，防止重复插入
     * 预处理中要求后续的动作不再进行，则在request中的attribute中设置“goWayFlag”为false
     * 注意：添加action的parameter命名标准为："add****"、"add****Do"
     *
     * @param mapping
     *            ActionMapping
     * @param form
     *            ActionForm
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     * @return ActionForward
     */
    public ActionForward preExecute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String preaction = mapping.getParameter();
        request.setAttribute("goWayFlag", "true");
        if (preaction == null)
            preaction = "";

        // 对添加(插入)动作进行预处理
        if (preaction.indexOf("add") == 0) {

            // 添加(插入)页面的处理动作
            if (preaction.lastIndexOf("Do") == (preaction.length() - 2)) {
                // 重复提交添加动作，不处理
                if (!isTokenValid(request)) {
                    request.setAttribute("goWayFlag", "false");// 不再进行Action中的动作处理
                    return mapping.findForward("success");
                } else {
                    // 正常提交添加动作，进行处理，并重置令牌
                    resetToken(request);
                    saveToken(request);
                }
            } else {
                // 添加(插入)页面的查询动作
                // 为add页面设置令牌标识
                saveToken(request);
            }
        }

        return null;// Action中继续执行，不需返回具体值
    }

    /**
     * 取得用户认证信息
     *
     * @param request
     *            HttpServletRequest
     * @return Authorization
     */
    public Authorization getAuthorization(HttpServletRequest request) {
        HttpSession session = request.getSession();
        AuthBean authBean = (AuthBean) session.getAttribute("authBean");
        return authBean.getAuthToken();
    }

    /**
     * 将Map的值转换进行排序后，可以直接在页面显示的options对象.
     *
     * @param map
     *            Map 下拉框的主要内容
     * @param notinMap
     *            Map 本下拉框不包含的
     * @param haveAll
     *            boolean true：包含“--请选择--” false：只包含map内容
     * @param sortType
     *            ：key 按key值排序，value 按显示内容排序
     * @return
     */
    public ArrayList getOptionsListByMap(Map map, Map notinMap, boolean haveAll, String sortType) {
        int len;
        String key = "";
        Comparator cmp = null;

        if (StringUtils.equals("value", sortType)) {
            cmp = new MapValueCmp();
        } else {
            cmp = new MapKeyCmp();
        }

        if (map == null || (len = map.size()) < 0) {
            return new ArrayList();
        }

        ArrayList list = new ArrayList(len + 1);
        // 全部
        if (haveAll) {
            list.add(new LabelValueBean("", "--请选择--"));
        }

        Object[] sets = map.entrySet().toArray();
        Arrays.sort(sets, cmp);

        for (int i = 0; i < sets.length; i++) {
            Entry entry = (Entry) sets[i];
            key = (String) entry.getKey();
            if (notinMap == null || !notinMap.containsKey(key)) {
                list.add(new LabelValueBean(key, (String) entry.getValue()));
            }
        }

        return list;
    }

    /**
     * 将Map的值转换可以直接在页面显示的options对象
     *
     * @param map
     *            Map 下拉框的主要内容
     * @param notinMap
     *            Map 本下拉框不包含的
     * @param havaAll
     *            boolean true：包含“--请选择--” false：只包含map内容
     * @return ArrayList
     */
    public ArrayList getOptionsListByMap(Map map, Map notinMap, boolean haveAll) {
        ArrayList list = new ArrayList();
        // 全部
        if (haveAll) {
            list.add(new LabelValueBean("", "--请选择--"));
        }
        //
        if (notinMap == null) {
            notinMap = new HashMap();
        }
        // 获得键值组的值
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {
            // 获得key值
            Object key = iter.next();
            // 获得value值
            Object value = map.get(key);
            // 如果不包含某一个key值,就不把它放到ArrayList中
            if (notinMap.containsKey(key)) {
                continue;
            }
            list.add(new LabelValueBean(String.valueOf(key), String
                    .valueOf(value)));
        }
        return list;
    }

    /**
     * 将Map的值转换可以直接在页面显示的options对象（按头尾分段存放）
     *
     * @param map
     *            Map 下拉框的主要内容
     * @param notinMap
     *            Map 本下拉框放在尾部的
     * @param havaAll
     *            boolean true：包含“--请选择--” false：只包含map内容
     * @return ArrayList
     */
    public ArrayList getOptionsListByMapForHand(Map map, Map notinMap,
            boolean haveAll) {
        ArrayList list = new ArrayList();
        // 全部
        if (haveAll) {
            list.add(new LabelValueBean("", "--请选择--"));
        }
        //
        if (notinMap == null) {
            notinMap = new HashMap();
        }
        // 获得键值组的值
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {
            // 获得key值
            Object key = iter.next();
            // 获得value值
            Object value = map.get(key);
            // 如果不包含某一个key值,就不把它放到ArrayList中
            if (notinMap.containsKey(key)) {
                continue;
            }
            list.add(new LabelValueBean((String) key, (String) value));
        }
        // 获得键值组的值
        Iterator iter_tail = notinMap.keySet().iterator();
        while (iter_tail.hasNext()) {
            // 获得key值
            Object key = iter_tail.next();
            // 获得value值
            Object value = notinMap.get(key);
            // 如果不包含某一个key值,就不把它放到ArrayList中

            list.add(new LabelValueBean((String) key, (String) value));
        }
        return list;
    }

    /**
     * 需求：页面显示时需要分多栏显示，因此需要在Action中组织好所需要的信息； 根据list，每行显示的条数，拆分为新的LIST
     *
     * @param list
     *            ArrayList
     * @param colspans
     *            int
     * @return ArrayList add by heguoqiang 2006-03-16
     */
    public ArrayList getSubListByList(ArrayList list, int colspans) {
        ArrayList new_list = new ArrayList();
        ArrayList subList = new ArrayList();
        Iterator iter = list.iterator();
        int i = 0;
        while (iter.hasNext()) {
            i++;
            subList.add(iter.next());
            if (i % colspans == 0) {
                new_list.add(subList.clone());
                subList = new ArrayList();
            }
        }

        if (i > 0 && i % colspans != 0) {
            new_list.add(subList.clone());
        }
        return new_list;
    }

    /**
     * 根据传入的keyList、valueList组装为Options的list
     *
     * @param keyList
     *            ArrayList key项
     * @param valueList
     *            ArrayList value项
     * @param haveAll
     *            boolean 是否带全选项
     * @return ArrayList
     */
    public ArrayList getOptionsByList(ArrayList keyList, ArrayList valueList,
            boolean haveAll) {
        ArrayList list = new ArrayList();
        // 全部
        if (haveAll) {
            list.add(new LabelValueBean("", "--请选择--"));
        }
        if (keyList == null || valueList == null
                || keyList.size() != valueList.size()) {
            keyList = new ArrayList();
            valueList = new ArrayList();
        }
        for (int i = 0; i < keyList.size(); i++) {
            list.add(new LabelValueBean((String) keyList.get(i),
                    (String) valueList.get(i)));
        }
        return list;
    }

    /**
     * 对传入的list，反序排列
     *
     * @param list
     *            ArrayList key项
     * @return ArrayList
     */
    public ArrayList getConverseList(ArrayList list) {
        ArrayList retList = new ArrayList();

        for (int i = list.size() - 1; i >= 0; i--) {
            retList.add(list.get(i));
        }
        return retList;
    }

    /**
     * 取得Sequence的值
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getSequenceNextVal(String seqname) throws Exception {
        String key = "";
        String sql = "";
        if(cm.isDbType("oracle")){
            sql = "select " + seqname.toUpperCase() + ".Nextval  from dual";
        }
        else if(cm.isDbType("db2")){
            sql = " select NEXTVAL FOR " + seqname + " from sysibm.sysdummy1 ";
        }else{
            throw new Exception("不支持此数据库！");
        }
        Long seqNextV = (Long) sqlMap.queryForObject("getValueLong", sql);
        key = String.valueOf(seqNextV);
        if (key.equals("")) {
            throw new Exception("获取主键失败！");
        }
        return key;
    }



    /**
     * 将页面传入10位的Startdate数据转19位的datetime
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getStartDateTime(String startdate) throws Exception {
    	if(startdate == null)return startdate;
    	if(startdate.indexOf(":") > -1)return startdate;
        String time = " 00:00:00";
        String startdatetime = startdate+time;
        Date d = DateUtils.stringToDate(startdatetime);
        if(d==null) startdatetime = "";
        if (startdate.equals("")) {
            startdatetime = startdate;
        }
        return startdatetime;
    }

    /**
     * 将页面传入10位的enddate数据转19位的datetime
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getEndDateTime(String enddate) throws Exception {
    	if(enddate == null)return enddate;
    	if(enddate.indexOf(":") > -1)return enddate;
        String time = " 23:59:59";
        String enddatetime = enddate+time;
        Date d = DateUtils.stringToDate(enddatetime);
        if(d==null) enddatetime = "";
        if (enddate.equals("")) {
            enddatetime = enddate;
        }
        return enddatetime;
    }

    /**
     * 取得Sequence的值
     *
     * @param seqname
     *            String
     * @return String
     */
    // public String getNextVal(String tableName, String colName) {
    // try {
    // IDBean idBean = IDBean.getInstance();
    // return idBean.getID(tableName, colName);
    // } catch (Exception ex) {
    // return null;
    // }
    // }
    // ==== 分页相关方法
    // ==============================================================================
    /**
     * 说明：每页的记录数属性
     *
     * @param intPageSize
     *            每页的记录数
     */
    public void setIntPageSize(int intPageSize) {
        this.intPageSize = intPageSize;
    }

    /**
     * 说明：每页的记录数属性
     *
     * @return int 每页的记录数
     */
    public int getIntPageSize() {
        return intPageSize;
    }

    /**
     * 说明：总页数属性
     *
     * @param intPageCount
     *            总页数
     */
    public void setIntPageCount(int intPageCount) {
        this.intPageCount = intPageCount;
    }

    /**
     * 说明：总页数属性
     *
     * @return int 总页数
     */
    public int getIntPageCount() {
        return intPageCount;
    }

    /**
     * 说明：总记录数属性
     *
     * @param intRowCount
     *            总记录数
     */
    public void setIntRowCount(int intRowCount) {
        this.intRowCount = intRowCount;
    }

    /**
     * 说明：总记录数属性
     *
     * @return int 总记录数
     */
    public int getIntRowCount() {
        return intRowCount;
    }

    /**
     * 说明：当前的页数
     *
     * @param intPage
     *            当前的页数
     */
    public void setIntPage(int intPage) {
        this.intPage = intPage;
    }

    /**
     * 说明：当前的页数
     *
     * @return int 当前的页数
     */
    public int getIntPage() {
        return intPage;
    }

    public int getStartRec(int intPage) {
        int iStartRec = 0;
        iStartRec = (intPage - 1) * intPageSize;
        return iStartRec;
    }

    /**
     * 说明：取得分页信息（个部分通用）
     *
     * @param totalRow
     *            总的记录数
     * @param intPage
     *            当前页数
     * @return Vector 分页信息
     */
    public Vector getPageInfo(int totalRow, int intPage) {
        Vector pageInfo = new Vector();
        // 总记录数
        intRowCount = totalRow;
        // 总页数
        intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
        // 调整当前页数合法
        if (intPage > intPageCount)
            intPage = intPageCount;
        if (intPage < 1)
            intPage = 1;
        // 调整上、下页数
        int prePage = 1;
        int nextPage = intPageCount;
        if (intPage > 1)
            prePage = intPage - 1;
        if (intPage < intPageCount)
            nextPage = intPage + 1;
        // 分页信息存于向量中
        pageInfo.add(new Integer(intRowCount));
        pageInfo.add(new Integer(intPageCount));
        pageInfo.add(new Integer(intPage));
        pageInfo.add(new Integer(prePage));
        pageInfo.add(new Integer(nextPage));
        return pageInfo;
    }

    /**
     * 取得分页字符串
     *
     * @param totalRow
     *            总页数
     * @param intPage
     *            当前页数
     * @param url
     *            提交处理路径
     * @param param
     *            参数信息
     * @return 取得分页信息
     */
    public String getPageInfoStr(int totalRow, int intPage, String url,
            String param) {
        // 取得分页信息
        Vector pageInfo = this.getPageInfo(totalRow, intPage);
        // 取得分页字符串
        return this.getPageInfoStr(pageInfo, intPage, url, param);
    }

    /**
     * 取得分页字符串
     * ************************************************************************
     * 分页信息必须在名字为“form1”的form中
     * 当点击时执行checkForm(command)函数(command=turnPage),执行必要的页面处理 页号变量为＝intPage
     * ************************************************************************
     *
     * @param pageInfo
     *            分页向量
     * @param intPage
     *            页号
     * @return 取得分页信息
     */

    public String getPageInfoStr(Vector pageInfo, int intPage, String url,
            String param) {
        if (param == null || param.equals("")) {
            param = "p=1";
        }
        String pref1 = "&";
        String pref;
        // 等于-1是表示没有出现过"?"
        if (url.indexOf("?") > -1) { // 当前url含有参数
            pref = "&";
        } else {
            pref = "?";
        }
        if (intPage == 0) {
            intPage = 1;
        }
        // pageStr存放分页信息
        StringBuffer pageStr = new StringBuffer();//将pageheadStr、pagemidStr、pageendStr拼接起来
        StringBuffer pageheadStr = new StringBuffer();//存储“第一页”“上一页”图标位置
        StringBuffer pagemidStr = new StringBuffer();//存储“共 xx 条记录 共 xx 页 当前第 xx 页”图标位置
        StringBuffer pageendStr = new StringBuffer();//存储“下一页”“最后一页”图标位置
        // 分类信息全部存在
        if (pageInfo.size() == 5) {
        	pagemidStr.append("<span></span>");
        	pagemidStr.append("共 " + pageInfo.elementAt(0).toString() + " 条记录");
        	pagemidStr.append(" 共 " + pageInfo.elementAt(1).toString() + " 页");
        	pagemidStr.append(" 当前第 " + (intPage) + " 页");
        	pagemidStr.append("<span></span>");
            int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
            int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
            int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
            int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
            // 当审批等操作返回时会因为第二页最后一条记录消失而无法返回第一页。
            // 三种情况需出现"上一页",第三种情况比较特殊,比如删除了一条记录后返回第二页,但是第二页已经没有了数据,此时也要显示上一页的链接,否则就返回不到上一页了
            if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
                    * this.intPageSize + 1 <= tal))
                    || pageInfo.elementAt(0).toString().equals("0")) {
            	pageheadStr.append(" <span class=\"p_first01\"></span>");//“第一页”不可点
            	pageheadStr.append(" <span class=\"p_prev01\"></span>");//“上一页”不可点
            } else {
            	pageheadStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + 1 + "';goPage()\"><span class=\"p_first\"></span></a>");//“第一页”可点
            	
            	pageheadStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pre + "';goPage()\"><span class=\"p_prev\"></span></a>");//“上一页”可点
            }

            if (nex == 0 || (cur >= nex)) {
            	pageendStr.append(" <span class=\"p_last01\"></span>");//“下一页”不可点
            	pageendStr.append(" <span class=\"p_next01\"></span>");//“最后一页”不可点
            } else {
            	pageendStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + nex + "';goPage()\"><span class=\"p_next\"></span></a>");//“下一页”可点
            	
            	pageendStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pageInfo.elementAt(1) + "';goPage()\"><span class=\"p_last\"></span></a>");//“最后一页”可点
            }

            int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

            // 超过1000页,则显示为输入矿的值
            if (totalPage < 1000) {
            	pageendStr
                        .append(" <span class=\"p_select\">跳到<select name='intPage' onChange=\"goPage()\">");

                for (int i = 1; i <= totalPage; i++) {
                    String se = (intPage == i) ? " selected " : "";
                    pageendStr.append("<option value='" + i + "'" + se + ">" + i
                            + "</option>");
                }
                if (totalPage == 0) {
                	pageendStr.append("<option value='1'>1</option>");
                }
                pageendStr.append("</select></span>");
            } else {
            	pageendStr
                        .append(" 跳到<input type=\"text\" size=4 class='text_white' name='intPage'>");
            	pageendStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
            }

            //
            pageendStr.append("<script language=\"javascript\">\n");
            pageendStr.append("function goPage()\n{");
            pageendStr.append(" var obj=document.all.intPage.value;");
            pageendStr
                    .append("if(isNaN(obj) || parseInt(obj)<1){ alert('请输入正确的页码,必须为正整数!');document.all.intPage.focus();return;}");
            pageendStr.append(" if(parseInt(obj)>parseInt(" + totalPage
                    + ")){document.all.intPage.value=" + totalPage + ";}");

            pageendStr.append("document.forms[0].action=\"" + url + pref
                    + "wherefrom=trunpage&" + param + pref1 + "intPage="
                    + "\" + document.all.intPage.value;"
                    + "document.forms[0].submit();}\n");
            pageendStr.append("</script>");
            
            pageStr.append(pageheadStr);
            pageStr.append(pagemidStr);
            pageStr.append(pageendStr);
            
        } else {
            pageStr.append("&nbsp;");
        }
        return pageStr.toString();
    }

    /**
     * 获取搜索对象
     *
     * @param searchObj
     *            本次查询的搜索对象，就是DTO
     * @param countSqlMapID
     *            取得本次查询总记录数的SQLMAP的ID
     * @param request
     *            HttpServletRequest
     * @param form
     *            ActionForm 必须经过造型后的
     * @param url
     *            页面跳转的URL
     * @return searchObj
     * @throws Exception
     */
    public BaseDTO getSearchObject(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form, String countSqlMapID,
            String url) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        //
        int intPage = 1;
        // 隐含产生
        String sessionID = searchObj.getClass().getName() + "_" + url;
        // logger.debug("=="+sessionID);
        //

        String wherefrom = StringUtils.trimToEmpty(request
                .getParameter("wherefrom"));

        if (newsearchflag.equals("1")) {// 新的查询
            // if(!wherefrom.equals("trunpage")){//新的查询
            PropertyUtils.copyProperties(searchObj, form);
            // 本次查询总页数
            BaseDAO baseDAO = new BaseDAO();
            int totalRow = baseDAO.getListCount(sqlMap, countSqlMapID,
                    searchObj);
            searchObj.setTotalRow(totalRow);
            // =====

            // =====
        } else {// 翻页
            searchObj = (BaseDTO) session.getAttribute(sessionID);
            String intPageStr = request.getParameter("intPage");
            //
            if (intPageStr == null)
                intPage = searchObj.getIntPage();
            else {
                try {
                    intPage = Integer.parseInt(intPageStr);
                } catch (Exception e) {
                }
                searchObj.setIntPage(intPage);
            }

            if (!wherefrom.equals("trunpage")) {
                BaseDAO baseDAO = new BaseDAO();
                int totalRow = baseDAO.getListCount(sqlMap, countSqlMapID,
                        searchObj);
                searchObj.setTotalRow(totalRow);
            }

        }

        searchObj.setNewsearchflag(newsearchflag);
        session.setAttribute(sessionID, searchObj);

        String pageInfo = this.getPageInfoStr(searchObj.getTotalRow(), intPage,
                url, "");

        request.setAttribute("pageInfo", pageInfo);
        
        /*
         * 为了解决列表页面加序号的问题，此处需要多传两个参数到页面。特增加
         * begin...
         */
        request.setAttribute("cebbank_intpagesize",new Integer(this.intPageSize));
        request.setAttribute("cebbank_intpage",new Integer(intPage));
        request.setAttribute("currRecordNum",new Integer(this.getStartRec(intPage)));
        
        /*
         * end...
         */
        return searchObj;
    }

    /**
     * 获取搜索对象
     *
     * @param searchObj
     *            本次查询的搜索对象，就是DTO
     * @param request
     *            HttpServletRequest
     * @param form
     *            ActionForm 必须经过造型后的
     * @return searchObj
     * @throws Exception
     */
    public BaseDTO getSearchObject(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        // 隐含产生
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        //
        if (newsearchflag.equals("1")) {// 新的查询
            PropertyUtils.copyProperties(searchObj, form);
            // =====

            // =====
            // session.setAttribute( sessionID,searchObj );
        } else {// 翻页
            searchObj = (BaseDTO) session.getAttribute(sessionID);
        }
        session.setAttribute(sessionID, searchObj);

			  /*
         * 为了解决列表页面加序号的问题，此处需要多传两个参数到页面。特增加
         * begin...
         */
        request.setAttribute("cebbank_intpagesize",new Integer(this.intPageSize));
        request.setAttribute("cebbank_intpage",new Integer(intPage));
        request.setAttribute("currRecordNum",new Integer(this.getStartRec(intPage)));
        
        /*
         * end...
         */	 
        return searchObj;
    }

    /**
     * 保存个性化查询条件
     *
     * @param searchObj
     *            搜索对象
     * @param request
     *            HttpServletRequest
     * @throws Exception
     */
    public void saveSearchObject(BaseDTO searchObj, HttpServletRequest request)
	    throws Exception {
		HttpSession session = request.getSession();
		// 隐含产生
		String  url = request.getRequestURI();
		String sessionID = searchObj.getClass().getName() + "_" + url;
		session.setAttribute(sessionID, searchObj);
	}

    /**
     * 将数组转换为指定分隔符连接的字符串
     *
     * @param sourArray
     *            待转换数组
     * @param splitter
     *            分隔符
     * @param invertedComma
     *            引号类型
     * @return String
     */
    public String formatStr(String[] sourArray, String splitter,
            String invertedComma) {
        String midSpl = invertedComma + splitter + invertedComma;
        String result = invertedComma + StringUtils.join(sourArray, midSpl)
                + invertedComma;
        return result;
    }

    public ArrayList getAttachmentList(HttpServletRequest request,
            String businesskey, String mode, String attachtype, String systemkey)
            throws Exception {
        return this.getAttachmentList(request, businesskey, mode, attachtype,
                systemkey, "", "");
    }

    
    
    /**
     * 显示附件列表 列出同一个业务编码下的所有附件。 新建时（即第一次进入），业务编码可以为空或空字符串。文档类型和所属子系统不能为空。
     * 当mode的值为edit时，可以上传和编辑附件；当mode的值为null、""、view等不是edit时，仅可以显示。
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            业务编码
     * @param mode
     *            是否可以编辑和上传
     * @param businesskey
     *            附件文档类型
     * @param mode
     *            所属子系统
     * @param title
     *            默认正文名称
     * @param template
     *            正文模版
     * @return ArrayList
     * @throws SQLException
     * @throws SQLException
     * @throws Exception
     */
    public ArrayList getAttachmentList(HttpServletRequest request,
            String businesskey, String mode, String attachtype,
            String systemkey, String title, String template) throws SQLException {
        ArrayList t01_attachmentList = new ArrayList();
        ArrayList t01_attachment_docList = new ArrayList();
        String keyStr = "";
        String docKeyStr = "";
        if (businesskey == null) {
            businesskey = "";
        }

        // 取得当前用户
        Authorization auth = this.getAuthorization(request);
        String currUserName = auth.getT00_user().getUsername();

        if (!businesskey.equals("")) {
            T01_attachmentDAO t01_attachmentDAO = (T01_attachmentDAO) context
                    .getBean("t01_attachmentDAO");
            T01_attachment t01_attachment = new T01_attachment();

            // 设置业务编码并从数据库取出数据
            t01_attachment.setBusinesskey(businesskey);

            /**
             * 文档类型：01-文档
             */
            t01_attachment.setAttachtype("01");
            t01_attachment_docList = t01_attachmentDAO.getT01_attachmentList(
                    sqlMap, t01_attachment);
            if (t01_attachment_docList.size() > 0) {
                // 把附件编码列表转成字符串，用“,”分隔
                for (int i = 0; i < t01_attachment_docList.size(); i++) {
                    docKeyStr = docKeyStr
                            + ((T01_attachment) t01_attachment_docList.get(i))
                                    .getAttachkey() + ",";
                }
                docKeyStr = docKeyStr.substring(0, docKeyStr.lastIndexOf(","));
            }

            /**
             * 文档类型：02-附件
             */
            t01_attachment.setAttachtype("02");
            t01_attachmentList = t01_attachmentDAO.getT01_attachmentList(
                    sqlMap, t01_attachment);

            if (t01_attachmentList.size() > 0) {
                // 把附件编码列表转成字符串，用“,”分隔
                for (int i = 0; i < t01_attachmentList.size(); i++) {
                    keyStr = keyStr
                            + ((T01_attachment) t01_attachmentList.get(i))
                                    .getAttachkey() + ",";
                }
                keyStr = keyStr.substring(0, keyStr.lastIndexOf(","));
            }
        }

        request.setAttribute("t01_attachment_docList", t01_attachment_docList);
        request.setAttribute("t01_attachmentList", t01_attachmentList);
        request.setAttribute("docKeyString", docKeyStr);
        request.setAttribute("attachkeyString", keyStr);
        request.setAttribute("currentUser", currUserName);
        request.setAttribute("realUser", auth.getT00_user().getRealname());


        if (mode.equalsIgnoreCase("new")) {
            request.setAttribute("showMode", "new");
        } else if (mode.equalsIgnoreCase("edit")) {
            request.setAttribute("showMode", "edit");
        } else {
            request.setAttribute("showMode", "view");
        }

        request.setAttribute("systemkey", systemkey); // 所属子系统
        request.setAttribute("title", title); // 默认正文名称
        request.setAttribute("template", template); // 正文模版

        return t01_attachmentList;
    }
    
    /**
     * 保存附件 1、将数据库中业务编码字段值与businesskey参数相同的记录找出来， 2、将这些记录的业务编码字段置为空字符串，
     * 3、根据页面上提交的附件编码，将附件编码对应的业务编码再置为businesskey参数的值（这样做是为了处理页面上删除的附件）
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            业务编码
     * @return boolean
     * @throws Exception
     */
    public boolean saveAttachment(SqlMapClient sqlMap,
            HttpServletRequest request, String businesskey) throws Exception {
        AttachmentManage am = (AttachmentManage) context
                .getBean("attachmentManage");
        return am.saveAttachment(sqlMap, request, businesskey);
    }

    /**
     * 拷贝附件 1、新的业务编码作为参数传进来
     * 2、根据页面上得到的附件编码，将这些附件编码数据记录拷贝一份，并生成新的附件编码插入表中，对应的业务编码为businesskey参数
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            业务编码
     * @return boolean
     * @throws Exception*/
     
    public boolean copyAttachment(SqlMapClient sqlMap,
            HttpServletRequest request, String businesskey) throws Exception {
        AttachmentManage am = (AttachmentManage) context
                .getBean("attachmentManage");
        return am.copyAttachment(sqlMap, request, businesskey);
    }


    public ArrayList chg(ArrayList statList,Statistic statistic) throws Exception{
        HashMap titleMap =statistic.getTitleMap();

        //统计行字段名称
        String rowStr = statistic.getRowStr();
        //统计列字段名称
        String colStr = statistic.getColStr();
        //统计数据字段名称
        String valsStr =statistic.getValsStr();

        //是否行统计
        boolean isCntRow = statistic.isCntRow();
        boolean isCntCol = statistic.isCntCol();


        ArrayList tmpDataList = new ArrayList();
        ArrayList tmpList = null;
        ArrayList rsltList = new ArrayList(128);
        HashMap tmpRowMap = null;
        HashMap tmpDataMap = null;
        Set colSet = new HashSet();
        StringBuffer rowSb = null;
        String tmpRowStr = null;

        String[] rows = StringUtils.split(rowStr,',');
        String[] rowVal = new String[rows.length];

        BigDecimal tmpRow = new BigDecimal(0);
        BigDecimal[] tmpCol = null;

        Iterator iter = statList.iterator();
        while (iter.hasNext()) {
            Object bean = iter.next();

            // 取行的当前值
            rowSb = new StringBuffer();
            tmpRowMap = new HashMap();
            for (int i = 0; i < rows.length; i++) {
                rowVal[i] = BeanUtils.getProperty(bean, rows[i]);
                rowSb.append("^").append(rowVal[i]);
                tmpRowMap.put(rows[i], rowVal[i]);
            }

            // 行发生变化，生成一个新的map
            if (!StringUtils.equals(tmpRowStr, rowSb.toString())) {
                tmpDataMap = new HashMap();
                tmpRowStr = rowSb.toString();
                tmpDataMap.putAll(tmpRowMap);
                tmpDataList.add(tmpDataMap);

                if(isCntRow){
                    tmpRow = new BigDecimal(0);
                }
            }

            //取列信息
            String col_key = BeanUtils.getProperty(bean, colStr);
            if (!colSet.contains(col_key)) {
                colSet.add(col_key);
            }

            //取值
            String col_val = BeanUtils.getProperty(bean, valsStr);
            tmpDataMap.put(col_key, col_val);
            //是否生成行小计
            if(isCntRow){
                tmpRow = addBigDec(tmpRow,col_val);
                tmpDataMap.put("COL_CNT", tmpRow);
            }
        }

        Object[] colkeys = colSet.toArray();
        Arrays.sort(colkeys);

        //需生成列小计
        if(isCntCol){
            if(isCntRow){
                tmpCol = new BigDecimal[colkeys.length+1];
            }else{
                tmpCol = new BigDecimal[colkeys.length];
            }

        }

        //生成表标题
        tmpList = new ArrayList(colkeys.length+rows.length);
        //表的行标题
        for (int i = 0; i < rows.length; i++) {
            tmpList.add(getVal(titleMap,rows[i]));
        }
        //表的列标题
        for (int i = 0; i < colkeys.length; i++) {
            tmpList.add(colkeys[i]);
        }
        if(isCntRow){
            tmpList.add("合计");
        }
        rsltList.add(tmpList);

        //生成新的数据list
        iter = tmpDataList.iterator();
        while(iter.hasNext()){
            tmpDataMap = (HashMap) iter.next();
            tmpList = new ArrayList(colkeys.length+rows.length);
            //写行数据
            for (int i = 0; i < rows.length; i++) {
                tmpList.add(getVal(tmpDataMap,rows[i]));
            }

            //写列数据
            for (int i = 0; i < colkeys.length; i++) {
                String tmpVal = getVal(tmpDataMap, (String) colkeys[i]);
                tmpList.add(tmpVal);
                if (isCntCol) {
                    tmpCol[i] = addBigDec(tmpCol[i],tmpVal);
                }
            }
            // 写行总计
            if(isCntRow){
                tmpList.add(tmpDataMap.get("COL_CNT"));
                if(isCntCol){
                    tmpCol[colkeys.length]=addBigDec(tmpCol[colkeys.length],(BigDecimal) tmpDataMap.get("COL_CNT"));
                }
            }
            rsltList.add(tmpList);
        }

        //写列总计
        if(isCntCol){
            tmpList = new ArrayList(colkeys.length+rows.length+1);
            //写行数据
            for (int i = 0; i < rows.length; i++) {
                if(i==0){
                    tmpList.add("总计");

                }else{
                    tmpList.add("");
                }
            }
            //写列数据
            for (int i = 0; i < tmpCol.length; i++) {
                tmpList.add(tmpCol[i]);
            }
            rsltList.add(tmpList);
        }

        return rsltList;
    }

    private BigDecimal addBigDec(BigDecimal bigDec,String str2){
        BigDecimal tmpDec ;
        try {
            tmpDec = new BigDecimal(str2);
        } catch (Exception e) {
           tmpDec = new BigDecimal(0);
        }

        if(bigDec == null){
            bigDec = new BigDecimal(0);
        }
        return bigDec.add(tmpDec);
    }
    private BigDecimal addBigDec(BigDecimal bigDec1,BigDecimal bigDec2){
        if(bigDec1 == null){
            bigDec1 = new BigDecimal(0);
        }
        if(bigDec2 == null){
            bigDec2 = new BigDecimal(0);
        }
        return bigDec1.add(bigDec2);
    }

    private String getVal(Map map,String key){
        if(map ==null||!map.containsKey(key)){
            return "";
        }else{
            return (String) map.get(key);
        }
    }
    
    public BaseDTO getSearchObjectForDSQL(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form, String sql_count,
            String url) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        //
        int intPage = 1;
        // 隐含产生
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        // logger.debug("=="+sessionID);
        //

        String wherefrom = StringUtils.trimToEmpty(request
                .getParameter("wherefrom"));

        if (newsearchflag.equals("1")) {// 新的查询
            // if(!wherefrom.equals("trunpage")){//新的查询
            PropertyUtils.copyProperties(searchObj, form);
            // 本次查询总页数
        	Integer iCount = (Integer) sqlMap.queryForObject( "getIntValue", sql_count);
        	int totalRow = iCount.intValue();
            searchObj.setTotalRow(totalRow);
            // =====

            // =====
        } else {// 翻页
        	if (session.getAttribute(sessionID) != null){
        		 searchObj = (BaseDTO) session.getAttribute(sessionID);
        	}
           
            String intPageStr = request.getParameter("intPage");
            //
            if (intPageStr == null)
                intPage = searchObj.getIntPage();
            else {
                try {
                    intPage = Integer.parseInt(intPageStr);
                } catch (Exception e) {
                }
                searchObj.setIntPage(intPage);
            }

            if (!wherefrom.equals("trunpage")) {
            	Integer iCount = (Integer) sqlMap.queryForObject( "getIntValue", sql_count);
            	int totalRow = iCount.intValue();
                searchObj.setTotalRow(totalRow);
            }

        }

        searchObj.setNewsearchflag(newsearchflag);
        session.setAttribute(sessionID, searchObj);

        String pageInfo = this.getPageInfoStr(searchObj.getTotalRow(), intPage,
                url, "");

        request.setAttribute("pageInfo", pageInfo);

        return searchObj;
    }    
    
    /**
     * 下载文件
     * @param response
     * @param fileName
     * @param bytes
     * @throws IOException
     */
    public void downloadFile(HttpServletResponse response, String fileName,
      byte[] bytes) throws IOException {
     // 设置为下载application/x-download
     response.reset();
     response.setContentType("application/x-download");
     fileName = URLEncoder.encode(fileName, "UTF-8");
     response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
     OutputStream output = null;
		try {
			output = response.getOutputStream();
			output.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(output != null)try {output.flush();} catch (Exception e2) {e2.printStackTrace();}
			if(output != null)try {output.close();} catch (Exception e2) {e2.printStackTrace();}
		} 
    
    }
    
   
    
    /**
     * 取得当前系统数据库连接方式
     * @return String
     * @throws Exception
     */
    public String getCurrentDbLinkKey() throws Exception {
    	LinkedHashMap t00_system_param=cm.getMapFromCache("t00_system_param");
		String dblinkkey = (String) t00_system_param.get("hpom-dm"); 
		if(StringUtils.isEmpty(dblinkkey)) {
			throw new Exception("未对DM数据区的数据库连接方式进行设置！");
		}
		return dblinkkey;
    }    
    
    /**
     * 获取清单列表相关列的SQL语句(自定义数据、查证结果、探索结果等导入清单都要使用)
     * @param tableCode
     * @return String
     */
    public String getCheckListColumnSql(String tableCode) {
    	StringBuffer sql = new StringBuffer();
    	sql.append("select ");
    	sql.append("colkey as column_name,");
    	sql.append("colname as column_comment,");
    	sql.append("'string' as column_type,");
    	sql.append("collength as column_length,");
    	sql.append("'0' as column_point ");
    	sql.append("from T12_programa_cols t1 ");
    	sql.append("where t1.tablecode = '"+tableCode+"'  ");
    	sql.append("and t1.flag = '1' ");
    	sql.append("order by t1.isdefaultfield desc,t1.isapply asc,t1.dispseq ");
    	
    	return sql.toString();
    }
    
    /**
     * 根据清单表代码，获取表对应的列的map信息
     * @param tableCode 表代码
     * @return List
     * @throws Exception
     */
    public List getCheckListColumnListOfMap(String tableCode) throws Exception {
    	List columnList = null;
    	String sql = this.getCheckListColumnSql(tableCode);
    	columnList = sqlMap.queryForList("getCommonListMap", sql);
    	return columnList;
    }
    
    /**
     * 对默认列，加上默认信息的列的map信息
     * @param tableCode 表代码
     * @param target 审计目标编号
     * @return List
     * @throws Exception
     */
    public List addDefault2CheckListColumnListOfMap(String tableCode,String target) throws Exception {
    	List columnListOfMap = null;
    	columnListOfMap = this.getCheckListColumnListOfMap(tableCode);
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String columnName = (String)columnMap.get(ConstantImporting.COLUMN_NAME);//列英文名
    		if(StaticVariable.CHECK_LIST_D_L_SEQ.equalsIgnoreCase(columnName)) {//清单序列(主键)
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_AUTO_SEQUENCE);
    			columnMap.put(ConstantImporting.COLUMN_SEQUENCE_NAME, StaticVariable.CHECK_LIST_SEQUENCE_NAME);
    		}
    		else if(StaticVariable.CHECK_LIST_D_L_TARGET.equalsIgnoreCase(columnName)) {//审计发现编号
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_DEFAULT);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE, target);
    		}
    		else if(StaticVariable.CHECK_LIST_D_L_FLAG.equalsIgnoreCase(columnName)) {//清单标识
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_DEFAULT);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE, "1");
    		}
		}
    	return columnListOfMap;
    }
    
    /**
     * 获取清单表的默认列与被选择列的列的map信息
     * @param tableCode
     * @param target
     * @param selectedList
     * @return
     * @throws Exception
     */
    public List getDefaultAndSelectedCheckListColumnListOfMap(String tableCode,String target,List selectedList) throws Exception {
    	List defaultAndSelectedList = new ArrayList();
    	List columnListOfMap = this.addDefault2CheckListColumnListOfMap(tableCode, target);
    	//没有选择的列，返回全部的列
    	if(selectedList == null || selectedList.size() < 1)return columnListOfMap;   	
    	
    	//默认列
    	defaultAndSelectedList.addAll(this.getDefaultCheckListColumnListOfMap(columnListOfMap));
    	//被选择列
    	defaultAndSelectedList.addAll(this.getSelectedCheckListColumnListOfMap(columnListOfMap, selectedList));
    	
    	return defaultAndSelectedList;
    }
    
    
    /**
     * 获取清单表的被选择列的列的map信息
     * @param columnListOfMap
     * @param selectedList
     * @return
     * @throws Exception
     */
    public List getSelectedCheckListColumnListOfMap(List columnListOfMap, List selectedList) throws Exception {
    	List selectedListOfMap = new ArrayList();
    	if(selectedList == null || selectedList.size() < 1)return null;
    	
    	//添加选择列
    	for (int i = 0; i < selectedList.size(); i++) {
    		String columnName = (String)selectedList.get(i);
    		if(StringUtils.isEmpty(columnName))continue;
    		
    		for (int j = 0; j < columnListOfMap.size(); j++) {
    			Map columnMap = (Map)columnListOfMap.get(j);
        		if(columnMap == null)continue;
        		String colName = (String)columnMap.get(ConstantImporting.COLUMN_NAME);//列英文名
        		if(columnName.equalsIgnoreCase(colName)) {//列英文名匹配
        			selectedListOfMap.add(columnMap);
        			break;
        		}
			}
		}
    	
    	return selectedListOfMap;
    }
    
    /**
     * 获取清单表的默认列的列的map信息
     * @param columnListOfMap
     * @return List
     */
    public List getDefaultCheckListColumnListOfMap(List columnListOfMap) {
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	List defaultList = new ArrayList();
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String isDefault = (String)columnMap.get(ConstantImporting.COLUMN_IS_DEFAULT);//是否默认值
    		if(ConstantImporting.COLUMN_IS_DEFAULT_YES.equalsIgnoreCase(isDefault)) {
    			defaultList.add(columnMap);
    		}
		}   	
    	return defaultList;
    }
    
    /**
     * 获取清单表的非默认列的列的map信息
     * @param columnListOfMap
     * @return List
     */
    public List getNotDefaultCheckListColumnListOfMap(List columnListOfMap) {
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	List defaultList = new ArrayList();
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String isDefault = (String)columnMap.get(ConstantImporting.COLUMN_IS_DEFAULT);//是否默认值
    		if(!ConstantImporting.COLUMN_IS_DEFAULT_YES.equalsIgnoreCase(isDefault)) {
    			defaultList.add(columnMap);
    		}
		}   	
    	return defaultList;
    }
    
    /**
     * 取得下一个序号值
     * @param parakey 参数编码
     * @param seqkey 序列编码
     * @return String
     * @throws Exception
     */
    public String getNextSeq(String parakey, String seqkey) throws Exception {
    	SeqMgr seqMgr = (SeqMgr)context.getBean("seqMgr");
    	return seqMgr.getNextSeq(parakey, seqkey);
    }
    
    /**
     * 获取临时文件路径
     * 如果不存在则创建
     * @return
     * @throws Exception 
     */
    protected String getTempPath() throws Exception {
    	 // 判断配置文件是否正确
		String rootPath = sysConfig.getProperty("data.dir_root");
		String tempPath = sysConfig.getProperty("data.dir_temp");
		
        if (StringUtils.isEmpty(rootPath) ||
        		StringUtils.isEmpty(tempPath)) {
            throw new Exception("配置文件有缺失！");
        }
        String tempFilePath = rootPath + File.separator + tempPath + File.separator
                + DateUtils.FormatDate(new Date(), "yyyyMM") + File.separator;
        File path = new File(tempFilePath);
        if (!path.exists()) {
        	path.mkdirs();
        }        
    	return tempFilePath;
    }
    
    /**
     * 获取登录用户相信息
     * @param request
     * @return
     * @throws Exception
     */
    protected AuthBean getAuthBean(HttpServletRequest request) throws Exception {
    	if (request == null || request.getSession() == null || request.getSession().getAttribute("authBean") == null) {
    		throw new Exception("请重新登录！");
    	}
    	return (AuthBean) request.getSession().getAttribute("authBean");
    }
    
    
    /**aml
     * 反洗钱
     * @param request
     * @return
     * @throws Exception
     */
    public String getOperatedTableName(String organkey,String baseTableName,HttpServletRequest request,XMLProperties SysConfig){
	   	 if(organkey==null){
	   		 throw new IllegalArgumentException("机构号为空！");
	   	 }
	   	 if(baseTableName==null){
	   		 throw new IllegalArgumentException("基表名称为空！");
	   	 }
	   	 //是系统管理员 直接返回主表
	   	 Authorization auth = this.getAuthorization(request);
	   	 if("1".equals(auth.getT00_user().getIsadmin())){
	   		 return baseTableName;
	   	 }
	   	 String operTableName = baseTableName;
	   	 if(isSplitTable(baseTableName,SysConfig)){
	   		LinkedHashMap organkey2serverkey = cm.getMapFromCache("organkey_2_serverkey");
	       	 String serverkey = (String)organkey2serverkey.get(organkey);
	   		 if(serverkey!=null && !"".equals(serverkey)){
	   			 operTableName = baseTableName+"_"+serverkey;
	   		 }
	   	 }
	   	 return operTableName.toUpperCase();
	    }
    
    /**aml
     * 判断是否是拆分表
     * 	1.系统配置拆分  拆分表配置拆分 则返回 true
     * 	2.其他均 返回 false
     * @param tablename
     * @return
     */
    public boolean isSplitTable(String tablename,XMLProperties SysConfig){
   	 String split_ind = SysConfig.getProperty("split_table.split_ind");
   	 if(!"1".equals(split_ind)){
   		 return false;
   	 }
   	 LinkedHashMap table2IsSplit = cm.getMapFromCache("tablename_2_issplit");
   	 if(table2IsSplit!=null&&table2IsSplit.size()>0){
	    	 Iterator iterator = table2IsSplit.keySet().iterator();
	    	 while(iterator.hasNext()){
	    		 String keyEentry = (String)iterator.next();
	    		 if(tablename.equalsIgnoreCase(keyEentry)){
	    			 return true;
	    		 }
	    	 }
   	 }
   	 return false;
    }
    
    /**
	 * 去掉form对象值的首尾空格
	 * @param obj
	 * @return
	 */
	public Object formFieldsTrim(Object obj) {
		try {
			Class c = obj.getClass();
	        Field[] fields = c.getDeclaredFields();//得到此类所有的字段
	        for (int i = 0; i < fields.length; i++) {
	        	String tempField = fields[i].getName();
	        	String setMethod = "set" + tempField.substring(0, 1).toUpperCase() +
                tempField.substring(1);//根据字段名拼凑其set方法名
	        	String getMethod = "get" + tempField.substring(0, 1).toUpperCase() +
                tempField.substring(1);//根据字段名拼凑其get方法名
	        	String fil = fields[i].getType().
                        getName();//得到每个字段的数据类型，也即是set方法的参数类型
	        	if (fil.equals("java.lang.String")) {
	        		Method getMothod=c.getMethod(getMethod, new Class[]{}); 
	        		Object value=getMothod.invoke(obj, new Object[]{});   
	        		//获取方法名为 set,类型和字段的类型
	        	    Method setMothod = c.getMethod(setMethod, new Class[]{fields[i].getType()}); 
	        		if( value!=null && !"".equals(value.toString()) ) {
	        			//调用set方法赋值
		        	    setMothod.invoke(obj,new Object[] {  value.toString().trim() });
	        		}
	        	}
	        }

		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	/**aml
	 * 取得分页字符串
	 * @param totalRow 总页数
	 * @param intPage 当前页数
	 * @param url 提交处理路径
	 * @param param 参数信息
	 * @return 取得分页信息
	 */
	public String getPageInfoStr1(int totalRow, int intPage, String url,
			String param,int intPageSize1) {
		//取得分页信息
		Vector pageInfo = this.getPageInfo1(totalRow, intPage,intPageSize1);
		//取得分页字符串
		return this.getPageInfoStr1(pageInfo, intPage, url, param,intPageSize1);
	}
	
	/**aml
	 * 取得分页字符串
	 * ************************************************************************
	 * 分页信息必须在名字为“form1”的form中
	 * 当点击时执行checkForm(command)函数(command=turnPage),执行必要的页面处理
	 * 页号变量为＝intPage
	 * ************************************************************************
	 * @param pageInfo 分页向量
	 * @param intPage 页号
	 * @return 取得分页信息
	 */

	/*public String getPageInfoStr1(Vector pageInfo, int intPage, String url,
			String param,int intPageSize1) {
		String pref1 = "&";
		String pref;
		//等于-1是表示没有出现过"?"
		if (url.indexOf("?") > -1) { //当前url含有参数
			pref = "&";
		} else {
			pref = "?";
		}
		if (intPage == 0) {
			intPage = 1;
		}
		//pageStr存放分页信息
		StringBuffer pageStr = new StringBuffer();
		//分类信息全部存在
		if (pageInfo.size() == 5) {
			pageStr.append("共 " + pageInfo.elementAt(0).toString() + " 条记录");
			pageStr.append(" 共 " + pageInfo.elementAt(1).toString() + " 页");
			pageStr.append(" 当前第 " + (intPage) + " 页");
			int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
			int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
			int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
			int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
			//当审批等操作返回时会因为第二页最后一条记录消失而无法返回第一页。
			//三种情况需出现"上一页",第三种情况比较特殊,比如删除了一条记录后返回第二页,但是第二页已经没有了数据,此时也要显示上一页的链接,否则就返回不到上一页了
			if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
					* intPageSize1 + 1 <= tal))
					|| pageInfo.elementAt(0).toString().equals("0")) {
				pageStr.append(" 上一页");
			} else {
				pageStr
						.append(" <a href=\"javaScript:document.all.intPage.value='"
								+ pre + "';goPage()\">上一页</a>");
			}

			if (nex == 0 || (cur >= nex)) {
				pageStr.append(" 下一页");
			} else {
				pageStr
						.append(" <a href=\"javaScript:document.all.intPage.value='"
								+ nex + "';goPage()\">下一页</a>");
			}

			int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

			//超过1000页,则显示为输入矿的值
			if (totalPage < 1000) {
				pageStr
						.append(" 跳到<select name='intPage' onChange=\"goPage()\">");

				for (int i = 1; i <= totalPage; i++) {
					String se = (intPage == i) ? " selected " : "";
					pageStr.append("<option value='" + i + "'" + se + ">" + i
							+ "</option>");
				}
				if (totalPage == 0) {
					pageStr.append("<option value='1'>1</option>");
				}
				pageStr.append("</select>");
			} else {
				pageStr
						.append(" 跳到<input type=\"text\" size=4 class='text_white' name='intPage'>");
				pageStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
			}

			//
			pageStr.append("<script language=\"javascript\">\n");
			pageStr.append("function goPage()\n{");
			pageStr.append(" var obj=document.all.intPage.value;");
			pageStr
					.append("if(isNaN(obj) || parseInt(obj)<1){ alert('请输入正确的页码,必须为正整数!');document.all.intPage.focus();return;}");
			pageStr.append(" if(parseInt(obj)>parseInt(" + totalPage
					+ ")){document.all.intPage.value=" + totalPage + ";}");

			pageStr.append("document.forms[0].action=\"" + url + pref + param
					+ pref1 + "intPage=" + "\" + document.all.intPage.value;"
					+ "document.forms[0].submit();}\n");
			pageStr.append("</script>");
		} else {
			pageStr.append("&nbsp;");
		}
		return pageStr.toString();
	}*/
	

    public String getPageInfoStr1(Vector pageInfo, int intPage, String url,
            String param,int intPageSize1) {
        if (param == null || param.equals("")) {
            param = "p=1";
        }
        String pref1 = "&";
        String pref;
        // 等于-1是表示没有出现过"?"
        if (url.indexOf("?") > -1) { // 当前url含有参数
            pref = "&";
        } else {
            pref = "?";
        }
        if (intPage == 0) {
            intPage = 1;
        }
        // pageStr存放分页信息
        StringBuffer pageStr = new StringBuffer();//将pageheadStr、pagemidStr、pageendStr拼接起来
        StringBuffer pageheadStr = new StringBuffer();//存储“第一页”“上一页”图标位置
        StringBuffer pagemidStr = new StringBuffer();//存储“共 xx 条记录 共 xx 页 当前第 xx 页”图标位置
        StringBuffer pageendStr = new StringBuffer();//存储“下一页”“最后一页”图标位置
        // 分类信息全部存在
        if (pageInfo.size() == 5) {
        	pagemidStr.append("<span></span>");
        	pagemidStr.append("共 " + pageInfo.elementAt(0).toString() + " 条记录");
        	pagemidStr.append(" 共 " + pageInfo.elementAt(1).toString() + " 页");
        	pagemidStr.append(" 当前第 " + (intPage) + " 页");
        	pagemidStr.append("<span></span>");
            int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
            int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
            int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
            int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
            // 当审批等操作返回时会因为第二页最后一条记录消失而无法返回第一页。
            // 三种情况需出现"上一页",第三种情况比较特殊,比如删除了一条记录后返回第二页,但是第二页已经没有了数据,此时也要显示上一页的链接,否则就返回不到上一页了
            if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
                    * intPageSize1 + 1 <= tal))
                    || pageInfo.elementAt(0).toString().equals("0")) {
            	pageheadStr.append(" <span class=\"p_first01\"></span>");//“第一页”不可点
            	pageheadStr.append(" <span class=\"p_prev01\"></span>");//“上一页”不可点
            } else {
            	pageheadStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + 1 + "';goPage()\"><span class=\"p_first\"></span></a>");//“第一页”可点
            	
            	pageheadStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pre + "';goPage()\"><span class=\"p_prev\"></span></a>");//“上一页”可点
            }

            if (nex == 0 || (cur >= nex)) {
            	pageendStr.append(" <span class=\"p_last01\"></span>");//“下一页”不可点
            	pageendStr.append(" <span class=\"p_next01\"></span>");//“最后一页”不可点
            } else {
            	pageendStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + nex + "';goPage()\"><span class=\"p_next\"></span></a>");//“下一页”可点
            	
            	pageendStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pageInfo.elementAt(1) + "';goPage()\"><span class=\"p_last\"></span></a>");//“最后一页”可点
            }

            int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

            // 超过1000页,则显示为输入矿的值
            if (totalPage < 1000) {
            	pageendStr
                        .append(" <span class=\"p_select\">跳到<select name='intPage' onChange=\"goPage()\">");

                for (int i = 1; i <= totalPage; i++) {
                    String se = (intPage == i) ? " selected " : "";
                    pageendStr.append("<option value='" + i + "'" + se + ">" + i
                            + "</option>");
                }
                if (totalPage == 0) {
                	pageendStr.append("<option value='1'>1</option>");
                }
                pageendStr.append("</select></span>");
            } else {
            	pageendStr
                        .append(" 跳到<input type=\"text\" size=4 class='text_white' name='intPage'>");
            	pageendStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
            }

            //
            pageendStr.append("<script language=\"javascript\">\n");
            pageendStr.append("function goPage()\n{");
            pageendStr.append(" var obj=document.all.intPage.value;");
            pageendStr
                    .append("if(isNaN(obj) || parseInt(obj)<1){ alert('请输入正确的页码,必须为正整数!');document.all.intPage.focus();return;}");
            pageendStr.append(" if(parseInt(obj)>parseInt(" + totalPage
                    + ")){document.all.intPage.value=" + totalPage + ";}");

            pageendStr.append("document.forms[0].action=\"" + url + pref
                    + "wherefrom=trunpage&" + param + pref1 + "intPage="
                    + "\" + document.all.intPage.value;"
                    + "document.forms[0].submit();}\n");
            pageendStr.append("</script>");
            
            pageStr.append(pageheadStr);
            pageStr.append(pagemidStr);
            pageStr.append(pageendStr);
            
        } else {
            pageStr.append("&nbsp;");
        }
        return pageStr.toString();
    }
	/**aml
	 *
	 */
	public Vector getPageInfo1(int totalRow, int intPage,int intPageSize1) {
		Vector pageInfo = new Vector();
		//总记录数
		intRowCount = totalRow;
		//总页数
		intPageCount = (intRowCount + intPageSize1 - 1) / intPageSize1;
		//调整当前页数合法
		if (intPage > intPageCount)
			intPage = intPageCount;
		if (intPage < 1)
			intPage = 1;
		//调整上、下页数
		int prePage = 1;
		int nextPage = intPageCount;
		if (intPage > 1)
			prePage = intPage - 1;
		if (intPage < intPageCount)
			nextPage = intPage + 1;
		//分页信息存于向量中
		pageInfo.add(new Integer(intRowCount));
		pageInfo.add(new Integer(intPageCount));
		pageInfo.add(new Integer(intPage));
		pageInfo.add(new Integer(prePage));
		pageInfo.add(new Integer(nextPage));
		return pageInfo;
	}
	//aml
	public int getStartRec1(int intPage,int intPageSize) {
		int iStartRec = 0;
		iStartRec = (intPage - 1) * intPageSize;
		return iStartRec;
	}
	
	//aml
	public boolean writeOperLog(Authorization authorization,
			SqlMapClient sqlMap, T00_operate_log t00_operate_log)
			throws Exception {
		
		LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
		String isLog = (String) sysparaMap.get("408"); 
		if("1".equals(isLog)){
		T00_operate_logDAO t00_operate_logDao =(T00_operate_logDAO)context.getBean("t00_operate_logDAO");
		this.writeOperLogEntity(authorization, t00_operate_log);
		int num = 0;
		try {
			num = t00_operate_logDao.insertT00_operate_log(sqlMap,
					t00_operate_log);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return num > 0;
		}else		return true;
	}

	 private T00_operate_log writeOperLogEntity(Authorization authorization,
				T00_operate_log rm_operate_log)throws Exception {

			//操作用户
			rm_operate_log.setUsername(authorization.getT00_user().getUsername());
			//操作用户真实姓名
			rm_operate_log.setRealname(authorization.getT00_user().getRealname());
			//子系统代码
		/*	rm_operate_log
					.setSystemkey(authorization.getT00_group().getSystemkey());*/
			Date today = DateUtils.getCurrDateTime();
			String day = DateUtils.dateToStringShort(today);
			if (day.indexOf('-') > 0) {
				day = day.substring(0, day.indexOf('-'))
						+ day.substring(day.indexOf('-') + 1);
				day = day.substring(0, day.indexOf('-'))
						+ day.substring(day.indexOf('-') + 1);
			}
			rm_operate_log.setLog_key(day
					+ this.getSequenceNextVal("T00_OPERATOR_LOGKEY"));
			//模块代码
			//     	rm_operate_log.setModulekey(authorization.getUserRoleKeys());    	
			//模块名称
			//     	rm_operate_log.setModulename(authorization.getUserRoleNames());

			return rm_operate_log;
		}
	 
	 public String getPageInfoStr2(int listsize,int intPage, String url,
				String param) {
			String pref1 = "&";
			if(param.equals("")){
				pref1="";	
			}
			String pref;
			//等于-1是表示没有出现过"?"
			if (url.indexOf("?") > -1) { //当前url含有参数
				pref = "&";
			} else {
				pref = "?";
			}
			if (intPage <= 0) {
				intPage = 1;
			}
			//调整上、下页数
			int pre = 1;
			int nex = intPage;
			if (intPage > 1)
				pre = intPage - 1;
			    nex = intPage + 1;
			//pageStr存放分页信息
			StringBuffer pageStr = new StringBuffer();
				pageStr.append(" 当前第 " + (intPage) + " 页");
				int cur = intPage;
				//当审批等操作返回时会因为第二页最后一条记录消失而无法返回第一页。
				//三种情况需出现"上一页",第三种情况比较特殊,比如删除了一条记录后返回第二页,但是第二页已经没有了数据,此时也要显示上一页的链接,否则就返回不到上一页了
				if (cur<=1) {
					pageStr.append(" 上一页");
				} else {
					pageStr
							.append(" <a href=\"javaScript:document.all.intPage.value='"
									+ pre + "';goPage()\">上一页</a>");
				}

				if (nex == 0 || (cur >= nex)||listsize==0) {
					pageStr.append(" 下一页");
				} else {
					pageStr
							.append(" <a href=\"javaScript:document.all.intPage.value='"
									+ nex + "';goPage()\">下一页</a>");
				}

				
					pageStr
							.append(" 跳到<input type=\"text\" size=4 class='text_white' name='intPage'>");
					pageStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
				

				//
				pageStr.append("<script language=\"javascript\">\n");
				String alertstr="if("+listsize+"==0 && "+intPage+">0) alert(\"没有记录！\")";
				pageStr.append(alertstr+"\n");
				pageStr.append("function goPage()\n{");
				pageStr.append(" var obj=document.all.intPage.value;");
				pageStr
						.append("if(isNaN(obj) || parseInt(obj)<1){ alert('请输入正确的页码,必须为正整数!');document.all.intPage.focus();return;}");
				
				pageStr.append("document.forms[0].action=\"" + url + pref + param
						+ pref1 + "intPage=" + "\" + document.all.intPage.value;"
						+ "document.forms[0].submit();}\n");
				pageStr.append("</script>");
			
			return pageStr.toString();
		}
	 
	 	/**
		 * 将Map对象转换成Json格式字符串
		 * 
		 * @return
		 */
		protected String convertMapToJson(Map<String, String> map) {

			if (map == null || map.isEmpty()) {
				return StringUtils.EMPTY;
			}
			List<Map<String, String>> codeList = new ArrayList<Map<String, String>>();
			for (String key : map.keySet()) {
				Map<String, String> convertMap = new HashMap<String, String>();
				convertMap.put("key", key);
				convertMap.put("value", key + "-" + map.get(key));
				codeList.add(convertMap);
			}
			return new Gson().toJson(codeList);
		}
}
