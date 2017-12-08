package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class Finance_query_form extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private FormFile file_upload;
	private String match_file="";
	private String download_file = "";
	

	public FormFile getFile_upload() {
		return file_upload;
	}

	public void setFile_upload(FormFile file_upload) {
		this.file_upload = file_upload;
	}

	public String getMatch_file() {
		return match_file;
	}

	public void setMatch_file(String match_file) {
		this.match_file = match_file;
	}

	public String getDownload_file() {
		return download_file;
	}

	public void setDownload_file(String download_file) {
		this.download_file = download_file;
	}

	
}
