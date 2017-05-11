package com.sf.nano.support;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sf.nano.tools.LanguageUtils;

@WebServlet( name = "support", urlPatterns = "/support")
public class Support extends HttpServlet{

	private static final long serialVersionUID = -4176862984502255408L;
	
	@Inject
	LanguageUtils languageUtils;
	
	private Logger log =  LoggerFactory.getLogger(getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleLandingPage(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = req.getParameter("action");

		log.debug(action);

		switch(action){
			case "changeLanguge":
				handleLandingPage(req, resp);
				break;
		}
	}
	
	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String language = req.getParameter("language");

		languageUtils.setLanguage(language, req);
		
		req.getSession().setAttribute("menuitem", "support");
		req.getRequestDispatcher("/WEB-INF/support/support.jsp").forward(req, resp);
	}
	

}
