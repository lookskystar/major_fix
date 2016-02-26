/**
 *
 * Copyright: Copyright (c) 2012 Asiainfo-Linkage
 *
 * com.major.admin.service@date:2014-3-4
 * @ClassName: PositionServiceI.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0上午09:46:28eleven
 * @author: elevenmajor_fix
 *
 * Modification History:
 * Date  Author  Version Description
 * ---------------------------------------------------------*
 * 2014-3-4 eleven v1.0.0 新建
 */
package com.major.admin.service;

import java.util.LinkedHashMap;

import com.major.admin.bean.Position;
import com.major.base.page.PageModel;
import com.major.base.service.BaseServiceI;

/**
 * @Title: PositionServiceI.java
 * @Description: TODO(职位服务接口)
 * @author eleven
 * @date 2014-3-4 上午09:46:28
 * 
 */
public interface PositionServiceI extends BaseServiceI<Position> {

	/**
	 * 
	 * @Title: findPosition
	 * @Description: TODO(查询职位列表)
	 * @return
	 * @return: PageModel
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	PageModel findPosition(Position position, LinkedHashMap<String, String> orderBy);

	/**
	 * 
	 * @Title: addPosition
	 * @Description: TODO(添加职位)
	 * @param position
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	void addPosition(Position position);

	/**
	 * 
	 * @Title: deletePostion
	 * @Description: TODO(删除职位)
	 * @param position
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	void deletePosition(Position position);

	/**
	 * 
	 * @Title: deletePositionOfBatch
	 * @Description: TODO(批量删除职位)
	 * @param ids
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	void deletePositionOfBatch(String[] ids);

	/**
	 * 
	 * @Title: updatePosition
	 * @Description: TODO(编辑职位)
	 * @param position
	 * @return: void
	 * @author: eleven
	 * @date: 2014-3-4
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-4 eleven v1.0.0 修改原因
	 */
	void updatePosition(Position position);

	/**
	 * 
	 * @Title: findById
	 * @Description: TODO(查询职位)
	 * @param id
	 * @return
	 * @return: Position
	 * @author: eleven
	 * @date: 2014-3-5
	 * @history: Date Author Version Description
	 *           ---------------------------------------------------------*
	 *           2014-3-5 eleven v1.0.0 修改原因
	 */
	Position findPositionById(String id);
}
