package com.agency.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.agency.dao.AdminDao;
import com.agency.entity.Admin;
import com.agency.service.AdminService;
@Controller("adminServiceImpl")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	@Override
	public Admin getadminByAccount(String account) {
		// TODO Auto-generated method stub
		String hql ="from Admin admin where admin.AAccount = '"+account+"'";
		return adminDao.Get(hql);
	}

}
