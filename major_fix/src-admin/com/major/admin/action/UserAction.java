/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.action@date:2014-3-3
 * @ClassName: UserAction.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0下午8:06:02eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-3 eleven v1.0.0 新建
 */
package com.major.admin.action;


import java.util.UUID;

import javax.annotation.Resource;
import com.major.admin.bean.User;
import com.major.admin.service.UserServiceI;
import com.major.base.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @Title: UserAction.java
 * @Description: TODO(用户Action)
 * @author eleven
 * @date 2014-3-3 下午8:06:02
 *
 */
public class UserAction extends BaseAction implements ModelDriven<User> {
	
	private static final long serialVersionUID = 1181523627136830149L;

	private User user;
	
	private UserServiceI userService;

	/* (非 Javadoc)
	* <p>Title: getModel</p>
	* <p>Description: </p>
	* @return
	* @see com.opensymphony.xwork2.ModelDriven#getModel()
	*/
	public User getModel() {
		if(user == null){
			user = new User();
		}
		return user;
	}
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	@Resource
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
	
	/**
	 * 
	 * @Title: addUser
	 * @Description: TODO(添加用户)
	 * @return
	 * @return: String
	 * @author: eleven
	 * @date: 2014-3-3
	 * @history: Date  Author  Version  Description
	 * 			 ---------------------------------------------------------*
	 * 			 2014-3-3  eleven v1.0.0   修改原因
	 */
	public String addUser(){
		User user = new User();
		user.setId(UUID.randomUUID().toString());
		user.setName("黄明");
		user.setPwd("123456");
		user.setAge(23);
		userService.add(user);
		return "success";
	}

}
