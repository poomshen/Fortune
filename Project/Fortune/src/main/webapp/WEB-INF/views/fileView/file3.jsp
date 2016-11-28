<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<link rel="shortcut icon" href="../favicon.ico"> 
	<link rel="stylesheet" type="text/css" href="dist/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="dist/fonts/font-awesome-4.2.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="dist/css/icons.css">
	
		
	<script src="dist/js/modernizr.custom.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=request.getContextPath() %>/js/jQuery.MultiFile.min.js"></script>

</head>
<body class="skin-4">
	<form name="multiform" id="multiform" action="uploadfile.ajax" method="POST" enctype="multipart/form-data">
		<label class="btn btn-primary" for="my-file-selector">
    		<input id="my-file-selector" type="file" name="file" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
    		파일 선택
    	</label>
		<span class='label label-info' id="upload-file-info"></span>
		<input type="submit" class="btn btn-primary" id="upload_btn" value="업로드"/>
	</form>

	<form name="deleteform" id="deleteform" action="deletefile.ajax" method="POST">
		<input type="submit" class="btn btn-primary" id="delete_btn" value="삭제"/><br>
	</form>
	
	<form name="searchform" id="searchform" action="searchfile.htm" method="get">
		<select name="selectvalue" id="selectvalue" class="cd-select">
			<option style="text-align:center" value="file_room_name">파일이름</option>
			<option style="text-align:center" value="file_room_date">등록날짜</option>
		</select>
		<input type="text" name="searchvalue">
		<input type="submit" class="btn btn-primary" id="search_btn" value="검색">
	</form>
	<hr>
	<div id="result">
		<div class="container">
			<div id="divrow1" class="content">
			<input type="hidden" id="deletename">
				<c:forEach items="${list}" var="flist" varStatus="status">
				<div class="col-lg-2" style="float: left">
					<div class="thumbnail bootsnipp-thumb">
						<input type="checkbox" name="filename" id="filename" value="${flist.file_room_rename}">
						<a href="downloadfile.htm?filename=${flist.file_room_rename}">${flist.file_room_cutname}</a>
						<div class="drag" style="position: relative;">
							<c:choose>
								<c:when test="${flist.file_room_ext == '.docx'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/docx.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.xlsx'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/xlsx.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.hwp'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/hwp.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.pptx'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/pptx.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.zip'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/zip.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:when test="${flist.file_room_ext == '.jpg' || flist.file_room_ext == '.png' || flist.file_room_ext == '.bmp' || flist.file_room_ext == '.gif'}">
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="upload/${flist.file_room_rename}" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:when>
								<c:otherwise>
									<input type="hidden" id="deletefilename${status.index}" name="deletefilename${status.index}" value="${flist.file_room_rename}"><img class=lazy src="images/file.jpg" onmousedown="indexselect(${status.index})" style="width: 100px; height: 50px">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div id="divrow2" class="row">
			<div class="text-center">
				<c:if test="${pg > block}">
					<ul class="pagination">
						<li><a href="mainfile.htm?pg=1">◀◀</a></li>
						<li><a href="mainfile.htm?pg=${from_page - 1}">◀</a></li>
					</ul>
				</c:if>
				<c:if test="${pg <= block && pg != 1}">
					<ul class="pagination">
						<li><a href="mainfile.htm?pg=1">◀◀</a></li>
						<li><a href="mainfile.htm?pg=${pg - 1}">◀</a></li>
					</ul>
				</c:if>
				<c:forEach begin="${from_page}" end="${to_page}" var="i">
					<ul class="pagination">
						<c:if test="${i == pg}"><li class="active"><a href="#">${i}</a></li></c:if>
						<c:if test="${i != pg}">
							<li><a href="mainfile.htm?pg=${i}">${i}</a></li>
						</c:if>
					</ul>
				</c:forEach>
				<c:if test="${pg < to_page || pg != all_page}">
					<ul class="pagination">
						<li><a href="mainfile.htm?pg=${pg + 1}">▶</a></li>
						<li><a href="mainfile.htm?pg=${all_page}">▶▶</a></li>
					</ul>
				</c:if>
				<c:if test="${to_page > all_page && pg != all_page}">
					<ul class="pagination">
						<li><a href="mainfile.htm?pg=${to_page + 1}">▶</a></li>
						<li><a href="mainfile.htm?pg=${all_page}">▶▶</a></li>
					</ul>
				</c:if>
			</div>
		</div>
		<div id="drop-area" class="drop-area">
			<div class="drop-area__item"><i class="fa fa-fw fa-archive"></i></div>
<!-- 			<div class="drop-area__item"><i class="fa fa-fw fa-star"></i></div>
			<div class="drop-area__item"><i class="fa fa-fw fa-exclamation-triangle"></i></div>
			<div class="drop-area__item"><i class="fa fa-fw fa-envelope"></i></div> -->
			<div class="drop-area__item" id="trash"><i class="fa fa-fw fa-trash"></i></div>
		</div>
		<div class="drop-overlay"></div>
	</div>
		<script src="dist/js/draggabilly.pkgd.min.js"></script>
		<script src="dist/js/dragdrop.js"></script>
		<script>
