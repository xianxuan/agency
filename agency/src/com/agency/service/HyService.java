package com.agency.service;

import com.agency.entity.Hy;

public interface HyService {
	/**
	 * 注册保存用户
	 * @param hy
	 */
	public void saveHy(Hy hy);
	/**
	 * 
	 * @param exmail
	 * @return
	 */
	public Hy getHyByExmail(String exmail);
	/**
	 * 
	 * @param hy
	 */
	public void editHy(Hy hy);
	
}
