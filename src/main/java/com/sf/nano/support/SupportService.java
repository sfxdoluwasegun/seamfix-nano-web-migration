package com.sf.nano.support;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.nano.jpa.entity.Loan;
import com.nano.jpa.entity.Payment;
import com.nano.jpa.entity.Thresholds;
import com.sf.nano.javabeans.LoanRequestReport;
import com.sf.nano.tools.NanoQueryManager;
import com.nano.jpa.entity.ras.SubscriberAssessment;

@Stateless
public class SupportService {

	@Inject
	private NanoQueryManager nanoQueryManager;
	
	public List<Thresholds> getAllThresholds() {
		
		return nanoQueryManager.getSortedThresholdList(true);
		
	}
	
	public  List<Loan> getAllLoanRequests() {
		return nanoQueryManager.getListOfAllLoanRequest();
	}
	
	public LoanRequestReport getLoanRequestReportByPk(Long pk){
		return nanoQueryManager.getMoreLoanRequestDetails(pk);
	}
	
	public LoanRequestReport getLoanRequestReportByLoanPk(Long pk){
		return nanoQueryManager.getLoanReqDetailsByLoanId(pk);
	}

	public Long getCountOfLoanRequest() {

		return nanoQueryManager.getCountByClass(Loan.class);
	}

	public List<Loan> getPaginatedLoanRequestListWithSearchParam(int pageSize, int pageIndex, String search) {
		
		if(search.isEmpty()){
			return nanoQueryManager.getPaginatedLoanRequestList(pageSize, pageIndex);
		}else{
			return nanoQueryManager.getPaginatedLoanRequestListBySearchParameter(pageSize, pageIndex, search);
		}
	}

	public JsonArray convertListOfLoanRequestToJsonArray(int index, List<Loan> LoanResults) {
		
		DateFormat df = new SimpleDateFormat("hh:mm a, E, dd/MM/yyy");
		
		JsonArray loanRequestList= new JsonArray();
		for (Loan loan : LoanResults) {
			JsonObject loanrequest = new JsonObject();
			loanrequest.addProperty("sn", index+1);
			loanrequest.addProperty("reqtime", df.format(loan.getDate()));
			loanrequest.addProperty("msisdn", loan.getSubscriber().getMsisdn());
			loanrequest.addProperty("refno", loan.getReferenceNo());
			loanrequest.addProperty("reqchannel",loan.getChannelType().name());
			loanrequest.addProperty("reqamount",loan.getAmountRequested());
			loanrequest.addProperty("status", loan.isGranted());
			loanrequest.addProperty("pk", loan.getPk() );
			
			index += 1;
			loanRequestList.add(loanrequest);
		}
		
		return loanRequestList;
		
	}

	public Long getCountOfSubAssessmentList() {
		return nanoQueryManager.getCountByClass(SubscriberAssessment.class);
	}

	public JsonArray convertListOfSubAssessmentListToJsonArray(int index, List<SubscriberAssessment> subscriberResult) {
			
			DateFormat df = new SimpleDateFormat("hh:mm a, E, dd/MM/yyy");
			
			JsonArray subscriberAssesArray= new JsonArray();
			for (SubscriberAssessment subscriberAssessment : subscriberResult) {
				JsonObject subscriberAssess = new JsonObject();
				subscriberAssess.addProperty("sn", index+1);
				subscriberAssess.addProperty("lastdate", df.format(subscriberAssessment.getLastProcessed()));
				subscriberAssess.addProperty("msisdn", subscriberAssessment.getSubscriber().getMsisdn());
				subscriberAssess.addProperty("nooftopup", subscriberAssessment.getNumberOfTopUps());
				subscriberAssess.addProperty("amounttoppedup",subscriberAssessment.getTotalTopUpValue() == null? "N/A":subscriberAssessment.getTotalTopUpValue().toString());
				subscriberAssess.addProperty("ageinnetwork",subscriberAssessment.getAgeOnNetwork());
				subscriberAssess.addProperty("status", subscriberAssessment.getInDebt());
				subscriberAssess.addProperty("eligibleamount", subscriberAssessment.getMaxBorrowableAmount().getAmount());
				
				index += 1;
				subscriberAssesArray.add(subscriberAssess);
			}
			
			return subscriberAssesArray;
	}

