package com.sf.nano.tools;

import javax.servlet.http.HttpServletRequest;


public class DataTableParamUtil {
	/**
	 * this method is used to get parameters sent by the datatables
	 * @param request
	 * @return
	 */
	public static JQueryDataTableParamModel getParam(HttpServletRequest request){
		//Enumeration<String> params = request.getParameterNames();
		String draw = request.getParameter("draw");
		//log.debug(request.getParameter("search[value]"));
		
		if(draw==null||draw.isEmpty()){
			return null;
		}else{
       		JQueryDataTableParamModel param = new JQueryDataTableParamModel();
			param.setsEcho(Integer.parseInt(request.getParameter("draw"))); 
			param.setsSearch(request.getParameter("search[value]"));
			param.setsColumns(request.getParameter("columns"));
			param.setiDisplayStart(Integer.parseInt( request.getParameter("start")));
			param.setiDisplayLength(Integer.parseInt( request.getParameter("length")));
			param.setsKeyword(request.getParameter("search"));
			
			return param;
		}
		}
}