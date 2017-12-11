package com.ist.aml.information.dto;

                                                  
import java.io.Serializable; 
      

import org.apache.struts.upload.FormFile;
                                              
public class T00_NOTICE implements Serializable {
                                              
	/**
	 * 
	 */
	private static final long serialVersionUID = -6803895903793297424L;

	/** 失效日期 */
	private String infactdate = "";

	/** 标题 */
	private String title = "";
	private String title_s="";

	/** 0：无效 1：有效 */
	private String flag = "";
	private String flag_disp="";

	/** 附件路径 */
	private String filepath = "";

	/** 发布时间   */
	private String createdate = "";

	/** 1:内部文件 2：外部文件 3重要通知 */
	private String notice_gory = "";
	private String notice_gory_s="";
	private String notice_gory_disp="";

	/** 1:系统公告 2 外部公告 */
	private String notice_type = "";

	/** 附件名 */
	private String filename = "";

	/** 内容 */
	private String content = "";

	/** 发布人 */
	private String creator = "";

	/** 公告号 */
	private String noteice_no = "";

	/** 发布机构 */
	private String createorgan = "";
	private String createorgan_s="";
	private String organame="";
	private FormFile filename1;    
	private String intPage = "0";   
	private String organkeys="";


    /**                   
     * 构造函数           
     */                   
    public T00_NOTICE() {    
    }


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getCreatedate() {
		return createdate;
	}


	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}


	public String getCreateorgan() {
		return createorgan;
	}


	public void setCreateorgan(String createorgan) {
		this.createorgan = createorgan;
	}


	public String getCreateorgan_s() {
		return createorgan_s;
	}


	public void setCreateorgan_s(String createorgan_s) {
		this.createorgan_s = createorgan_s;
	}


	public String getCreator() {
		return creator;
	}


	public void setCreator(String creator) {
		this.creator = creator;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public FormFile getFilename1() {
		return filename1;
	}


	public void setFilename1(FormFile filename1) {
		this.filename1 = filename1;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	public String getInfactdate() {
		return infactdate;
	}


	public void setInfactdate(String infactdate) {
		this.infactdate = infactdate;
	}


	public String getIntPage() {
		return intPage;
	}


	public void setIntPage(String intPage) {
		this.intPage = intPage;
	}


	public String getNoteice_no() {
		return noteice_no;
	}


	public void setNoteice_no(String noteice_no) {
		this.noteice_no = noteice_no;
	}


	public String getNotice_gory() {
		return notice_gory;
	}


	public void setNotice_gory(String notice_gory) {
		this.notice_gory = notice_gory;
	}


	public String getNotice_gory_s() {
		return notice_gory_s;
	}


	public void setNotice_gory_s(String notice_gory_s) {
		this.notice_gory_s = notice_gory_s;
	}


	public String getNotice_type() {
		return notice_type;
	}


	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}


	public String getOrganame() {
		return organame;
	}


	public void setOrganame(String organame) {
		this.organame = organame;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getTitle_s() {
		return title_s;
	}


	public void setTitle_s(String title_s) {
		this.title_s = title_s;
	}


	public String getFlag_disp() {
		return flag_disp;
	}


	public void setFlag_disp(String flag_disp) {
		this.flag_disp = flag_disp;
	}


	public String getNotice_gory_disp() {
		return notice_gory_disp;
	}


	public void setNotice_gory_disp(String notice_gory_disp) {
		this.notice_gory_disp = notice_gory_disp;
	}


	public String getOrgankeys() {
		return organkeys;
	}


	public void setOrgankeys(String organkeys) {
		this.organkeys = organkeys;
	}                     

//=======================================================
}


