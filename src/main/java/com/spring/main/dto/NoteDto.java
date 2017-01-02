package com.spring.main.dto;

import java.sql.Date;

public class NoteDto {
	private String n_idx;
	private String n_writer;
	private String writer_idx;
	private String n_receiver;
	private String receiver_idx;
	private String n_title;
	private String n_content;
	private Date n_date;
	private String n_confirm;
	private String n_new;
	
	
	public String getN_idx() {
		return n_idx;
	}
	public void setN_idx(String n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getWriter_idx() {
		return writer_idx;
	}
	public void setWriter_idx(String writer_idx) {
		this.writer_idx = writer_idx;
	}
	public String getN_receiver() {
		return n_receiver;
	}
	public void setN_receiver(String n_receiver) {
		this.n_receiver = n_receiver;
	}
	public String getReceiver_idx() {
		return receiver_idx;
	}
	public void setReceiver_idx(String receiver_idx) {
		this.receiver_idx = receiver_idx;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_confirm() {
		return n_confirm;
	}
	public void setN_confirm(String n_confirm) {
		this.n_confirm = n_confirm;
	}
	public String getN_new() {
		return n_new;
	}
	public void setN_new(String n_new) {
		this.n_new = n_new;
	}
	
	
	
	
}
