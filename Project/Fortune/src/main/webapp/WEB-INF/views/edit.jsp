<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>

</head>
<body style="color:#777">


<h3 style="
    margin-bottom: 40px;
    margin-top: 30px;
">회원정보 수정</h3>
<hr>

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
      <label for="lastname" class="col-md-2" style="
    margin-top: 5px;
">
     <span class="addon"style=" padding-bottom: 0px;"><i class="glyphicon glyphicon-lock"></i></span>비밀번호
      </label>
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
 <label for="emailaddress" class="col-md-2" style="
    margin-top: 5px;
">
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
      <label for="emailaddress" class="col-md-2" style="
    margin-top: 5px;
">
      <span class="addon"style="
    padding-bottom: 0px;
"><i class="glyphicon glyphicon-phone"></i></span>휴대폰 번호
    </label>
           <div class="col-md-10" style=" margin-bottom: 10px">
     
        <input type="text" style="color:#777;" class="form-control" id="user_phone" name="user_phone" value="${sessionScope.info.user_phone}">
     
      </div>
 
 
    </div>
    
       <div class="form-group">
      <label for="emailaddress" class="col-md-2" style="
    margin-top: 5px;
">
      <span class="addon"style="
    padding-bottom: 0px;
"><i class="glyphicon glyphicon-calendar"></i></span>입사일
   </label>
           <div class="col-md-10" style="margin-bottom: 10px">
        <input type="text" class="form-control" id="user_join" name="user_join" value="${fn:substring(sessionScope.info.user_join,0,10)}" readonly="readonly">
     
      </div>
 
 
    </div>
 
 	<button type="submit" class="btn hvr-glow" onclick="alert('수정 완료')" value="수정완료">수정완료</button>
    </form>



    <script src="js/jquery.js"></script>
 

  <script src="js/bootstrap.min.js"></script>
   
</body>
</html>