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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 회원 수정</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>

</head>
<body style="color:#777">
<h3 style="margin-bottom: 40px; margin-top: 30px;">회원정보 수정</h3>
<hr>
	<div class="col-sm-7" style="padding-left: 0px;">
		<label style="height: 32px; margin-top: 10px;"> &nbsp;&nbsp;&nbsp; 일반 / 회의 (선택 미구현)</label>
	</div>
	
	<div class="col-sm-5" style="padding-right: 0px;">
		<div class="row" style="padding-right: 0px;">
			<form action="updateConfirm.htm" method="post">
				<div class="form-group">
					<label for="firstname" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-user"></i></span>아이디
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">
						<input type="text" id="user_id" name="user_id" readonly="readonly"
							value="${sessionScope.info.user_id}" class="form-control"
							id="firstname">
					</div>
				</div>

				<div class="form-group">
					<label for="lastname" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-lock"></i></span>비밀번호
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">
						<input type="password" style="color: #777" class="form-control"
							id="user_password" name="user_password">
					</div>
				</div>

				<div class="form-group">
					<label for="emailaddress" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-font"></i></span> 이름
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">
						<input type="text" class="form-control" id="user_name"
							name="user_name" readonly="readonly"
							value="${sessionScope.info.user_name}">
					</div>
				</div>

				<div class="form-group">
					<label for="emailaddress" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-user"></i></span>성별
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">
						<input type="text" class="form-control" id="user_gender"
							name="user_gender" readonly="readonly"
							value="${sessionScope.info.user_gender}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="emailaddress" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-calendar"></i></span>생년월일
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">

						<input type="text" class="form-control" id="user_date"
							name="user_date" readonly="readonly"
							value="${sessionScope.info.user_date}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="emailaddress" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-phone"></i></span>휴대폰 번호
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">

						<input type="text" style="color: #777;" class="form-control"
							id="user_phone" name="user_phone"
							value="${sessionScope.info.user_phone}">
					</div>
				</div>

				<div class="form-group">
					<label for="emailaddress" class="col-md-3" style="margin-top: 5px;">
						<span class="addon" style="padding-bottom: 0px;"><i
							class="glyphicon glyphicon-calendar"></i></span>입사일
					</label>
					<div class="col-md-9" style="margin-bottom: 10px">
						<input type="text" class="form-control" id="user_join"
							name="user_join"
							value="${fn:substring(sessionScope.info.user_join,0,10)}"
							readonly="readonly">
					</div>
				</div>
				
				<!--부서명 입력-->
				<!--select id 변경 : 변경불가 -->
				<div class="form-group">
					<div class="col-sm-3 col-sm-offset-1" style="margin-left: 10%">
						<section class="main clearfix">
						<div class="fleft">
							<select name="dept_no" id="cd-dropdown" class="cd-select">
								<option value="-1" selected>부서명을 선택하세요</option>
								<c:forEach var="i" items="${dept}">
									<option style="text-align: center" value="${i.dept_no}">${i.dept_name}</option>
								</c:forEach>
							</select>
						</div>
						</section>
					</div>

					<div class="col-sm-3">
						<section class="main clearfix">
						<div class="fleft">
							<select name="team_no" id="cd-dropdown2" class="cd-select">
								<option value="-1" selected>팀을 선택하세요</option>
								<c:forEach var="i" items="${team}">
									<option style="text-align: center" value="${i.team_no}">${i.team_name}</option>
								</c:forEach>

							</select>
						</div>
						</section>
					</div>

					<div class="col-sm-3">
						<section class="main clearfix">
						<div class="fleft">
							<select name="position_no" id="cd-dropdown3" class="cd-select">
								<option value="-1" selected>직급을 선택하세요</option>
								<c:forEach var="i" items="${position}">
									<option style="text-align: center" value="${i.position_no}">${i.position_name}</option>
								</c:forEach>

							</select>
						</div>
						</section>
					</div>
				</div>

				<button type="submit" class="btn hvr-glow" onclick="alert('수정 완료')"
					value="수정완료">수정완료</button>
			</form>
		</div>
	</div>
</body>
</html>