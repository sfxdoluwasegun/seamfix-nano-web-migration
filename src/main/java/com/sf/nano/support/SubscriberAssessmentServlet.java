package com.sf.nano.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.nano.jpa.entity.ras.SubscriberAssessment;
import com.sf.nano.tools.DataTableParamUtil;
import com.sf.nano.tools.JQueryDataTableParamModel;
import com.sf.nano.tools.LanguageUtils;

@WebServlet( name = "subscriberassessment", urlPatterns = "/support/subscriberassessment")
public class SubscriberAssessmentServlet extends HttpServlet{

	private static final long serialVersionUID = 4851443632684160884L;
	
	@Inject
	LanguageUtils languageUtils;
	
	@Inject
	SupportService supportService;
	
	private Logger log =  LoggerFactory.getLogger(getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleLandingPage(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		String action = req.getParameter("action");

		log.debug(action);

		switch(action){
			case "changeLanguge":
				handleLandingPage(req, resp);
				break;
			case "_dt":
				handleDatatables(req, resp);
				break;
		}
		
	}

	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String language = req.getParameter("language");
		
		languageUtils.setLanguage(language, req);
		
		req.getSession().setAttribute("menuitem", "subscriberassessment");
		req.getRequestDispatcher("/WEB-INF/support/subscriberassessment.jsp").forward(req, resp);
	}
	
	private void handleDatatables(HttpServletRequest req, HttpServletResponse resp) {

		JsonObject jsonResponse = new JsonObject();
		try {
			Long count = supportService.getCountOfSubAssessmentList();
			
			JQueryDataTableParamModel jQueryDataTableParamModel = DataTableParamUtil.getParam(req);

			List<SubscriberAssessment> searchResult = getSubAssessmentList(jQueryDataTableParamModel);
			
			jsonResponse.addProperty("draw", jQueryDataTableParamModel.getsEcho());
			jsonResponse.addProperty("iTotalRecords", count);
			jsonResponse.addProperty("iTotalDisplayRecords", count);
			
			JsonArray array = supportService.convertListOfSubAssessmentListToJsonArray(jQueryDataTableParamModel.getiDisplayStart(), searchResult);
			jsonResponse.add("data",array);

		} catch (JsonIOException e) {
			log.debug("JsonIOException", e);
			jsonResponse.addProperty("error","error");

		} catch (Exception e) {
			jsonResponse.addProperty("error","error");
			log.debug("Exception e", e);
		}
		
		sendJsonObjectToView(resp, jsonResponse);
		
	}
	
	private List<SubscriberAssessment> getSubAssessmentList(JQueryDataTableParamModel jQueryDataTableParamModel) {

		int pageSize = jQueryDataTableParamModel.getiDisplayLength();
		int pageIndex = jQueryDataTableParamModel.getiDisplayStart();
		String search = jQueryDataTableParamModel.getsSearch();

		List<SubscriberAssessment> entityList = supportService.getPaginatedSubAssessmentListWithSearchParam(pageSize, pageIndex, search);
		return entityList;
	}

	private void sendJsonObjectToView(HttpServletResponse resp, JsonObject jsonObject) {
		
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(jsonObject);

		resp.setContentType("text/json");
		PrintWriter pw = null;

		try {
			pw = resp.getWriter();
		}catch (IOException e){
			log.error("", e);
		}

		if (pw != null) {
			pw.write(jsonString);
			pw.flush();
			pw.close();
		}
	}
	
}
