package com.sf.nano.tools;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nano.jpa.entity.Loan;
import com.nano.jpa.entity.Loan_;
import com.nano.jpa.entity.Nano;
import com.nano.jpa.entity.Nano_;
import com.nano.jpa.entity.admin.Admin;
import com.nano.jpa.entity.admin.Admin_;
import com.nano.jpa.entity.ras.BorrowableAmount;

@Stateless
public class QueryManager extends NanoService {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	private EntityManager entityManager;
	private CriteriaBuilder criteriaBuilder;
	
	@PostConstruct
	public void init() {
		entityManager = getEntityManager();
		criteriaBuilder = entityManager.getCriteriaBuilder();
	}
	
	@PreDestroy
	public void cleanup() {
		closeEntityManager(entityManager);
	}
	
	
	public Admin getAdminByUserId(long userid) {

		CriteriaQuery<Admin> criteriaQuery = criteriaBuilder.createQuery(Admin.class);
		Root<Admin> root = criteriaQuery.from(Admin.class);

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get(Admin_.userid), userid));

		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error("No Admin instance was found for userid:" + userid);
		}

		return null;
	}

	public List<BorrowableAmount> getBorrowableAmountList() {
		List<BorrowableAmount> borrowableAmountList = getListByClass(BorrowableAmount.class);

		if ((borrowableAmountList != null) && (!borrowableAmountList.isEmpty()))
			return borrowableAmountList;

		return null;
	}

	/**
	 * Fetches all persisted entity instance by class.
	 * 
	 * @param clazz
	 * @return List of all class entities
	 */
	public <T> List<T> getListByClass(Class<T> clazz) {

		CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(clazz);
		Root<T> root = criteriaQuery.from(clazz);

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));

		try {
			return entityManager.createQuery(criteriaQuery).getResultList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error("No " + clazz.getCanonicalName() + " exists ", e);
		}

		return null;
	}
	
	/**
	 * 
	 * @param granted
	 * @return Total count of failed loans requests
	 */
	public Long getTotalCountOfFailedLoanRequestsWithinDatePeriod(Date from, Date to){
		
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.between(root.get(Loan_.date), to, from),
							criteriaBuilder.equal(root.get(Loan_.granted), false)
									));
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return 0L;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return 0L;
	}
	
	/**
	 * 
	 * @param granted
	 * @param from
	 * @param to
	 * @return Count of successful loan requests
	 */
	public Long getTotalCountOfSuccessfulLoanRequestsWithinDatePeriod(Date from, Date to){
		
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.between(root.get(Loan_.date), to, from),
							criteriaBuilder.equal(root.get(Loan_.granted), true)
									));
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return 0L;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return 0L;
	}
	
	/**
	 * 
	 * @param Status
	 * @param from
	 * @param to
	 * @return Count of rejected loan request within a period of time
	 */
	public Long getTotalCountOfRejectedLoanRequestsWithinDatePeriodAndStatus(Date from, Date to){
		
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.between(root.get(Loan_.date), to, from),
							criteriaBuilder.equal(root.get(Loan_.deleted), false),
							criteriaBuilder.equal(root.get(Loan_.granted), false)));
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return 0L;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return 0L;
		
	}
	/**
	 * granted
	 * to
	 * from 
	 * Count Of requested loan within specified period.
	 */
	public Long getTotalCountOfLoanRequestsWithinDatePeriod(Loan granted, Date from, Date to){
		
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.between(root.get(Loan_.date), to, from),
							criteriaBuilder.equal(root.get(Loan_.granted), false), 
							criteriaBuilder.equal(root.get(Loan_.granted), true),
							criteriaBuilder.equal(root.get(Loan_.deleted), false)
									));
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return 0L;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return 0L;
	}
		
	/**
	 * 
	 * @param from
	 * @param to
	 * @param status
	 * @return Count of requested loans based on denomination
	 */
	public Long getCountOfLoanRequestsWithinDatePeriodAndDenomination (Loan amountRequested, Date from, Date to){
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);

		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.and(
				criteriaBuilder.between(root.get(Loan_.date), from, to),
				criteriaBuilder.equal(root.get(Loan_.amountRequested), amountRequested),
				criteriaBuilder.equal(root.get(Loan_.deleted), false)
				));
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			log.error("No Topup History found on the system");
		}

		return 0L;
	}
	
	/**
	 * 
	 * @param poolCap
	 * @return Airtime Pool Balance
	 */
	public  BigDecimal getAirtimePoolBalance(){
		
		CriteriaQuery<BigDecimal> criteriaQuery = criteriaBuilder.createQuery(BigDecimal.class);
		Root<Nano> root = criteriaQuery.from(Nano.class);
		
		criteriaQuery.select(criteriaBuilder.sum(root.get(Nano_.poolCap)));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Nano_.poolCap), Nano_.poolCap));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Nano_.deleted), false));
		
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return BigDecimal.ZERO;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return BigDecimal.ZERO;
	}
	
	/**
	 * 
	 * @param to
	 * @param from
	 * @return Total amount of granted loan requests
	 */
	public BigDecimal getTotalAmountOfGrantedLoan(Date to, Date from) {
		
		CriteriaQuery<BigDecimal> criteriaQuery = criteriaBuilder.createQuery(BigDecimal.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		criteriaQuery.select(criteriaBuilder.sum(root.get(Loan_.amountRequested)));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Loan_.granted), true));
		criteriaQuery.where(criteriaBuilder.between(root.get(Loan_.date), to, from));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Loan_.deleted), false));
		
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} 
		catch (NoResultException ne) {
			return BigDecimal.ZERO;
		}
		catch(Exception e) {
			log.error("It seems there is no granted loan requests at the moment");
		}
		return BigDecimal.ZERO;
	}
}

