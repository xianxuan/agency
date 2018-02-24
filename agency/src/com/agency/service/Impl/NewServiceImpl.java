package com.agency.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.agency.dao.AdminDao;
import com.agency.dao.NewDao;
import com.agency.entity.Admin;
import com.agency.entity.New;
import com.agency.service.AdminService;
import com.agency.service.NewService;
import com.agency.util.Page;
@Controller("newServiceImpl")
public class NewServiceImpl implements NewService {
	@Autowired
	private NewDao newDao;
	@Override
	public int addNewAndGetId(New news) {
		// TODO Auto-generated method stub
		String sql = "select auto_increment from information_schema.`TABLES` where table_name = 'new' and TABLE_SCHEMA='agency'";
		newDao.Save(news);
		return newDao.getPrefetching(sql);
	}
	@Override
	public long getNewsCount() {
		// TODO Auto-generated method stub
		String hql="select count(*) from New n where n.isdelete = '否'";		
		return newDao.count(hql);
	}
	@Override
	public List<New> getNews(Page page) {
		// TODO Auto-generated method stub
		String hql="from New n where n.isdelete = '否'";
		return newDao.find(hql, page.getCurrentPage(), page.getPageSize());
	}
	@Override
	public New getNewById(int id) {
		// TODO Auto-generated method stub
		String hql="from New n where n.newid ="+id;
		return newDao.Get(hql);
	}
	@Override
	public void editNew(New n) {
		// TODO Auto-generated method stub
		newDao.update(n);
	}
	@Override
	public long getNewCountByTitle(String title) {
		// TODO Auto-generated method stub
		String hql="select count(*) from New n where n.isdelete = '否' and n.title like '%"+title+"%'";	
		return newDao.count(hql);
	}
	@Override
	public List<New> getNewsByTitle(String title, Page page) {
		String hql="from New n where n.isdelete = '否' and n.title like '%"+title+"%'";
		return newDao.find(hql, page.getCurrentPage(), page.getPageSize());
	}
	@Override
	public List<New> getAllNews() {
		String hql="from New n where n.isdelete = '否' and n.status = '是'";
		return newDao.find(hql);
	}

}
