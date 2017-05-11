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
			                      <option value = "loanrequest">LOAN REQUEST REPORT</option>
			                      <option value = "loanreturn">LOAN RETURN REPORT</option>
			                      <option value = "subscriberassessment">SUBSCRIBER ASSESSMENT</option>
			                  </select>
				         </div>
				         <br>
				        <b> ENTER SEARCH PARAMETERS	</b>
				        <div id="loanrequest">
				        <div class="row">
				        	<div class="col-xs-2">
						        <div class="form-group">
							        <label class="control-label">Request Start Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label">Request End Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker2">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
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
							        <label class="control-label">Return Start Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label">Return End Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker2">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
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
							        <label class="control-label">Assessment Start Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="form-group">
							        <label class="control-label">Assessment End Date</label>
							        <div class="date">
							            <div class="input-group input-append date" id="datePicker2">
							                <input type="text" class="form-control" name="date" />
							                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
							            </div>
							        </div>
							    </div>
				        	</div>	
				        	<div class="col-xs-2">
				        		<div class="input-group">
				                    <div class="form-group">
				                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
				                        <div>
				                        	<input class="form-control" name="msisdn" id="msisdn" required>
				                        </div>
				                    </div>
				                </div>
				        	</div>	
				        	<div class="col-xs-2">
					        	<div class="input-group">
									  <label class="control-label"><fmt:message key="label.selectreport" /></label>
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
			        		<button type="submit" id="submituserform" class="btn pull-left"><<fmt:message key="label.runreport" /></button>
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
				<div>
					<table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						        <th>Request time</th>
						        <th>MSISDN</th>
						        <th>Loan Reference</th>
						        <th>Request channel</th>
						        <th>Request amount</th>
						        <th>Grant status</th>
						        <th>SMPP </th>
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
    $('#datePicker').datepicker({
            format: 'mm/dd/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
        });
    $('#datePicker2').datepicker({
        format: 'mm/dd/yyyy'
    })
    .on('changeDate', function(e) {
        // Revalidate the date field
        $('#eventForm').formValidation('revalidateField', 'date');
    });

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
	}else if(selectedvalue=='loanreturn'){
		hideelement('loanrequest');
		hideelement('subscriberassessment');
		showelement('loanreturn');
	}else if(selectedvalue=='subscriberassessment'){
		hideelement('loanrequest');
		showelement('subscriberassessment');
		hideelement('loanreturn');
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
