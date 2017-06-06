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
import com.nano.jpa.entity.Loan;
import com.sf.nano.javabeans.LoanRequestReport;
import com.sf.nano.tools.DataTableParamUtil;
import com.sf.nano.tools.JQueryDataTableParamModel;
import com.sf.nano.tools.LanguageUtils;


@WebServlet( name = "support", urlPatterns = "/support/loanrequest")
public class LoanRequest extends HttpServlet{

	private static final long serialVersionUID = -4176862984502255408L;
	
	@Inject
	SupportService supportService;
	
	@Inject
	LanguageUtils languageUtils;
	
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
			case "_fetchDetails":
				fetchdetails(req, resp);
				break;
			case "_dt":
				handleDatatables(req, resp);
				break;
		}
	}

	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String language = req.getParameter("language");
		
		languageUtils.setLanguage(language, req);
		
		req.getSession().setAttribute("menuitem", "support");
		req.getRequestDispatcher("/WEB-INF/support/support.jsp").forward(req, resp);
	}
	
	private void fetchdetails(HttpServletRequest req, HttpServletResponse resp) {

		String pk = req.getParameter("_p");
		
		log.debug("here " + pk);
		
		if(pk == null || pk.isEmpty()){
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "Something went wrong. Please try again1");

			sendJsonObjectToView(resp, jsonObject);
			return;
		}
		
		long pkLong = 0;

		try {
			pkLong= Long.parseLong(pk);
		} catch (NumberFormatException e) {
			log.error("",e);
		}

		if (pkLong == 0){
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "Something went wrong. Please try again2");
			sendJsonObjectToView(resp, jsonObject);
			return;
		}
		
		LoanRequestReport loanRequestReport = supportService.getLoanRequestReportByPk(pkLong);
		
		if(loanRequestReport==null){
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "Something went wrong. Please try again3");
			sendJsonObjectToView(resp, jsonObject);
			return;
		}
		
		JsonObject jsonObject = supportService.getLoanRequestAsJsonObject(loanRequestReport);
		
		log.debug("here now");
		sendJsonObjectToView(resp, jsonObject);
		
	}
	
	
	private void handleDatatables(HttpServletRequest req, HttpServletResponse resp) {

		JsonObject jsonResponse = new JsonObject();
		try {
			Long count = supportService.getCountOfLoanRequest();
			
			JQueryDataTableParamModel jQueryDataTableParamModel = DataTableParamUtil.getParam(req);

			List<Loan> searchResult = getPaginatedLoanRequestList(jQueryDataTableParamModel);
			
			jsonResponse.addProperty("draw", jQueryDataTableParamModel.getsEcho());
			jsonResponse.addProperty("iTotalRecords", count);
			jsonResponse.addProperty("iTotalDisplayRecords", count);
			
			JsonArray array = supportService.convertListOfLoanRequestToJsonArray(jQueryDataTableParamModel.getiDisplayStart(), searchResult);
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
	
	private List<Loan> getPaginatedLoanRequestList(JQueryDataTableParamModel jQueryDataTableParamModel) {
		int pageSize = jQueryDataTableParamModel.getiDisplayLength();
		int pageIndex = jQueryDataTableParamModel.getiDisplayStart();
		String search = jQueryDataTableParamModel.getsSearch();

		List<Loan> entityList = supportService.getPaginatedLoanRequestListWithSearchParam(pageSize, pageIndex, search);
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
