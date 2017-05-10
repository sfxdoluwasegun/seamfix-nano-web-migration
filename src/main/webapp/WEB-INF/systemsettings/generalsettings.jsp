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
					<div class="row">
						 <button title="DEFINE SETTINGS" class="btn btn-round btn-sm btn-info pull-right " style="margin-right: 15px;"data-toggle="modal" data-target="#definesettings">
		                 <i class="material-icons">add</i>
		             	 </button>
		             	 <div class="clearfix"></div>
                         <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                              <thead>
                              <tr>
                                  <th>s/n</th>
                                  <th>General Settings</th>
                                  <th>Value</th>
                                  <th class="disabled-sorting">Actions</th>
                              </tr>
                              </thead>
                              <tbody>
	                              <tr>
	                                  <td>1</td>
	                                  <td>USE STAGING SERVER</td>
	                                  <td>false</td>
	                                  <td class="td-actions">
								        <a ><button type="button" data-placement="top" title="EDIT" class="btn" data-toggle="modal" data-target="#updatesettings"><i class="material-icons">mode_edit</i></button></a>
								        <a ><button type="button" data-placement="top" title="RESET" class="btn btn-warning"><i class="material-icons">loop</i></button></a>
	                                  </td>
	                              </tr>
	                              <tr>
	                                  <td>1</td>
	                                  <td>GRANT SMART LOAN AMOUNT</td>
	                                  <td>true</td>
	                                  <td class="td-actions">
								        <a ><button type="button" data-placement="top" title="EDIT" class="btn"><i class="material-icons">mode_edit</i></button></a>
								        <a ><button type="button" data-placement="top" title="RESET" class="btn btn-warning"><i class="material-icons">loop</i></button></a>
	                                  </td>
	                              </tr>
                              </tbody>
                          </table>
					</div>
				</div>
			</div>
		</div>
		
<!------------------------------------------------ Define Settings Modal------------------------------------------------------------>
									
<div class="modal fade" id="definesettings" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
			<div class="modal-content">
					<div class="modal-header modal-success">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">BACK</button>
                            <h3 id="myModalLabel" style="color: blue"></h3>
                    </div>
			        <div class="modal-body">	
			       		 <div class="row">	
			       		 	<div class="col-md-2">
				                </div>								
							 	<div class="col-md-8">
								 	<form id="createcriterion" class="form-horizontal" method="POST" action="/nano/systemsettings/generalsettings">
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Name<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="settingsname" name="settingsname" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Value<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="settingsvalue" name="settingsvalue" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Description<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="Description" name="Description" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	<input name="action" value="definesettings" type="hidden">
							 		<button type="submit" id="definesettings" class="btn btn-info pull-right">Define Settings</button>
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

<!------------------------ Define Settings Modal ends------------------------------>

<!------------------------------------------------ Update Settings Modal------------------------------------------------------------>
									
<div class="modal fade" id="updatesettings" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
			<div class="modal-content">
					<div class="modal-header modal-success">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">BACK</button>
                            <h3 id="myModalLabel" style="color: blue"></h3>
                    </div>
			        <div class="modal-body">	
			       		 <div class="row">	
			       		 	<div class="col-md-2">
				                </div>								
							 	<div class="col-md-8">
								 	<form id="createcriterion" class="form-horizontal" method="POST" action="/nano/systemsettings/generalsettings">
								 	 <p>Name: <span> Use Staging Server</span></p>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Value<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="settingsvalue" name="settingsvalue" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	 <div class="input-group col-xs-10">
						                    <div class="form-group label-floating">
						                        <label class="control-label">Description<b style="color: red; font-size: 100%"> * </b></label>
						                        <input type="text" class="form-control"
													id="Description" name="Description" pattern="{1,15}"
													title="<fmt:message key="label.firstname.error" />"
													required>
						                    </div>
								 	</div>
								 	<input name="action" value="definesettings" type="hidden">
							 		<button type="submit" id="definesettings" class="btn btn-info pull-right">Update Settings</button>
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

<!------------------------ Update Settings Modal ends------------------------------>
	</jsp:body>
</t:page>