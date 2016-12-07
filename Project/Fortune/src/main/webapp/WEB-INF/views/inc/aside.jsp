<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<style>
.sidebar-nav ul a {
     color: white;
    text-decoration: none;
}

</style>
<div class="navbar-default sidebar" style="border-color:#444;background-color:#194f89;height:100%;width: 150px;margin-top: 0px;" role="navigation">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    <li>
                            <a class="hvr-grow-shadow" href="noticeList.htm"><i class="fa fa-edit fa-fw"></i>공지 사항</a>
                        </li>
                            	<security:authorize access="hasAnyRole('ROLE_SUPERMGR','ROLE_ADMI')">
                        <li>
                            <a class="hvr-grow-shadow" href="#" >
                            <i class="fa fa-bar-chart-o fa-fw hvr-pop"></i>프로젝트<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_SUPERMGR')">
                                <li>
                                    <a href="writerequest.htm">요청하기</a>
                                </li>
                                   <li> <a href="listReplyRequest.htm">보낸 요청함</a></li>
                                   <li> <a href="requestList.htm">받은 요청함</a></li>
                                   </security:authorize>
                                   <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                   <li> <a href="listallRequest.htm">요청리스트</a></li>
                                <li>
                                    <a href="historyAllList.htm">모든 히스토리</a>
                                </li>
                                   </security:authorize>
                            	</ul>
                            	</li>
                            	</security:authorize>
                            	<security:authorize access="hasAnyRole('ROLE_MGR','ROLE_USER')">
                                <li>
                                    <a href="responseList_ver1.htm">MY 프로젝트</a>
                                </li>
                                </security:authorize>
                            <!-- /.nav-second-level -->
                       
                        <li>
                            <a class="hvr-grow-shadow" href="#"><i class="fa fa-table fa-fw"></i>일정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <c:forEach var="n" items="${sessionScope.collabo}">
                                <li>
                                 <a href="schedule.htm?collabo_no=${n.collabo_no}"> ${n.collabo_req_title}</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </li>
                        
                        <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <li>
                            <a class="hvr-grow-shadow" href="#"><i class="fa fa-wrench fa-fw"></i>관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                	<li>
                                		<a href="adminusers.htm">관리자 회원 수정</a>
                                    </li>
                                </security:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </security:authorize>
			<li>
                            <a class="hvr-grow-shadow" href="dept.htm"><i class="fa fa-wrench fa-fw"></i>주소록</span></a>
                        </li>
                        <li style="">
                        </li>
                        <li>
                        <a class="hvr-grow-shadow" href="#" style="text-decoration:line-through;"><i class="fa fa-table fa-fw"></i>완료된프로젝트<span class="fa arrow"></span></a>
                          <ul class="nav nav-second-level">
                                <c:forEach var="n" items="${sessionScope.finishCollabo}">
                                <li>
                                 <a href="schedule.htm?collabo_no=${n.collabo_no}"> ${n.collabo_req_title}</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>