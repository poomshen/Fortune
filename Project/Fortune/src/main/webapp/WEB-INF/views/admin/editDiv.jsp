<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
   request.setCharacterEncoding("UTF-8");
%>

<div class="form-group">
	<label for="firstname" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-user"></i></span>아이디
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<input type="text" id="user_id" name="user_id" readonly="readonly" 
			value="${join_DTO.user_id}" class="form-control" id="firstname">
	</div>
</div>

<div class="form-group">
	<label for="lastname" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-lock"></i></span>비밀번호
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<input type="password" style="color: #777" class="form-control"
			value="${join_DTO.user_password}" id="user_password" name="user_password" readonly="readonly">
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-font"></i></span> 이름
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<input type="text" style="color: #777" class="form-control" id="user_name"
			name="user_name" value="${join_DTO.user_name}">
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-user"></i></span>성별
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<span class="field">
			<c:if test="${join_DTO.user_gender == 'male'}">
				<input type="radio" name="user_gender" id="user_gender" value="male" checked="checked">남자
				<input type="radio" name="user_gender" id="user_gender" value="female">여자<br>
			</c:if>
			<c:if test="${join_DTO.user_gender == 'female'}">
				<input type="radio" name="user_gender" id="user_gender" value="male">남자
				<input type="radio" name="user_gender" id="user_gender" value="female" checked="checked">여자<br>
			</c:if>
		</span>
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-calendar"></i></span>생년월일
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">

		<input type="text" style="color: #777" class="form-control" id="user_date"
			name="user_date" value="${join_DTO.user_date}">
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-phone"></i></span>휴대폰 번호
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<input type="text" style="color: #777;" class="form-control"
			id="user_phone" name="user_phone" value="${join_DTO.user_phone}">
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-calendar"></i></span>입사일
	</label>
	<div class="col-md-7" style="margin-bottom: 10px">
		<input type="text" style="color: #777" class="form-control" id="user_join"
			name="user_join" value="${fn:substring(join_DTO.user_join,0,10)}">
	</div>
</div>

<!--부서명 입력-->
<!--select id 변경 : 변경불가 -->
<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-calendar"></i></span>부서명
	</label>
	<div class="col-md-7" style="margin-bottom: 10px; margin-top: 5px;">
		<select class="selectpicker" id="deptSelect" name="dept_no" onchange="deptchange()" style="width: 150px;">
			<c:forEach var="i" items="${deptselect}">
				<c:choose>
					<c:when test="${i.dept_no == join_DTO.dept_no}">
						<option value="${i.dept_no}" selected>${i.dept_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${i.dept_no}">${i.dept_name}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-calendar"></i></span>팀명
	</label>
	<div class="col-md-7" style="margin-bottom: 10px; margin-top: 5px;">
		<select class="selectpicker" id="teamSelect" name="team_no" style="width: 150px;">
			<c:forEach var="j" items="${teamselect}">
				<c:choose>
					<c:when test="${join_DTO.team_no == j.team_no}">
						<option value="${j.team_no}" selected>${j.team_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${j.team_no}">${j.team_name}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;"><i
			class="glyphicon glyphicon-calendar"></i></span>직급명
	</label>
	<div class="col-md-7" style="margin-bottom: 10px; margin-top: 5px;">
		<select class="selectpicker" name="position_no" id="positionSelect" style="width: 150px;">
			<c:forEach var="i" items="${positionselect}">
				<c:choose>
					<c:when test="${i.position_no == join_DTO.position_no}">
						<option value="${i.position_no}" selected>${i.position_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${i.position_no}">${i.position_name}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="emailaddress" class="col-md-5" style="margin-top: 5px;">
		<span class="addon" style="padding-bottom: 0px;">
		<i class="glyphicon glyphicon-calendar"></i></span>권한
	</label>
	<div class="col-md-7" style="margin-bottom: 10px; margin-top: 5px;">
		<select id="roleSelect" name="role_no" style="width: 150px;">
			<c:forEach var="i" items="${roleselect}">
				<c:choose>
					<c:when test="${i.role_no == join_DTO.role_no}">
						<option value="${i.role_no}" selected>${i.role}</option>
					</c:when>
					<c:otherwise>
						<option value="${i.role_no}">${i.role}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
</div>
<div class="form-group">
	<div class="content col-md-12" align="center">
		<input type="button" class="btn btn-primary " onclick="UserUpdate()" value="수정"> 
		<input type="button" class="btn btn-primary" onclick="CancelUpdate()" value="취소">
	</div>
</div>
