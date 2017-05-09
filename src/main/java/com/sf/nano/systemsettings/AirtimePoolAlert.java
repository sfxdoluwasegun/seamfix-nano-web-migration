package com.sf.nano.systemsettings;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( name = "airtimepoolalert", urlPatterns = "/systemsettings/airtimepoolalert")
public class AirtimePoolAlert extends HttpServlet {

	private static final long serialVersionUID = 8518925885468340855L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getSession().setAttribute("menuitem", "airtimepoolalert");
		req.getRequestDispatcher("/WEB-INF/systemsettings/airtimepoolalert.jsp").forward(req, resp);
	}

}
