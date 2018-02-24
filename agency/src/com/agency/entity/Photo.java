// default package
package com.agency.entity;
import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.java_cup.internal.runtime.virtual_parse_stack;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Photo", catalog = "agency")
public class Photo implements java.io.Serializable {

	// Fields

	private Integer PId;
	private String url;
	private Integer hid;
	private Integer nid;
	private Integer aid;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "PId", unique = true, nullable = false)
	public Integer getPId() {
		return PId;
	}

	public void setPId(Integer pId) {
		PId = pId;
	}
	@Column(name = "P_Url")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "N_Id")
	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}
	@Column(name = "A_Id")
	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}
	@Column(name = "H_Id")
	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	

	

	
}