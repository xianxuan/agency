// default package
package com.agency.entity;
import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "admin", catalog = "agency")
public class Admin implements java.io.Serializable {

	// Fields

	private Integer adminId;
	private String AAccount;
	private String APsw;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(Integer adminId) {
		this.adminId = adminId;
	}

	/** full constructor */
	public Admin(Integer adminId, String AAccount, String APsw) {
		this.adminId = adminId;
		this.AAccount=AAccount;
		this.APsw = APsw;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "AdminId", unique = true, nullable = false)
	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	@Column(name = "A_PSW")
	public String getAPsw() {
		return this.APsw;
	}

	public void setAPsw(String APsw) {
		this.APsw = APsw;
	}
	@Column(name = "A_Account")
	public String getAAccount() {
		return AAccount;
	}

	public void setAAccount(String aAccount) {
		AAccount = aAccount;
	}

}