package com.sf.nano.tools;

import javax.inject.Inject;
import javax.persistence.EntityManager;

public class NanoService {

	@Inject
	private JPAUtils jpaUtils;

	public EntityManager getEntityManager() {
		return jpaUtils.getFactory().createEntityManager();
	}

	public void closeEntityManager(EntityManager entityManager) {
		if (entityManager!=null)
			entityManager.close();
	}
	
}
