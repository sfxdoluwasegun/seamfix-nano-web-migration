package com.sf.nano.tools;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nano.jpa.entity.Borrow;
import com.nano.jpa.entity.Borrow_;
import com.nano.jpa.entity.EvcNotification;
import com.nano.jpa.entity.EvcNotification_;
import com.nano.jpa.entity.Loan;
import com.nano.jpa.entity.Loan_;
import com.nano.jpa.entity.Payment;
import com.nano.jpa.entity.Payment_;
import com.nano.jpa.entity.SercomNotification;
import com.nano.jpa.entity.SercomNotification_;
import com.nano.jpa.entity.SmppNotification;
import com.nano.jpa.entity.SmppNotification_;
import com.nano.jpa.entity.Subscriber;
import com.nano.jpa.entity.SubscriberState;
import com.nano.jpa.entity.SubscriberState_;
import com.nano.jpa.entity.Subscriber_;
import com.nano.jpa.entity.Thresholds;
import com.nano.jpa.entity.Thresholds_;
import com.nano.jpa.entity.admin.Admin;
import com.nano.jpa.entity.admin.Admin_;
import com.nano.jpa.entity.ras.SubscriberAssessment;
import com.nano.jpa.entity.ras.SubscriberAssessment_;
import com.nano.jpa.tools.NanoService;
import com.sf.nano.javabeans.LoanRequestReport;

@Stateless
public class NanoQueryManager extends NanoService {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	public List<Thresholds> getSortedThresholdList(boolean ascending) {

		CriteriaQuery<Thresholds> criteriaQuery = criteriaBuilder.createQuery(Thresholds.class);
		Root<Thresholds> root = criteriaQuery.from(Thresholds.class);

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.isNotNull(root.get(Thresholds_.amount)));

		if (ascending)
			criteriaQuery.orderBy(criteriaBuilder.asc(root.get(Thresholds_.amount)));
		else
			criteriaQuery.orderBy(criteriaBuilder.desc(root.get(Thresholds_.amount)));

		try {
			return entityManager.createQuery(criteriaQuery).getResultList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			log.debug("error reason",e);
			log.error("No Threshold instance found");
		}

		return null;
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

//	public List<BorrowableAmount> getBorrowableAmountList() {
//		List<BorrowableAmount> borrowableAmountList = getListByClass(BorrowableAmount.class);
//
//		if ((borrowableAmountList != null) && (!borrowableAmountList.isEmpty()))
//			return borrowableAmountList;
//
//		return null;
//	}
	
