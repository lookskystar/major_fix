/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.service@date:2014-3-3
 * @ClassName: UserServiceI.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0下午7:48:59eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-3 eleven v1.0.0 新建
 */
package com.major.admin.service;

import com.major.admin.bean.User;
import com.major.base.service.BaseServiceI;

/**
 * @Title: UserServiceI.java
 * @Description: TODO(用户服务接口)
 * @author eleven
 * @date 2014-3-3 下午7:48:59
 *
 */
public interface UserServiceI extends BaseServiceI<User> {
	
	/**
	 * 
	 * @Title: add
	 * @Description: TODO(添加用户)
	 * @return
	 * @return: Long
	 * @author: eleven
	 * @date: 2014-3-3
	 * @history: Date  Author  Version  Description
	 * 			 ---------------------------------------------------------*
	 * 			 2014-3-3  eleven v1.0.0   修改原因
	 */
	void add(User user);
}
