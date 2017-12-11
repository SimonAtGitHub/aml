package com.ist.platform.controller;

import org.apache.struts.action.*;
import javax.servlet.http.*;

public class AuthActionForm extends ActionForm {
    private String username;
    private String password;
    private String groupkey;
    private String flag="";

    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
        /**@todo: finish this method, this is just the skeleton.*/
        return null;
    }
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
    }
    public String getGroupkey() {
        return groupkey;
    }
    public void setGroupkey(String groupkey) {
        this.groupkey = groupkey;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return username;
    }
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}