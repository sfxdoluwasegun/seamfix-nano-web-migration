package com.sf.nano.systemsettings;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( name = "generalsettings", urlPatterns = "/systemsettings/generalsettings")
public class GeneralSettings extends HttpServlet {

	private static final long serialVersionUID = 8494386553131259745L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().setAttribute("menuitem", "generalsettings");
		req.getRequestDispatcher("/WEB-INF/systemsettings/generalsettings.jsp").forward(req, resp);
	}
	
}
