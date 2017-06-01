package com.sf.nano.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.google.gson.JsonObject;
import com.nano.jpa.entity.Loan;
import com.nano.jpa.entity.Thresholds;
import com.sf.nano.javabeans.LoanRequestReport;
import com.sf.nano.tools.LanguageUtils;


@WebServlet( name = "support", urlPatterns = "/support")
public class Support extends HttpServlet{

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
		}
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String language = req.getParameter("language");
		
		List<Thresholds> thresholds = supportService.getAllThresholds();
		List<Loan> loanRequests = supportService.getAllLoanRequests();
		
		for (Loan loan : loanRequests) {
			log.debug(loan.getSubscriber().getMsisdn());
		}
		
		languageUtils.setLanguage(language, req);
		
		req.setAttribute("thresholds", thresholds);
		req.setAttribute("loanRequests", loanRequests);
		
		req.getSession().setAttribute("menuitem", "support");
		req.getRequestDispatcher("/WEB-INF/support/support.jsp").forward(req, resp);
	}
	
	private void fetchdetails(HttpServletRequest req, HttpServletResponse resp) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
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
		
		JsonObject jsonObject= new JsonObject();
		jsonObject.addProperty("update", "success");
		jsonObject.addProperty("time",df.format(loanRequestReport.getDate()));
		jsonObject.addProperty("msisdn",loanRequestReport.getMsisdn());
		jsonObject.addProperty("refno",loanRequestReport.getReferenceNo());
		jsonObject.addProperty("network",loanRequestReport.getChannelType());
		jsonObject.addProperty("amount",loanRequestReport.getAmountRequested().toPlainString());
		jsonObject.addProperty("evc",loanRequestReport.getEvc_response());
		jsonObject.addProperty("sercom",loanRequestReport.getSercom_response());
		jsonObject.addProperty("smpp",loanRequestReport.getSmpp_response());
		jsonObject.addProperty("sms","not available");
		log.debug("here now");
		sendJsonObjectToView(resp, jsonObject);
		
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
