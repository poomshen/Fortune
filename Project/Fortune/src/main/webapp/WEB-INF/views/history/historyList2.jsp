<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<body>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">프로젝트 히스토리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
                    <!-- /.panel -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <c:forEach var="historylist" items="${list}">
                                <c:choose >
                                	<c:when test="${historylist.history_title=='요청'||historylist.history_title=='최초요청'||historylist.history_title=='거절'}">
                                	 <li>
                                	</c:when>
                                	<c:otherwise>
                                	 <li class="timeline-inverted">
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${historylist.history_title=='수락'}">
                                    <div class="timeline-badge success"><i style="margin-top:30%;" class="fa fa-check"></i>
                                    </div>
                                	</c:when>
                                	<c:when test="${historylist.history_title=='거절'}">
                                    <div class="timeline-badge danger"><i style="margin-top:30%;" class="fa fa-times"></i>
                                    </div>
                                	</c:when>
                                	<c:otherwise>
                                    <div class="timeline-badge "><i style="margin-top:30%;" class="fa fa-check"></i>
                                    </div>
                                	</c:otherwise>
                                </c:choose>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">${historylist.history_title}</h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> ${historylist.history_date }</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <h4 class="timeline-title">${historylist.collabo_req_title}</h4>
                                            <p>${historylist.collabo_req_text}</p>
                                        </div>
                                    </div>
                                	</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->

	


</body>

