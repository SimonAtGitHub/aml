/*    */ package com.ist.aml.newrisk.dto;
/*    */ 
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class T31_n_move
/*    */   implements Serializable
/*    */ {
/*    */   private static final long serialVersionUID = 6668544438988123102L;
/* 30 */   private String oper_id = "";
/*    */ 
/* 32 */   private String oper_url = "";
/*    */ 
/* 37 */   private String node_id = "";
/*    */ 
/* 39 */   private Long oper_seq = null;
/*    */ 
/* 41 */   private String oper_desc = "";
/*    */ 
/* 44 */   private String post_id = "";
/*    */ 
/*    */   public String getPost_id()
/*    */   {
/* 55 */     return this.post_id;
/*    */   }
/*    */   public void setPost_id(String postId) {
/* 58 */     this.post_id = postId;
/*    */   }
/*    */ 
/*    */   public void setOper_id(String oper_idStr)
/*    */   {
/* 63 */     this.oper_id = oper_idStr;
/*    */   }
/*    */   public String getOper_id() {
/* 66 */     return this.oper_id;
/*    */   }
/*    */ 
/*    */   public void setOper_url(String oper_urlStr) {
/* 70 */     this.oper_url = oper_urlStr;
/*    */   }
/*    */   public String getOper_url() {
/* 73 */     return this.oper_url;
/*    */   }
/*    */ 
/*    */   public void setNode_id(String node_idStr)
/*    */   {
/* 79 */     this.node_id = node_idStr;
/*    */   }
/*    */   public String getNode_id() {
/* 82 */     return this.node_id;
/*    */   }
/*    */ 
/*    */   public void setOper_seq(Long oper_seqStr) {
/* 86 */     this.oper_seq = oper_seqStr;
/*    */   }
/*    */   public Long getOper_seq() {
/* 89 */     return this.oper_seq;
/*    */   }
/*    */ 
/*    */   public void setOper_desc(String oper_descStr) {
/* 93 */     this.oper_desc = oper_descStr;
/*    */   }
/*    */   public String getOper_desc() {
/* 96 */     return this.oper_desc;
/*    */   }
/*    */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_n_move
 * JD-Core Version:    0.6.2
 */