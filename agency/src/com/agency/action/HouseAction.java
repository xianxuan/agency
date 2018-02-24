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
import com.agency.entity.Photo;
import com.agency.service.HouseService;
import com.agency.service.PhotoService;
import com.agency.util.Page;
import com.agency.util.UploadImgs;
import com.agency.util.WebXMLParameter;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;
@Component
@Scope("prototype")
@Action(value="houseAction",results={
		@Result(name="success",location="/new/index.jsp"),
		@Result(name="getNewHouses",location="/new/index.jsp"),
		@Result(name="getGoodHouses",location="/new/index.jsp"),
		@Result(name="getAdminHouses",location="/new/adminIndex.jsp"),
		@Result(name="getAdminNewHouses",location="/new/adminIndex.jsp"),
		@Result(name="getAdminGoodHouses",location="/new/adminIndex.jsp"),
		@Result(name="getAdminHouseByName",location="/new/adminIndex.jsp"),
		@Result(name="setGoodHouse",location="houseAction!getAdminHouses.action",type="redirect"),
		@Result(name="cancleGoodHouse",location="houseAction!getAdminHouses.action",type="redirect"),
		@Result(name="adminDeleteHouse",location="houseAction!getAdminHouses.action",type="redirect"),
		@Result(name="getHousesByName",location="/new/index.jsp"),
		@Result(name="addHouse",location="houseAction.action",type="redirect"),
		@Result(name="editHouse",location="houseAction.action",type="redirect"),
		@Result(name="jumpEditHouse",location="/jsp/House/edit.jsp"),
		@Result(name="deleteHouse",location="houseAction.action",type="redirect"),
		@Result(name="rentHouse",location="houseAction.action",type="redirect"),
		@Result(name="callHouse",location="houseAction.action",type="redirect"),
		@Result(name="detailHouse",location="/jsp/House/detail.jsp"),

})
public class HouseAction extends BaseAction {
	@Autowired
	private HouseService houseServiceImpl;
	@Autowired
	private PhotoService photoServiceImpl;
	private House house;
	private List<House> houses;
	private List<Photo> photos;
	private int houseId;
	private String name;
	private List<File> myFile = new ArrayList<File>();    
    private List<String> fileName = new ArrayList<String>();    //文件名  
    private List<String> imageFileName = new ArrayList<String>();
    private String pageHtml;// 分页
	private int cp = 1;// 当前页
    public String execute(){
    	HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
		Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(houseServiceImpl.getHouseCountByUserId(hy.getUserid()));
		houses=houseServiceImpl.getHousesByUserId(hy.getUserid(), page);
		pageHtml=page.getPage("houseAction.action");
    	return "success";
    }
    public String  getHousesByName(){
    	HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
		Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(houseServiceImpl.getHouseCountByUserIDAndName(hy.getUserid(), name));
		houses=houseServiceImpl.getHousesByUserIdAndName(hy.getUserid(), page, name);
		pageHtml=page.getPage("houseAction!getHousesByName.action?name="+name);
    	return "getHousesByName";
    }
    public String getNewHouses(){
    	HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
    	houses=houseServiceImpl.getNewHouses(hy.getUserid());
    	if(houses !=null && houses.size()<10){
    		
    	}else{
    		houses=houses.subList(0, 10);
    	}
    
    	return "getNewHouses";
    }
    public String getGoodHouses(){
    	HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
    	houses=houseServiceImpl.getGoodHouses(hy.getUserid());
    	return "getGoodHouses";
    }
    public String getAdminHouses(){
    	Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(houseServiceImpl.getAdminHousesCount());
		houses=houseServiceImpl.getAdminHouses(page);
		pageHtml=page.getPage("houseAction!getAdminHouses.action");
    	return "getAdminHouses";
    }
    public String getAdminHouseByName(){
    	Page page = new Page();
		page.setCurrentPage(cp);
		page.setTotalNum(houseServiceImpl.getAdminHousesCountByName(name));
		houses=houseServiceImpl.getAdminHousesByName(name, page);
		pageHtml=page.getPage("houseAction!getAdminHouseByName.action?name="+name);
    	return "getAdminHouseByName";
    }
    public String getAdminNewHouses(){
    	
    	houses=houseServiceImpl.getAdminNewHouses();
    	if(houses !=null && houses.size()<10){
    		
    	}else{
    		houses=houses.subList(0, 10);
    	}
    	return "getAdminNewHouses";
    }
    public String getAdminGoodHouses(){
    	houses=houseServiceImpl.getAdminGoodHouses();
    	return "getAdminGoodHouses";
    }
    public String setGoodHouse(){
    	house=houseServiceImpl.getHouseById(houseId);
		house.setIsgood("是");
		houseServiceImpl.editHhouse(house);
    	return "setGoodHouse";
    }
    public String cancleGoodHouse(){
    	house=houseServiceImpl.getHouseById(houseId);
		house.setIsgood("否");
		houseServiceImpl.editHhouse(house);
    	return "cancleGoodHouse";
    }
	public String addHouse()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
		house.setIsdelete("否");
		house.setIsgood("否");
		house.setIsrent("否");
		house.setUserid(hy.getUserid());
		int id = houseServiceImpl.addHouseAndGetId(house);
		String url = WebXMLParameter.getParamValue("HPic");
		imageFileName = UploadImgs.upload(myFile,fileName, url);
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("emptyError"))
		{
			return "addHouse";
		}
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("typeError"))
		{
			return "addHouse";
		}
		photoServiceImpl.addPhotosByHouse(id, imageFileName);
		return "addHouse";
	}
	public String jumpEditHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		return "jumpEditHouse";
	}
	public String editHouse()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Hy hy = (Hy) session.getAttribute("hy");
		House h = houseServiceImpl.getHouseById(house.getHouseid());
		house.setIsgood(h.getIsgood());
		house.setIsrent(h.getIsrent());
		house.setUserid(hy.getUserid());
		house.setIsdelete("否");
		houseServiceImpl.editHhouse(house);
		String url = WebXMLParameter.getParamValue("HPic");
		imageFileName = UploadImgs.upload(myFile,fileName, url);
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("emptyError"))
		{
			return "editHouse";
		}
		if(imageFileName.size() == 1 && imageFileName.get(0).equals("typeError"))
		{
			return "editHouse";
		}
		photoServiceImpl.deletePhotosByHouse(house.getHouseid());
		photoServiceImpl.addPhotosByHouse(house.getHouseid(), imageFileName);
		return "editHouse";
	}
	public String deleteHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		house.setIsdelete("是");
		houseServiceImpl.editHhouse(house);
	 	return "deleteHouse";
	}
	public String adminDeleteHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		house.setIsdelete("是");
		houseServiceImpl.editHhouse(house);
		return "adminDeleteHouse";
	}
	public String rentHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		house.setIsrent("是");
		houseServiceImpl.editHhouse(house);
		return "rentHouse";
	}
	public String callHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		house.setIsrent("否");
		houseServiceImpl.editHhouse(house);
		return "callHouse";
	}
	public String detailHouse(){
		house=houseServiceImpl.getHouseById(houseId);
		photos = photoServiceImpl.getPhotosByHouse(house.getHouseid());
		return "detailHouse";
	}
	public House getHouse() {
		return house;
	}


	public void setHouse(House house) {
		this.house = house;
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
	public List<House> getHouses() {
		return houses;
	}
	public void setHouses(List<House> houses) {
		this.houses = houses;
	}
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

}
