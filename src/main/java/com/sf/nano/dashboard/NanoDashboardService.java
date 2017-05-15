package com.sf.nano.dashboard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nano.jpa.entity.Loan;
import com.sf.nano.tools.QueryManager;

import javax.ejb.Stateless;
import javax.inject.Inject;


@Stateless
public class NanoDashboardService 
	{
	
	
	@Inject
	QueryManager queryManager;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	}
	
	

