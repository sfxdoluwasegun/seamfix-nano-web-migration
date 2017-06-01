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
				        <div id="loanrequest" style="display:none;">
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
				      <div id ="subscriberassessment">
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
					                      <c:choose>
						                  	<c:when test="${thresholds ne null}">
						                  		<c:forEach  var = "threshold" items = "${thresholds}">
						                  		<option value = "${threshold.amount}">${threshold.amount}</option>
						                  		</c:forEach>
						                  	</c:when>
						                  </c:choose>
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
						    	<th><fmt:message key="label.sn" /></th>
						        <th><fmt:message key="label.RequestTime" /></th>
						        <th><fmt:message key="label.msisdn" /></th>
						        <th><fmt:message key="label.LoanReference" /></th>
						        <th><fmt:message key="label.RequestChannel" /></th>
						        <th><fmt:message key="label.RequestAmount" /></th>
						        <th><fmt:message key="label.GrantStatus" /></th>
						        <th class="disabled-sorting"><fmt:message key="label.actions" /></th>
						        <%-- <th><fmt:message key="label.SMPP" /></th>
						        <th><fmt:message key="label.evcnotification" /></th>
						        <th><fmt:message key="label.Sercomnotification" /></th> --%>
						    </tr>
					    </thead>
					    <tbody>
					    	<c:choose>
					    		<c:when test="${loanRequests ne null}">
					    			<c:forEach  var = "loanRequest" items = "${loanRequests}" varStatus="myIndex">
					    				 <tr>
					    				 	<td scope="row" class="text-center">${myIndex.index +1}</td>
									        <td><fmt:formatDate type="DATE" pattern="EEE dd MMM, yyyy HH:mm a" value="${loanRequest.date}"/></td>
									        <td>${loanRequest.subscriber.msisdn}</td>
									        <td>${loanRequest.referenceNo}</td>
									        <td>${loanRequest.channelType}</td>
									        <td>${loanRequest.amountRequested}</td>
									        <c:choose>
						                  	<c:when test="${loanRequest.granted eq true}">
						                  		<td>Granted</td>
						                  	</c:when>
						                  	<c:otherwise>
						                  		<td>Not Granted</td>
						                  	</c:otherwise>
						                  </c:choose>
						                  <td class="td-actions">
						                  <a onclick="GetInfo('${loanRequest.pk}')"><button type="button" data-placement="top" title='<fmt:message key="label.viewmore" />' class="btn btn-info"><i class="material-icons">keyboard_arrow_down</i></button></a>
									       </td>
									       <%--  <td>${loanRequest.date}</td>
									        <td>${loanRequest.date}</td>
									        <td>${loanRequest.date}</td> --%>
									    </tr>
			                  		</c:forEach>
					    		</c:when>
					    	</c:choose>
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
			<!------------------------ view mORE Modal ------------------------------>

<div class="modal fade" id="view" role="dialog">
	<div class="modal-dialog modal-lg">

<!-- Modal content-->
		<div class="modal-content">
				<div class="modal-header modal-info">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                     <h3 id="myModalLabel" style="color:black">Loan Request Report</h3>
                </div>
				<div class="modal-body">
					 <p><b>MSISDN:</b><b id="msisdnv"></b></p>
					 <p><b>SMPP RESPONSE:</b><b id="smpp"></b></p>
					 <p></p>
					 <p></p>
					 <p></p>
				</div>
				<div class="modal-footer">
				</div>
			</div>
	 </div>
</div>
<!-- ---------------------------------------------------MODALS END------------------------------------------------------->
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
function GetInfo(_p){

	var ajaxUrl = '<%=request.getContextPath() + "/support?action=_fetchDetails&_p="%>' + _p;

			$.ajax({
				url : ajaxUrl,
				type : "POST",
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					if (data.update == "success") {
					document.getElementById("msisdnv").innerHTML = data.msisdn;
					document.getElementById("smpp").innerHTML = data.smpp;

						//alert(data.fullname);
						$('#view').modal('show');
					} else {

						alert(data.update);
					}
				}
			});

		}

</script>
