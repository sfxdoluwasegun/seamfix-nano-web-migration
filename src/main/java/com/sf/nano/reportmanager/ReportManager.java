package com.sf.nano.reportmanager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( name = "reportmanager", urlPatterns = "/reportmanager")
public class ReportManager extends HttpServlet {

	private static final long serialVersionUID = 950129382246280996L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().setAttribute("menuitem", "reportmanager");
		req.getRequestDispatcher("/WEB-INF/reportmanager/reportmanager.jsp").forward(req, resp);
	}



}
