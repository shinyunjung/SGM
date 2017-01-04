package com.spring.main.dto;

import oracle.sql.DATE;

public class freelistDTO {
   
	
   private int totalidx;
   private int j_idx;
   private int u_idx;
   private String j_name;
   private String j_category;
   private String j_title;
   private String j_content;
   private DATE j_date;
   private int j_filenum;
   private int j_vcount;
   private int j_reple;
   
   
   public int getTotalidx() {
	   return totalidx;
   }
   public void setTotalidx(int totalidx) {
	   this.totalidx = totalidx;
   }
   
   public int getJ_idx() {
      return j_idx;
   }
   public void setJ_idx(int j_idx) {
      this.j_idx = j_idx;
   }
   public int getU_idx() {
      return u_idx;
   }
   public void setU_idx(int u_idx) {
      this.u_idx = u_idx;
   }
   public String getJ_name() {
      return j_name;
   }
   public void setJ_name(String j_name) {
      this.j_name = j_name;
   }
   public String getJ_category() {
      return j_category;
   }
   public void setJ_category(String j_category) {
      this.j_category = j_category;
   }
   public String getJ_title() {
      return j_title;
   }
   public void setJ_title(String j_title) {
      this.j_title = j_title;
   }
   public String getJ_content() {
      return j_content;
   }
   public void setJ_content(String j_content) {
      this.j_content = j_content;
   }
   public DATE getJ_date() {
      return j_date;
   }
   public void setJ_date(DATE j_date) {
      this.j_date = j_date;
   }
   public int getJ_filenum() {
      return j_filenum;
   }
   public void setJ_filenum(int j_filenum) {
      this.j_filenum = j_filenum;
   }
   public int getJ_vcount() {
      return j_vcount;
   }
   public void setJ_vcount(int j_vcount) {
      this.j_vcount = j_vcount;
   }
   public int getJ_reple() {
      return j_reple;
   }
   public void setJ_reple(int j_reple) {
      this.j_reple = j_reple;
   }
   
   
   
}