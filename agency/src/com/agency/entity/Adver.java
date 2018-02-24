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
@Table(name = "Adver", catalog = "agency")
public class Adver implements java.io.Serializable {

	// Fields

	private Integer AdverId;
	private String A_Title;
	private String A_Content;

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "AdverId", unique = true, nullable = false)
	public Integer getAdverId() {
		return AdverId;
	}
	public void setAdverId(Integer adverId) {
		AdverId = adverId;
	}

	@Column(name = "A_Title")
	public String getA_Title() {
		return A_Title;
	}
	public void setA_Title(String a_Title) {
		A_Title = a_Title;
	}

	@Column(name = "A_Content")
	public String getA_Content() {
		return A_Content;
	}
	public void setA_Content(String a_Content) {
		A_Content = a_Content;
	}

	@Column(name = "A_Status")
	public String getA_Status() {
		return A_Status;
	}
	public void setA_Status(String a_Status) {
		A_Status = a_Status;
	}

	@Column(name = "IS_Delete")
	public String getIS_Delete() {
		return IS_Delete;
	}
	public void setIS_Delete(String iS_Delete) {
		IS_Delete = iS_Delete;
	}
	private String A_Status;
	private String IS_Delete;
}