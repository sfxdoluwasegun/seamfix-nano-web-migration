<%@tag description="Default Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8" />
		<link rel="apple-touch-icon" sizes="76x76"
			href="/nano/assets/img/apple-icon.png" />
		<link rel="icon" type="image/ico" href="/nano/assets/img/favicon.ico" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta
			content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
			name='viewport' />
		<meta name="viewport" content="width=device-width" />
		<link href="/nano/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/nano/assets/css/material-dashboard.css" rel="stylesheet" />
		<link href="/nano/assets/css/custom.css" rel="stylesheet" />
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
			rel="stylesheet">
		<link rel="stylesheet" type="text/css"
			href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
		
		<link rel="stylesheet" href="assets/css/c3.css">
        <title><fmt:message key="title.browser" /></title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
	    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400,300' rel='stylesheet' type='text/css'>
	    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link href="/nano/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
	    <link href="/nano/assets/css/material-dashboard.css" rel="stylesheet" />
	    <link href="/nano/assets/css/custom.css" rel="stylesheet" />
	    <link href="/nano/assets/css/c3.css" rel="stylesheet" />
	    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" /> 
	    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" /> 
	    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
	    
	   
	    
    </head>
    <body>
    		<div class="wrapper">
    			<jsp:include page="/include_nav/sidenav.jsp" flush="false" />
    				<div class="main-panel">
    				<jsp:include page="/include_nav/header.jsp" flush="false" />
    					<div class="content">
             				<div class="container-fluid">
                 				<div class="row">
                 				<jsp:doBody/>
                 				</div>
                 			</div>
                 		</div>
                 	<footer>
    				<jsp:include page="/include_nav/footer.jsp" flush="false" />
					<script src="/nano/assets/js/jquery-ui.min.js" type="text/javascript"></script>
					<script src="/nano/assets/js/bootstrap.min.js" type="text/javascript"></script>
					<script src="/nano/assets/js/material.min.js" type="text/javascript"></script>
					<script src="/nano/assets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
					<!-- Forms Validations Plugin -->
					<script src="/nano/assets/js/jquery.validate.min.js"></script>
					<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
					<script src="/nano/assets/js/moment.min.js"></script
					>
					<!--  Charts Plugin -->
					<script src="js/chartist.min.js"></script>
					
					<script src="/nano/assets/js/d3.js"></script>
					
					<script src="/nano/assets/js/c3.js"></script>
					
					<script>
					    var chart = c3.generate({
					        bindto: '.chart',
					        data: {
					            x: 'x',
					            columns: [
					                ['x', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
					                ['2017', 130, 120, 150, 140, 160, 150, 130, 120, 150, 140, 160, 150],
					                ['Top-Ups', 200, 460, 190, 500, 750,400, 630, 190, 600, 300, 900, 200]
					            ]
					        },
					        axis: {
					            x: {
					                type: 'categorized',
					            }
					        },
					
					        colors: {
					            2017: '#ff0000',
					            data2: '#00ff00'
					        }
					    });
					
					</script>
					
					
					<script>
					    $(document).ready(function() {
					        $('#datatables').DataTable({
					            "pagingType": "full_numbers",
					            "lengthMenu": [
					                [10, 25, 50, -1],
					                [10, 25, 50, "All"]
					            ],
					            responsive: true,
					            language: {
					                search: "_INPUT_",
					                searchPlaceholder: "Search records",
					            }
					
					        });
					
					
					        var table = $('#datatables').DataTable();
					
					        // Edit record
					        table.on('click', '.edit', function() {
					            $tr = $(this).closest('tr');
					
					            var data = table.row($tr).data();
					            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
					        });
					
					        // Delete a record
					        table.on('click', '.remove', function(e) {
					            $tr = $(this).closest('tr');
					            table.row($tr).remove().draw();
					            e.preventDefault();
					        });
					
					        //Like record
					        table.on('click', '.like', function() {
					            alert('You clicked on Like button');
					        });
					
					        $('.card .material-datatables label').addClass('form-group');
					    });
					</script>
					
					
					<!--  Plugin for the Wizard -->
					<script src="/nano/assets/js/jquery.bootstrap-wizard.js"></script>
					<!--  Notifications Plugin    -->
					<script src="/nano/assets/js/bootstrap-notify.js"></script>
					<!--   Sharrre Library    -->
					<script src="/nano/assets/js/jquery.sharrre.js"></script>
					<!-- DateTimePicker Plugin -->
					<script src="/nano/assets/js/bootstrap-datetimepicker.js"></script>
					<!-- Vector Map plugin -->
					<script src="/nano/assets/js/jquery-jvectormap.js"></script>
					<!-- Sliders Plugin -->
					<script src="/nano/assets/js/nouislider.min.js"></script>
					<!--  Google Maps Plugin    -->
					<script src="https://maps.googleapis.com/maps/api/js"></script>
					<!-- Select Plugin -->
					<script src="/nano/assets/js/jquery.select-bootstrap.js"></script>
					<!--  DataTables.net Plugin    -->
					<script src="/nano/assets/js/jquery.datatables.js"></script>
					<!-- Sweet Alert 2 plugin -->
					<script src="/nano/assets/js/sweetalert2.js"></script>
					<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
					<script src="/nano/assets/js/jasny-bootstrap.min.js"></script>
					<!--  Full Calendar Plugin    -->
					<script src="/nano/assets/js/fullcalendar.min.js"></script>
					<!-- TagsInput Plugin -->
					<script src="/nano/assets/js/jquery.tagsinput.js"></script>
					<!-- Material Dashboard javascript methods -->
					<script src="/nano/assets/js/material-dashboard.js"></script>
					<!-- Material Dashboard DEMO methods, don't include it in your project! -->
					<script src="/nano/assets/js/custom.js"></script>
					<script type="text/javascript">
					    $(document).ready(function() {
					
					        // Javascript method's body can be found in assets/js/demos.js
					        demo.initDashboardPageCharts();
					
					        demo.initVectorMap();
					    });
					</script>
    			</footer>
    				</div>
    		</div>
	</body>
</html>