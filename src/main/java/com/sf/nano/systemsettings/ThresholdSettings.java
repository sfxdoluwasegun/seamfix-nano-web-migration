package com.sf.nano.systemsettings;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( name = "thresholdsettings", urlPatterns = "/systemsettings/thresholdsettings")
public class ThresholdSettings extends HttpServlet {

	private static final long serialVersionUID = 2679361105440833104L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().setAttribute("menuitem", "thresholdsettings");
		req.getRequestDispatcher("/WEB-INF/systemsettings/thresholdsettings.jsp").forward(req, resp);
	}

}
