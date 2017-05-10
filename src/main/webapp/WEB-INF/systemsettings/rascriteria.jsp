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
				<span id="ErrorLabel" style="display:none;"><fmt:message key="label.error" /></span>
				<div class="clearfix"></div>
				<div class="card-content">
					<div id="amountform" style="display:none;">
						<form id="createcriterion" class="form-horizontal" method="POST" action="/nano/systemsettings/ras">
							 <div class="row">
								 <div class="col-sm-3">
				                </div>
				                <div class="col-sm-6">
					                <div class="input-group  form-group label-floating">
					               		<label class="control-label">Amount</label>
				                        <input type="text" class="form-control" id="amount" name="amount" pattern="{1,15}"
												title="<fmt:message key="label.firstname.error" />" required>
					                    <span class="input-group-btn">
					 						<button type="button" id="createcriterionbutton" onclick="check('amount')" class="btn btn-info btn-md  pull-left">Create Criterion</button>
								        </span>
								        <span class="input-group-btn">
								        	<button type="button" id="cancel" class="btn btn-info btn-md" onclick="change('amountform','definecriterion')">Cancel</button>
								        </span>
									 </div>
						 		</div>
				                <div class="col-sm-3">
							 	</div>
		                	</div>
						 </form>
					</div>
					<div class="row">
						 <button title="DEFINE CRITERION" id="definecriterion" class="btn btn-round btn-sm btn-success pull-right " style="margin-right: 15px;" onclick="change('definecriterion','amountform')">
		                 Define Criterion
		             	 </button>
		             	 <div class="clearfix"></div>
                         <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                              <thead>
                              <tr>
                                  <th>s/n</th>
                                  <th>Amount</th>
                                  <th>Number Of Topups</th>
                                  <th>Topup Duration</th>
                                   <th>Age On Network</th>
                                  <th>Min Recharge Amount</th>
                                  <th>Service Fee</th>
                                  <th class="disabled-sorting">Actions</th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>1</td>
                                  <td>NGN 50.00</td>
                                  <td>1</td>
                                  <td>30 Day(s)</td>
                                  <td>30 Day(s)</td>
                                  <td>NGN 100.00</td>
                                   <td>15%</td>
                                  <td class="td-actions">
							        <a ><button type="button" data-placement="top" title="EDIT" class="btn"><i class="material-icons">mode_edit</i></button></a>
                                  </td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td>NGN 50.00</td>
                                  <td>1</td>
                                  <td>30 Day(s)</td>
                                  <td>30 Day(s)</td>
                                  <td>NGN 100.00</td>
                                   <td>15%</td>
                                  <td class="td-actions">
							        <a ><button type="button" data-placement="top" title="EDIT" class="btn"><i class="material-icons">mode_edit</i></button></a>
                                  </td>
                              </tr>
                              </tbody>
                          </table>
					</div>
				</div>
			</div>
			<!------------------------------------------------ create Criterion Modal------------------------------------------------------------>
									
<div class="modal fade" id="create" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
			<div class="modal-content">
					<div class="modal-header modal-success">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="change('amountform','definecriterion')">BACK</button>
                            <h3 id="myModalLabel" style="color: blue"></h3>
                    </div>
			        <div class="modal-body">	
			       		 <div class="row">	
			       		 	<div class="col-md-2">
				                </div>								
							 	<div class="col-md-8">
								 	<form id="createcriterion" class="form-horizontal" method="POST" action="/nano/systemsettings/ras">
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Number Of TopUps<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="noftopup" name="noftopup" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Top-Up Duration<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="topupduration" name="topupduration" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Age On Network<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="ageonnetwork" name="ageonnetwork" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	<div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Minimum Recharge Amount<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="minrechamount" name="minrechamount" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	<div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Service Fee<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="servicefee" name="servicefee" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	<input name="action" value="createrascriterion" type="hidden">
							 		<button type="submit" id="createcriterion" class="btn btn-info pull-right">Create Criterion</button>
							 	</form>
			                </div>
						 		<div class="col-md-2">
				                </div>
						 </div>
					</div>
					<div class="modal-footer">
					</div>
		  </div>
    </div>
</div>

<!------------------------ create Criterion Modal ends------------------------------>
	</jsp:body>
</t:page>
	<script>
	function hideelement(id){
		document.getElementById(id).style.display = "none";
		erase('amount');
	}
	function showelement(id){
		document.getElementById(id).style.display = "block";
	}
	function change(id1,id2){
		hideelement(id1)
		showelement(id2)
	}
	
	function erase(id){
		document.getElementById(id).value = "";
	}
	
	function check(id){
		
		var amount = document.getElementById(id).value;
		
		var ajaxUrl = '<%=request.getContextPath() + "/systemsettings/ras?action=checkam&am="%>' + amount;

		$.ajax({
			url : ajaxUrl,
			type : "POST",
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				if (data.update == "success") {
					if(data.exists=='true'){
						
						var value = "Amount NGN " + amount + ".00";
						document.getElementById('myModalLabel').innerHTML = value;
						$('#create').modal('show');
					}
				} else {

					alert(data.update);
				}
			}
		});

		//alert(amount);
	}
	
	</script>