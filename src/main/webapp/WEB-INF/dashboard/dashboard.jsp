<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:page>
	<jsp:body>
	<div>
        	<form id ="myForm" class="form-horizontal" method="POST" action="/nano/dashboard">
	            <select id="language" name="language" onchange="submit()">
	                <option  ${language == 'en' ? 'selected' : ''} value="en">English</option>
	                <option  ${language == 'fr' ? 'selected' : ''} value="fr">French</option>
	                <option  ${language == 'zh' ? 'selected' : ''} value="zh">China</option>
	            </select>
	            <input name="action" value="changeLanguge" type="hidden">
	        </form>
        </div>
		<div id="header-includes"></div>
            <div class="content">
				<div class="container-fluid jus">
				    <div class="row">
						<div class = "dropdown">
    					<button class="btn  btn-round btn-success dropdown-toggle" style =  "float:left;" type="button" data-toggle="dropdown">Loan Request Period
    					<span class="caret"></span></button>
    					<ul class="dropdown-menu">
 							 <li><a href="#">Today</a></li>
 							 <li><a href="#">Last 7 Days</a></li>
 							 <li><a href="#">Last 30 Days</a></li>
 							  <li class="divider"></li>
 							 <li onclick="showDatePeriod()"><a href="#">Custom</a></li>
						</ul>
				    </div>
				    <form id="eventForm" method="post" class="form-horizontal"  style="display: none">
						      		<div class="input-daterange input-group" style = "float: right;" id ="customDate">
									    <input type="date" class="input-lg form-control" style = "background-color : white;"/>
									    <span class="input-group-addon"><b>to</b></span>
									    <input type="date" class="input-lg form-control"  style = "background-color : white;"/>
									    <button style="background-color: #26c6da;  float: left;" type="button" class="btn btn-default btn-round btn-sm" >Submit</button>
									</div>
				    </form>
				    </div>
				       <div class="col-lg-3 col-md-6 col-sm-6">
				            <div class="card card-stats equal">
				                <div class="card-header" data-background-color="blue">Granted Loan Requests</div>
				                <div class="card-content">
				                    <h3 class="card-title"><b>300/500</b></h3> </div>
				                <div class="card-footer">
				                    <div class="stats"> <i class="material-icons ">local_offer</i>
				                    <form action="/nano/dashboard">
				                    <button class="btn btn-info btn-sm">View Requests</button>
									</form>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <div class="col-lg-3 col-md-6 col-sm-6">
				            <div class="card card-stats equal">
				                <div class="card-header" data-background-color="blue"> Total Loans Granted</div>
				                <div class="card-content">
				                
				                    <h3 class="card-title">₦<b>35,000</b></h3></div>
				                <div class="card-footer">
				                    <div class="stats"> <i class="material-icons ">local_offer</i></div><br>Loans granted
				                </div>
				            </div>
				        </div>
				        <div class="col-lg-3 col-md-6 col-sm-6">
				            <div class="card card-stats equal">
				                <div class="card-header" data-background-color="blue"> Total Returns</div>
				                <div class="card-content">
				                    <h3 class="card-title"> ₦<b>400</b></h3> </div>
				                <div class="card-footer">
				         		<div class="stats"> <i class="material-icons ">local_offer</i></div><br>Returns from granted loans.
				                </div>
				            </div>
				        </div>
				        <div class="col-lg-3 col-md-6 col-sm-6">
				            <div class="card card-stats equal">
				                <div class="card-header" data-background-color="blue"> Airtime Pool Balance</div>
				                <div class="card-content">
				                    <h3 class="card-title">₦<b>40,000</b></h3></div>
				                <div class="card-footer">
				                    <div class="stats"> <i class="material-icons ">local_offer</i>
				                    <form action="/nano/dashboard">
    									<button class="btn btn-info btn-sm">Top Up Pool</button>
									</form>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				    <div class="col-lg-6 col-md-6 col-sm-6">
				   		 <div class="card card-stats equall">
						            <div class="card-header card-header-text"
											data-background-color="green">
						                	Successful vs Failed Loan Requests
							            	</div>
							            	<div class="card-content">
							            	<p>Click failed requests to drill down</p>
							               			<div class="loanReqChart"></div>
						           			</div>	
						           			
						</div>		      
  			  		</div>
  			   <div class="col-lg-6 col-md-6 col-sm-12">
				    <div class="card card-stats equall">
						            <div class="card-header card-header-text"
											data-background-color="green">
						                	Request Count By Denomination	
							            	</div>
							            	<div class="card-content">							            	
							               			<div class="reqCountByDenominationChart"></div>
						      				</div>		
					</div>		      
  			  </div>
	     </div>
	    <div>
    											<!-- <div class="form-group">
    											<div class="form-group">
       											 	<div class="col-xs-5 date" >
            											<div id="embeddingDatePicker" ></div>
            											<label class="col-xs-5 control-label" style = "display: none" ><b>Start Date</b></label>
            											<input type="date" id="datePicker" name="selectedDate" style = "display: none" /> <br>
            											<label class="col-xs-5 control-label" style = "display: none" ><b>End Date</b></label>
            											<input type="date" id="datePicker" name="selectedDate" style = "display: none" />
        											</div>
    											</div> -->
    											
										
	     </div>
	</jsp:body>
