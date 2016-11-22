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
				console.log("success");
				console.log(data);
				output(data);
			},
			error : function(e) {
				console.log("error");
				console.log(e);
			}
		});
	}
	
	function output(data) {
		$('#result').empty();
		var str = "";
		$.each(data.list, function(index, item) {
			if(item.role_no == '0'){
				var result0 = "selected=selected";
			}else if(item.role_no == '1'){
				var result1 = "selected=selected";
			}else if(item.role_no == '2'){
				var result2 = "selected=selected";
			}else if(item.role_no == '3'){
				var result3 = "selected=selected";
			}else if(item.role_no == '4'){
				var result4 = "selected=selected";
			}else if(item.role_no == '5'){
				var result5 = "selected=selected";
			}
			
			str += "<tr><td align=center><input type=hidden id=user_id"+index+" name=user_id"+index+" value="+item.user_id+">"+item.user_id+"</td>"+
					"<td align=center><select name=role_no"+index+" class=role_no"+index+" id=role_no"+index+" class=cd-select>"+
					"<option value=0 "+ result0 +">manager</option>"+
					"<option value=1 "+ result1 +">boss</option>"+
					"<option value=2 "+ result2 +">dept</option>"+
					"<option value=3 "+ result3 +">team</option>"+
					"<option value=4 "+ result4 +">user</option>"+
					"<option value=5 "+ result5 +">nouser</option>"+
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
			<c:forEach items="${list}" var="alist" varStatus="status">
				<tr>
					<td align="center"><input type="hidden" id="user_id${status.index}" name="user_id${status.index}" value="${alist.user_id}">${alist.user_id}</td>
					<td align="center">
					<select name="role_no${status.index}" class="role_no${status.index}" id="role_no${status.index}" class="cd-select">
							<option value="0" ${alist.role_no == '0' ? 'selected="selected"' : ''}>manager</option>
							<option value="1" ${alist.role_no == '1' ? 'selected="selected"' : ''}>boss</option>
							<option value="2" ${alist.role_no == '2' ? 'selected="selected"' : ''}>dept</option>
							<option value="3" ${alist.role_no == '3' ? 'selected="selected"' : ''}>team</option>
							<option value="4" ${alist.role_no == '4' ? 'selected="selected"' : ''}>user</option>
							<option value="5" ${alist.role_no == '5' ? 'selected="selected"' : ''}>nouser</option>
					</select>
					<input type="submit" class="update_btn" value="수정" onclick="updatebtn(${status.index})"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>