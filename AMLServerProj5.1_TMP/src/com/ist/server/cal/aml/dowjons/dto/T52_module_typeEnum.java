package com.ist.server.cal.aml.dowjons.dto;

public enum T52_module_typeEnum
{
	MODULE_TYPE_MD("名单模板","0"),
	MODULE_TYPE_HS("回溯模板", "1");
	
	private String module_type_name 		= "";
	private String module_type_code 		= "";
	
	private T52_module_typeEnum(String module_type_name, String module_type_code)
	{
		this.module_type_name = module_type_name;
		this.module_type_code = module_type_code;
	}

	public String getModule_type_name()
	{
		return module_type_name;
	}

	public void setModule_type_name(String module_type_name)
	{
		this.module_type_name = module_type_name;
	}

	public String getModule_type_code()
	{
		return module_type_code;
	}

	public void setModule_type_code(String module_type_code)
	{
		this.module_type_code = module_type_code;
	}
}
