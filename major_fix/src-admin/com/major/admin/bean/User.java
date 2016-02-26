/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * bean@date:2014-3-3
 * @ClassName: User.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0下午7:41:12eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-3 eleven v1.0.0 新建
 */
package com.major.admin.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.CompareToBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @Title: User.java
 * @Description: TODO(用户表映射类)
 * @author eleven
 * @date 2014-3-3 下午7:41:12
 *
 */
public class User implements Serializable, Comparable<User> {

	private static final long serialVersionUID = 4284572555216108008L;
	
	private String id;
	
	private String name;
	
	private String pwd;
	
	private Integer age;
	
	private Date entryTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}

	/* (非 Javadoc)
	* <p>Title: compareTo</p>
	* <p>Description: </p>
	* @param o
	* @return
	* @see java.lang.Comparable#compareTo(java.lang.Object)
	*/
	public int compareTo(User o) {
		return new CompareToBuilder()
		.append(entryTime, o.entryTime).toComparison();
	}
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
