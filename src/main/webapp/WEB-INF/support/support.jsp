<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:page>
	<jsp:body>
	<div>
        	<form id ="myForm" class="form-horizontal" method="POST" action="/nano/support">
	            <select id="language" name="language" onchange="submit()">
	                <option  ${language == 'en' ? 'selected' : ''} value="en">English</option>
	                <option  ${language == 'fr' ? 'selected' : ''} value="fr">French</option>
	                <option  ${language == 'zh' ? 'selected' : ''} value="zh">China</option>
	            </select>
	            <input name="action" value="changeLanguge" type="hidden">
	        </form>
        </div>
		<div class="card">
				<div class="card-header card-header-icon"
					data-background-color="#00bcd4">
					<i class="material-icons">assignment</i>
				</div>
				<h5 class="card-title"><b><fmt:message key="label.RforNano" /></b> <fmt:message key="label.Extra" /></h5>
				<div class="clearfix"></div>
				<div class="card-content">
					<div>
					<form>
						<div class="input-group">
						<label class="control-label"><fmt:message key="label.selectreport" /></label>
			                  <select class="form-control" name="reporttype" onchange="changeform()" id="reporttype" required>
			                      <option value = "loanrequest"><fmt:message key="label.loanrequest" /></option>
			                      <option value = "loanreturn"><fmt:message key="label.loanReturn" /></option>
			                      <option value = "subscriberassessment"><fmt:message key="label.subscriberassessment" /></option>
			                  </select>
				         </div>
				         <br>
				        <b><fmt:message key="label.entersearchparam" /></b>
				        <div id="loanrequest">
				        <div class="row">
				        	<div class="col-xs-2">
						        <div class="form-group">
							        <label class="control-label"><fmt:message key="label.requestStartDate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" class="datepicker1">
							                <input type="text" class="form-control" name="startdate" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label"><fmt:message key="label.RequestEndDate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" class="datepicker1">
							                <input type="text" class="form-control" name="enddate" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.msisdn" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
									  <label class="control-label"><fmt:message key="label.GrantStatus" /></label>
					                  <select class="form-control" name="grantstatus" required>
					                      <option value = "granted"><fmt:message key="label.Granted" /></option>
					                      <option value = "notgranted"><fmt:message key="label.notgranted" /></option>
					                  </select>
						         </div>
				        	</div>
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="input-group">
									  <label class="control-label"><fmt:message key="label.RequestChannel" /></label>
					                  <select class="form-control" name="requestchannel" required>
					                      <option value = "ussd"><fmt:message key="label.sms" /></option>
					                      <option value = "sms"><fmt:message key="label.ussd" /></option>
					                  </select>
						         	</div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.genericsearch" /></label>
				                        <div>
				                        	<input class="form-control" name="searchgeneric" id="searchgeneric" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        </div>
				      </div>
				      <div id ="loanreturn" style="display:none;">
				      	 <div class="row">
				        	<div class="col-xs-2">
						        <div class="form-group">
							        <label class="control-label"><fmt:message key="label.requestStartDate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" class="datepicker1">
							                <input type="text" class="form-control" name="startdateforloanreturn" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label"><fmt:message key="label.RequestEndDate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" class="datepicker1">
							                <input type="text" class="form-control" name="enddateforloanreturn" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.msisdn" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdnforloanreturn" id="msisdnforloanreturn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.LoanReference" /></label>
				                        <div>
				                        	<input class="form-control" name="refno" id="refno" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.LoanAmount" /></label>
				                        <div>
				                        	<input class="form-control" name="loanamount" id="loanamount" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.paidAmount" /></label>
				                        <div>
				                        	<input class="form-control" name="paidamount" id="paidamount" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        </div>
				      </div>
				      <div id ="subscriberassessment" style="display:none;">
				      	 <div class="row">
				        	<div class="col-xs-2">
						        <div class="form-group">
							        <label class="control-label"><fmt:message key="label.assessmentstartdate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" id="datepicker1">
							                <input type="text" class="form-control" name="assessmentstartdate" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label"><fmt:message key="label.assessmentenddate" /></label>
							        <div class="date">
							            <div class="input-group input-append date" class="datepicker1">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.msisdn" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
					        	<div class="input-group">
									  <label class="control-label"><fmt:message key="label.eligibleamount" /></label>
					                  <select class="form-control" name="eligibleamount" id="eligibleamount" required>
					                      <option value = "1">50</option>
					                      <option value = "1">100</option>
					                      <option value = "1">200</option>
					                      <option value = "1">500</option>
					                      <option value = "1">1000</option>
					                      <option value = "1">2000</option>
					                      <option value = "1">2600</option>
					                  </select>
						         </div>
				        	</div>	
				        	<div class="col-xs-2">
					        	<div class="input-group">
									  <label class="control-label"><fmt:message key="label.selectreport" /></label>
					                  <select class="form-control" name="eligibilitystatus" id="eligibilitystatus" required>
					                      <option value = "1">Eligible</option>
					                      <option value = "1">In-eligible</option>
					                  </select>
						         </div>
				        	</div>	
				        	<div class="col-xs-2">
				        	</div>
				        </div>
				      </div>
				        <div class="row">
			        		<button type="submit" id="submituserform" class="btn pull-left"><fmt:message key="label.generatereport" /></button>
				        </div>
					</form>
				</div>
				<div>
				</div>
			</div>
		</div>
		<br>
		<div class="card">
				<div class="clearfix"></div>
				<div class="card-content">
				<div id="loanrequesttable" style="display:none;">
					<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						        <th><fmt:message key="label.RequestTime" /></th>
						        <th><fmt:message key="label.msisdn" /></th>
						        <th><fmt:message key="label.LoanReference" /></th>
						        <th><fmt:message key="label.RequestChannel" /></th>
						        <th><fmt:message key="label.RequestAmount" /></th>
						        <th><fmt:message key="label.GrantStatus" /></th>
						        <th><fmt:message key="label.SMPP" /></th>
						        <th><fmt:message key="label.evcnotification" /></th>
						        <th><fmt:message key="label.Sercomnotification" /></th>
						    </tr>
					    </thead>
					    <tbody>
					    <tr>
					        <td>8:00PM</td>
					        <td>08099776566</td>
					        <td>6YHVC7Y</td>
					        <td>N/A</td>
					        <td>50000</td>
					        <td>Granted</td>
					        <td>Yeah</td>
					    </tr>
					
					    </tbody>
					</table>
				</div>
				<div id="loanreturnreporttable" style="display:none;">
					<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						        <th><fmt:message key="label.msisdn" /></th>
						        <th><fmt:message key="label.LoanReference" /></th>
						        <th><fmt:message key="label.rechargedate" /></th>
						        <th><fmt:message key="label.processeddate" /></th>
						        <th><fmt:message key="label.amountloaned" /></th>
						        <th><fmt:message key="label.servicecharge" /></th>
						        <th><fmt:message key="label.paidAmount" /></th>
						        <th><fmt:message key="label.amountstillowed" /></th>
						        <th><fmt:message key="label.evcnotification" /></th>
						        <th><fmt:message key="label.Sercomnotification" /></th>
						    </tr>
					    </thead>
					    <tbody>
					    <tr>
					        <td>8:00PM</td>
					        <td>08099776566</td>
					        <td>6YHVC7Y</td>
					        <td>N/A</td>
					        <td>50000</td>
					        <td>Granted</td>
					        <td>Yeah</td>
					    </tr>
					
					    </tbody>
					</table>
				</div>
				<div id="subscriberassessmenttable" style="display:none;">
					<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						        <th><fmt:message key="label.msisdn" /></th>
						        <th><fmt:message key="label.lastassessmentdate" /></th>
						        <th><fmt:message key="label.nooftopup30" /></th>
						        <th><fmt:message key="label.amounttoppedup30" /></th>
						        <th><fmt:message key="label.ageinnetwork" /></th>
						        <th><fmt:message key="label.eligibilitystatus" /></th>
						        <th><fmt:message key="label.eligibleamount" /></th>
						    </tr>
					    </thead>
					    <tbody>
					    <tr>
					        <td>8:00PM</td>
					        <td>08099776566</td>
					        <td>6YHVC7Y</td>
					        <td>N/A</td>
					        <td>50000</td>
					        <td>Granted</td>
					        <td>Yeah</td>
					    </tr>
					
					    </tbody>
					</table>
				</div>
			</div>
		</div>
	</jsp:body>
