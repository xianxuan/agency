package com.agency.service;

import java.util.List;

import com.agency.entity.New;
import com.agency.util.Page;

public interface NewService {
	/**
	 * 
	 * @param news
	 * @return
	 */
	public int addNewAndGetId(New news);
	/**
	 * 
	 * @return
	 */
	public long getNewsCount();
	/**
	 * 
	 * @param page
	 * @return
	 */
	public List<New> getNews(Page page);
	/**
	 * 
	 * @param id
	 * @return
	 */
	public New getNewById(int id);
	/**
	 * 
	 * @param n
	 */
	public void editNew(New n);
	/**
	 * 
	 * @param title
	 * @return
	 */
	public long getNewCountByTitle(String title);
	/**
	 * 
	 * @param title
	 * @param page
	 * @return
	 */
	public List<New> getNewsByTitle(String title,Page page);
	/**
	 * 
	 * @return
	 */
	public List<New> getAllNews();

}
