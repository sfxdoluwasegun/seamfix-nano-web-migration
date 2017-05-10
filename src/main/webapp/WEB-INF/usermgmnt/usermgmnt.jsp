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
						 <button title="ADD NEW ADMIN USER" class="btn btn-round btn-sm btn-success pull-left " style="margin-right: 15px;"data-toggle="modal" data-target="#addadmin">
		                 <i class="material-icons">add</i>
		             	 </button>
		             	 <div class="clearfix"></div>
                         <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                              <thead>
                              <tr>
                                  <th>s/n</th>
                                  <th><fmt:message key="label.firstname" /></th>
                                  <th><fmt:message key="label.lastname" /></th>
                                   <th><fmt:message key="label.emailadd" /></th>
                                  <th><fmt:message key="label.community" /></th>
                                  <th><fmt:message key="label.status" /></th>
                                  <th class="disabled-sorting"><fmt:message key="label.actions" /></th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>1</td>
                                  <td>Babatunde</td>
                                  <td>Ajala</td>
                                  <td>bajala@seamfix.com</td>
                                  <td>Portal Admin</td>
                                  <td>Active</td>
                                  <td class="td-actions">
                                    <a ><button type="button" data-placement="top" title="VIEW MORE" class="btn btn-info"><i class="material-icons">keyboard_arrow_down</i></button></a>
							        <a ><button type="button" data-placement="top" title="UPDATE" class="btn" data-toggle="modal" data-target="#updateadmin"><i class="material-icons">mode_edit</i></button></a>
							        <a ><button type="button" data-placement="top" title="RESET PASSWORD" class="btn btn-warning"><i class="material-icons">loop</i></button></a>
							        <a ><button type="button" data-placement="top" title="ACTIVATE" class="btn btn-success" data-toggle="modal" ><i class="material-icons">check_circle</i></button></a>
							        <a ><button type="button" data-placement="top" title="DEACTIVATE" class="btn btn-danger" data-toggle="modal" ><i class="material-icons">close</i></button></a>
                                  </td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td>Babatunde</td>
                                  <td>Ajala</td>
                                  <td>bajala@seamfix.com</td>
                                  <td>Portal Admin</td>
                                  <td>Active</td>
                                  <td class="td-actions">
                                    <a ><button type="button" data-placement="top" title="VIEW MORE" class="btn btn-info"><i class="material-icons">keyboard_arrow_down</i></button></a>
							        <a ><button type="button" data-placement="top" title="UPDATE" class="btn" data-toggle="modal" data-target="#updateadmin"><i class="material-icons">mode_edit</i></button></a>
							        <a ><button type="button" data-placement="top" title="RESET PASSWORD" class="btn btn-warning"><i class="material-icons">loop</i></button></a>
							        <a ><button type="button" data-placement="top" title="ACTIVATE" class="btn btn-success" data-toggle="modal" ><i class="material-icons">check_circle</i></button></a>
							        <a ><button type="button" data-placement="top" title="DEACTIVATE" class="btn btn-danger" data-toggle="modal" ><i class="material-icons">close</i></button></a>
                                  </td>
                              </tr>
                              </tbody>
                          </table>
					</div>
				</div>
			</div>
		</div>
		
<!------------------------------------------------ Add Admin User Modal------------------------------------------------------------>
									
<div class="modal fade" id="addadmin" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
			<div class="modal-content">
					<div class="modal-header modal-success">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="myModalLabel" style="color:Blue"><fmt:message key="label.addAdmin" /></h3>
                    </div>
			        <div class="modal-body">										
						 <form id="addadminuser" class="form-horizontal" method="POST" action="/nano/usermanagement">
						 	<div class="col-sm-12">
						         <div class="input-group">
			                        <span class="input-group-addon">
			                            <i class="material-icons">face</i>
			                        </span>
				                    <div class="form-group label-floating">
				                        <label class="control-label"><fmt:message key="label.firstname" /></label>
				                        <input type="text" class="form-control"
											id="firstName" name="firstName" pattern="[a-zA-Z]{1,15}"
											title="<fmt:message key="label.firstname.error" />"
											required>
				                    </div>
		                		</div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">face</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.lastname" /></label>
					                        <input type="text" class="form-control"
												name="lastName" id="lastName" pattern="[a-zA-Z]{1,15}"
												title="<fmt:message key="label.lastname.error" />"
												required>
					                    </div>
				                </div>
				                 <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">face</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.middlename" /></label>
					                        <input type="text" class="form-control"
												name="middlename" id="middlename" pattern="[a-zA-Z]{1,15}"
												title="<fmt:message key="label.middlename.error" />"
												>
					                    </div>
				                </div>
				                <div class="input-group">
					                  <span class="input-group-addon">
					                     <i class="material-icons">face</i>
					                  </span>
					                  <select class="form-control" name="gender" id="gender" required>
					                      <option selected disabled hidden=true><fmt:message key="label.selectgender" /></option>
					                      <option value = "1">Female</option>
					                      <option value = "1">Male</option>
					                  </select>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">mail</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
					                        <input type="email" class="form-control" name="email" id="email" required>
					                    </div>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">phone</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.phoneno" /></label>
					                        <input class="form-control" name="phoneno" id="phoneno" required>
					                    </div>
				                </div>
				                <div class="input-group">
					                  <span class="input-group-addon">
					                     <i class="material-icons">supervisor_account</i>
					                  </span>
					                  <select class="form-control" name="community" required>
					                      <option selected disabled hidden=true><fmt:message key="label.selectcommunity" /></option>
					                      <option value = "1">Etisalat Admin</option>
					                      <option value = "1">Nano Airtime Admin</option>
					                      <option value = "1">Nano Airtime Directors</option>
					                      <option value = "1">Support Admin</option>
					                  </select>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">lock_outline</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.password" /></label>
					                        <input type="password" class="form-control" name="password" minlength="8" required>
					                    </div>
				                </div>
				                <input name="action" value="createAdminuser" type="hidden">
						        <button type="submit" id="submituserform" class="btn btn-info pull-right"><fmt:message key="label.submit" /></button>
							</div>
						 </form>
					</div>
					<div class="modal-footer">
					</div>
		  </div>
    </div>
