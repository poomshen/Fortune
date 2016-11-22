<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="navbar-default sidebar" style="border-color:#444; background-color:#417ca5; width:170px; height:644px;" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#" ><i class="fa fa-bar-chart-o fa-fw hvr-pop"></i>프로젝트<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <li>
                                    <a href="writerequest.htm">프로젝트 생성</a>
                                </li>
                            	</security:authorize>
                            	<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
                                <li>
                                    <a href="requestList.htm">협업요청 리스트</a>
                                </li>
                                </security:authorize>
                                <li>
                                    <a href="responseList.htm">협업 리스트</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="schedule.htm"><i class="fa fa-table fa-fw"></i>일정</a>
                        </li>
                        <li>
                            <a href="noticeList.htm"><i class="fa fa-edit fa-fw"></i>공지 사항</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i>관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="authority.htm">권한 부여</a>
                                </li>
                                <li>
                                    <a href="#">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>조직도<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">부서</a>
                                </li>
                                <li>
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
                                    <!-- /.nav-third-level -->
                                </li>
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