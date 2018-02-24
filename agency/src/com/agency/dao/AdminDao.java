package com.agency.dao;
import org.springframework.stereotype.Repository;

import com.agency.dao.base.BaseDao;
import com.agency.entity.Admin;


@Repository("adminDao")
public class AdminDao extends BaseDao<Admin> {

}