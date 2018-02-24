package com.agency.dao;
import org.springframework.stereotype.Repository;

import com.agency.dao.base.BaseDao;
import com.agency.entity.Admin;
import com.agency.entity.New;


@Repository("newDao")
public class NewDao extends BaseDao<New> {

}