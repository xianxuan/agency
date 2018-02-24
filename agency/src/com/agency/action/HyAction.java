package com.agency.action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.resource.ResourceUrlEncodingFilter;

import com.agency.action.base.BaseAction;
import com.agency.entity.Admin;
import com.agency.entity.Hy;
import com.agency.pojo.User;
import com.agency.service.AdminService;
import com.agency.service.HyService;
import com.agency.util.UploadImgs;
import com.agency.util.WebXMLParameter;
import com.opensymphony.xwork2.ActionContext;
@Component
@Scope("prototype")
@Action(value="hyAction",results={
		@Result(name="jumpRegister",location="/new/register.jsp"),
		@Result(name="registerError",location="/new/register.jsp"),
		@Result(name="register",location="/new/login.jsp"),
		@Result(name="jumpLogin",location="/new/login.jsp"),
		@Result(name="success",location="houseAction.action",type="redirect"),
		@Result(name="logout",location="indexAction.action",type="redirect"),
		@Result(name="jumpEditInfor",location="/new/infor.jsp"),
		@Result(name="editInfor",location="hyAction!jumpEditInfor.action",type="redirect"),
		@Result(name="editInforError",location="hyAction!jumpEditInfor.action",type="redirect"),

})
public class HyAction extends BaseAction {
	@Autowired
	private HyService hyServiceImpl;
	private Hy user;
	private String flag;
	private String userName;
	private String password;
	
	public String execute(){
		return "success";
	}
	
	public String jumpLogin()
	{
		return "jumpLogin";
	}
	public String checkLogin(){
		String json="";
		Hy  hy = hyServiceImpl.getHyByExmail(userName);
		if(hy==null||hy.getMail()==null||hy.getMail().equals(""))
		{
			json="邮箱不存在";
		}
		else if(!hy.getPsw().equals(password))
		{
			json="密码错误";
		}
		else
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("hy", hy);
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
	public String jumpRegister()
	{
		
		return "jumpRegister";
	}
	public String register(){
		Hy hy=hyServiceImpl.getHyByExmail(user.getMail());
		if(hy!=null)
		{
			setFlag("registerError");
			return "registerError";
		}
		user.setStatus("正常");
		hyServiceImpl.saveHy(user);
		return "register";
	}
	public String jumpEditInfor()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();		
		user = (Hy) session.getAttribute("hy");
		return "jumpEditInfor";
	}
	public String editInfor(){
		Hy hy=hyServiceImpl.getHyByExmail(user.getMail());
		if(hy!=null&&hy.getUserid()!=user.getUserid())
		{
			setFlag("editInforError");
			return "editInforError";
		}
		user.setStatus("正常");
		HttpSession session = ServletActionContext.getRequest().getSession();
	 	session.setAttribute("hy", user);
		hyServiceImpl.editHy(user);
		return "editInfor";
	}
	public Hy getUser() {
		return user;
	}
	public void setUser(Hy user) {
		this.user = user;
	}
	public HyService getHyServiceImpl() {
		return hyServiceImpl;
	}
	public void setHyServiceImpl(HyService hyServiceImpl) {
		this.hyServiceImpl = hyServiceImpl;
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
