<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="usermanagement" value="" />
<c:set var="reportmanager" value="" />
<c:set var="reportjobs" value="" />
<c:set var="schedulemanager" value="" />
<c:set var="rascriteria" value="" />
<c:set var="airtimepoolalert" value="" />
<c:set var="generalsettings" value="" />
<c:set var="settlement" value="" />
<c:set var="thresholdsettings" value="" />
<c:set var="dashboard" value="" />


<c:if test="${sessionScope.menuitem eq 'rascriteria'}">
	<c:set var="rascriteria" value="active" />
</c:if>
<c:if test="${sessionScope.menuitem eq 'usermanagement'}">
	<c:set var="usermanagement" value="active" />
</c:if>
<c:if test="${sessionScope.menuitem eq 'reportmanager'}">
	<c:set var="reportmanager" value="active" />
</c:if>

<c:if test="${sessionScope.menuitem eq 'reportjobs'}">
	<c:set var="reportjobs" value="active" />
</c:if>

<c:if test="${sessionScope.menuitem eq 'schedulemanager'}">
	<c:set var="schedulemanager" value="active" />
</c:if>
<c:if test="${sessionScope.menuitem eq 'airtimepoolalert'}">
	<c:set var="airtimepoolalert" value="active" />
</c:if>
<c:if test="${sessionScope.menuitem eq 'generalsettings'}">
	<c:set var="generalsettings" value="active" />
</c:if>

<c:if test="${sessionScope.menuitem eq 'settlement'}">
	<c:set var="settlement" value="active" />
</c:if>

<c:if test="${sessionScope.menuitem eq 'thresholdsettings'}">
	<c:set var="thresholdsettings" value="active" />
</c:if>
<c:if test="${sessionScope.menuitem eq 'dashboard'}">
	<c:set var="dashboard" value="active" />
</c:if>

<div class="sidebar" data-active-color="rose" data-background-color="black" data-image="/nano/assets/img/sidebar-1.jpg">
    <div class="logo">
        <a href="#" class="simple-text">
            <img src="/nano/assets/img/logo.png" style="width:100px;"/>
        </a>
    </div>
    <div class="sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <img src="/nano/assets/img/faces/avatar.jpg" />
            </div>
        </div>
        <ul class="nav">
        		<li class="${dashboard}">
	                <a href="/nano/dashboard">
                     	<i class="material-icons">dashboard</i>
                    	 <p><fmt:message key="label.dashboard" /></p>
                	</a>  
	            </li>
				<li class="${usermanagement}">
	                <a href="/nano/usermanagement">
                    <i class="material-icons">content_paste</i>
                    <p><fmt:message key="label.usermanagement" /></p>
                </a>  
	            </li>
	          
           <!--  <li class="active">
                <a href="/nano/usermanagement">
                    <i class="material-icons">content_paste</i>
                    <p>User Management</p>
                </a>
            </li> -->
            	<li class="${thresholdsettings} ${rascriteria} ${generalsettings} ${airtimepoolalert} ${settlement}">
	            	 <a data-toggle="collapse" href="#system" title="SYSTEM SETTINGS">
	                    <i class="material-icons">build</i>
	                    <p><fmt:message key="label.systemsettings" />
	                    <b class="caret"></b>
	                    </p>
	                </a>
	                <div class="collapse" id="system">
	                     <ul class="nav">
                        <li class="${rascriteria}">
                            <a href="/nano/systemsettings/ras"><fmt:message key="label.rascriteria" /></a>
                        </li>
                        <li class="${generalsettings}">
                            <a href="/nano/systemsettings/generalsettings"><fmt:message key="label.generalsettings" /></a>
                        </li>
                        <li class="${airtimepoolalert}">
                            <a href="/nano/systemsettings/airtimepoolalert"><fmt:message key="label.airtimepoolalert" /></a>
                        </li>
                        <li class="${thresholdsettings}">
                            <a href="/nano/systemsettings/thresholdsettings"><fmt:message key="label.thresholdsettings" /></a>
                        </li>
                        <li class="${settlement}">
                            <a href="/nano/systemsettings/settlement"><fmt:message key="label.settlement" /></a>
                        </li>
                    </ul>
	                </div>
	            </li>
            <!-- <li class="active">
                <a data-toggle="collapse" href="#system">
                <i class="material-icons">build</i>
                    <p>System Settings
                    <b class="caret"></b></p>
                </a>
                <div class="collapse" id="system">
                    <ul class="nav">
                        <li>
                            <a href="/nano/systemsettings/ras">RAS Criteria</a>
                        </li>
                        <li>
                            <a href="/nano/systemsettings/generalsettings">General Settings</a>
                        </li>
                        <li>
                            <a href="/nano/systemsettings/airtimepoolalert">Airtime Pool Alert</a>
                        </li>
                        <li>
                            <a href="/nano/systemsettings/thresholdsettings">Threshold Settings</a>
                        </li>
                        <li>
                            <a href="/nano/systemsettings/settlement">Settlement</a>
                        </li>
                    </ul>
                </div>
            </li> -->
            <li class="${reportmanager}">
                <a href="/nano/reportmanager">
                    <i class="material-icons">poll</i>
                    <p><fmt:message key="label.reportmanager" /></p>
                </a>
            </li>
            <li class="${schedulemanager}">
                <a href="/nano/schedulemanager">
                    <i class="material-icons">forward_30</i>
                    <p><fmt:message key="label.schedulemanager" /></p>
                </a>
            </li>
            <li class="${reportjobs}">
                <a href="/nano/reportjobs">
                    <i class="material-icons">multiline_chart</i>
                    <p><fmt:message key="label.reportjobs" /></p>
                </a>
            </li>
        </ul>
    </div>
</div>