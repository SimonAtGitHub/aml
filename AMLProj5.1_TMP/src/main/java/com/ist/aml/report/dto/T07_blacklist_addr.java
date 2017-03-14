package com.ist.aml.report.dto;

import java.io.Serializable;

public class T07_blacklist_addr implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5922437621445440684L;
	private String party_id;
	private String address;
	private String country;
	private String city;
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

}
