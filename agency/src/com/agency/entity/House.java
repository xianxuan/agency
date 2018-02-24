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
@Table(name = "house", catalog = "agency")
public class House implements java.io.Serializable {

	// Fields

	private Integer houseid;
	private String area;
	private String addre;
	private String price;
	private String name;
	private String isdelete;
	private String isrent;
	private String isgood;
	private String type;
	private Integer userid;

	// Constructors

	/** default constructor */
	public House() {
	}
	
	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "HouseId", unique = true, nullable = false)
	public Integer getHouseid() {
		return houseid;
	}

	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}
	@Column(name = "H_Area")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	@Column(name = "H_Addre")
	public String getAddre() {
		return addre;
	}

	public void setAddre(String addre) {
		this.addre = addre;
	}
	@Column(name = "H_Price")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	@Column(name = "H_Name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "IS_Delete")
	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	@Column(name = "IS_Rent")
	public String getIsrent() {
		return isrent;
	}

	public void setIsrent(String isrent) {
		this.isrent = isrent;
	}
	@Column(name = "IS_Good")
	public String getIsgood() {
		return isgood;
	}

	public void setIsgood(String isgood) {
		this.isgood = isgood;
	}
	@Column(name = "H_Type")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "UserId")
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}



	

}