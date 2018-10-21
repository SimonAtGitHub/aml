
package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

import org.apache.struts.upload.FormFile;

public class Finance_query_form extends ActionForm {
	private String xqFileName;
    private String mwFileName;
    private String mingwStatus;
    private String miFileName;
    private String miStatus;
    private String errmsg;
    private String begindat;
    private String enddat;
	private String verification_DT;
    private String verification_BATCH;
    private String verification_SEQ;
    private String intPage;
    private  String newsearchflag;
    public String getIntPage() {
		return intPage;
	}
	public void setIntPage(String intPage) {
		this.intPage = intPage;
	}
	public String getNewsearchflag() {
		return newsearchflag;
	}
	public void setNewsearchflag(String newsearchflag) {
		this.newsearchflag = newsearchflag;
	}
	public String getBegindat() {
		return begindat;
	}
	public void setBegindat(String begindat) {
		this.begindat = begindat;
	}
	public String getEnddat() {
		return enddat;
	}
	public void setEnddat(String enddat) {
		this.enddat = enddat;
	}
	public String getXqFileName() {
		return xqFileName;
	}
	public void setXqFileName(String xqFileName) {
		this.xqFileName = xqFileName;
	}
	public String getMwFileName() {
		return mwFileName;
	}
	public void setMwFileName(String mwFileName) {
		this.mwFileName = mwFileName;
	}
	public String getMingwStatus() {
		return mingwStatus;
	}
	public void setMingwStatus(String mingwStatus) {
		this.mingwStatus = mingwStatus;
	}
	public String getMiFileName() {
		return miFileName;
	}
	public void setMiFileName(String miFileName) {
		this.miFileName = miFileName;
	}
	public String getMiStatus() {
		return miStatus;
	}
	public void setMiStatus(String miStatus) {
		this.miStatus = miStatus;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public String getVerification_DT() {
		return verification_DT;
	}
	public void setVerification_DT(String verificationDT) {
		verification_DT = verificationDT;
	}
	public String getVerification_BATCH() {
		return verification_BATCH;
	}
	public void setVerification_BATCH(String verificationBATCH) {
		verification_BATCH = verificationBATCH;
	}
	public String getVerification_SEQ() {
		return verification_SEQ;
	}
	public void setVerification_SEQ(String verificationSEQ) {
		verification_SEQ = verificationSEQ;
	}

	
}