	public SubscriberState getSubscriberCurrentState(Subscriber subscriber) {

		CriteriaQuery<SubscriberState> criteriaQuery = criteriaBuilder.createQuery(SubscriberState.class);
		Root<SubscriberState> root = criteriaQuery.from(SubscriberState.class);

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get(SubscriberState_.msisdn), subscriber.getMsisdn()));

		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error("No Borrow instance was found for subscriber:" + subscriber.getMsisdn());
		}

		return null;
	}
	
	public List<Loan> getListOfAllLoanRequest(){
		CriteriaQuery<Loan> criteriaQuery = criteriaBuilder.createQuery(Loan.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);

		criteriaQuery.select(root);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get(Loan_.date)));
		criteriaQuery.distinct(true);
		root.fetch(Loan_.subscriber, JoinType.LEFT);

		try {
			return entityManager.createQuery(criteriaQuery).getResultList();
		} catch (Exception e) {
			log.error("No Loan Request List found on the system");
		}

		return null;
	}
	
	public List<SubscriberAssessment> getSubscriberAssessmentList(){
		
		CriteriaQuery<SubscriberAssessment> criteriaQuery = criteriaBuilder.createQuery(SubscriberAssessment.class);
		Root<SubscriberAssessment> root = criteriaQuery.from(SubscriberAssessment.class);

		criteriaQuery.select(root);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get(SubscriberAssessment_.lastProcessed)));
		criteriaQuery.distinct(true);
		root.fetch(SubscriberAssessment_.subscriber, JoinType.LEFT);

		try {
			return entityManager.createQuery(criteriaQuery).getResultList();
		} catch (Exception e) {
			log.error("No Subscriber List found on the system");
		}

		return null;
		
	}
	
	public LoanRequestReport getLRDByPk(Long pk){
		
		CriteriaQuery<LoanRequestReport> criteriaQuery = criteriaBuilder.createQuery(LoanRequestReport.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		Join<Loan, Subscriber> subscriber = root.join(Loan_.subscriber,JoinType.LEFT);
		
//		Join<Loan, SmppNotification> smppJoin = root.join(SmppNotification_.response,JoinType.LEFT);
//		smppJoin.on(criteriaBuilder.equal(smppJoin.get(SmppNotification_.referenceNo),root.get(Loan_.referenceNo)));
		
		Join<Loan, EvcNotification> evcJoin = root.join(EvcNotification_.response.toString(),JoinType.LEFT);
		evcJoin.on(criteriaBuilder.equal(root.get(EvcNotification_.paymentref.toString()),root.get(Loan_.referenceNo)));
		
		Join<Loan, SercomNotification> sercomJoin = root.join(SercomNotification_.response.toString(),JoinType.LEFT);
		sercomJoin.on(criteriaBuilder.equal(root.get(SercomNotification_.paymentref.toString()),root.get(Loan_.referenceNo)));
		
		criteriaQuery.select(criteriaBuilder.construct(LoanRequestReport.class, 
				root.get(Loan_.amountRequested).alias("amountRequested"),
				root.get(Loan_.channelType).alias("channel"),
				root.get(Loan_.date).alias("date"),
				root.get(Loan_.granted).alias("granted"),
				root.get(Loan_.referenceNo).alias("referenceNo"),
				subscriber.get(Subscriber_.msisdn).alias("msisdn"),
				root.get(SmppNotification_.response.toString()).alias("smpp_response"),
				root.get(EvcNotification_.response.toString()).alias("evc_response"),
				root.get(SercomNotification_.response.toString()).alias("sercom_response")
				));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Loan_.pk), pk));
		
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			log.error("",e);
		}
		
		return null;
	}
	
