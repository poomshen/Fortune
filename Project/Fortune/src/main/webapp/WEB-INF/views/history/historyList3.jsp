<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">
 <style type="text/css">
	#historytitle{
		float:right;
		
	}
</style>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		function lastPostFunc(){
			console.log("스크롤 끝");
			 $("div#pageListLoader").html("<div  class='btn btn-primary btn-lg btn-block'><h1style='color: white;'>로딩중..</h1></div>");  
			 $.get("historyAllList2.ajax",{collabo_req_no:${req_no} ,page :$(".wrdLatest:last").attr("id")}, function(data, textStatus, req) {
				  if (data != "") {  
				        $(".wrdLatest:last").after(data);             
				        }  
				        $("div#lastPostsLoader").empty();  
			 })
		}
		
	
	
	$(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();  
        }  
	});  
	
	</script>
	<%
	   //치환 변수 선언
	    pageContext.setAttribute("cr", "\r"); //Space
	    pageContext.setAttribute("cn", "\n"); //Enter
	    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	    pageContext.setAttribute("br", "<br/>"); //br 태그
	%> 

<body>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${progectName }</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
                    <!-- /.panel -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i>프로젝트 히스토리
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                               <c:forEach var="historylist" items="${list}">
                                <!-- 타임라인 왼쪽 오른쪽 주기  -->
                                <c:choose >
                                	<c:when test="${historylist.history_title=='요청'||historylist.history_title=='거절'||historylist.history_title=='수정'}">
                                	 <li  class="wrdLatest" id="${historylist.num }">
                                	</c:when>
                                	<c:otherwise>
                                	 <li class="timeline-inverted wrdLatest" id="${historylist.num }">
                                	</c:otherwise>
                                </c:choose>
                                    <!--  글 아이콘 설정 -->
                                <c:choose>
                                	<c:when test="${historylist.history_title=='요청'}">
                                		<div class="timeline-badge "><i style="margin-top:30%;" class="fa fa-edit"></i>
                                    		</div>
                                	</c:when>
                                	<c:when test="${historylist.history_title=='수정'}">
                                		<div class="timeline-badge "><i style="margin-top:30%;" class="fa fa-gears"></i>
                                    		</div>
                                	</c:when>
                                	<c:when test="${historylist.history_title=='수락'}">
                                    <div class="timeline-badge info"><i style="margin-top:30%;" class="fa fa-check-square-o"></i>
                                    </div>
                                	</c:when>
                                	<c:when test="${historylist.history_title=='거절'}">
                                    <div class="timeline-badge danger"><i style="margin-top:30%;" class="fa fa-share-square-o"></i>
                                    </div>
                                	</c:when>
                                	<c:when test="${historylist.history_title=='완료'}">
                                    <div class="timeline-badge success"><i style="margin-top:30%;" class="fa fa-flag"></i>
                                    </div>
                                	</c:when>
                                	<c:otherwise>
                                    <div class="timeline-badge "><i style="margin-top:30%;" class="fa fa-check"></i>
                                    </div>
                                	</c:otherwise>
                                </c:choose>
                                <!-- 글 내용   -->
                                    <div class="timeline-panel">
                                        <div class="timeline-heading" id="historytitle">
                                            <h4 class="timeline-title">${historylist.history_title}</h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i>
                                            ${fn: substring(historylist.history_date,0,16) }</small> 
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <h4 class="timeline-title">${historylist.collabo_req_title}</h4>
                                            <br>
                                             <c:choose>
                                            <c:when test="${ historylist.history_title != '수정'&& historylist.history_title != '거절'}">
                                            <p>${fn:replace(historylist.collabo_req_text, crcn, br)}</p> 
                                            </c:when>
					<c:otherwise>
					  <p>${fn:replace(historylist.history_text, crcn, br)}</p>
					</c:otherwise>                                            
                                            </c:choose>
                                        </div>
                                    </div>
                                	</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div id ="pageListLoader"></div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->

	


</body>

