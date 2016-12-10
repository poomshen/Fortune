<!-- 
작성자  : 김지현
최초작업일 : 2016/12/10
최종수정일 : 2016/12/10
작업내용 : 회원의 비밀번호/전화번호를 수정 할 수 있다
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
   String check = (String)request.getAttribute("check");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
   var check = <%=check%>;
   if(check=="1"){
      swal("수정 완료");
   }else if(check=="0"){
      swal("수정 실패");
   }
   </script>

</head>
<body style="color:#777">
<h3 style="
    margin-bottom: 40px;
    margin-top: 30px;
">회원정보 수정</h3>
<hr>
<div class="col-sm-10" style="width: 60%">
  <form  action="updateConfirm.htm" method="post">
   <div class="form-group">
      <label for="firstname" class="col-md-2" style="
    margin-top: 5px;
">
       <span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-user"></i></span>아이디
      </label>
      <div class="col-md-10" style="margin-bottom: 10px">
           <input type="text" id="user_id" name="user_id" readonly="readonly" value="${sessionScope.info.user_id}" class="form-control" id="firstname">
      </div>
 
 
    </div>
    

   <div class="form-group">
      <label for="lastname" class="col-md-2" style="margin-top: 5px;">
         <span class="addon"style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span>비밀번호</label>
        <div class="col-md-10" style="margin-bottom: 10px">
             <input type="password" style="color:#777" class="form-control" id="user_password" name="user_password" >
         </div>
    </div>
    

  
    <div class="form-group">
      <label for="emailaddress" class="col-md-2" style="
    margin-top: 5px;
">
        <span class="addon"style="
    padding-bottom: 0px;
"><i class="glyphicon glyphicon-font"></i></span> 이름
   </label>
           <div class="col-md-10" style="margin-bottom: 10px">
        <input type="text" class="form-control" id="user_name" name="user_name" readonly="readonly" value="${sessionScope.info.user_name}">
     
      </div>
 
 
    </div>
 

<div class="form-group">
   <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
      <span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-user"></i></span>성별
   </label>
   <div class="col-md-10" style="margin-bottom: 10px">
        <input type="text" class="form-control" id="user_gender" name="user_gender" readonly="readonly" value="${sessionScope.info.user_gender}">
     </div>
</div>  
 

  
     <div class="form-group">
      <label for="emailaddress" class="col-md-2" style="
    margin-top: 5px;
">
           <span class="addon"style="
    padding-bottom: 0px;
"><i class="glyphicon glyphicon-calendar"></i></span>생년월일
      </label>
           <div class="col-md-10" style="margin-bottom: 10px">
     
        <input type="text" class="form-control" id="user_date" name="user_date" readonly="readonly" value="${sessionScope.info.user_date}">
     
      </div>
 
 
    </div>
    <div class="form-group">
      <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
      <span class="addon"style="padding-bottom: 0px;"><i class="glyphicon glyphicon-phone"></i></span>휴대폰 번호
    </label>
    <div class="col-md-10" style=" margin-bottom: 10px">
       <input type="text" style="color:#777;" class="form-control" id="user_phone" name="user_phone" value="${sessionScope.info.user_phone}">   
    </div>
 
 
    </div>

      <div class="form-group">
         <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
            <span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-calendar"></i></span>입사일
         </label>
         <div class="col-md-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" id="user_join" name="user_join" value="${fn:substring(sessionScope.info.user_join,0,10)}" readonly="readonly">
         </div>
      </div>
      
      <div class="form-group">
         <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
            <span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-list-alt"></i></span>부서명
         </label>
         <div class="col-md-10" style="margin-bottom: 10px">
            <c:forEach var="i" items="${dept}">
               <c:if test="${sessionScope.info.dept_no == i.dept_no}">
                  <input type="text" class="form-control" id="user_dept" name="user_dept" value="${i.dept_name}" readonly="readonly">
               </c:if>
            </c:forEach>         
         </div>
      </div>
      
      <div class="form-group">
         <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
            <span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-menu-right "></i></span>팀명
         </label>
         <div class="col-md-10" style="margin-bottom: 10px">
            <c:forEach var="i" items="${team}">
               <c:if test="${sessionScope.info.team_no == i.team_no}">
                  <input type="text" class="form-control" id="user_dept" name="user_dept" value="${i.team_name}" readonly="readonly">
               </c:if>
            </c:forEach>
               <c:if test="${sessionScope.info.team_no == 0}">
                  <input type="text" class="form-control" id="user_dept" name="user_dept" value="없음" readonly="readonly">
               </c:if>                           
         </div>
      </div>
      
      <div class="form-group">
         <label for="emailaddress" class="col-md-2" style="margin-top: 5px;">
            <span class="addon" style="padding-bottom: 0px;"><i class="glyphicon glyphicon-menu-right"></i></span>직함명
         </label>
         <div class="col-md-10" style="margin-bottom: 10px">
            <c:forEach var="i" items="${position}">
               <c:if test="${sessionScope.info.position_no == i.position_no}">
                  <input type="text" class="form-control" id="user_dept" name="user_dept" value="${i.position_name}" readonly="readonly">
               </c:if>
            </c:forEach>         
         </div>
      </div>
     
     <!-- 수정 div -->
      <div class="form-group container" style="position: relative; width: 10%; padding-top: 58%">
         <input type="submit" class="btn btn-primary" value="수정완료">
      </div>
    </form>
</div>
</body>
</html>