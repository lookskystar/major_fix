/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.service.impl@date:2014-3-4
 * @ClassName: PositionServiceImpl.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0上午09:47:10eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-4 eleven v1.0.0 新建
 */
package com.major.admin.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.UUID;

import javax.annotation.Resource;

import com.major.admin.bean.Position;
import com.major.admin.dao.PositionDaoI;
import com.major.admin.service.PositionServiceI;
import com.major.base.page.PageModel;
import com.major.base.service.impl.BaseServiceImpl;

/**
 * @Title: PositionServiceImpl.java
 * @Description: TODO(职位服务实现类)
 * @author eleven
 * @date 2014-3-4 上午09:47:10
 * 
 */
public class PositionServiceImpl extends BaseServiceImpl<Position> implements PositionServiceI {

	private PositionDaoI positionDao;

	@Resource
	public void setPositionDao(PositionDaoI positionDao) {
		this.positionDao = positionDao;
	}

	/*
	 * (非 Javadoc) <p>Title: findPosition</p> <p>Description: </p>
	 * 
	 * @return
	 * 
	 * @see com.major.admin.service.PositionServiceI#findPosition()
	 */
	public PageModel findPosition(Position position, LinkedHashMap<String, String> orderBy) {
		return positionDao.queryPageList(position, orderBy);
	}

	/*
	 * (非 Javadoc) <p>Title: addPosition</p> <p>Description: </p>
	 * 
	 * @param position
	 * 
	 * @see
	 * com.major.admin.service.PositionServiceI#addPosition(com.major.admin.
	 * bean.Position)
	 */
	public void addPosition(Position position) {
		// 设置UUID
		position.setId(UUID.randomUUID().toString());
		// 设置创建时间
		position.setCreateTime(YMDHMS.format(new Date()));
		// 设置最后修改时间
		position.setLastModifyTime(YMDHMS.format(new Date()));
		positionDao.save(position);
	}

	/*
	 * (非 Javadoc) <p>Title: deletePostion</p> <p>Description: </p>
	 * 
	 * @param position
	 * 
	 * @see
	 * com.major.admin.service.PositionServiceI#deletePostion(com.major.admin
	 * .bean.Position)
	 */
	public void deletePosition(Position position) {
		positionDao.delete(position.getId());
	}

	/*
	 * (非 Javadoc) <p>Title: updatePosition</p> <p>Description: </p>
	 * 
	 * @param position
	 * 
	 * @see
	 * com.major.admin.service.PositionServiceI#updatePosition(com.major.admin
	 * .bean.Position)
	 */
	public void updatePosition(Position position) {
		// 设置最后修改时间
		position.setLastModifyTime(YMDHMS.format(new Date()));
		positionDao.update(position);
	}

	/*
	 * (非 Javadoc) <p>Title: deletePositionOfBatch</p> <p>Description: </p>
	 * 
	 * @param ids
	 * 
	 * @see
	 * com.major.admin.service.PositionServiceI#deletePositionOfBatch(java.lang
	 * .String[])
	 */
	public void deletePositionOfBatch(String[] ids) {
		positionDao.deleteOfBatch(ids);
	}

	/*
	 * (非 Javadoc) <p>Title: findById</p> <p>Description: </p>
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 * @see com.major.admin.service.PositionServiceI#findById(java.lang.String)
	 */
	public Position findPositionById(String id) {
		return positionDao.getById(id);
	}
}
