package com.sf.nano.tools;

import javax.ejb.Singleton;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

@Singleton
public class JPAUtils {
	
	@PersistenceUnit(unitName = "nano-jpa")
	private EntityManagerFactory entityManagerFactory;

	public synchronized EntityManagerFactory getFactory() {
		return entityManagerFactory;
	}

}