</div>

<!------------------------ Add Admin User Modal ends------------------------------>
<!------------------------------------------------ Update Admin User Modal------------------------------------------------------------>
									
<div class="modal fade" id="updateadmin" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
			<div class="modal-content">
					<div class="modal-header modal-success">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="myModalLabel" style="color:Blue"><fmt:message key="label.updateAdmin" /></h3>
                    </div>
			        <div class="modal-body">										
						 <form id="addadminuser" class="form-horizontal" method="POST" action="/nano/usermanagement">
						 	<div class="col-sm-12">
						         <div class="input-group">
			                        <span class="input-group-addon">
			                            <i class="material-icons">face</i>
			                        </span>
				                    <div class="form-group label-floating">
				                        <label class="control-label"><fmt:message key="label.firstname" /></label>
				                        <input type="text" class="form-control"
											id="firstName" name="firstName" pattern="[a-zA-Z]{1,15}"
											title="<fmt:message key="label.firstname.error" />"
											required>
				                    </div>
		                		</div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">face</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.lastname" /></label>
					                        <input type="text" class="form-control"
												name="lastName" id="lastName" pattern="[a-zA-Z]{1,15}"
												title="<fmt:message key="label.lastname.error" />"
												required>
					                    </div>
				                </div>
				                 <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">face</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.middlename" /></label>
					                        <input type="text" class="form-control"
												name="middlename" id="middlename" pattern="[a-zA-Z]{1,15}"
												title="<fmt:message key="label.middlename.error" />"
												required>
					                    </div>
				                </div>
				                <div class="input-group">
					                  <span class="input-group-addon">
					                     <i class="material-icons">face</i>
					                  </span>
					                  <select class="form-control" name="gender" id="gender" required>
					                      <option selected disabled hidden=true><fmt:message key="label.selectgender" /></option>
					                      <option value = "1">Female</option>
					                      <option value = "1">Male</option>
					                  </select>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">mail</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.emailadd" /></label>
					                        <input type="email" class="form-control" name="email" id="email" required>
					                    </div>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">phone</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.phoneno" /></label>
					                        <input class="form-control" name="phoneno" id="phoneno" required>
					                    </div>
				                </div>
				                <div class="input-group">
					                  <span class="input-group-addon">
					                     <i class="material-icons">supervisor_account</i>
					                  </span>
					                  <select class="form-control" name="community" required>
					                      <option selected disabled hidden=true><fmt:message key="label.selectcommunity" /></option>
					                      <option value = "1">Etisalat Admin</option>
					                      <option value = "1">Nano Airtime Admin</option>
					                      <option value = "1">Nano Airtime Directors</option>
					                      <option value = "1">Support Admin</option>
					                  </select>
				                </div>
				                <div class="input-group">
				                        <span class="input-group-addon">
				                            <i class="material-icons">lock_outline</i>
				                        </span>
					                    <div class="form-group label-floating">
					                        <label class="control-label"><fmt:message key="label.password" /></label>
					                        <input type="password" class="form-control" name="password" minlength="8" required>
					                    </div>
				                </div>
				                <input name="action" value="createAdminuser" type="hidden">
						        <button type="submit" id="submituserform" class="btn btn-info pull-right"><fmt:message key="label.updateUser" /></button>
							</div>
						 </form>
					</div>
					<div class="modal-footer">
					</div>
		  </div>
    </div>
</div>

<!------------------------ Update Admin User Modal ends------------------------------>
	</jsp:body>
</t:page>
<script>
var message = document.getElementById("ErrorLabel").innerHTML;
   $("#addadminuser").validate({
       messages: {
    	   firstName: message,
    	   password: message,
    	   lastName: message,
    	   email: message,
    	   phoneno: message,
    		  
       },
       submitHandler: function (form) {
           $('#submituserform').click(function () {
               form.submit();
           });
       }		
   });
</script>
