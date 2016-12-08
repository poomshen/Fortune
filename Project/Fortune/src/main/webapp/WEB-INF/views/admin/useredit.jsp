<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 회원 수정</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
table, th, td {
    border: 1px solid black;
    text-align: center;
}
input.buttonLink {
	background-color: transparent;
	text-decoration: underline;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body style="color:#777">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">[사원 정보 수정]</h1>
		</div>
	</div>
	
	<!-- 부서명 -->
	<div class="col-sm-6" style="padding-left: 0px;">
		<form action="">
			<select id="deptSelect1" name="deptSelect1">
				<option value="-1" selected="selected">부서 선택</option>
				<c:forEach var="i" items="${dept}">
					<option value="${i.dept_no}">${i.dept_name}</option>
				</c:forEach>
			</select> 
			<input type="button" class="btn btn-primary" onclick="deptshowadmin()" value="검색">
		</form>
		
		<div id="deptshowDiv">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>부서명</th>
				</tr>
				<c:forEach var="i" items="${deptlist}">
					<c:if test="${not (i.user_id eq 'admin@fortune.com')}">
						<tr>
							<td><input type="button" value="${i.user_id}" class="buttonLink" onclick="ShowUserInfo('${i.user_id}')"></td>
							<td><c:out value="${i.user_name}"></c:out></td>
							<td><c:out value="${i.user_phone}"></c:out></td>
							<c:if test="${i.dept_no == 0}">
								<td><c:out value="없음"></c:out></td>
							</c:if>
							<c:forEach var="j" items="${dept}">
								<c:choose>
									<c:when test="${i.dept_no == j.dept_no}">
										<td><c:out value="${j.dept_name}"></c:out></td>
									</c:when>
								</c:choose>
							</c:forEach>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="col-sm-6" style="padding-right: 0px;">
		<div class="row" style="padding-right: 0px;">
			<label style="height: 32px; margin-top: 10px;"> &nbsp;&nbsp;&nbsp; 사원 상세 정보</label>
			<form action="">
				<div id="usershowDiv"></div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
//부서명 변경하면 팀명 자동으로 변경
function deptchange() {
	var deptval = $('#deptSelect').val();
	
	$.ajax({
		type:"get",
		url:"getteam.ajax",
		data:{"dept_no":$('#deptSelect').val()},
		success:function(data){
			$("#teamSelect").html("");
			$('#teamSelect').append("<option value=-1 'selected'>선택</option>");
			for(var i=0; i<data.length; i++){
				if(i==0){
					$('#teamSelect').append("<option value='"+data[i].team_no+"' selected>"+data[i].team_name+"</option>");
				}else{
					$('#teamSelect').append("<option value='"+data[i].team_no+"'>"+data[i].team_name+"</option>");
				}
			}
		},
		error:function(){
			swal('팀목록 가져오는데서 에러남!');
		}
	});
}

//부서명 검색 버튼 클릭
function deptshowadmin(){
	$.ajax({
		type:"get",
		url:"deptsearchadmin.ajax",
		data:{"dept_no": $('#deptSelect1').val()},
		success:function(data){
			$("#deptshowDiv").css("overflow-y", "auto");
			$("#deptshowDiv").css("height", "500px");
			$("#deptshowDiv").append($('#deptshowDiv').html(data));
		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		},
		complete:function(){
			$('.wrap-loading').addClass('display-none');
		},
		error:function(){
			swal('회원 목록을 가져오는데 실패했습니다');
		}
	}); 
}

//회원 상제 정보보기 위해서 회원 아이디 클릭 
function ShowUserInfo(userid){
	$.ajax({
		type: "get",
		url : "userinfoadmin.ajax",
		data: {"user_id": userid},
		success:function(data){
			$("#usershowDiv").append($('#usershowDiv').html(data)); 
		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		},
		complete:function(){
			$('.wrap-loading').addClass('display-none');
		},
		error:function(){
			swal('회원 상제 정보 가져오기 실패');
		}
	});
}

//상세정보 보기에서 취소 버튼 클릭
function CancelUpdate(){
	$("#usershowDiv").append($('#usershowDiv').html("")); 
}

//사원 수정
function UserUpdate(){
	if($('#user_name').val() == null || $('#user_name').val() == ""){		
		swal('이름을 작성해주세요.');
		$('#user_name').focus();
		return;
	}else if($('#user_phone').val() == null || $('#user_phone').val() == ""){
		swal('ex)01x-xxxx-xxxx 형식으로 작성해주세요');
		$('#user_phone').focus();
		return;
	}
	
	$.ajax({
		type: "get",
		url : "userupdateadmin.ajax",
		data: {"user_id":$('#user_id').val(),"user_password":$('#user_password').val(),
			"user_name":$('#user_name').val(),"user_gender":$('#user_gender').val(),
			"user_date":$('#user_date').val(),"user_phone":$('#user_phone').val(),
			"user_join":$('#user_join').val(),"dept_no":$('#deptSelect').val(),
			"team_no":$('#teamSelect').val(),"position_no":$('#positionSelect').val(),
			"role_no":$('#roleSelect').val()},
		success:function(data){
			swal('수정 성공');
			deptshowadmin();
			$("#usershowDiv").append($('#usershowDiv').html(data)); 
		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		},
		complete:function(){
			$('.wrap-loading').addClass('display-none');
		},
		error:function(){
			swal('수정 실패');
		}
	});
}

//사원 삭제
function deleteok_id(user_id){
	swal({
		  title: "정말로 탈퇴 하시겠습니까?",
		  text: "탈퇴한 아이디와 데이터는 재사용 및 복구가 불가합니다..",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "네, 탈퇴하겠습니다.",
		  cancelButtonText: "아니요, 계속 사용하겠습니다.",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
		  if (isConfirm) {
		    swal("삭제완료", "그동안 고생하셨습니다!.", "success");
		    location.replace('deleteMemember.htm?user_id='+user_id);
		  } else {
		    swal("삭제취소", "앞으로 열일 바랍니다.^^!", "error");
		  }
	});
}
</script>
</html>