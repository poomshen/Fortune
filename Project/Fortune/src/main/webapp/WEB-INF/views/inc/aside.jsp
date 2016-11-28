<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<style>
a {
     color: white;
    text-decoration: none;
}

</style>
<div class="navbar-default sidebar" style="border-color:#444; background-color:#417ca5; width:170px; height:1000px;" role="navigation">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    <li>
                            <a href="noticeList.htm"><i class="fa fa-edit fa-fw"></i>공지 사항</a>
                        </li>
                        <li>
                            <a href="#" ><i class="fa fa-bar-chart-o fa-fw hvr-pop"></i>프로젝트<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                                <li>
                                    <a href="writerequest.htm">협업 요청하기</a>
                                </li>
                            	</security:authorize>
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                               
                                <li>
                               <a href="#"><i class="fa fa-bank"></i></i>협업요청 목록<span class="fa arrow"></span></a>
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
                                    <a href="historyList.htm">모든 히스토리</a>
                                </li>
                                </security:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>일정<span class="fa arrow"></a>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i>관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                                <li>
                                    <a href="authority.htm">전체 권한 부여</a>
                                </li>
                                </security:authorize>
                                <li>
                                    <a href="#">부서장 팀장 선출</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </security:authorize>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>조직도<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="dept.htm">부서</a>
                                </li>
                             <!--    <li>
                                    <a href="#">팀 <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    /.nav-third-level
                                </li> -->
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="mainfile.htm"><i class="fa fa-files-o fa-fw"></i>자료실</a>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>