package com.sf.nano.tools;

import java.util.Locale;

import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.jstl.core.Config;

@Stateless
public class LanguageUtils {

	public void setLanguage(String language,HttpServletRequest req) {

		if("fr".equalsIgnoreCase(language))
			Config.set(req, Config.FMT_LOCALE, Locale.FRANCE);
		else if("zh".equalsIgnoreCase(language))
			Config.set(req, Config.FMT_LOCALE, Locale.CHINA);
		else if("en".equalsIgnoreCase(language))
			Config.set(req, Config.FMT_LOCALE, Locale.ENGLISH);
		
		req.setAttribute("language", language);
	}
}
