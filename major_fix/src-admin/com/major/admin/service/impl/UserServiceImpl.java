/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.service@date:2014-3-3
 * @ClassName: UserServiceImpl.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0下午7:50:53eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-3 eleven v1.0.0 新建
 */
package com.major.admin.service.impl;

import javax.annotation.Resource;


import com.major.admin.bean.User;
import com.major.admin.dao.UserDaoI;
import com.major.admin.service.UserServiceI;
import com.major.base.service.impl.BaseServiceImpl;

/**
 * @Title: UserServiceImpl.java
 * @Description: TODO(用户服务实现类)
 * @author eleven
 * @date 2014-3-3 下午7:50:53
 *
 */
public class UserServiceImpl extends BaseServiceImpl<User> implements UserServiceI {
	
	
	private UserDaoI userDao;
	
	@Resource
	public void setUserDao(UserDaoI userDao) {
		this.userDao = userDao;
	}



	/* (非 Javadoc)
	 * <p>Title: add</p>
	 * <p>Description: </p>
	 * @param user
	 * @return
	 * @see com.major.admin.service.UserServiceI#add(com.major.admin.bean.User)
	 */
	public void add(User user) {
		userDao.save(user);
	}

}
