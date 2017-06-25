package com.ist.aml.blacklist.dto;

import com.ist.common.base.BaseDTO;

/**
 * 道琼斯模板dto
 * @author liuzp
 *
 */
public class T52_def_temp extends BaseDTO
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6362333794436741147L;
	
	private String templatekey			= "";				// 模板编码
	private String templatename			= "";				// 模板名称
	/** 模板编码 ：用于copy时候的插入操作*/
	private String templatekey_temp 	= "";
	private String des					= "";				// 描述
	private String granularity			= "";				// 粒度	1:日；4:月；5:季；6:半年7：年
	private String granularity_disp 	= "";
	private String flag					= "";				// 是否启用(0:否  1：是
	private String flag_disp			= "";
	private String tag					= "";				// 0:否  1：是
	private String modify_user			= "";				// 修改人
	private String modify_dt			= "";				// 修改日期
	private String create_user			= "";				// 创建人
	private String create_dt			= "";				// 创建日期
	private String create_org			= "";				// 创建机构
	private String is_build				= "";				// 是否内建
	private String coverflag			= "";				// 是否覆盖
	private String coverflag_disp		= "";
	private Integer calculateseq		= new Integer(0);	// 模板的计算顺序
	private String matchcondition		= "";				// 匹配条件 存放json数据
	private String sqlkey				= "";				// 
	private String sqlgranularity		= "";				// sql执行粒度
	private String roster_table			= "";				// 数据表名
	private String datagranularity		= "";				// 数据粒度
	
	private String sql_str				= "";				// 执行sql
	private String calsql				= "";				// 计算顺序
	private String party_class_cd		= "";				// 'C:对公 I:对私'
	private String party_class_cd_disp	= "";
	private String moduletype			= "";				// 模板类型 0：名单模板1：回溯模板
	private String moduletype_disp		= "";

	private String validateSql 			= "";				// 校验sql

	private String create_dt_start 		= "";
	private String create_dt_end 		= "";
	private String sqlgranularity_disp	= "";
	private String datagranularity_disp	= "";
	
	public String getTemplatekey()
	{
		return templatekey;
	}
	public void setTemplatekey(String templatekey)
	{
		this.templatekey = templatekey;
	}
	public String getTemplatename()
	{
		return templatename;
	}
	public void setTemplatename(String templatename)
	{
		this.templatename = templatename;
	}
	public String getDes()
	{
		return des;
	}
	public void setDes(String des)
	{
		this.des = des;
	}

	public String getFlag()
	{
		return flag;
	}
	public void setFlag(String flag)
	{
		this.flag = flag;
	}
	public String getTag()
	{
		return tag;
	}
	public void setTag(String tag)
	{
		this.tag = tag;
	}
	public String getModify_user()
	{
		return modify_user;
	}
	public void setModify_user(String modify_user)
	{
		this.modify_user = modify_user;
	}
	public String getModify_dt()
	{
		return modify_dt;
	}
	public void setModify_dt(String modify_dt)
	{
		this.modify_dt = modify_dt;
	}
	public String getCreate_user()
	{
		return create_user;
	}
	public void setCreate_user(String create_user)
	{
		this.create_user = create_user;
	}
	public String getCreate_dt()
	{
		return create_dt;
	}
	public void setCreate_dt(String create_dt)
	{
		this.create_dt = create_dt;
	}
	public String getCreate_org()
	{
		return create_org;
	}
	public void setCreate_org(String create_org)
	{
		this.create_org = create_org;
	}
	public String getIs_build()
	{
		return is_build;
	}
	public void setIs_build(String is_build)
	{
		this.is_build = is_build;
	}
	public String getCoverflag()
	{
		return coverflag;
	}
	public void setCoverflag(String coverflag)
	{
		this.coverflag = coverflag;
	}
	
	public String getMatchcondition()
	{
		return matchcondition;
	}
	public void setMatchcondition(String matchcondition)
	{
		this.matchcondition = matchcondition;
	}
	public String getSqlkey()
	{
		return sqlkey;
	}
	public void setSqlkey(String sqlkey)
	{
		this.sqlkey = sqlkey;
	}
	public String getSqlgranularity()
	{
		return sqlgranularity;
	}
	public void setSqlgranularity(String sqlgranularity)
	{
		this.sqlgranularity = sqlgranularity;
	}
	public String getRoster_table()
	{
		return roster_table;
	}
	public void setRoster_table(String roster_table)
	{
		this.roster_table = roster_table;
	}
	public String getDatagranularity()
	{
		return datagranularity;
	}
	public void setDatagranularity(String datagranularity)
	{
		this.datagranularity = datagranularity;
	}
	public String getSql_str()
	{
		return sql_str;
	}
	public void setSql_str(String sql_str)
	{
		this.sql_str = sql_str;
	}
	public String getGranularity()
	{
		return granularity;
	}
	public void setGranularity(String granularity)
	{
		this.granularity = granularity;
	}
	public String getGranularity_disp()
	{
		return granularity_disp;
	}
	public void setGranularity_disp(String granularity_disp)
	{
		this.granularity_disp = granularity_disp;
	}
	public Integer getCalculateseq()
	{
		return calculateseq;
	}
	public void setCalculateseq(Integer calculateseq)
	{
		this.calculateseq = calculateseq;
	}
	public String getCalsql()
	{
		return calsql;
	}
	public void setCalsql(String calsql)
	{
		this.calsql = calsql;
	}
	public String getParty_class_cd()
	{
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd)
	{
		this.party_class_cd = party_class_cd;
	}
	public String getFlag_disp()
	{
		return flag_disp;
	}
	public void setFlag_disp(String flag_disp)
	{
		this.flag_disp = flag_disp;
	}
	public String getCoverflag_disp()
	{
		return coverflag_disp;
	}
	public void setCoverflag_disp(String coverflag_disp)
	{
		this.coverflag_disp = coverflag_disp;
	}
	public String getParty_class_cd_disp()
	{
		return party_class_cd_disp;
	}
	public void setParty_class_cd_disp(String party_class_cd_disp)
	{
		this.party_class_cd_disp = party_class_cd_disp;
	}
	public String getCreate_dt_start()
	{
		return create_dt_start;
	}
	public void setCreate_dt_start(String create_dt_start)
	{
		this.create_dt_start = create_dt_start;
	}
	public String getCreate_dt_end()
	{
		return create_dt_end;
	}
	public void setCreate_dt_end(String create_dt_end)
	{
		this.create_dt_end = create_dt_end;
	}
	public String getTemplatekey_temp()
	{
		return templatekey_temp;
	}
	public void setTemplatekey_temp(String templatekey_temp)
	{
		this.templatekey_temp = templatekey_temp;
	}
	public String getSqlgranularity_disp()
	{
		return sqlgranularity_disp;
	}
	public void setSqlgranularity_disp(String sqlgranularity_disp)
	{
		this.sqlgranularity_disp = sqlgranularity_disp;
	}
	public String getDatagranularity_disp()
	{
		return datagranularity_disp;
	}
	public void setDatagranularity_disp(String datagranularity_disp)
	{
		this.datagranularity_disp = datagranularity_disp;
	}
	public String getModuletype()
	{
		return moduletype;
	}
	public void setModuletype(String moduletype)
	{
		this.moduletype = moduletype;
	}
	public String getModuletype_disp()
	{
		if("0".equals(moduletype))
		{
			return "名单模板";
		} else if ("1".equals(moduletype))
		{
			return "回溯模板";
		}
		return moduletype_disp;
	}
	public void setModuletype_disp(String moduletype_disp)
	{
		this.moduletype_disp = moduletype_disp;
	}
	public String getValidateSql()
	{
		return validateSql;
	}
	public void setValidateSql(String validateSql)
	{
		this.validateSql = validateSql;
	}
	
	
	
	
	
}