</t:page>

<script type="text/javascript">
	
var lanReqChart = c3.generate({
	 bindto: '.loanReqChart',
    data: {
        // iris data from R
        columns: [
            ['Failed Loan Request', 78],
            ['Successful Loan Request', 22],
        ],
        type : 'pie',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); },
        colors: {
        	'Successful Loan Request': '#008000',
        	'Failed Loan Request': '#ff0000',
        },
    }
});

setTimeout(function () {
    chart.load({
        columns: [
            ["Successful Loan Request", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
            ["Failed Loan Request", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
        ]
    });
}, 1500);

setTimeout(function () {
    chart.unload({
        ids: 'data1'
    });
    chart.unload({
        ids: 'data2'
    });
}, 2500);

var reqCountByDenominationChart = c3.generate({
	 bindto: '.reqCountByDenominationChart',
   data: {
       // iris data from R
       columns: [
           ['₦50', 10],
           ['₦100', 30],
           ['₦200', 15],
           ['₦500', 10],
           ['₦1000', 5],
           ['₦2000', 25],
           ['₦2600', 5],
       ],
       type : 'pie',
       onclick: function (d, i) { console.log("onclick", d, i); },
       onmouseover: function (d, i) { console.log("onmouseover", d, i); },
       onmouseout: function (d, i) { console.log("onmouseout", d, i); },
       colors: {
       	'₦50': 	'#000080',
       	'₦100': '#F08080',
    	'₦200': '#008080',
    	'₦500': '#008000',
    	'₦1000': '#9BD5E0',
    	'₦2000': '#003B6F',
    	'₦2600': '#D1854B',
       },
   }
});

setTimeout(function () {
   chart.load({
       columns: [
				["₦50", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
				["₦100", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
				["₦200", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
				["₦500", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
				["₦1000", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
				["₦2000", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
				["₦2600", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
      ]
   });
}, 1500);

setTimeout(function () {
   chart.unload({
       ids: 'data1'
   });
   chart.unload({
       ids: 'data2'
   });
}, 2500);
</script>
<script>
    $(document).ready(function() {
        var heights = $(".equall").map(function() {
            return $(this).height();
        }).get(),

        maxHeight = Math.max.apply(null, heights);

        $(".equall").height(maxHeight);
    });
</script>
<script>
    $(document).ready(function() {
        var heights = $(".equal").map(function() {
            return $(this).height();
        }).get(),

        maxHeight = Math.max.apply(null, heights);

        $(".equal").height(maxHeight);
    });
</script>
<script>
function showDatePeriod(){
	
	$('#eventForm').show();
}
</script>
<script>
function standardPeriod(p) {
	var CurrentDate = new Date();
	CurrentDate.setMonth(CurrentDate.getMonth() + p);
	
	var day = CurrentDate.getDate();
	var month = CurrentDate.getMonth()+1;
	var year = CurrentDate.getFullYear();
	
	if (month < 10)
		month = "0" + month;
	if (day < 10)
		day = "0" + day;
	
	var today = day + "/" + month + "/" + year;
	
	return today;
}
/*  jQuery ready function. Specify a function to execute when the DOM is fully loaded.  */
$(document).ready(
/* This is the function that will get executed after the DOM is fully loaded */
function () {
$('#initialdate').val(standardPeriod(-6));
$('#lastdate').val(standardPeriod(6));
}
);
</script>
