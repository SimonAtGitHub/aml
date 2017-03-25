/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T37_risk_attach;
/*     */ import com.ist.common.LogUtils;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.properties.XMLProperties;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import org.apache.log4j.Logger;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T37_risk_attachDAO extends BaseDAO
/*     */ {
/*  42 */   private static Logger logger = LogUtils.getLogger(T37_risk_attachDAO.class
/*  43 */     .getName());
/*     */ 
/*     */   public ArrayList getT37_risk_attachList(SqlMapClient sqlMap, T37_risk_attach t37_risk_attach, int iStartRec, int iPageSize, ApplicationContext context)
/*     */     throws SQLException
/*     */   {
/*  68 */     ArrayList list = (ArrayList)sqlMap
/*  69 */       .queryForList("getT37_risk_attachList", t37_risk_attach, 
/*  70 */       iStartRec, iPageSize);
/*  71 */     ArrayList t37_risk_attachList = new ArrayList();
/*  72 */     XMLProperties sysConfig = (XMLProperties)context.getBean("sysConfig");
/*  73 */     String rootPath = sysConfig.getProperty("data.import");
/*  74 */     Iterator iter = list.iterator();
/*  75 */     while (iter.hasNext()) {
/*  76 */       T37_risk_attach t37_risk_attach1 = (T37_risk_attach)iter.next();
/*  77 */       if (t37_risk_attach1.getLoad_date() != null) {
/*  78 */         t37_risk_attach1.setLoad_date_disp(
/*  79 */           DateUtils.dateToString(t37_risk_attach1.getLoad_date()));
/*     */       }
/*  81 */       t37_risk_attach1.setAttach_name(rootPath + t37_risk_attach1.getAttach_name());
/*  82 */       t37_risk_attachList.add(t37_risk_attach1);
/*     */     }
/*  84 */     return t37_risk_attachList;
/*     */   }
/*     */ 
/*     */   public int getT37_risk_attachListCount(SqlMapClient sqlMap, T37_risk_attach t37_risk_attach)
/*     */     throws SQLException
/*     */   {
/*  99 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 100 */       "getT37_risk_attachListCount", t37_risk_attach);
/* 101 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T37_risk_attach getT37_risk_attachDisp(SqlMapClient sqlMap, String resulekey)
/*     */     throws SQLException
/*     */   {
/* 116 */     T37_risk_attach t37_risk_attach = (T37_risk_attach)sqlMap
/* 117 */       .queryForObject("getT37_risk_attachDisp", resulekey);
/* 118 */     if (t37_risk_attach == null)
/* 119 */       t37_risk_attach = new T37_risk_attach();
/* 120 */     return t37_risk_attach;
/*     */   }
/*     */ 
/*     */   public T37_risk_attach getT37_risk_attachDispByAttachkey(SqlMapClient sqlMap, String attachkey) throws SQLException {
/* 124 */     T37_risk_attach t37_risk_attach = (T37_risk_attach)sqlMap
/* 125 */       .queryForObject("getT37_risk_attachDispByAttachkey", attachkey);
/* 126 */     if (t37_risk_attach == null)
/* 127 */       t37_risk_attach = new T37_risk_attach();
/* 128 */     return t37_risk_attach;
/*     */   }
/*     */ 
/*     */   public int insertT37_risk_attach(SqlMapClient sqlMap, T37_risk_attach t37_risk_attach)
/*     */     throws SQLException
/*     */   {
/* 142 */     int i = sqlMap.update("insertT37_risk_attach", t37_risk_attach);
/* 143 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT37_risk_attach(SqlMapClient sqlMap, String application_num)
/*     */     throws SQLException
/*     */   {
/* 160 */     int i = sqlMap.update("deleteT37_risk_attach", application_num);
/* 161 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T37_risk_attachDAO
 * JD-Core Version:    0.6.2
 */