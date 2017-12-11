package com.ist.cms.services.impl;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.cms.dao.T12_ca_programaDAO;
import com.ist.cms.dto.T12_ca_programa;
import com.ist.cms.dto.T12_programa;
import com.ist.cms.services.BaseModuleService;
import com.ist.common.Authorization;
import com.ist.common.util.DateUtils;
import com.ist.platform.dao.T00_moduleDAO;
import com.ist.platform.dto.T00_module;

public class AMLModuleServices extends BaseModuleService {

	public void addT00_module(SqlMapClient sqlMap, T12_programa t12_programa, HttpServletRequest request) throws Exception {
		T00_moduleDAO t00_moduleDAO = (T00_moduleDAO) this.context.getBean("t00_moduleDAO");
		T00_module t00_module = new T00_module();

		String isartcategory = (String) request.getAttribute("isartcategory");
		String url = "";
		String menu_id = "";
		if (t12_programa.getReleasetype().equals("3")) {
			url = t12_programa.getProgramaadd();
		} else if (isartcategory.equals("1")) {
			menu_id = getMenu_id(t12_programa.getProgramakey());
			url = "/cms/knowledgemanager/getT12_articleIndex.do?newsearchflag=1&programakey=" + t12_programa.getProgramakey()
					+ "&menu_id=" + menu_id;
		} else {
			url = "/cms/knowledgemanager/t12_knowledge_list.do?newsearchflag=1&programakey=" + t12_programa.getProgramakey();
		}
		Authorization auth = getAuthorization(request);
		try {
			t00_module = t00_moduleDAO.getT00_moduleDisp(sqlMap, "A" + t12_programa.getProgramakey());
			if (StringUtils.trimToEmpty(t00_module.getModulekey()).equals("")) {
				t00_module.setModulekey("A" + t12_programa.getProgramakey());
				t00_module.setUpmodulekey("A" + t12_programa.getCategorykey());
				t00_module.setModulename(t12_programa.getProgramaname());
				t00_module.setSystemkey("9");
				try {
					t00_module.setDisplayseq((new Long(t12_programa.getDispseq())));
				} catch (Exception e) {
					t00_module.setDisplayseq(Long.valueOf(1000));
				}
				t00_module.setUrl(url);
				t00_module.setCreatedate(DateUtils.getCurrTime());
				t00_module.setCreator(auth.getT00_user().getUsername());
				t00_moduleDAO.insertT00_module(sqlMap, t00_module);
			}
			t00_module = t00_moduleDAO.getT00_moduleDisp(sqlMap, "A" + t12_programa.getCategorykey());
			if (!(StringUtils.trimToEmpty(t00_module.getModulekey()).equals("")))
				return;
			T12_ca_programaDAO t12_ca_programaDAO = (T12_ca_programaDAO) this.context.getBean("t12_ca_programaDAO");
			T12_ca_programa t12_ca_programa = t12_ca_programaDAO.getT12_ca_programaDisp(sqlMap, t12_programa.getCategorykey());
			t00_module.setModulekey("A" + t12_ca_programa.getCategorykey());
			t00_module.setUpmodulekey("-1");
			t00_module.setModulename(t12_ca_programa.getCategoryname());
			t00_module.setSystemkey("9");
			try {
				t00_module.setDisplayseq(new Long(t12_ca_programa.getDispseq()));
			} catch (Exception e) {
				t00_module.setDisplayseq(Long.valueOf(1000));
			}
			t00_module.setUrl("#");
			t00_module.setCreatedate(DateUtils.getCurrTime());
			t00_module.setCreator(auth.getT00_user().getUsername());
			t00_module.setImgurl("to_icon06.png");
			t00_moduleDAO.insertT00_module(sqlMap, t00_module);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}