package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.*;

public class T18_OnlineServer implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3383927498956515477L;
	/**任务类型**/
	private String tasktype = "";
	/**子任务代码预警ID **/
	private String taskkey = "";
	private String taskname = "";
	/**状态**/
	private String execstatus = "";
	private Date endtime = null;
	private String endtime_disp = "";
	private String begintime_disp = "";
	private Date lastexecdate = null;
	private String creator = "";
	private Date creatdate = null;
	private Date begintime =null;
	private String des = "";
	public Date getBegintime() {
		return begintime;
	}
	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}
	public Date getCreatdate() {
		return creatdate;
	}
	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getExecstatus() {
		return execstatus;
	}
	public void setExecstatus(String execstatus) {
		this.execstatus = execstatus;
	}
	public Date getLastexecdate() {
		return lastexecdate;
	}
	public void setLastexecdate(Date lastexecdate) {
		this.lastexecdate = lastexecdate;
	}
	public String getTaskkey() {
		return taskkey;
	}
	public void setTaskkey(String taskkey) {
		this.taskkey = taskkey;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getTasktype() {
		return tasktype;
	}
	public void setTasktype(String tasktype) {
		this.tasktype = tasktype;
	}
	public String getBegintime_disp() {
		return begintime_disp;
	}
	public void setBegintime_disp(String begintime_disp) {
		this.begintime_disp = begintime_disp;
	}
	public String getEndtime_disp() {
		return endtime_disp;
	}
	public void setEndtime_disp(String endtime_disp) {
		this.endtime_disp = endtime_disp;
	}
	

 
}
