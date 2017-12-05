package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class Finance_query_form extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private FormFile file_upload;

	public FormFile getFile_upload() {
		return file_upload;
	}

	public void setFile_upload(FormFile file_upload) {
		this.file_upload = file_upload;
	}

	
}