	public List<SubscriberAssessment> getPaginatedSubAssessmentListWithSearchParam(int pageSize, int pageIndex, String search) {
		if(search.isEmpty()){
			return nanoQueryManager.getPaginatedSubAssessmentList(pageSize, pageIndex);
		}else{
			return nanoQueryManager.getPaginatedSubAssessmentBySearchParameter(pageSize, pageIndex, search);
		}
	}

	public Long getCountOfLoanReturn() {
		return nanoQueryManager.getCountByClass(Payment.class);
	}

	public List<Payment> getPaginatedLoanReturnListWithSearchParam(int pageSize, int pageIndex, String search) {
		if(search.isEmpty()){
			return nanoQueryManager.getPaginatedLoanReturnList(pageSize, pageIndex);
		}else{
			return nanoQueryManager.getPaginatedLoanReturnBySearchParameter(pageSize, pageIndex, search);
		}
	}
	
	public Payment getPaymentById(Long pk){
		return nanoQueryManager.getPaymentDetailsById(pk);
	}

	public JsonArray convertListOfLoanReturnToJsonArray(int index, List<Payment> paymentResult) {
		DateFormat df = new SimpleDateFormat("dd-MM-yyy");
		
		JsonArray paymentArray= new JsonArray();
		for (Payment payment : paymentResult) {
			JsonObject paymentAssess = new JsonObject();
			paymentAssess.addProperty("sn", index+1);
			paymentAssess.addProperty("rechargedate", df.format(payment.getRechargeTime()));
			paymentAssess.addProperty("msisdn", payment.getBorrow().getSubscriber().getMsisdn());
			paymentAssess.addProperty("refno", payment.getBorrow().getReferenceNo());
			paymentAssess.addProperty("processdate",df.format(payment.getProcessedTimestamp()));
			paymentAssess.addProperty("sevicecharge",payment.getBorrow().getCharge());
			paymentAssess.addProperty("amountloaned",payment.getBorrow().getAmountApproved());
			paymentAssess.addProperty("amountpaid", payment.getAmountPaid());
			paymentAssess.addProperty("amountstillowed", payment.getAmountOwedAfterPayment());
			paymentAssess.addProperty("pk", payment.getPk() );
			
			index += 1;
			paymentArray.add(paymentAssess);
		}
		
		return paymentArray;
	}

	public JsonObject getLoanReturnAsJsonObject(Payment payment) {
		
		DateFormat df = new SimpleDateFormat("hh:mm a, E, dd/MM/yyy");
		JsonObject jsonObject= new JsonObject();
		jsonObject.addProperty("update", "success");
		jsonObject.addProperty("processdate",df.format(payment.getProcessedTimestamp()));
		jsonObject.addProperty("rechargedate",df.format(payment.getRechargeTime()));
		jsonObject.addProperty("msisdn",payment.getBorrow().getSubscriber().getMsisdn());
		jsonObject.addProperty("refno",payment.getBorrow().getReferenceNo());
		jsonObject.addProperty("servicecharge",payment.getBorrow().getCharge());
		jsonObject.addProperty("amountloaned",payment.getBorrow().getAmountApproved());
		jsonObject.addProperty("amountpaid",payment.getAmountPaid());
		jsonObject.addProperty("amountstillowed",payment.getAmountOwedAfterPayment());
		jsonObject.addProperty("sercomnotif",payment.getResponse() == null? "N/A":payment.getResponse());
		jsonObject.addProperty("smpp",payment.getSmppResponse()== null? "N/A":payment.getSmppResponse());
		
		return jsonObject;
	}

	public JsonObject getLoanRequestAsJsonObject(LoanRequestReport loanRequestReport) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		JsonObject jsonObject= new JsonObject();
		jsonObject.addProperty("update", "success");
		jsonObject.addProperty("time",df.format(loanRequestReport.getDate()));
		jsonObject.addProperty("msisdn",loanRequestReport.getMsisdn());
		jsonObject.addProperty("refno",loanRequestReport.getReferenceNo());
		jsonObject.addProperty("channel",loanRequestReport.getChannelType());
		jsonObject.addProperty("amount",loanRequestReport.getAmountRequested().toPlainString());
		jsonObject.addProperty("evc",loanRequestReport.getEvc_response());
		jsonObject.addProperty("sercom",loanRequestReport.getSercom_response());
		jsonObject.addProperty("smpp",loanRequestReport.getSmpp_response());
		jsonObject.addProperty("sms","not available");
		
		return jsonObject;
	}
	
}
