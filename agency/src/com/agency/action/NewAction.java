package com.agency.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.agency.service.HouseService;
import com.agency.service.NewService;
import com.agency.service.PhotoService;
import com.agency.util.Page;
import com.agency.util.UploadImgs;
import com.agency.util.WebXMLParameter;
@Component
@Scope("prototype")
@Action(value="newAction",results={
		@Result(name="success",location="/new/new.jsp"),
		@Result(name="getNewsByTitle",location="/new/new.jsp"),
		@Result(name="addNew",location="newAction.action",type="redirect"),
		@Result(name="editNew",location="newAction.action",type="redirect"),
		@Result(name="jumpEditNew",location="/jsp/New/edit.jsp"),
		@Result(name="deleteNew",location="newAction.action",type="redirect"),
		@Result(name="hideNew",location="newAction.action",type="redirect"),
		@Result(name="showNew",location="newAction.action",type="redirect"),
		@Result(name="detailNew",location="/jsp/New/detail.jsp"),
})
public class NewAction extends BaseAction {
	@Autowired
	private NewService newServiceImpl;
	@Autowired
	private PhotoService photoServiceImpl;
	private New news;
	private List<New> newList;
	private String title;
	private int newId;
	private List<Photo> photos;
	private List<File> myFile = new ArrayList<File>();    
    private List<String> fileName = new ArrayList<String>();    //文件名  
    private List<String> imageFileName = new ArrayList<String>();
    private String pageHtml;// 分页
	private int cp = 1;// 当前页
	public String execute(){
		Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(newServiceImpl.getNewsCount());
		newList = newServiceImpl.getNews(page);
		pageHtml = page.getPage("newAction.action");
		return "success";
	}
	public String  getNewsByTitle(){
		Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(newServiceImpl.getNewCountByTitle(title));
		newList = newServiceImpl.getNewsByTitle(title, page);
		pageHtml=page.getPage("newAction!getNewsByTitle.action?title="+title);
    	return "getNewsByTitle";
    }
	public String addNew(){
		news.setIsdelete("否");
		int id = newServiceImpl.addNewAndGetId(news);
		String url = WebXMLParameter.getParamValue("NPic");
		imageFileName = UploadImgs.upload(myFile,fileName, url);
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("emptyError"))
		{
			return "addNew";
		}
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("typeError"))
		{
			return "addNew";
		}
		photoServiceImpl.addPhotosByNew(id, imageFileName);
		return "addNew";
	}
	public String jumpEditNew(){
		news=newServiceImpl.getNewById(newId);
		return "jumpEditNew";
	}
	public String editNew()
	{
		New n =  newServiceImpl.getNewById(news.getNewid());
		news.setNewid(n.getNewid());
		news.setIsdelete(n.getIsdelete());
		newServiceImpl.editNew(news);
		String url = WebXMLParameter.getParamValue("NPic");
		imageFileName = UploadImgs.upload(myFile,fileName, url);
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("emptyError"))
		{
			return "editNew";
		}
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("typeError"))
		{
			return "editNew";
		}
		photoServiceImpl.deletePhotosByNew(news.getNewid());
		photoServiceImpl.addPhotosByNew(news.getNewid(), imageFileName);
		return "editNew";
	}
	public String deleteNew(){
		news=newServiceImpl.getNewById(newId);
		news.setIsdelete("是");
		newServiceImpl.editNew(news);
	 	return "deleteNew";
	}
	public String showNew(){
		news=newServiceImpl.getNewById(newId);
		news.setStatus("是");
		newServiceImpl.editNew(news);
		return "showNew";
	}
	public String hideNew(){
		news=newServiceImpl.getNewById(newId);
		news.setStatus("否");
		newServiceImpl.editNew(news);
		return "hideNew";
	}
	public String detailNew(){
		news=newServiceImpl.getNewById(newId);
		setPhotos(photoServiceImpl.getPhotosByNew(news.getNewid()));
		return "detailNew";
	}
	public New getNews() {
		return news;
	}
	public void setNews(New news) {
		this.news = news;
	}

	public List<File> getMyFile() {  
        return myFile;  
    }  
  
    public void setMyFile(List<File> myFile) {  
        this.myFile = myFile;  
    }  
  
  
  
    public List<String> getMyFileFileName() {  
        return fileName;  
    }  
  
    public void setMyFileFileName(List<String> fileName) {  
        this.fileName = fileName;  
    }  
  
  
    public List<String> getImageFileName() {  
        return imageFileName;  
    }  
  
    public void setImageFileName(List<String> imageFileName) {  
        this.imageFileName = imageFileName;  
    }
	public String getPageHtml() {
		return pageHtml;
	}
	public void setPageHtml(String pageHtml) {
		this.pageHtml = pageHtml;
	}
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	public List<New> getNewList() {
		return newList;
	}
	public void setNewList(List<New> newList) {
		this.newList = newList;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNewId() {
		return newId;
	}
	public void setNewId(int newId) {
		this.newId = newId;
	}
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}
}
