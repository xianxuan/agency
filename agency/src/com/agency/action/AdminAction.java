package com.agency.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.support.incrementer.AbstractDataFieldMaxValueIncrementer;
import org.springframework.stereotype.Component;

import com.agency.action.base.BaseAction;
import com.agency.entity.Admin;
import com.agency.entity.Hy;
import com.agency.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.sun.org.apache.bcel.internal.generic.NEW;

import freemarker.template.utility.DOMNodeModel;
@Component
@Scope("prototype")
@Action(value="adminAction",results={
		@Result(name="success",location="houseAction!getAdminHouses.action",type="redirect"),
		@Result(name="logout",location="indexAction.action",type="redirect"),

})
public class AdminAction extends BaseAction {
	@Autowired
	private AdminService adminServiceImpl;
	private Admin admin;
	private String flag;
	private String userName;
	private String password;

	public String execute(){
		return "success";
	}
	public String checkLogin(){
		String json="";
		Admin  admin = adminServiceImpl.getadminByAccount(userName);
		if(admin==null||admin.getAAccount()==null||admin.getAAccount().equals(""))
		{
			json="用户名不存在";
		}
		else if(!admin.getAPsw().equals(password))
		{
			json="密码错误";
		}
		else
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("admin", admin);
		}
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(
						org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String logout()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
	 	session.invalidate();
		return "logout";
	}
	public AdminService getAdminServiceImpl() {
		return adminServiceImpl;
	}
	public void setAdminServiceImpl(AdminService adminServiceImpl) {
		this.adminServiceImpl = adminServiceImpl;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
