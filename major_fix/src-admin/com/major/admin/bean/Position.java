/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.bean@date:2014-3-4
 * @ClassName: Position.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0上午09:32:20eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-4 eleven v1.0.0 新建
 */
package com.major.admin.bean;

import java.io.Serializable;

import org.apache.commons.lang.builder.CompareToBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @Title: Position.java
 * @Description: TODO(职位表映射类)
 * @author eleven
 * @date 2014-3-4 上午09:32:20
 *
 */
public class Position implements Serializable, Comparable<Position> {

	private static final long serialVersionUID = 7981016277804321902L;
	
	/** 职位Id  */
	private String id;
	
	/** 职位编号 */
	private String num;
	
	/** 职位名称 */
	private String name;
	
	/** 职位描述 */
	private String desc;
	
	/** 职位创建时间 */
	private String createTime;
	
	/** 职位最后修改时间 */
	private String lastModifyTime;
	
	/** 默认构造方法 */
	public Position() {
	}

	/** 参数构造方法 */
	public Position(String id, String num, String name, String desc, String createTime, String lastModifyTime) {
		this.id = id;
		this.num = num;
		this.name = name;
		this.desc = desc;
		this.createTime = createTime;
		this.lastModifyTime = lastModifyTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(String lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	/* (非 Javadoc)
	* <p>Title: compareTo</p>
	* <p>Description: </p>
	* @param o
	* @return
	* @see java.lang.Comparable#compareTo(java.lang.Object)
	*/
	public int compareTo(Position o) {
		return new CompareToBuilder()
		.append(this.num, o.num).toComparison();
	}
	
	/** 重写toString */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
