package com.sf.nano.systemsettings;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet( name = "rascriteria", urlPatterns = "/systemsettings/ras")
public class RasCriteria extends HttpServlet{

	private static final long serialVersionUID = 8494386553131259745L;
	
	private Logger log =  LoggerFactory.getLogger(getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		log.debug(action);
		switch (action) {
		case "checkam":
			checkAmount(req, resp);
			break;
		}
	
		
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().setAttribute("menuitem", "rascriteria");
		req.getRequestDispatcher("/WEB-INF/systemsettings/rascriteria.jsp").forward(req, resp);
	}

	private void checkAmount(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		log.debug("check");

		String amount = req.getParameter("am");
		log.debug(amount);
		
		if(amount == null || amount.isEmpty()){
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "Something went wrong. Please try again");

			sendJsonObjectToView(resp, jsonObject);
			return;
		}
		long amountLong = 0;
		log.debug(amount);
		try {
			amountLong= Long.parseLong(amount);
		} catch (NumberFormatException e) {
			log.error("",e);
		}

		if (amountLong == 0){
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "Something went wrong. Please try again");
			sendJsonObjectToView(resp, jsonObject);
			return;
		}

		log.debug(amount);
		if(true){
			log.debug(amount+"67");
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("update", "success");
			jsonObject.addProperty("exists", "true");
			sendJsonObjectToView(resp, jsonObject);
			return;
		}
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
