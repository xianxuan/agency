package com.agency.service;

import java.util.List;

import com.agency.entity.House;
import com.agency.util.Page;


public interface HouseService {
	/**
	 * 
	 * @param house
	 * @return
	 */
	public int addHouseAndGetId(House house);
	/**
	 * 
	 * @param userId
	 * @param page
	 * @return
	 */
	public List<House> getHousesByUserId(int userId,Page page);
	/**
	 * 
	 * @param userId
	 * @param page
	 * @param name
	 * @return
	 */
	public List<House> getHousesByUserIdAndName(int userId,Page page,String name);
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public long getHouseCountByUserId(int userId);
	/**
	 * 
	 * @param userId
	 * @param name
	 * @return
	 */
	public long getHouseCountByUserIDAndName(int userId,String name);
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<House> getNewHouses(int userId);
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<House> getGoodHouses(int userId);
	/**
	 * 
	 * @param houseId
	 * @return
	 */
	public House getHouseById(int houseId);
	/**
	 * 
	 * @param house
	 */
	public void editHhouse(House house);
	/**
	 * 
	 * @return
	 */
	public long getAdminHousesCount();
	/**
	 * .
	 * @param page
	 * @return
	 */
	public List<House> getAdminHouses(Page page);
	/**
	 * 
	 * @param name
	 * @return
	 */
	public long getAdminHousesCountByName(String name);
	/**
	 * 
	 * @param name
	 * @param page
	 * @return
	 */
	public List<House> getAdminHousesByName(String name,Page page);
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<House> getAdminNewHouses();
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<House> getAdminGoodHouses();
	/**
	 * 
	 * @return
	 */
	public List<House> getAllHouses();
	/**
	 * 
	 * @return
	 */
	public List<House> getAllGood();
	/**
	 * 
	 * @return
	 */
	public List<House> getAllNew();

}
