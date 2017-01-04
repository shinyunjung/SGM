package com.spring.main.dto;

public class AdDto {
	
	String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"};
	private String ad_idx;
	private String ad_host;
	private String ad_manager;
	private String ad_type;
	private String ad_title;
	private String ad_content;
	private String ad_area;
	private String ad_address;
	private String ad_vcount;
	private String ad_exposure;
	private String ad_lat;
	private String ad_lng;
	private String s_date;
	private String e_date;
	private String ad_count;
	private String ad_state;
	
	public String getAd_idx() {
		return ad_idx;
	}
	public void setAd_idx(String ad_idx) {
		this.ad_idx = ad_idx;
	}
	public String getAd_host() {
		return ad_host;
	}
	public void setAd_host(String ad_host) {
		this.ad_host = ad_host;
	}
	public String getAd_manager() {
		return ad_manager;
	}
	public void setAd_manager(String ad_manager) {
		this.ad_manager = ad_manager;
	}
	public String getAd_type() {
		return ad_type;
	}
	public void setAd_type(String ad_type) {
		this.ad_type = ad_type;
	}
	public String getAd_title() {
		return ad_title;
	}
	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}
	public String getAd_content() {
		return ad_content;
	}
	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	public String getAd_area() {
		return ad_area;
	}
	public void setAd_area(int ad_area) {
		this.ad_area = area[ad_area];;
	}
	public String getAd_address() {
		return ad_address;
	}
	public void setAd_address(String ad_address) {
		this.ad_address = ad_address;
	}
	public String getAd_vcount() {
		return ad_vcount;
	}
	public void setAd_vcount(String ad_vcount) {
		this.ad_vcount = ad_vcount;
	}
	public String getAd_exposure() {
		return ad_exposure;
	}
	public void setAd_exposure(String ad_exposure) {
		this.ad_exposure = ad_exposure;
	}
	public String getAd_lat() {
		return ad_lat;
	}
	public void setAd_lat(String ad_lat) {
		this.ad_lat = ad_lat;
	}
	public String getAd_lng() {
		return ad_lng;
	}
	public void setAd_lng(String ad_lng) {
		this.ad_lng = ad_lng;
	}
	public String getS_date() {
		return s_date;
	}
	public void setE_Sate(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getAd_count() {
		return ad_count;
	}
	public void setAd_count(String ad_count) {
		this.ad_count = ad_count;
	}
	public String getAd_state() {
		return ad_state;
	}
	public void setAd_state(String ad_state) {
		this.ad_state = ad_state;
	}
	
	

}
