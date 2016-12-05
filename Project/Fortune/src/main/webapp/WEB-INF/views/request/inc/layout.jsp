<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>[효율적인업무 For春]</title>



<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>	
<link href="bower_components/bootstrap/dist/css/bootstrap.min.css"rel="stylesheet">


<!-- MetisMenu CSS -->
<link href="bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
	
<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	


<link rel="stylesheet" href="assets/css/hover.css">	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="aside" />
	<!-- Page Content -->
	<div id="page-wrapper" style="min-height: 644px;margin-left: 150px;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<tiles:insertAttribute name="content" />
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	



 <!-- Bootstrap Core JavaScript -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


<!-- Metis Menu Plugin JavaScript -->
	<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>



<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>
	

	
</body>
</html>