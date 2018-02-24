package com.agency.dao;
import org.springframework.stereotype.Repository;

import com.agency.dao.base.BaseDao;
import com.agency.entity.House;
import com.agency.entity.Hy;


@Repository("houseDao")
public class HouseDao extends BaseDao<House> {

}