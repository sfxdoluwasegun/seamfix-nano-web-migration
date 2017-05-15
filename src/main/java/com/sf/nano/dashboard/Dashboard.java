package com.sf.nano.dashboard;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nano.jpa.entity.Loan;
import com.sf.nano.tools.LanguageUtils;

@WebServlet( name = "dashboard", urlPatterns = "/dashboard")
public class Dashboard  extends HttpServlet{

	/**
	 * 
	 */
	@Inject
	private LanguageUtils languageUtils;
	
	@Inject
	NanoDashboardService dashboardService;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	private static final long serialVersionUID = 950129382246280996L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		handleLandingPage(req, resp);		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		handleLandingPage(req, resp);		
	}

	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String language = req.getParameter("language");
		languageUtils.setLanguage(language, req);
		req.getSession().setAttribute("menuitem", "dashboard");
		req.getRequestDispatcher("/WEB-INF/dashboard/dashboard.jsp").forward(req, resp);
	}
}
