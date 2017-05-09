package com.sf.nano.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( name = "schedulemanager", urlPatterns = "/schedulemanager")
public class ScheduleManager extends HttpServlet {

	private static final long serialVersionUID = 6540674661052188389L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		handleLandingPage(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().setAttribute("menuitem", "schedulemanager");
		req.getRequestDispatcher("/WEB-INF/schedule/schedulemanager.jsp").forward(req, resp);
	}

}