public LoanRequestReport getLoanRDByPk(Long pk){
		
		CriteriaQuery<LoanRequestReport> criteriaQuery = criteriaBuilder.createQuery(LoanRequestReport.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);
		
		Join<Loan, Subscriber> subscriber = root.join(Loan_.subscriber,JoinType.LEFT);
		
//		Join<Loan, SmppNotification> smppJoin = root.join(SmppNotification_.response,JoinType.LEFT);
//		smppJoin.on(criteriaBuilder.equal(smppJoin.get(SmppNotification_.referenceNo),root.get(Loan_.referenceNo)));
		
		Join<Loan, EvcNotification> evcJoin = root.join(EvcNotification_.response.toString(),JoinType.LEFT);
		evcJoin.on(criteriaBuilder.equal(root.get(EvcNotification_.paymentref.toString()),root.get(Loan_.referenceNo)));
		
		Join<Loan, SercomNotification> sercomJoin = root.join(SercomNotification_.response.toString(),JoinType.LEFT);
		sercomJoin.on(criteriaBuilder.equal(root.get(SercomNotification_.paymentref.toString()),root.get(Loan_.referenceNo)));
		
		criteriaQuery.select(criteriaBuilder.construct(LoanRequestReport.class, 
				root.get(Loan_.amountRequested).alias("amountRequested"),
				root.get(Loan_.channelType).alias("channel"),
				root.get(Loan_.date).alias("date"),
				root.get(Loan_.granted).alias("granted"),
				root.get(Loan_.referenceNo).alias("referenceNo"),
				subscriber.get(Subscriber_.msisdn).alias("msisdn"),
				root.get(SmppNotification_.response.toString()).alias("smpp_response"),
				root.get(EvcNotification_.response.toString()).alias("evc_response"),
				root.get(SercomNotification_.response.toString()).alias("sercom_response")
				));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Loan_.pk), pk));
		
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			log.error("",e);
		}
		
		return null;
	}
	
	public LoanRequestReport getLoanReqDetailsByLoanId(Long pk){
		
		CriteriaQuery<LoanRequestReport> criteriaQuery = criteriaBuilder.createQuery(LoanRequestReport.class);
		
		Root<Loan> root = criteriaQuery.from(Loan.class);
		Join<Loan, Subscriber> subscriber = root.join(Loan_.subscriber,JoinType.LEFT);
		
		Subquery<String> subqueryForSmpp = criteriaQuery.subquery(String.class);
		Root<SmppNotification> smppRoot = subqueryForSmpp.from(SmppNotification.class); 
		
		Join<SmppNotification, String> smppJoin = smppRoot.join(SmppNotification_.response,JoinType.LEFT);
		smppJoin.on(criteriaBuilder.equal(smppRoot.get(SmppNotification_.referenceNo),root.get(Loan_.referenceNo)));
		
		subqueryForSmpp.select(smppRoot.get(SmppNotification_.response));
		//subqueryForSmpp.where(criteriaBuilder.equal(smppRoot.get(SmppNotification_.referenceNo),root.get(Loan_.referenceNo)));
		
		Subquery<String> subqueryForEvc = criteriaQuery.subquery(String.class);
		Root<EvcNotification> EvcRoot = subqueryForEvc.from(EvcNotification.class);
		
		subqueryForEvc.select(EvcRoot.get(EvcNotification_.response));
		subqueryForEvc.where(criteriaBuilder.equal(EvcRoot.get(EvcNotification_.paymentref),root.get(Loan_.referenceNo)));
		
		Subquery<String> subqueryForSercom = criteriaQuery.subquery(String.class);
		Root<SercomNotification> SercomRoot = subqueryForSercom.from(SercomNotification.class);
		
		subqueryForSercom.select(SercomRoot.get(SercomNotification_.response));
		subqueryForSercom.where(criteriaBuilder.equal(SercomRoot.get(EvcNotification_.paymentref),root.get(Loan_.referenceNo)));
		
		criteriaQuery.select(criteriaBuilder.construct(LoanRequestReport.class, 
				root.get(Loan_.amountRequested).alias("amountRequested"),
				root.get(Loan_.channelType).alias("channel"),
				root.get(Loan_.date).alias("date"),
				root.get(Loan_.granted).alias("granted"),
				root.get(Loan_.referenceNo).alias("referenceNo"),
				subscriber.get(Subscriber_.msisdn).alias("msisdn"),
				smppRoot.get(SmppNotification_.response).alias("smpp_response"),
				EvcRoot.get(EvcNotification_.response).alias("evc_response"),
				SercomRoot.get(SercomNotification_.response).alias("sercom_response")
				));
		criteriaQuery.where(criteriaBuilder.equal(root.get(Loan_.pk), pk));
		criteriaQuery.groupBy(
				root.get(Loan_.amountRequested),
				root.get(Loan_.channelType),
				root.get(Loan_.date),
				root.get(Loan_.granted),
				root.get(Loan_.referenceNo),
				subscriber.get(Subscriber_.msisdn),
				smppRoot.get(SmppNotification_.response),
				EvcRoot.get(EvcNotification_.response),
				SercomRoot.get(SercomNotification_.response)
				);
		
//		subquery.select(loanRoot.get(Loan_.))
//		criteriaQuery.where(criteriaBuilder.equal(root.get(Admin_.userid), userid));
		
		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			log.error("",e);
		}
		
		return null;
	}
	
	public LoanRequestReport getMoreLoanRequestDetails(Long pk){
		
		String sql = "select lr.pk,lr.amountrequested,lr.channeltype,lr.date,lr.granted,lr.referenceno, "+
		"sub.msisdn as submsisdn, sm.response as smpp_response, sm.sms as sms_response ,"+
		"ev.response as EVC_responce,sn.response as sercom_response from loan_request lr "+
		"left join subscriber sub on sub.pk=lr.subscriber_fk left join smpp_notification sm "+
		"on lr.pk = sm.notificationpk left join evc_notification ev on lr.pk = ev.notificationpk "+
		"left join sercom_notification sn on lr.pk = sn.notificationpk where lr.pk=" + pk;
		
		Query query = entityManager.createNativeQuery(sql);
		
		Object[] result = null;
		
		try {
			result = (Object[]) query.getSingleResult();
		} catch (Exception e) {
			log.debug("cannot run native sql query",e);
		}
		
		if(result==null){
			return null;
		}
		
		LoanRequestReport loanRequestReport = new LoanRequestReport();
		
		try {
			loanRequestReport.setAmountRequested(result[1] == null? null:(BigDecimal) result[1]);
			loanRequestReport.setDate(result[3] == null? null:(Timestamp) result[3]);
			loanRequestReport.setGranted(result[4] == null? null:(boolean) result[4]);
			loanRequestReport.setReferenceNo(result[5] == null? null:(String) result[5]);
			loanRequestReport.setChannelType(result[2] == null? null:(String) result[2]);
			loanRequestReport.setMsisdn(result[6] == null? null:(String) result[6]);
			loanRequestReport.setSercom_response(result[10] == null? "No Sercom Response":(String) result[10]);
			loanRequestReport.setSmpp_response(result[7] == null? "No SMPP Response":(String) result[7]);
			loanRequestReport.setSms_response(result[8] == null? "No SMS Message":(String) result[8]);
			loanRequestReport.setEvc_response(result[9] == null? "No EVC Response":(String) result[9]);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return loanRequestReport;
		
	}
	
	public <T> Long getCountByClass(Class<T> clazz){
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<T> root = criteriaQuery.from(clazz);
		
		criteriaQuery.select(criteriaBuilder.count(root));
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		
		try{
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		}
		catch(Exception e){
			log.error("",e);
			return -1L;
		}
	}

	public List<Loan> getPaginatedLoanRequestList(int pageSize, int pageIndex) {
		
		CriteriaQuery<Loan> criteriaQuery = criteriaBuilder.createQuery(Loan.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);

		criteriaQuery.select(root);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get(Loan_.date)));
		criteriaQuery.distinct(true);
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		root.fetch(Loan_.subscriber, JoinType.LEFT);

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Loan Request List found on the system");
		}

		return null;
		
	}

	public List<Loan> getPaginatedLoanRequestListBySearchParameter(int pageSize, int pageIndex, String search) {

		CriteriaQuery<Loan> criteriaQuery = criteriaBuilder.createQuery(Loan.class);
		Root<Loan> root = criteriaQuery.from(Loan.class);

		@SuppressWarnings("unchecked")
		Join<Loan, Subscriber> subscriberJoin = (Join<Loan, Subscriber>) root.fetch(Loan_.subscriber, JoinType.LEFT);
		
		if(search == null || search.isEmpty()){
			try {
				return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
			} catch (Exception e) {
				log.error("No Loan Request found",e);
				return null;
			}
		}
		
		criteriaQuery.select(root);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get(Loan_.date)));
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		
		Predicate or = criteriaBuilder.disjunction();
		or = criteriaBuilder.or(or,
				criteriaBuilder.like(subscriberJoin.get(Subscriber_.msisdn), "%"+search+"%"),
				criteriaBuilder.like(root.get(Loan_.referenceNo),"%"+search+"%")
				);
		criteriaQuery.where(or);
		criteriaQuery.distinct(true);

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Loan Request List found on the system");
		}

		return null;
	
	}

	public List<SubscriberAssessment> getPaginatedSubAssessmentList(int pageSize, int pageIndex) {
		
		CriteriaQuery<SubscriberAssessment> criteriaQuery = criteriaBuilder.createQuery(SubscriberAssessment.class);
		Root<SubscriberAssessment> root = criteriaQuery.from(SubscriberAssessment.class);

		criteriaQuery.select(root);
		criteriaQuery.distinct(true);
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		root.fetch(SubscriberAssessment_.subscriber, JoinType.LEFT);

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Subscriber Assessment List found on the system");
		}
		
		return null;
	}

	public List<SubscriberAssessment> getPaginatedSubAssessmentBySearchParameter(int pageSize, int pageIndex, String search) {

		CriteriaQuery<SubscriberAssessment> criteriaQuery = criteriaBuilder.createQuery(SubscriberAssessment.class);
		Root<SubscriberAssessment> root = criteriaQuery.from(SubscriberAssessment.class);
		
		@SuppressWarnings("unchecked")
		Join<SubscriberAssessment, Subscriber> subscriberJoin = (Join<SubscriberAssessment, Subscriber>) root.fetch(SubscriberAssessment_.subscriber, JoinType.LEFT);
		
		if(search == null || search.isEmpty()){
			try {
				return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
			} catch (Exception e) {
				log.error("No Subscriber Assessment found",e);
				return null;
			}
		}
		
		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.like(subscriberJoin.get(Subscriber_.msisdn), "%"+search+"%"));
		criteriaQuery.distinct(true);
		//criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Subscriber Assessment List found on the system");
		}
		
		return null;
	}

	public List<Payment> getPaginatedLoanReturnList(int pageSize, int pageIndex) {
		CriteriaQuery<Payment> criteriaQuery = criteriaBuilder.createQuery(Payment.class);
		Root<Payment> root = criteriaQuery.from(Payment.class);
		
		Fetch<Payment, Borrow> borrowFetch = root.fetch(Payment_.borrow, JoinType.LEFT);
//		Fetch<Borrow, Subscriber> subscriberFetch = 
		borrowFetch.fetch(Borrow_.subscriber, JoinType.LEFT);
//		Join<Borrow, Subscriber> subscriberJoin = (Join<Borrow, Subscriber>) subscriberFetch;

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		criteriaQuery.distinct(true);

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Subscriber Assessment List found on the system");
		}
		
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Payment> getPaginatedLoanReturnBySearchParameter(int pageSize, int pageIndex, String search) {
		
		CriteriaQuery<Payment> criteriaQuery = criteriaBuilder.createQuery(Payment.class);
		Root<Payment> root = criteriaQuery.from(Payment.class);
		
		Fetch<Payment, Borrow> borrowFetch = root.fetch(Payment_.borrow, JoinType.LEFT);
		Join<Payment, Borrow> borrowJoin = (Join<Payment, Borrow>) borrowFetch;
		Fetch<Borrow, Subscriber> subscriberFetch = borrowFetch.fetch(Borrow_.subscriber, JoinType.LEFT);
		Join<Borrow, Subscriber> subscriberJoin = (Join<Borrow, Subscriber>) subscriberFetch;

		criteriaQuery.select(root);
		criteriaQuery.distinct(true);
		Predicate or = criteriaBuilder.disjunction();
		or = criteriaBuilder.or(or,
				criteriaBuilder.like(subscriberJoin.get(Subscriber_.msisdn), "%"+search+"%"),
				criteriaBuilder.like(borrowJoin.get(Borrow_.referenceNo),"%"+search+"%"),
				criteriaBuilder.equal(root.get("deleted"), false)
				);
		criteriaQuery.where(or);

		try {
			return entityManager.createQuery(criteriaQuery).setMaxResults(pageSize).setFirstResult(pageIndex).getResultList();
		} catch (Exception e) {
			log.error("No Payment List found on the system");
		}
		return null;
	}

	public Payment getPaymentDetailsById(Long pk) {

		CriteriaQuery<Payment> criteriaQuery = criteriaBuilder.createQuery(Payment.class);
		Root<Payment> root = criteriaQuery.from(Payment.class);
		
		Fetch<Payment, Borrow> borrowFetch = root.fetch(Payment_.borrow, JoinType.LEFT);
//		Fetch<Borrow, Subscriber> subscriberFetch = 
		borrowFetch.fetch(Borrow_.subscriber, JoinType.LEFT);
//		Join<Borrow, Subscriber> subscriberJoin = (Join<Borrow, Subscriber>) subscriberFetch;

		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.and(
				criteriaBuilder.equal(root.get(Payment_.pk), pk), 
				criteriaBuilder.equal(root.get("deleted"), false)
				));
		//criteriaQuery.where(criteriaBuilder.equal(root.get("deleted"), false));
		criteriaQuery.distinct(true);

		try {
			return entityManager.createQuery(criteriaQuery).getSingleResult();
		} catch (Exception e) {
			log.error("No Payment with " + pk + " found");
		}
		return null;
	}
}
