package com.agency.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.agency.dao.HyDao;
import com.agency.entity.Hy;
import com.agency.service.HyService;
@Controller("hyServiceImpl")
public class HyServiceImpl implements HyService {
	@Autowired
	private HyDao hyDao;
	@Override
	public void saveHy(Hy hy) {
		// TODO Auto-generated method stub
		hyDao.Save(hy);
	}
	@Override
	public Hy getHyByExmail(String exmail) {
		// TODO Auto-generated method stub
		String hql ="from Hy hy where hy.mail = '"+exmail+"'";
		return hyDao.Get(hql);
	}
	@Override
	public void editHy(Hy hy) {
		// TODO Auto-generated method stub
		hyDao.update(hy);
	}

}
