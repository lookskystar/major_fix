/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.action@date:2014-3-4
 * @ClassName: PositionAction.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0上午10:31:37eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-4 eleven v1.0.0 新建
 */
package com.major.admin.action;

import java.util.LinkedHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.major.admin.bean.Position;
import com.major.admin.service.PositionServiceI;
import com.major.base.action.BaseAction;
import com.major.base.page.PageModel;
import com.major.base.util.CurdMessage;
import com.major.base.util.JsonMessage;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @Title: PositionAction.java
 * @Description: TODO(职位Action)
 * @author eleven
 * @date 2014-3-4 上午10:31:37
 * 
 */
public class PositionAction extends BaseAction implements ModelDriven<Position> {

	private static final long serialVersionUID = -3828770494072160619L;

	private Position position;

	private PositionServiceI positionService;

	private String ids;

	private String sort;

	private String order;

	/** request */
	private HttpServletRequest request = ServletActionContext.getRequest();

	/*
	 * (非 Javadoc) <p>Title: getModel</p> <p>Description: </p>
	 * 
	 * @return
	 * 
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Position getModel() {
		if (position == null) {
			position = new Position();
		}
		return position;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	@Resource
	public void setPositionService(PositionServiceI positionService) {
		this.positionService = positionService;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	/**
	 * 
	 * @Title: DataGridOfPosition
	 * @Description: TODO(职位数据Grid)
	 * @return
	 * @return: String
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	public String dataGridOfPosition() {
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		if (StringUtils.isNotEmpty(sort) && StringUtils.isNotEmpty(order)) {
			orderBy.put(sort, order);
		}
		try {
			PageModel pm = positionService.findPosition(position, orderBy);
			request.setAttribute("pm", pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "position:list:grid";
	}

	/**
	 * 
	 * @Title: positionAdd
	 * @Description: TODO(添加职位)
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	public String positionAdd() {
		JsonMessage msg = new JsonMessage();
		try {
			positionService.addPosition(position);
			msg.setMessage(CurdMessage.AddSuccess.getMessage());
			// 重置属性
			Position positionOfClear = new Position();
			BeanUtils.copyProperties(positionOfClear, position);
		} catch (Exception e) {
			e.printStackTrace();
			msg.setMessage(CurdMessage.AddFailure.getMessage());
		}
		return dataGridOfPosition();
	}

	/**
	 * 
	 * @Title: positionRemoveOfBatch
	 * @Description: TODO(批量删除职位)
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	public void positionRemoveOfBatch() {
		JsonMessage msg = new JsonMessage();
		try {
			positionService.deletePositionOfBatch(ids.split(","));
			msg.setSuccess(true);
			msg.setMessage(CurdMessage.DeleteSuccess.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			msg.setMessage(CurdMessage.DeleteFailure.getMessage());
		} finally {
			writeJson(msg);
		}
	}

	/**
	 * 
	 * @Title: positionRemove
	 * @Description: TODO(删除职位)
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	public void positionRemove() {
		JsonMessage msg = new JsonMessage();
		try {
			positionService.deletePosition(position);
			msg.setSuccess(true);
			msg.setMessage(CurdMessage.DeleteSuccess.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			msg.setMessage(CurdMessage.DeleteFailure.getMessage());
		} finally {
			writeJson(msg);
		}
	}

	/**
	 * 
	 * @Title: positionEditShow
	 * @Description: TODO(编辑职位信息)
	 * @return
	 * @return: String
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	public String positionEditShow() {
		try {
			Position positionOfReturn = positionService.findPositionById(position.getId());
			request.setAttribute("position", positionOfReturn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "position:edit:show";
	}

	/**
	 * 
	 * @Title: positionEdit
	 * @Description: TODO(编辑职位信息)
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	public String positionEdit() {
		try {
			positionService.updatePosition(position);
			// 重置属性
			Position positionOfClear = new Position();
			BeanUtils.copyProperties(positionOfClear, position);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataGridOfPosition();
	}

	/**
	 * 
	 * @Title: positionView
	 * @Description: TODO(查看职位信息)
	 * @return
	 * @return: String
	 * @author: eleven
	 * @date: 2014-3-6
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-6 eleven v1.0.0 修改原因
	 */
	public String positionView() {
		try {
			Position positionOfReturn = positionService.findPositionById(position.getId());
			request.setAttribute("position", positionOfReturn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "position:view";
	}

}
