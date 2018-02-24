package com.agency.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;

import com.agency.dao.HouseDao;
import com.agency.entity.House;
import com.agency.service.AdminService;
import com.agency.service.HouseService;
import com.agency.util.Page;
@Controller("houseServiceImpl")
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao houseDao;
	@Override
	public int addHouseAndGetId(House house) {
		// TODO Auto-generated method stub
		String sql = "select auto_increment from information_schema.`TABLES` where table_name = 'house' and TABLE_SCHEMA='agency'";
		houseDao.Save(house);
		return houseDao.getPrefetching(sql);
	}
	@Override
	public List<House> getHousesByUserId(int userId, Page page) {
		// TODO Auto-generated method stub
		String hql="from House house where house.userid = "+userId+" and house.isdelete = '否'";
		List<House> houses=houseDao.find(hql, page.getCurrentPage(), page.getPageSize());
		return houses;
	}
	@Override
	public long getHouseCountByUserId(int userId) {
		// TODO Auto-generated method stub
		String hql="select count(*) from House house where house.userid = "+userId+" and house.isdelete = '否'";
		return houseDao.count(hql);
	}
	@Override
	public House getHouseById(int houseId) {
		// TODO Auto-generated method stub
		String hql="from House house where house.houseid ="+houseId;
		return houseDao.Get(hql);
	}
	@Override
	public void editHhouse(House house) {
		// TODO Auto-generated method stub
		houseDao.update(house);
	}
	@Override
	public List<House> getHousesByUserIdAndName(int userId, Page page, String name) {
		// TODO Auto-generated method stub
		String hql="from House house where house.userid = "+userId+" and house.isdelete = '否' and house.name like '%"+name+"%'";
		List<House> houses=houseDao.find(hql, page.getCurrentPage(), page.getPageSize());
		return houses;
	}
	@Override
	public long getHouseCountByUserIDAndName(int userId, String name) {
		// TODO Auto-generated method stub
		String hql="select count(*) from House house where house.userid = "+userId+" and house.isdelete = '否' and house.name like '%"+name+"%'";
		return houseDao.count(hql);
	}
	@Override
	public long getAdminHousesCount() {
		// TODO Auto-generated method stub
		String hql="select count(*) from House house where  house.isdelete = '否'";
		return houseDao.count(hql);
	}
	@Override
	public List<House> getAdminHouses(Page page) {
		// TODO Auto-generated method stub
		String hql="from House house where  house.isdelete = '否'";
		List<House> houses=houseDao.find(hql, page.getCurrentPage(), page.getPageSize());
		return houses;
	}
	@Override
	public long getAdminHousesCountByName(String name) {
		// TODO Auto-generated method stub
		String hql="select count(*) from House house where house.isdelete = '否' and house.name like '%"+name+"%'";
		return houseDao.count(hql);
	}
	@Override
	public List<House> getAdminHousesByName(String name, Page page) {
		// TODO Auto-generated method stub
		String hql="from House house where house.isdelete = '否' and house.name like '%"+name+"%'";
		List<House> houses=houseDao.find(hql, page.getCurrentPage(), page.getPageSize());
		return houses;
	}
	@Override
	public List<House> getNewHouses(int userId) {
		String hql="from House house where house.userid = "+userId+" and house.isdelete = '否' order by house.houseid desc";
		List<House> houses=houseDao.find(hql);
		return houses;
	}
	@Override
	public List<House> getGoodHouses(int userId) {
		// TODO Auto-generated method stub
		String hql="from House house where house.userid = "+userId+" and house.isdelete = '否' and house.isgood = '是'";
		List<House> houses=houseDao.find(hql);
		return houses;
	}
	@Override
	public List<House> getAdminNewHouses() {
		String hql="from House house where house.isdelete = '否' order by house.houseid desc";
		List<House> houses=houseDao.find(hql);
		return houses;
	}
	@Override
	public List<House> getAdminGoodHouses() {
		// TODO Auto-generated method stub
				String hql="from House house where  house.isdelete = '否' and house.isgood = '是'";
				List<House> houses=houseDao.find(hql);
				return houses;
	}
	@Override
	public List<House> getAllHouses() {
		String hql="from House house where  house.isdelete = '否'";
		List<House> houses=houseDao.find(hql);
		return houses;
	}
	@Override
	public List<House> getAllGood() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<House> getAllNew() {
		// TODO Auto-generated method stub
		return null;
	}

}
