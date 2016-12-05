<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
						<c:forEach items="${list}" var="n">
							<div class="w3-card-4 responseFrom" id="${n.num}"
								style="width: 98%; ">
							<div id="cardLeft" >
								<header class="w3-container "> 
								번호: ${n.collabo_no} 기간: ${n.collabo_start} ~ ${n.collabo_end}
								<h1>${n.collabo_req_title}</h1>
								<c:choose>
										<c:when test="${n.collabo_sal  == null}">
										</c:when>
										<c:otherwise>
											예상 수익: ${n.collabo_sal}￦
										</c:otherwise>
									</c:choose>
								<br>
								팀장 : ${n.user_ID}
								<br>
								부장 : ${n.collabo_req_ID}
								<h5>${n.collabo_state}
								<security:authorize access="hasAnyRole('ROLE_SUPERMGR')">
								<a data-toggle="modal" data-target="#myModal"  class="btn btn-primary" onclick="ctionQuestion(${n.collabo_no })" >완료</a>
								</security:authorize>
								</h5>
								 </header>
								</div>
								<footer class="w3-container " >
								<div >
								<div class="btnDivs">
									<a href="schedule.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon glyphicon-calendar"></i><br>일정</a>
								</div>
								<div class="btnDivs">
									<a href="mainfile.htm?collabo_no=${n.collabo_no}" class="btn btn-primary">
									<i class="glyphicon  glyphicon-cloud"></i><br>자료실</a>
								</div>
								<br>
								<div class="btnDivs">
									<a  onclick="detailReqCollabo(${n.collabo_req_index})" class="btn btn-primary"> 
									<i class="glyphicon  glyphicon-th-list"></i><br>상세 보기</a>
								</div>
								<div class="btnDivs">
									<a href="historyList.htm?collabo_req_no=${n.collabo_req_no }" class="btn btn-primary"> 
									<i class="glyphicon  glyphicon-th-list"></i><br>히스토리보기</a>
								</div>
								</div> 
								</footer>
							</div>
							<!-- 여기에서 CSS 제공 -->
						</c:forEach>
							<script type="text/javascript">
							$(function(){
								console.log("dd");	
							});
							$("div#lastPostsLoader").html("<div  class='btn btn-primary btn-lg btn-block'><h1style='color: white;'>더 이상 존제하지 않습니다</h1></div>"); 
                                				</script>
							
