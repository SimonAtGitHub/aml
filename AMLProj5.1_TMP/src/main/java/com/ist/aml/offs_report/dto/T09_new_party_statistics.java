package com.ist.aml.offs_report.dto;

import java.io.Serializable;
import java.util.Date;

public class T09_new_party_statistics implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1141877364245855112L;

	private Date beginDate = new Date();
	
	private Date endDate = new Date();
	
	private String cnew = "";
	
	private String inew = "";
	
	private String imnew = "";
	
	private String inmnew = "";
     
    private String all_total = "";
    
    private String oncnew = "";
    
    private String oninew = "";
    
    private String onimnew = "";
    
    private String oninmnew = "";
    
    private String onall_total = "";
    
    private String ohcnew = "";
    
    private String ohinew = "";
    
    private String ohimnew = "";
    
    private String ohinmnew = "";
	
	private String organkey="";
    
    private String statistic_type="";

    private String ohall_total = "";
	public String getCnew() {
		return cnew;
	}

	public void setCnew(String cnew) {
		this.cnew = cnew;
	}

	public String getImnew() {
		return imnew;
	}

	public void setImnew(String imnew) {
		this.imnew = imnew;
	}

	public String getInew() {
		return inew;
	}

	public void setInew(String inew) {
		this.inew = inew;
	}

	public String getInmnew() {
		return inmnew;
	}

	public void setInmnew(String inmnew) {
		this.inmnew = inmnew;
	}

	public String getOrgankey() {
		return organkey;
	}

	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

    /**
     * @return the statistic_type
     */
    public String getStatistic_type() {
        return statistic_type;
    }

    /**
     * @param statistic_type the statistic_type to set
     */
    public void setStatistic_type(String statistic_type) {
        this.statistic_type = statistic_type;
    }

    /**
     * @return the all_total
     */
    public String getAll_total() {
        return all_total;
    }

    /**
     * @param all_total the all_total to set
     */
    public void setAll_total(String all_total) {
        this.all_total = all_total;
    }

    /**
     * @return the ohcnew
     */
    public String getOhcnew() {
        return ohcnew;
    }

    /**
     * @param ohcnew the ohcnew to set
     */
    public void setOhcnew(String ohcnew) {
        this.ohcnew = ohcnew;
    }

    /**
     * @return the ohimnew
     */
    public String getOhimnew() {
        return ohimnew;
    }

    /**
     * @param ohimnew the ohimnew to set
     */
    public void setOhimnew(String ohimnew) {
        this.ohimnew = ohimnew;
    }

    /**
     * @return the ohinew
     */
    public String getOhinew() {
        return ohinew;
    }

    /**
     * @param ohinew the ohinew to set
     */
    public void setOhinew(String ohinew) {
        this.ohinew = ohinew;
    }

    /**
     * @return the ohinmnew
     */
    public String getOhinmnew() {
        return ohinmnew;
    }

    /**
     * @param ohinmnew the ohinmnew to set
     */
    public void setOhinmnew(String ohinmnew) {
        this.ohinmnew = ohinmnew;
    }

    /**
     * @return the oncnew
     */
    public String getOncnew() {
        return oncnew;
    }

    /**
     * @param oncnew the oncnew to set
     */
    public void setOncnew(String oncnew) {
        this.oncnew = oncnew;
    }

    /**
     * @return the onimnew
     */
    public String getOnimnew() {
        return onimnew;
    }

    /**
     * @param onimnew the onimnew to set
     */
    public void setOnimnew(String onimnew) {
        this.onimnew = onimnew;
    }

    /**
     * @return the oninew
     */
    public String getOninew() {
        return oninew;
    }

    /**
     * @param oninew the oninew to set
     */
    public void setOninew(String oninew) {
        this.oninew = oninew;
    }

    /**
     * @return the oninmnew
     */
    public String getOninmnew() {
        return oninmnew;
    }

    /**
     * @param oninmnew the oninmnew to set
     */
    public void setOninmnew(String oninmnew) {
        this.oninmnew = oninmnew;
    }

    /**
     * @return the ohall_total
     */
    public String getOhall_total() {
        return ohall_total;
    }

    /**
     * @param ohall_total the ohall_total to set
     */
    public void setOhall_total(String ohall_total) {
        this.ohall_total = ohall_total;
    }

    /**
     * @return the onall_total
     */
    public String getOnall_total() {
        return onall_total;
    }

    /**
     * @param onall_total the onall_total to set
     */
    public void setOnall_total(String onall_total) {
        this.onall_total = onall_total;
    }
	
}