</t:page>

<script>
$(document).ready(function() {
    $('#datePicker1').datepicker({
            format: 'mm/dd/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
        });
    /* $('#datePicker2').datepicker({
        format: 'mm/dd/yyyy'
    })
    .on('changeDate', function(e) {
        // Revalidate the date field
        $('#eventForm').formValidation('revalidateField', 'date');
    }); */

});
</script>
<script>
//select all checkboxes(jquery 1.6+)
$("#selectall").change(function(){  //"select all" change
    $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
});

//".checkbox" change
$('.checkbox').change(function(){
    //uncheck "select all", if one of the listed checkbox item is unchecked
    if(false == $(this).prop("checked")){ //if this item is unchecked
        $("#selectall").prop('checked', false); //change "select all" checked status to false
    }
    //check "select all" if all checkbox items are checked
    if ($('.checkbox:checked').length == $('.checkbox').length ){
        $("#selectall").prop('checked', true);
    }
});
</script>
<script>
function changeform(){
	var selectedvalue = $( "#reporttype" ).val();
	
	if(selectedvalue=='loanrequest'){
		showelement('loanrequest');
		hideelement('subscriberassessment');
		hideelement('loanreturn');
		showelement('loanrequesttable');
		hideelement('subscriberassessmenttable');
		hideelement('loanreturnreporttable');
	}else if(selectedvalue=='loanreturn'){
		hideelement('loanrequest');
		hideelement('subscriberassessment');
		showelement('loanreturn');
		hideelement('loanrequesttable');
		hideelement('subscriberassessmenttable');
		showelement('loanreturnreporttable');
	}else if(selectedvalue=='subscriberassessment'){
		hideelement('loanrequest');
		showelement('subscriberassessment');
		hideelement('loanreturn');
		hideelement('loanrequesttable');
		showelement('subscriberassessmenttable');
		hideelement('loanreturnreporttable');
	}
}

function hideelement(id){
	document.getElementById(id).style.display = "none";
}
function showelement(id){
	document.getElementById(id).style.display = "block";
}
</script>
<script>
var resultOutput = {
	"loanrequest": ["Request Time","MSISDN","Loan Reference","Request Channel","SMS/USSD","Request Amount","Grant Status","SMPP Notification","EVC Notification","Sercom Notification"],
	"loanreturn":["MSISDN","Ref Number","Recharge Date","Processed Date","Amount Loaned","Service Charge","Amount Paid","Amount STill owed","Sercom Notification"],
	"subscriberassessment":["MSISDN","Last Assessment Date","Number Of Topups in last 30 days","Amount topped up in last 30 days","age on network","Eligibility Status"]
}

</script>
