package com.sf.nano.javabeans;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.nano.jpa.enums.ChannelType;

public class LoanRequestReport {

	private BigDecimal amountRequested;
	private String channelType;
	private ChannelType channel;
	private Timestamp date;
	private boolean granted;
	private String referenceNo;
	private String msisdn;
	private String smpp_response;
	private String sms_response;
	private String evc_response;
	private String sercom_response;
	
	
	
	public LoanRequestReport() {
		super();
	}

	public LoanRequestReport(BigDecimal amountRequested, ChannelType channelType, Timestamp date,
			boolean granted, String referenceNo, String msisdn, String smpp_response,
			String evc_response, String sercom_response) {
		super();
		this.amountRequested = amountRequested;
		this.channel = channelType;
		this.date = date;
		this.granted = granted;
		this.referenceNo = referenceNo;
		this.msisdn = msisdn;
		this.smpp_response = smpp_response;
		this.evc_response = evc_response;
		this.sercom_response = sercom_response;
	}
	
	public LoanRequestReport(BigDecimal amountRequested, String channelType, Timestamp date,
			boolean granted, String referenceNo, String msisdn, String smpp_response, String sms_response,
			String evc_response, String sercom_response) {
		super();
		this.amountRequested = amountRequested;
		this.channelType = channelType;
		this.date = date;
		this.granted = granted;
		this.referenceNo = referenceNo;
		this.msisdn = msisdn;
		this.smpp_response = smpp_response;
		this.sms_response = sms_response;
		this.evc_response = evc_response;
		this.sercom_response = sercom_response;
	}
	
	public BigDecimal getAmountRequested() {
		return amountRequested;
	}

	public void setAmountRequested(BigDecimal amountRequested) {
		this.amountRequested = amountRequested;
	}

	public String getChannelType() {
		return channelType;
	}

	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public boolean isGranted() {
		return granted;
	}

	public void setGranted(boolean granted) {
		this.granted = granted;
	}

	public String getReferenceNo() {
		return referenceNo;
	}

	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public String getSmpp_response() {
		return smpp_response;
	}

	public void setSmpp_response(String smpp_response) {
		this.smpp_response = smpp_response;
	}

	public String getSms_response() {
		return sms_response;
	}

	public void setSms_response(String sms_response) {
		this.sms_response = sms_response;
	}

	public String getEvc_response() {
		return evc_response;
	}

	public void setEvc_response(String evc_response) {
		this.evc_response = evc_response;
	}

	public String getSercom_response() {
		return sercom_response;
	}

	public void setSercom_response(String sercom_response) {
		this.sercom_response = sercom_response;
	}

	public ChannelType getChannel() {
		return channel;
	}

	public void setChannel(ChannelType channel) {
		this.channel = channel;
	}
	
	

}
