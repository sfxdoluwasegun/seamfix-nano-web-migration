<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:page>
	<jsp:body>
	<div>
        	<form id ="myForm" class="form-horizontal" method="POST" action="/nano/support/subscriberassessment">
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
				<h5 class="card-title"><b><fmt:message key="label.RforNano" /></b><fmt:message key="label.subscriberassessment" /></h5>
				<div class="clearfix"></div>
				<div class="card-content">
					<p id="viewmoretitle" style="display:none;"><fmt:message key="label.viewmore" /></p>
					<table id="datatableassessment" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
					    <thead>
						    <tr>
						    	<th class="_sn"><fmt:message key="label.sn" /></th>
						        <th class="_msisdn"><fmt:message key="label.msisdn" /></th>
						        <th class="_date"><fmt:message key="label.lastassessmentdate" /></th>
						        <th class="_nooftopup"><fmt:message key="label.nooftopup30" /></th>
						        <th class="_amounttoppedup"><fmt:message key="label.amounttoppedup30" /></th>
						        <th class="_ageinnetwork"><fmt:message key="label.ageinnetwork" /></th>
						        <th class="_eligibilitystatus"><fmt:message key="label.eligibilitystatus" /></th>
						        <th class="_eligibleamount"><fmt:message key="label.eligibleamount" /></th>
						    </tr>
					    </thead>
					</table>
			</div>
		</div>
	</jsp:body>
</t:page>

<script src="/nano/assets/js/jquery.datatables.js"></script>
	<script>
	$(document).ready(function() {

    	var ajaxUrl = '<%=request.getContextPath() + "/support/subscriberassessment?action=_dt"%>';
    	
        $('#datatableassessment').DataTable({

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
				"targets" : [ "_date" ],
				"data" : "lastdate"
			}, {
				"targets" : [ "_msisdn" ],
				"data" : "msisdn"
			}, {
				"targets" : [ "_nooftopup" ],
				"data" : "nooftopup"
			}, {
				"targets" : [ "_amounttoppedup" ],
				"data" : "amounttoppedup"
			}, {
				"targets" : [ "_ageinnetwork" ],
				"data" : "ageinnetwork"
			},
			{
				"targets" : [ "_eligibleamount" ],
				"data" : "eligibleamount"
			},
			{
				"targets" : [ "_eligibilitystatus" ],
				"data" : "",
				"render": function(data, type, full){
					var statusResult = "";
					if(full.status ==true){
						statusResult = "Eligible"
						}
					else{
						statusResult = "Not Eligible"
						}
					return statusResult;
				}
			}]

        });

        $('.card .material-datatables label').addClass('form-group');
    });

</script>
