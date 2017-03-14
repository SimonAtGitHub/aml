package com.ist.avp.report.taglib;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.taglib.TagUtils;

import com.ist.avp.report.model.Report;
import com.ist.avp.report.utils.ReportHTMLView;

public class ReportTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -915621697116046984L;
	
	private static final String CANNOT_FIND_ANY_BEAN = "不能查询到报表或报表数据实例";
	
	/**
	 * 报表持久化类
	 */
	private String report = null;
	
	/**
	 * 报表数据
	 */
	private String data = null;
	

	public int doStartTag() throws JspException {
		ReportHTMLView rhv = ReportHTMLView.getInstance();
		JspWriter writer = pageContext.getOut();

		try {
			Report reportObject = (Report) TagUtils.getInstance().lookup(pageContext, report, null);
			Map reportData = (Map) TagUtils.getInstance().lookup(pageContext, data, null);
			
			// 如果不能查询到报表或者报表数据实例则抛出异常
			if (reportObject == null || reportData == null) {
				throw new JspException(CANNOT_FIND_ANY_BEAN);
			}
			
			writer.write(rhv.createReportView(reportObject, reportData));
		} catch (Exception e) {
            e.printStackTrace();
            StringBuffer message = new StringBuffer(128).append("报表视图展现出现异常，");
            if (StringUtils.isBlank(e.getMessage()) || "null".equalsIgnoreCase(e.getMessage())) {
            	message.append("请与管理员联系！");
            } else {
            	message.append("异常原因：[").append(e.getMessage()).append("] 或者与管理员联系！");
            }
            try {
				writer.write(createErrorMessageView(message.toString()));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return SKIP_BODY;
	}


	/**
	 * @param report the report to set
	 */
	public void setReport(String report) {
		this.report = report;
	}


	/**
	 * @param data the data to set
	 */
	public void setData(String data) {
		this.data = data;
	}

	/**
	 * 创建报表错误信息提示视图
	 * @param message
	 * @return
	 */
	private String createErrorMessageView(String message) {
		StringBuffer sb = new StringBuffer(256);
		sb.append("<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">")
			.append("<tr><td align=\"left\" height=\"22\" style=\"visibility:visible\" id=\"messageError\"><font color=\"red\"><b>")
			.append(message)
			.append("</b></font></td></tr></table>");
		return sb.toString();
	}
	
}
