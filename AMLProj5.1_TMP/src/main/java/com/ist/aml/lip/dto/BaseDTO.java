/**
 * Copyright 2003 (C) PANLAB ，All Rights Reserved.
 * 日期         作者 			动作
 * 2003-10-20   青蛙                     创建
 */
package com.ist.aml.lip.dto;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2002
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author
 * @version 2.0
 */


/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author
 * @version 1.0
 */

public class BaseDTO implements java.io.Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 9203574624192243200L;
	/** 搜索标志：1－新搜索；0－现有条件的搜索 */
    public String newsearchflag = "";
    /** 业务类别编码：按照业务类别展现动态菜单时的业务编号 */
    public String busstypecd = ""; 
    public String shortstring = "";
    
    /** 当前的页号 **/
    public int intPage = 1;
    
    public int totalRow = 0;
        
    /**
     * 说明：构造函数
     */
    public BaseDTO() {
    }

    /**
     * @return the intPage
     */
    public int getIntPage() {
        return intPage;
    }

    /**
     * @param intPage the intPage to set
     */
    public void setIntPage(int intPage) {
        if(intPage==0) intPage = 1;
        this.intPage = intPage;
    }

    /**
     * @return the newsearchflag
     */
    public String getNewsearchflag() {
        return newsearchflag;
    }
    
    /**
     * @param newsearchflag the newsearchflag to set
     */
    public void setNewsearchflag(String newsearchflag) {
        this.newsearchflag = newsearchflag;
    }

    /**
     * @return the totalRow
     */
    public int getTotalRow() {
        return totalRow;
    }

    /**
     * @param totalRow the totalRow to set
     */
    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    /**
     * @return the busstypecd
     */
    public String getBusstypecd() {
        return busstypecd;
    }

    /**
     * @param busstypecd the busstypecd to set
     */
    public void setBusstypecd(String busstypecd) {
        this.busstypecd = busstypecd;
    }

	public String getShortstring() {
		return shortstring;
	}

	public void setShortstring(String shortstring) {
		this.shortstring = shortstring;
	}
    
    
    
}
