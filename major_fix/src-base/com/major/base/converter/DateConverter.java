package com.major.base.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class DateConverter extends StrutsTypeConverter {

	private SimpleDateFormat SDFYMD = new SimpleDateFormat("yyyy-MM-dd");

	@SuppressWarnings("rawtypes")
	public Object convertFromString(Map context, String[] params, Class targetClass) {
		Date date = null;
		if (targetClass == java.util.Date.class) {
			if (null != params && null != params[0] && !"".equals(params[0])) {
				try {
					date = SDFYMD.parse(params[0]);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		return date;
	}

	@SuppressWarnings("rawtypes")
	public String convertToString(Map context, Object target) {
		Date date = (Date) target;
		return SDFYMD.format(date);
	}

}
