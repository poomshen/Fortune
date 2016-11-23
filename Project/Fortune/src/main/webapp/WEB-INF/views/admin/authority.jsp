<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>권한 부여</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

	function updatebtn(index){
		//console.log($('#role_no2').val());
		console.log($("#user_id"+index).val());
		console.log($("#role_no"+index).val());
		$.ajax({
			url : 'updateauthority.ajax',
			type : 'get',
			data : {"user_id" : $('#user_id'+index).val(), "role_no" : $('#role_no'+index).val()},
			success : function(data) {
				alert(data.msg);
				console.log("success");
				console.log(data);
				output(data);
			},
			error : function(e) {
				alert(data.msg);
				console.log("error");
				console.log(e);
			}
		});
	}
	
	function output(data) {
		$('#result').empty();
		var str = "";
		
		$.each(data.authorityList, function(index, aitem) {
			var opt = "";
			$.each(data.roleList, function(index, ritem) {
				var result = "";
				if(aitem.role_no == ritem.role_no){
					result = " selected=selected";
				}
				opt += "<option value="+ritem.role_no+result+">"+ritem.role+"</option>";
			});
			
			str += "<tr><td align=center><input type=hidden id=user_id"+index+" name=user_id"+index+" value="+aitem.user_id+">"+aitem.user_id+"</td>"+
					"<td align=center><select name=role_no"+index+" class=role_no"+index+" id=role_no"+index+" class=cd-select>"+opt+
					"</select><input type=submit class=update_btn value=수정 onclick=updatebtn("+index+")></td></tr>";
		});
		
		$('#result').append("<table width=500 cellpadding=0 cellspacing=0 border=1>"+
		"<tr><th align=center>회원 아이디</th><th align=center>권한</th></tr>"+str+"</table>");
	}
</script>
</head>
<body>
	<div id="result">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th align="center">회원 아이디</th>
				<th align="center">권한</th>
			</tr>
			<c:forEach items="${authorityList}" var="alist" varStatus="status">
				<tr>
					<td align="center"><input type="hidden" id="user_id${status.index}" name="user_id${status.index}" value="${alist.user_id}">${alist.user_id}</td>
					<td align="center">
					<select name="role_no${status.index}" class="role_no${status.index}" id="role_no${status.index}" class="cd-select">
						<c:forEach items="${roleList}" var="rlist">
							<option value="${rlist.role_no}" ${alist.role_no == rlist.role_no ? 'selected="selected"' : ''}>${rlist.role}</option>
						</c:forEach>
					</select>
					<input type="submit" class="update_btn" value="수정" onclick="updatebtn(${status.index})"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>