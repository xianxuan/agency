package com.agency.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.agency.dao.PhotoDao;
import com.agency.entity.Photo;
import com.agency.service.PhotoService;
@Controller("photoServiceImpl")
public class PhotoServiceImpl implements PhotoService {
	@Autowired
	private PhotoDao photoDao;
	@Override
	public void addPhotosByHouse(int id, List<String> url) {
		// TODO Auto-generated method stub
		for(int i=0;i<url.size();i++)
		{
			Photo photo = new Photo();
			photo.setUrl(url.get(i));
			photo.setHid(id);
			photoDao.Save(photo);
		}
	}
	@Override
	public void deletePhotosByHouse(int id) {
		// TODO Auto-generated method stub
		String hql="delete from Photo photo where photo.hid ="+id;
		photoDao.delete(hql);
	}
	@Override
	public List<Photo> getPhotosByHouse(int id) {
		// TODO Auto-generated method stub
		String hql = "from Photo photo where photo.hid ="+id;
		return photoDao.find(hql);
	}
	@Override
	public void addPhotosByNew(int id, List<String> url) {
		// TODO Auto-generated method stub
		for(int i=0;i<url.size();i++)
		{
			Photo photo = new Photo();
			photo.setUrl(url.get(i));
			photo.setNid(id);
			photoDao.Save(photo);
		}
	}
	@Override
	public void deletePhotosByNew(int id) {
		// TODO Auto-generated method stub
		String hql="delete from Photo photo where photo.nid ="+id;
		photoDao.delete(hql);
	}
	@Override
	public List<Photo> getPhotosByNew(int id) {
		// TODO Auto-generated method stub
		String hql = "from Photo photo where photo.nid ="+id;
		return photoDao.find(hql);
	}


}
