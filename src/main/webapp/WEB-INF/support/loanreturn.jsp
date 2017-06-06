<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:page>
	<jsp:body>
		<div>
        	<form id ="myForm" class="form-horizontal" method="POST" action="/nano/support/loanreturn">
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
				<p id="viewmoretitle" style="display:none;"><fmt:message key="label.viewmore" /></p>
				<h5 class="card-title"><b><fmt:message key="label.RforNano" /></b> <fmt:message key="label.loanReturn" /></h5>
				<div class="clearfix"></div>
				<div class="card-content">
						<table id="datatableloanreturn" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						    	<th class="_sn"><fmt:message key="label.sn" /></th>
						        <th class="_msisdn"><fmt:message key="label.msisdn" /></th>
						        <th class="loanref"><fmt:message key="label.LoanReference" /></th>
						        <th class="rechargedate"><fmt:message key="label.rechargedate" /></th>
						        <%-- <th class="processdate"><fmt:message key="label.processeddate" /></th> --%>
						        <th class="amountloaned"><fmt:message key="label.amountloaned" /></th>
						        <th class="servicecharge"><fmt:message key="label.servicecharge" /></th>
						        <th class="paidamount"><fmt:message key="label.paidAmount" /></th>
						        <th class="amountstillowed"><fmt:message key="label.amountstillowed" /></th>
						        <th class="_action"><fmt:message key="label.actions" /></th>
						    </tr>
					    </thead>
					</table>
				</div>
			</div>
			<!------------------------ view mORE Modal ------------------------------>

<div class="modal fade" id="view" role="dialog">
	<div class="modal-dialog modal-lg">

<!-- Modal content-->
		<div class="modal-content">
				<div class="modal-header modal-info">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                     <h3 id="myModalLabel" style="color:black"><fmt:message key="label.loanReturn" /></h3>
                </div>
				<div class="modal-body">
						<table class="table" width="100%">
							 <tbody>
								<tr>
								 <td><b><fmt:message key="label.msisdn" /></b></td>
								 <td id="msisdnv"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.LoanReference" /></b></td>
								 <td id="_lf"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.amountloaned" /></b></td>
								 <td id="_amountloaned"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.paidAmount" /></b></td>
								 <td id="_amountpaid"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.amountstillowed" /></b></td>
								 <td id="_amountstillowed"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.rechargedate" /></b></td>
								 <td id="_rd"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.processeddate" /></b></td>
								 <td id="_pd"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.servicecharge" /></b></td>
								 <td id="_sc"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.SMPP" /></b></td>
								 <td id="_smpp"></td>
								</tr>
								<tr>
								 <td><b><fmt:message key="label.Sercomnotification" /></b></td>
								 <td id="_ser"></td>
								</tr>
							</tbody>
					  </table>
				</div>
				<div class="modal-footer">
				</div>
			</div>
	 </div>
</div>
<!-- ---------------------------------------------------MODALS END------------------------------------------------------->
	</jsp:body>
</t:page>

<script src="/nano/assets/js/jquery.datatables.js"></script>
	<script>
	function GetInfo(_p){

		var ajaxUrl = '<%=request.getContextPath() + "/support/loanreturn?action=_fetchDetails&_p="%>' + _p;

				$.ajax({
					url : ajaxUrl,
					type : "POST",
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						if (data.update == "success") {
						document.getElementById("msisdnv").innerHTML = data.msisdn;
						document.getElementById("_smpp").innerHTML = data.smpp;
						document.getElementById("_lf").innerHTML = data.refno;
						document.getElementById("_amountloaned").innerHTML = data.amountloaned;
						document.getElementById("_amountpaid").innerHTML = data.amountpaid;
						document.getElementById("_amountstillowed").innerHTML = data.amountstillowed;
						document.getElementById("_rd").innerHTML = data.rechargedate;
						document.getElementById("_sc").innerHTML = data.servicecharge;
						document.getElementById("_ser").innerHTML = data.sercomnotif;
						document.getElementById("_pd").innerHTML = data.processdate;

							$('#view').modal('show');
						} else {

							alert(data.update);
						}
					}
				});

			}
	$(document).ready(function() {

    	var ajaxUrl = '<%=request.getContextPath() + "/support/loanreturn?action=_dt"%>';
    	
        $('#datatableloanreturn').DataTable({

        	"ajax": {
        	    "url": ajaxUrl,
        	    "type": "POST",
        	    "dataType" : "json",
        	  },
        	 "paging":true,
            "serverSide": true,
            "searchable" : true,
            "orderable" : false,
            "processing": true,
            "stateSave" : false,
			"jQueryUI" : true,
			
			"columnDefs" : [{
				"targets" : [ "_sn" ],
				"data" : "sn"
			}, {
				"targets" : [ "loanref" ],
				"data" : "refno"
			}, {
				"targets" : [ "_msisdn" ],
				"data" : "msisdn"
			}, {
				"targets" : [ "rechargedate" ],
				"data" : "rechargedate"
			}, /* {
				"targets" : [ "processdate" ],
				"data" : "processdate"
			}, */ {
				"targets" : [ "amountloaned" ],
				"data" : "amountloaned"
			},
			{
				"targets" : [ "servicecharge" ],
				"data" : "sevicecharge"
			},
			{
				"targets" : [ "paidamount" ],
				"data" : "amountpaid"
			},
			{
				"targets" : [ "amountstillowed" ],
				"data" : "amountstillowed"
			},
			{
				"targets" : [ "_action" ],
				"data" : '',
				"orderable": false ,
				"render" : function(data, type, full) {
					var title = document.getElementById("viewmoretitle").innerHTML;
					var	actionDivHtml = '<a onclick="GetInfo(\''+full.pk+'\')"><button type="button" data-placement="top" title="'+title+'" class="btn btn-info btn-xs"><i class="material-icons">keyboard_arrow_down</i></button></a>';
					return actionDivHtml;
				}
			}]

        });

        $('.card .material-datatables label').addClass('form-group');
    });

</script>