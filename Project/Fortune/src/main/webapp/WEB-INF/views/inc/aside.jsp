<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<style>
ul a {
     color: white;
    text-decoration: none;
}

</style>
<div class="navbar-default sidebar" style="border-color:#444; background-color:#194f89;  height:100%;" role="navigation">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    <li>
                            <a class="hvr-grow-shadow" href="noticeList.htm"><i class="fa fa-edit fa-fw"></i>공지 사항</a>
                        </li>
                        <li>
                            <a class="hvr-grow-shadow" href="#" ><i class="fa fa-bar-chart-o fa-fw hvr-pop"></i>프로젝트<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                                <li>
                                    <a href="writerequest.htm">협업 요청하기</a>
                                </li>
                            	</security:authorize>
                            	</ul>
                            	</li>
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                               
                                <li>
                               <a href="#"><i class="fa fa-bank"></i>협업요청 목록<span class="fa arrow"></span></a>

                               <ul class="nav nav-second-level">
                                   <li> <a href="listReplyRequest.htm">보낸요청 리스트</a></li>
                                   <li> <a href="requestList.htm">받은요청 리스트</a></li>
                                   <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                   <li> <a href="listallRequest.htm">전체 리스트</a></li>
                                   </security:authorize>
                                </ul>
                                </li>
                                </security:authorize>
                                <li>
                                    <a href="responseList.htm">협업 리스트</a>
                                </li>
                                <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <li>
                                    <a href="historyAllList.htm">모든 히스토리</a>
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
                        
                        <security:authorize access="hasAnyRole('ROLE_SUPERMGR','ROLE_ADMIN')">
                        <li>
                            <a class="hvr-grow-shadow" href="#"><i class="fa fa-wrench fa-fw"></i>관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                                	<li>
                                		<a href="adminusers.htm">관리자 회원 수정</a>
                                    </li>
                                </security:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </security:authorize>
						<li>
                            <a class="hvr-grow-shadow" href="dept.htm"><i class="fa fa-wrench fa-fw"></i>주소록<span class="fa arrow"></span></a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>