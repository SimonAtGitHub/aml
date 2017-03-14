package com.ist.common.lucene.index.common;

public class IndexConstant {

	/**
	 * 系统分割符
	 */
	public static final String SYSTEM_SEPARATOR = System.getProperties().getProperty("file.separator");
	/** 索引来源类型：单路径文件 */
	public static final String INDEX_SOURCE_TYPE_FILE_SINGLE = "file_single";
	/** 索引来源类型：多路径文件 */
	public static final String INDEX_SOURCE_TYPE_FILE_MULTIPLE = "file_multiple";
	/** 索引来源类型：文件列表 */
	public static final String INDEX_SOURCE_TYPE_FILE_LIST = "file_list";
	/** 索引来源类型：存储数据库的文章内容 */
	public static final String INDEX_SOURCE_TYPE_DB_CONTENT = "db_content";
	/** 索引来源类型：存储数据库的附件 */
	public static final String INDEX_SOURCE_TYPE_DB_ATTACH = "db_attach";
	/** 索引来源类型：修改文件 */
	public static final String INDEX_SOURCE_TYPE_MODIFY_FILE = "modify_file";

	// /** 索引方式：不索引 */
	// public static final String INDEX_TYPE_NO = "NO";
	// /** 索引方式：不索引 */
	// public static final String INDEX_TYPE_TOKENIZED = "TOKENIZED";
	// /** 索引方式：不索引 */
	// public static final String INDEX_TYPE_UN_TOKENIZED = "UN_TOKENIZED";
	//
	//
	// /** 存储方式：不存储 */
	// public static final String STORE_TYPE_NO = "NO";
	// /** 存储方式：存储 */
	// public static final String STORE_TYPE_YES = "YES";
	//

	/** 索引名称：主键标识 */
	public static final String INDEX_NAME_UID = "uid";

	public static final String INDEX_NAME_PROGRAMAKEY = "programakey";
	/** 索引名称：内容 */
	public static final String INDEX_NAME_CONTENT = "content";
	/** 索引名称：路径 */
	public static final String INDEX_NAME_PATH = "path";
	/** 索引名称：标题 */
	public static final String INDEX_NAME_TITLE = "title";
	/** 索引名称：序列 */
	public static final String INDEX_NAME_SEQ = "seq";
	/** 索引名称：访问的URL */
	public static final String INDEX_NAME_URL = "url";
	/** 索引名称：文章或文件最后修改时间 */
	public static final String INDEX_NAME_MDATE = "mdate";
	/** 索引名称：安全级别(密级) */
	public static final String INDEX_NAME_SECLEVEL = "seclevel";

	/** 是否重建索引 */
	public static final boolean IS_REBUILD_INDEX = true;

	/** 默认安全级别(密级) */
	public static final String DEFAULT_SECLEVEL = "0";

	/** 默认的文件访问路径 */
	public static final String DEFAULT_FILE_URL = "/cmp/attachment/t01_attachment_disp.do?attachkey=#uid#";
	public static final String DEFAULT_URL = "/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=#uid#&programakey=#programakey#";

}
