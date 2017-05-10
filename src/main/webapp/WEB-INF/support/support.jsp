<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:page>
	<jsp:body>
		<div class="card">
				<div class="card-header card-header-icon"
					data-background-color="rose">
					<i class="material-icons">assignment</i>
				</div>
				<h5 class="card-title"><b>Report For NanoAirtime - </b> You can generate reports using the search tool.</h5>
				<div class="clearfix"></div>
				<div class="card-content">
					<div>
					<form>
						<div class="input-group">
						<label class="control-label"><fmt:message key="label.selectreport" /></label>
			                  <select class="form-control" name="gender" id="gender" required>
			                      <option value = "1">LOAN REQUEST REPORT</option>
			                      <option value = "1">LIST OF USERS</option>
			                  </select>
				         </div>
				         <br>
				        <b> ENTER SEARCH PARAMETERS	</b>
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
				        
				        	</div>	
				        </div>
				        <div class="row">
				        	<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" value="selectall">Select All</label>
				    			</div>
		        			</div>
				        </div>
				        <div class="row">
				        	<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >Request time</label>
				    			</div>
		        			</div>
		        			<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >MSISDN</label>
				    			</div>
		        			</div>
		        			<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >Loan Reference</label>
				    			</div>
		        			</div>
		        			<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >Request amount</label>
				    			</div>
		        			</div>
		        			<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >Grant status</label>
				    			</div>
		        			</div>
		        			<div class="col-md-3">
			        			<div class="checkbox">
				      				<label><input name ="selectall" type="checkbox" >SMPP Notification </label>
				    			</div>
		        			</div>
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
