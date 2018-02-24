package com.agency.service;

import java.util.List;

import org.apache.commons.lang.Validate;

import com.agency.entity.Photo;

public interface PhotoService {
	/**
	 * 
	 * @param id
	 * @param url
	 */
	public void addPhotosByHouse(int id,List<String> url);
	/**
	 * 
	 * @param id
	 */
	public void deletePhotosByHouse(int id);
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<Photo> getPhotosByHouse(int id);
	/**
	 * 
	 * @param id
	 * @param url
	 */
	public void addPhotosByNew(int id,List<String> url);
	/**
	 * 
	 * @param id
	 */
	public void deletePhotosByNew(int id);
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<Photo> getPhotosByNew(int id);

}
