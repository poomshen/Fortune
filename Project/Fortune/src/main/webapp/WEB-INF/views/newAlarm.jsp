<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
     <a class="dropdown-toggle" style="color:#417ca5;;" data-toggle="dropdown" href="#">
                       <i class="fa fa-bell fa-fw hvr-pop">
                       <span id="blink"  
                       	<c:if test="${sessionScope.alarm.size()>0}"> class="blink_me notification_count" </c:if> > 
                       	<c:if test="${sessionScope.totalCount>0}"> ${sessionScope.totalCount}</c:if></span></i>  
                       	<i class="fa fa-caret-down"></i>
                    </a>
          
                  <c:if test="${sessionScope.alarm.size()>0}">
              
                   <ul id="alarmList" class="dropdown-menu dropdown-alerts">
                   	   <c:forEach var="alarm" items="${sessionScope.alarm}"> 
                  		
                        <li id="${alarm.work_type}">
                       
                            <a href="#">
                                <div> 
                                
                   <c:choose>
                   <c:when test="${alarm.work_type==1}">
                    	<i class="fa fa-file-o fa-fw"></i>	새 프로젝트 요청 
                   </c:when>                 
                   <c:when test="${alarm.work_type==2}">
                  	     <i class="fa fa-file-text-o fa-fw"></i>  기존 프로젝트 요청
                   </c:when>               
                   <c:when test="${alarm.work_type==3}">
                      <i class="fa fa-file-word-o fa-fw"></i>	새로운 업무 요청
                   </c:when>                 
                   <c:when test="${alarm.work_type==4}">
                   		 <i class="fa fa-comment-o fa-fw"></i>	새로운 댓글 
                   </c:when>                
                      </c:choose>
                                    <span class="pull-right text-muted small" 
                                    style="padding: 3px 7px 3px 7px;background: #cc0000;color: #ffffff;font-weight: bold;border-radius: 9px;">
 										${alarm.count}</span>
                                </div>
                         
                         
                            </a>
                      
                        </li>
                        
                            <li class="divider"></li>
                            
             			</c:forEach>	
             			

                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    
               
                    </ul>
                    
                  
                    </c:if>
           