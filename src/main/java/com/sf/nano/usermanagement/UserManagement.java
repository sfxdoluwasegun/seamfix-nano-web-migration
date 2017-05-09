package com.sf.nano.usermanagement;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sf.nano.tools.LanguageUtils;

@WebServlet( name = "usermanagementServlet", urlPatterns = "/usermanagement")
public class UserManagement extends HttpServlet {
	
	private static final long serialVersionUID = -7265598879035531391L;

	private Logger log =  LoggerFactory.getLogger(getClass());
	
	@Inject
	LanguageUtils languageUtils;

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
			case "createAdminUser":
				createAdminUser(req, resp);
		}
	}

	private void createAdminUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = req.getParameter("firstName");
		String lastname = req.getParameter("lastName");
		String middlename = req.getParameter("middlename");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phoneno");
		String community = req.getParameter("community");
		
		if(firstname == null || firstname.isEmpty() 
				|| lastname == null || lastname.isEmpty() 
				|| email == null || email.isEmpty() 
				|| gender == null || gender.isEmpty()
				|| phonenumber == null || phonenumber.isEmpty()
				|| community == null || community.isEmpty()){
//			req.setAttribute("error_alert", "Something went wrong! Please try again");
			handleLandingPage(req, resp);
			return;
		}
	}

	private void handleLandingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String language = req.getParameter("language");

		languageUtils.setLanguage(language, req);
		req.getSession().setAttribute("menuitem", "usermanagement");
		req.getRequestDispatcher("/WEB-INF/usermgmnt/usermgmnt.jsp").forward(req, resp);
	}

}
