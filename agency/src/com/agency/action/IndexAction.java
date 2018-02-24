package com.agency.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.LifecycleListener;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.agency.action.base.BaseAction;
import com.agency.dao.PhotoDao;
import com.agency.entity.House;
import com.agency.entity.Hy;
import com.agency.entity.New;
import com.agency.entity.Photo;
import com.agency.pojo.HousePic;
import com.agency.pojo.NewPic;
import com.agency.service.HouseService;
import com.agency.service.NewService;
import com.agency.service.PhotoService;
import com.agency.util.Page;
import com.agency.util.UploadImgs;
import com.agency.util.WebXMLParameter;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;
@Component
@Scope("prototype")
@Action(value="indexAction",results={
		@Result(name="success",location="/stage/index.jsp"),
		@Result(name="second",location="/stage/second.jsp"),
		@Result(name="getHouseById",location="/stage/house.jsp"),
		@Result(name="getNewById",location="/stage/new.jsp"),
		

})
public class IndexAction extends BaseAction {
	@Autowired
	private HouseService houseServiceImpl;
	@Autowired
	private PhotoService photoServiceImpl;
	@Autowired
	private NewService newServiceImpl;
	private List<HousePic> housePics=new ArrayList<HousePic>();
	private List<NewPic> newPics=new ArrayList<NewPic>();
	private int id;
	private New news;
	private House house;
	private List<Photo> photos;
	private String picUrl;
    public String execute(){
    	List<House> houses=houseServiceImpl.getAllHouses();
    	List<New> news=newServiceImpl.getAllNews();
    	for(int i=0;i<houses.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByHouse(houses.get(i).getHouseid());
    		HousePic housePic=new HousePic();
    		if(photos==null||photos.isEmpty()){
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl("");
    		}else{
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl(photos.get(0).getUrl());
    		}
    		housePics.add(housePic);
    	}
    	for(int i=0;i<news.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByNew(news.get(i).getNewid());
    		NewPic newPic=new NewPic();
    		if(photos==null||photos.isEmpty()){
    			newPic.setUrl("");
    			newPic.setNews(news.get(i));
    		}else{
    			newPic.setNews(news.get(i));
    			newPic.setUrl(photos.get(0).getUrl());
    		}
    		newPics.add(newPic);
    	}
    	return "success";
    }
    public String getGood(){
    	List<House> houses=houseServiceImpl.getAdminGoodHouses();
    	List<New> news=newServiceImpl.getAllNews();
    	for(int i=0;i<houses.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByHouse(houses.get(i).getHouseid());
    		HousePic housePic=new HousePic();
    		if(photos==null||photos.isEmpty()){
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl("");
    		}else{
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl(photos.get(0).getUrl());
    		}
    		housePics.add(housePic);
    	}
    	for(int i=0;i<news.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByNew(news.get(i).getNewid());
    		NewPic newPic=new NewPic();
    		if(photos==null||photos.isEmpty()){
    			newPic.setUrl("");
    			newPic.setNews(news.get(i));
    		}else{
    			newPic.setNews(news.get(i));
    			newPic.setUrl(photos.get(0).getUrl());
    		}
    		newPics.add(newPic);
    	}
    	return "second";
    }
    public String getNew(){
    	List<House> houses=houseServiceImpl.getAdminNewHouses();
    	if(houses !=null && houses.size()<10){
    		
    	}else{
    		houses=houses.subList(0, 10);
    	}
    	List<New> news=newServiceImpl.getAllNews();
    	for(int i=0;i<houses.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByHouse(houses.get(i).getHouseid());
    		HousePic housePic=new HousePic();
    		if(photos==null||photos.isEmpty()){
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl("");
    		}else{
    			housePic.setHouse(houses.get(i));
    			housePic.setUrl(photos.get(0).getUrl());
    		}
    		housePics.add(housePic);
    	}
    	for(int i=0;i<news.size();i++){
    		List<Photo> photos=photoServiceImpl.getPhotosByNew(news.get(i).getNewid());
    		NewPic newPic=new NewPic();
    		if(photos==null||photos.isEmpty()){
    			newPic.setUrl("");
    			newPic.setNews(news.get(i));
    		}else{
    			newPic.setNews(news.get(i));
    			newPic.setUrl(photos.get(0).getUrl());
    		}
    		newPics.add(newPic);
    	}
    	return "second";
    }
    public String getNewById(){
    	news=newServiceImpl.getNewById(id);
    	photos=photoServiceImpl.getPhotosByNew(id);
    	if(photos==null||photos.isEmpty()){
    		picUrl="";
    	}else{
    		picUrl=photos.get(0).getUrl();
    	}
    	return "getNewById";
    }
    public String getHouseById(){
    	house=houseServiceImpl.getHouseById(id);
    	photos=photoServiceImpl.getPhotosByHouse(id);
    	if(photos==null||photos.isEmpty()){
    		picUrl="";
    	}else{
    		picUrl=photos.get(0).getUrl();
    	}
    	return "getHouseById";
    }
	public List<HousePic> getHousePics() {
		return housePics;
	}
	public void setHousePics(List<HousePic> housePics) {
		this.housePics = housePics;
	}
	public List<NewPic> getNewPics() {
		return newPics;
	}
	public void setNewPics(List<NewPic> newPics) {
		this.newPics = newPics;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public New getNews() {
		return news;
	}
	public void setNews(New news) {
		this.news = news;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
  

}