(function() {
	var body = document.body,
		dropArea = document.getElementById( 'drop-area' ),
		droppableArr = [], dropAreaTimeout;

	// initialize droppables
	[].slice.call( document.querySelectorAll( '#drop-area .drop-area__item' )).forEach( function( el ) {
		droppableArr.push( new Droppable( el, {
			onDrop : function( instance, draggable ) {
				if(instance.el.id == 'trash'){
					var deletefilename = $('#deletename').val();
					
					$.ajax({
						url : 'deletefiles.ajax',
						type : 'post',
						cache : false,
						data : {"deletefilename": deletefilename},
						dataType : "json",
						success : function(data, statusText) {
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

				// show checkmark inside the droppabe element
				classie.add( instance.el, 'drop-feedback' );
				clearTimeout( instance.checkmarkTimeout );
				instance.checkmarkTimeout = setTimeout( function() { 
					classie.remove( instance.el, 'drop-feedback' );
				}, 800 );
				// ...
			}
		} ) );
	} );

	// initialize draggable(s)
	[].slice.call(document.querySelectorAll( '.drag' )).forEach( function( el ) {
		new Draggable( el, droppableArr, {
			draggabilly : { containment: document.body },
			onStart : function() {
				// add class 'drag-active' to body
				classie.add( body, 'drag-active' );
				// clear timeout: dropAreaTimeout (toggle drop area)
				clearTimeout( dropAreaTimeout );
				// show dropArea
				classie.add( dropArea, 'show' );
			},
			onEnd : function( wasDropped ) {
				
				var afterDropFn = function() {
					// hide dropArea
					
					classie.remove( dropArea, 'show' );
					// remove class 'drag-active' from body
					classie.remove( body, 'drag-active' );
					
				};

				if( !wasDropped ) {
					afterDropFn();
				}
				else {
					// after some time hide drop area and remove class 'drag-active' from body
					clearTimeout( dropAreaTimeout );
					dropAreaTimeout = setTimeout( afterDropFn, 400 );
				}
			}
		} );
	} );
})();
	
	$(function() {
		$('#upload_btn').click(function() {
			$('#multiform').ajaxForm({
				cache : false,
				dataType : "json",
				success : function(data, statusText) {
					console.log("success");
					console.log(data);
					output(data);
				},
				error : function(e) {
					console.log("error");
					console.log(e);
				}
			});
		})
		
		$('#delete_btn').click(function() {
			var checkboxValues = [];
			
			$("input[name='filename']:checked").each(function(i) {
				checkboxValues.push($(this).val());
			});
			
			$('#deleteform').ajaxForm({
				cache : false,
				data : {"checkArray": checkboxValues},
				dataType : "json",
				success : function(data, statusText) {
					console.log("success");
					console.log(data);
					output(data);
				},
				error : function(e) {
					console.log("error");
					console.log(e);
				}
			});
		});
	});
	
	function output(data) {
		$('#divrow1').empty();
		$('#divrow2').empty();
		$('#upload-file-info').html("");
		if (data.file && data.file.length != 0) {
			$('#divrow1').append("<input type=hidden id=deletename>");
			$.each(data.file, function(index, item) {
				if(item.file_room_ext == ".docx"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/docx.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else if(item.file_room_ext == ".hwp"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/hwp.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else if(item.file_room_ext == ".xlsx"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/xlsx.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else if(item.file_room_ext == ".pptx"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/pptx.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else if(item.file_room_ext == ".zip"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/zip.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else if(item.file_room_ext == ".jpg" || item.file_room_ext == ".png" || item.file_room_ext == ".bmp" || item.file_room_ext == ".gif"){
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=upload/"+ item.file_room_rename +" onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}else{
					var result = "<input type=hidden id=deletefilename"+index+" name=deletefilename"+index+" value="+item.file_room_rename+">" + "<img class=lazy src=images/file.jpg onmousedown=indexselect("+index+") style=width:100px;height:50px></div></div></div>";
				}
			
				$("#divrow1").append("<div class=col-lg-2 style=float:left>"+
						"<div class='thumbnail bootsnipp-thumb'>"+
						"<input type=checkbox name=filename id=filename value=" + item.file_room_rename + ">" +
						"<a href=downloadfile.htm?filename=" + item.file_room_rename + ">" + item.file_room_cutname + 
						"</a><div class=drag style='position: relative'>" + result);
			});
		}

		
		var result2 = "";
		if(data.pg > data.block){
			result2 += "<ul class=pagination>" + 
			"<li><a href=mainfile.htm?pg=1>◀◀</a></li>" +
			"<li><a href=mainfile.htm?pg="+data.from_page-1+">◀</a></li></ul>";
		}else if(data.pg <= data.block && data.pg != 1){
			result2 += "<ul class=pagination>" + 
			"<li><a href=mainfile.htm?pg=1>◀◀</a></li>" +
			"<li><a href=mainfile.htm?pg="+data.pg-1+">◀</a></li></ul>";
		}
		
		for(var i = data.from_page; i <= data.to_page; i++){
			if(data.pg == i){
				result2 += "<ul class=pagination><li class=active><a href=#>"+i+"</a></li></ul>";
			}else{
				result2 += "<ul class=pagination><li><a href=mainfile.htm?pg="+i+">"+i+"</a></li></ul>";
			}
		}
		
		if(data.pg < data.to_page || data.pg != data.all_page){
			result2 += "<ul class=pagination>" + 
			"<li><a href=mainfile.htm?pg="+(data.pg+1)+">▶</a></li>" +
			"<li><a href=mainfile.htm?pg="+data.all_page+">▶▶</a></li></ul>";
		}else if(data.to_page > data.all_page && data.pg != data.all_page){
			result2 += "<ul class=pagination>" + 
			"<li><a href=mainfile.htm?pg="+(data.to_page+1)+">▶</a></li>" + 
			"<li><a href=mainfile.htm?pg="+data.all_page+">▶▶</a></li></ul>";
		}
		
		$("#divrow2").append("<div class=text-center>" + result2 + "</div>");
	}
	
	function indexselect(index) {
		$('#deletename').val($('#deletefilename'+index).val());
	}
</script>
</body>
</html>