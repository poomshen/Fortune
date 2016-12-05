<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">

*,:after,:before{box-sizing:border-box}
.pull-left{float:left}
.pull-right{float:right}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}

.accordion-wrap{
    top:0;
    left:0;
    right:0;
    bottom:0;
    padding:15px;
    position:relative;
    width: 280px;
    height: 200px;
    margin-top: 10px;

}
.accordion{
    width:100%;
    margin:auto;
    max-width:280px;
    height: 150px;
    overflow:hidden;
    border-radius:3px;
    background:#f8f8f8;
    box-shadow:0 17px 50px 0 rgba(0,0,0,.19),0 12px 15px 0 rgba(0,0,0,.24);
}
.accordion>a{
    color:#fff;
    padding:15px;
    display:block;
    text-decoration:none;
    transition:all .3s ease-in-out 0s;
    
    padding-bottom: 1px;
    padding-top: 1px;
    
}
.accordion>a:not(:last-child){
    border-bottom:1px solid #fff;
    
    padding-bottom: 1px;
    padding-top: 1px;
    
}
.accordion>a:hover,
.accordion>a.active{

    padding-bottom: 1px;
    padding-top: 1px;

background:#194f89;
    color:#fff;
}
.accordion>a.active{
    color:#fff;
    
    padding-bottom: 1px;
    padding-top: 1px;
    
}
.accordion>a>.alert-numb,
.accordion>.sub-nav>a>.alert-numb{
    color:#eee;
    right:10px;
    height:22px;
    min-width:40px;
    font-size:12px;
    font-weight:600;
    line-height:22px;
    border-radius:15px;
    text-align:center;
    background:#665e51;
}
.accordion>a.active>.alert-numb,
.accordion>.sub-nav>a.active>.alert-numb{
    background:#d0a051;
}
.accordion .sub-nav{
    display:none;
    color:#374046;
    overflow:hidden;
    background:#f8f8f8;
}
.accordion .sub-nav.open{
    display:block;
}
.accordion .sub-nav a{
    display:block;
    color:inherit;
    font-weight:300;
    padding:10px 15px;
    text-decoration:none;
    transition:all .2s ease-in-out 0s;
}
.accordion .sub-nav a:not(:last-child){
    border-bottom:1px solid rgba(0,0,0,.1);
}
.accordion .sub-nav a:hover{
    background:#c2ced1;
    box-shadow:5px 0 0 #8ca3a8 inset;
}

.accordion .html{
    padding:15px;
}
.accordion .about-me{
    text-align:center;
    position:relative;
}
.accordion .about-me h4{
    margin-bottom:0;
}
.accordion .about-me p{
    font-size:14px;
    font-weight:300;
    margin-bottom:0;
}
.accordion .about-me .photo{
    width:50px;
    height:50px;
    margin:auto;
    overflow:hidden;
    border-radius:50%;
    position:relative;
    border:4px solid #fff;
    box-shadow:0 6px 20px 0 rgba(0,0,0,.19),0 8px 17px 0 rgba(0,0,0,.2);
    background-color:#fff;
    margin-left:0px;
    
}
.accordion .about-me .photo .photo-overlay{
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    visibility:hidden;
    position:absolute;
    background:rgba(0,0,0,.4);
}
.accordion .about-me .photo .photo-overlay .plus{
    top:50%;
    left:50%;
    width:30px;
    height:30px;
    color:#1a1a1b;
    cursor:pointer;
    font-size:24px;
    font-weight:100;
    margin-top:-15px;
    margin-left:-15px;
    position:absolute;
    line-height:30px;
    border-radius:50%;
    text-align:center;
    background:#e8d0a9;
    transform:scale(0) rotate(0);
    transition:all .1s ease-in-out 0s;
}
.accordion .about-me .photo:hover .photo-overlay{
    opacity:1;
    visibility:visible;
}
.accordion .about-me .photo:hover .photo-overlay .plus{
    transform:scale(1) rotate(90deg);
}

.accordion .about-me .social-link{
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    padding-top:48px;
    visibility:hidden;
    position:absolute;
    background:rgba(0,0,0,.3);
    transition:opacity .5s ease-in-out 0s;
}
.accordion .about-me .social-link.active{
    opacity:1;
    visibility:visible;
}
.accordion .about-me .social-link .link{
    width:30px;
    padding:0;
    color:#eee;
    height:30px;
    margin:0 4px;
    line-height:28px;
    border-radius:50%;
    display:inline-block;
    transform:translateY(-80px) scale(0);
    border:1px solid rgba(0,0,0,.2);
}
.accordion .about-me .social-link .link-twitter{
    background:#55acce;
}
.accordion .about-me .social-link .link-codepen{
    background:#1a1a1b;
}
.accordion .about-me .social-link .link-facebook{
    background:#3b5998;
}
.accordion .about-me .social-link .link-dribbble{
    background:#ea4c89;
}
.accordion .about-me .social-link .link:hover{
    box-shadow:none;
}
.accordion .about-me .social-link.active .link{
    transform:translateY(0) scale(1);
}
.accordion .about-me .social-link.active .link:nth-child(1){
    transition-duration:.1s;
}
.accordion .about-me .social-link.active .link:nth-child(2){
    transition-duration:.2s;
}
.accordion .about-me .social-link.active .link:nth-child(3){
    transition-duration:.3s;
}
.accordion .about-me .social-link.active .link:nth-child(4){
    transition-duration:.4s;
}
.accordion .about-me .social-link.active .link:nth-child(5){
    transition-duration:5s;
}
.accordion .about-me.blur p,
.accordion .about-me.blur h4,
.accordion .about-me.blur .photo{
    -webkit-filter:blur(2px);
    filter:blur(2px);
}

.accordion .chat .user:not(:last-child){
    margin-bottom:10px;
}
.accordion .chat .user .photo{
    width:40px;
    height:40px;
    font-size:24px;
    line-height:36px;
    text-align:center;
    position:relative;
    border-radius:3px;
    display:inline-block;
    border:1px solid rgba(0,0,0,.2);
}
.accordion .chat .user .photo:before,
.accordion .chat .user .photo:after{
    content:'';
    opacity:0;
    visibility:hidden;
    position:absolute;
    transition:opacity .4s ease-in-out 0s;
}
.accordion .chat .user .photo:before{
    left:50%;
    width:60px;
    bottom:50px;
    padding:4px;
    font-size:12px;
    line-height:14px;
    margin-left:-30px;
    text-align:center;
    background:#333333;
    border-radius:4px;
    word-break:break-all;
    content:attr(data-username);
}
.accordion .chat .user .photo:after{
    left:50%;
    bottom:35px;
    margin-left:-8px;
    border:8px solid transparent;
    border-top:8px solid #333333;
}
.accordion .chat .user .photo:hover:before,
.accordion .chat .user .photo:hover:after{
    opacity:1;
    visibility:visible;
}

.accordion .chat .user.user-dribble .photo{
    color:#fff;
    margin-right:5px;
    background:#f15e95;
}
.accordion .chat .user .text-msg{
    max-width:70%;
    font-size:13px;
    padding:4px 8px;
    background:#fff;
    border-radius:4px;
    display:inline-block;
    border:1px solid #cdd6d8;
}
.accordion .chat .user.user-khadkamhn .text-msg{
    background:#dce2e4;
}

.accordion .invite{
    text-align:center;
}
.accordion .invite .dribbble{
    display:block;
    color:#c33269;
    margin:10px 0;
    font-size:24px;
    font-family:Pacifico;
}
.accordion .invite .btn{
    color:#eee;
    font-weight:500;
    background:#ccc;
    padding:10px 15px;
    border-radius:2px;
    background:#f15e95;
    display:inline-block;
    text-transform:uppercase;
}
.accordion .invite .btn:hover{
    box-shadow:none;
    background:#cb386f;
}

#pageside {
	width: 100%;
	
}

#ajaxside {
	width: 40%;
	float: right;
	margin: 1%;
	
}
</style>


<script type="text/javascript">
$(function(){
    Profile.load();
});

Profile = {
    load:function(){
        this.links();
        this.social();
        this.accordion();
    },
    links:function(){
        $('a[href="#"]').click(function(e){
            e.preventDefault();
        });
    },
    social:function(){
        $('.plus').click(function(){
        	
        	alert( $(this).attr('id'));
        	detailReqCollabo($(this).attr('id'));
            $('#social-link'+$(this).attr('id')).toggleClass('active');
            $('#about-mesocial-link'+$(this).attr('id')).toggleClass('blur');
        });
        $('.social-link').click(function(){
           $(this).toggleClass('active');
            $('#about-me'+$(this).attr('id')).toggleClass('blur');
        });
    },
    accordion:function(){
        var subMenus = $('.accordion .sub-nav').hide();
        $('.accordion > a').each(function(){
            if($(this).hasClass('active')){
                $(this).next().slideDown(100);
            }
        });
        $('.accordion > a').click(function(){
            $this = $(this);
            $target =  $this.next();
            $this.siblings('a').removeAttr('class');
            $this.addClass('active');
            if(!$target.hasClass('active')){
                subMenus.removeClass('active').slideUp(100);
                $target.addClass('active').slideDown(100);
            }
            return false;
        });
    }
}


     //상세 정보를 보여주는 ajax 입니다.
     function detailReqCollabo(a){
		alert(a);
    	 $("#menuView2").empty();
    	 $("#yj").empty();
 	  	
    	 
 	   	 $.ajax({
 	   		 
 	 			type: "get",
 	 			url:  "ProDetail.htm",
 	 			cache: false,				
 	 			data:"collabo_req_index="+a,
 	 		    success:function(data){ //callback  
 	 		    	$("#yj").append("<div>");
 					$("#yj").append($('#yj').html(data)); 
 					$("#yj").append("</div>");
 	 		      
 	 		     },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
 	}
     //대기 수락 거절을 비동기 처리로 사용하였다.
     function selectState(state){
    		console.log(state);
    		$.get("listReplyRequest2.htm", {st :state}, function(data, textStatus, req) {
    			$('#requestlist').html(data);
    		})
    	}

     
     //검색 기능 비동기 처리로 하였습니다.
    	function searchBtn(){
    		console.log()
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{me : $('#memoselect').val(),
 	 				  se:$('#search').val()},
 	 		    success:function(data){ //callback  
 	 		    	console.log($('#search').val());
 	 		    	console.log($('#memoselect').val());
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
     
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    	//페이징 처리를 비동기 처리로 처리 하였습니다. << 버튼으로 처리하였습니다.
    	function pazingBtn(){
    		
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{pg:1,
 	 				  st: "${st_query}",
 	 				  me: "${memo}", 
 	 				  se: "${search}"},
 	 		    success:function(data){ //callback  
 	 		    	console.log('${st_query}');
 	 		    	console.log('${memo}');
 	 		    	console.log('${search}');
 	 		    	
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
    	//페이징 처리를 비동기 처리로 처리 하였습니다. < 버튼으로 처리하였습니다.
function pazingBtn2(){
    		
    		$.ajax({
  	   		 
 	 			type: "get",
 	 			url:  "listReplyRequest2.htm",
 	 			cache: false,				
 	 			data:{pg: "${from_page-1}",
 	 				  st: "${st_query}",
 	 				  me: "${memo}", 
 	 				  se: "${search}"},
 	 		    success:function(data){ //callback  
 	 		    	console.log('${st_query}');
 	 		    	console.log('${memo}');
 	 		    	console.log('${search}');
 	 		    	
 	 		    
 	 		    	
 	 		    	$("#requestlist").html(data); 
 	 		    
 	 		    },
 	 			error: function(){						
 	 				alert('Error while request..'	);
 	 			}
 	 		});
    		
    		
    	}
//페이징 처리를 비동기 처리로 처리 하였습니다. 번호 버튼으로 처리하였습니다.
function pazing3Btn(page){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: page,
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}
//페이징 처리를 비동기 처리로 처리 하였습니다. > 버튼으로 처리하였습니다.
function pazing4Btn(){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: "${to_page+1}",
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}
//페이징 처리를 비동기 처리로 처리 하였습니다. >> 버튼으로 처리하였습니다.
function pazing5Btn(){
	
	$.ajax({
 		 
			type: "get",
			url:  "listReplyRequest2.htm",
			cache: false,				
			data:{pg: "${all_page}",
				  st: "${st_query}",
				  me: "${memo}", 
				  se: "${search}"},
		    success:function(data){ //callback  
		    	console.log('${st_query}');
		    	console.log('${memo}');
		    	console.log('${search}');
		    	
		    
		    	
		    	$("#requestlist").html(data); 
		    
		    },
			error: function(){						
				alert('Error while request..'	);
			}
		});
	
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////
    	
     
     
</script>



<title>Insert title here</title>
</head>
<body>
<div class="container" id="requestlist" style="margin-top:20px">
<div class="tab-container">
  <ul class="nav nav-tabs" style="width:950px">
    <li class="active"><a onclick="selectState('대기')" data-toggle="tab">대기</a></li>
    <li><a onclick="selectState('수락')" data-toggle="tab">수락</a></li>
    <li><a onclick="selectState('거절')" data-toggle="tab">거절</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="home"></div>
    <div class="tab-pane" id="profile"></div>
    <div class="tab-pane" id="messages"></div>
  </div>
</div>
<div class="row grid-columns" style="width:1000px; height:20px; margin-top:2px">
     <div id="gg" style="height:20px;margin-left: 700px;" class="col-md-6 col">
		
				<select id="memoselect">
				<option value="collabo_req_title">제목</option>
				<option value="collabo_req_text">내용</option>
				</select>
		<input type="text" id="search" placeholder="Search" >
		<button onclick="searchBtn()">검색</button>
		
		</div>
		</div>
		<c:forEach items="${list}" var="n" varStatus="status">
	<c:choose>
     	<c:when test="${(status.index)%3 eq 0}">
     	<div class="row grid-columns" style="width:1000px; margin-top:20px">
     <div id="gg" style="height:200px" class="col-md-4 col">
				
				<div class="accordion-wrap">
	   <div class="accordion">
        <a href="#" class="active"><i class="fa fa-user"></i>&nbsp;${n.collabo_req_ID}</a>
        <div class="sub-nav active">
            <div class="html about-me" id="about-mesocial-link${n.collabo_req_index}">
                                <div class="photo" style=
                
                <c:choose>
					<c:when test="${n.collabo_req_state == '수락'}">
               "border:3px solid #1e851f"
                </c:when>
                	<c:when test="${n.collabo_req_state == '거절'}">
								 "border:3px solid #dd2d16"
									</c:when>
									<c:otherwise>
								 "border:3px solid #ddd"
									</c:otherwise>

								</c:choose>
								>
                 <img src="images/언니회색.jpg" style="background:no-repeat center;width:100%; height: 100%">
               
                    <div class="photo-overlay" >
                        <span id="${n.collabo_req_index}" class="plus">+</span>
                    </div>
                  
                    
                    
                </div>
               
              
                <br>
                    제목 : ${n.collabo_req_title}
                작성일:${n.collabo_req_date}
                <div class="social-link" id="social-link${n.collabo_req_index}">
                    <a class="link link-twitter" href="http://twitter.com/khadkamhn/" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a class="link link-codepen" href="http://codepen.io/khadkamhn/" target="_blank"><i class="fa fa-codepen"></i></a>
                    <a class="link link-facebook" href="http://facebook.com/khadkamhn/" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a class="link link-dribbble" href="http://dribbble.com/khadkamhn" target="_blank"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>

    </div>
</div>
				</div>
</c:when>
<c:when test="${(status.index)%3 eq 1}">
      	<div id="gg" style="height:200px" class="col-md-4 col">
				
				<div class="accordion-wrap">
	   <div class="accordion">
        <a href="#" class="active index"><i class="fa fa-user"></i>&nbsp;${n.collabo_req_ID}</a>
        <div class="sub-nav active index">
            <div class="html about-me index plus" id="about-mesocial-link${n.collabo_req_index}">
                <div class="photo" style=
                
                <c:choose>
					<c:when test="${n.collabo_req_state == '수락'}">
               "border:3px solid #1e851f"
                </c:when>
                	<c:when test="${n.collabo_req_state == '거절'}">
								 "border:3px solid #dd2d16"
									</c:when>
									<c:otherwise>
								 "border:3px solid #ddd"
									</c:otherwise>

								</c:choose>
								>
                 <img src="images/언니회색.jpg" style="background:no-repeat center;width:100%; height: 100%">
               
                    <div class="photo-overlay" >
                        <span id="${n.collabo_req_index}" class="plus">+</span>
                    </div>
                </div>
               
                      제목 : ${n.collabo_req_title}
                <br>
                작성일:${n.collabo_req_date}
                <div class="social-link" id="social-link${n.collabo_req_index}">
                    <a class="link link-twitter" href="http://twitter.com/khadkamhn/" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a class="link link-codepen" href="http://codepen.io/khadkamhn/" target="_blank"><i class="fa fa-codepen"></i></a>
                    <a class="link link-facebook" href="http://facebook.com/khadkamhn/" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a class="link link-dribbble" href="http://dribbble.com/khadkamhn" target="_blank"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>
 
    </div>
</div>
				</div>


</c:when>
    	<c:otherwise>
      	<div id="gg" style="height:200px" class="col-md-4 col">
				
				<div class="accordion-wrap">
	   <div class="accordion">
        <a href="#" class="active index"><i class="fa fa-user"></i>&nbsp;${n.collabo_req_ID}</a>
        <div class="sub-nav active index">
            <div class="html about-me index plus" id="about-mesocial-link${n.collabo_req_index}">
                <div class="photo" style=
                
                <c:choose>
					<c:when test="${n.collabo_req_state == '수락'}">
               "border:3px solid #1e851f"
                </c:when>
                	<c:when test="${n.collabo_req_state == '거절'}">
								 "border:3px solid #dd2d16"
									</c:when>
									<c:otherwise>
								 "border:3px solid #ddd"
									</c:otherwise>

								</c:choose>
								>
                 <img src="images/언니회색.jpg" style="background:no-repeat center;width:100%; height: 100%">
               
                    <div class="photo-overlay" >
                        <span id="${n.collabo_req_index}" class="plus">+</span>
                    </div>
                </div>
               
                      제목 : ${n.collabo_req_title}
                <br>
                작성일:${n.collabo_req_date}
                <div class="social-link" id="social-link${n.collabo_req_index}">
                    <a class="link link-twitter" href="http://twitter.com/khadkamhn/" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a class="link link-codepen" href="http://codepen.io/khadkamhn/" target="_blank"><i class="fa fa-codepen"></i></a>
                    <a class="link link-facebook" href="http://facebook.com/khadkamhn/" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a class="link link-dribbble" href="http://dribbble.com/khadkamhn" target="_blank"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>
 
    </div>
</div>
				</div>
		
			</div>
	
    	</c:otherwise>
  		</c:choose>
  		</c:forEach>
  		</div>
  	
		

		  		<div style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg>block}">
							<li><a href="#" onclick="pazingBtn()">««</a></li>
							<li><a href="listReplyRequest.htm?pg=1&st=${st_query}&me=${memo}&se=${search}">««</a></li>
							<li><a href="#" onclick="pazingBtn2()">«</a></li>
							<li><a href="listReplyRequest.htm?pg=${from_page-1}&st=${st_query}&me=${memo}&se=${search}">«</a></li>
						</c:if>
						<c:if test="${pg<=block}">
							<li><a href="#">««</a></li>
							<li><a href="#">«</a></li>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i==pg}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">
								<li><a href="#" onclick="pazing3Btn(${i})">${i}</a></li>
								<li><a href="listReplyRequest.htm?pg=${i}&st=${st_query}&me=${memo}&se=${search}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${to_page<all_page}">
							<li><a href="#" onclick="pazing4Btn()">»</a></li>
							<li><a href="#" onclick="pazing5Btn()">»»</a></li>
							<li><a href="listReplyRequest.htm?pg=${to_page+1}&st=${st_query}&me=${memo}&se=${search}">»</a></li>							
							<li><a href="listReplyRequest.htm?pg=${all_page}&st=${st_query}&me=${memo}&se=${search}">»»</a></li>
						</c:if>
						<c:if test="${to_page>=all_page}">
							<li><a href="#">»</a></li>
							<li><a href="#">»»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		
			
					

				


<%-- 

	<div id="requestlist">
	
	<div class="w3-panel w3-card-4">

		<div class="w3-dropdown-hover w3-left">
				<a onclick="selectState('대기')" class="btn btn-primary">대기</a>
				<a onclick="selectState('수락')" class="btn btn-primary">수락</a>
				<a onclick="selectState('거절')" class="btn btn-primary">거절</a>
		</div>
		
		<div class="w3-dropdown-hover w3-right">
		
		<select id="memoselect">
		<option value="collabo_req_title">제목</option>
		<option value="collabo_req_text">내용</option>
		</select>
		<input type="text" id="search" placeholder="Search" >
		<button onclick="searchBtn()">검색</button>
		</div>

	</div>


<!-- 이곳은  w3-card-4 전체에 잡고 있습니다. CSS  -->
	<div class="w3-panel w3-card-4">
		<div id="ajaxside">
			<div class="panel panel-default"  style="position: fixed;">
				<div class="panel-heading">협업 리스트</div>
				<!-- 검색폼 추가 -->
				<div class="panel-body" id="ReqCollabo"></div>
			</div>
		</div>

<div class="w3-panel w3-card-4" style="float: left;">
		<c:forEach items="${list}" var="n">


			<div id="pageside" class="w3-small">
				<div style="float: left;border: #e1e1e1;border-style: solid;">


					<div class="w3-panel w3-card-4">



						<!-- 요청담당자 쪽 그림 입니다. -->
						<div style="float: left;">

							<div class="w3-card-2" style="margin: 3px" align="center">
								<br> <img style="width:30px"alt="이승훈 사진" src="http://www.y-bridge.co.kr/attach/files/20161031/thumbs/7cb2befbf0dc7adf828094523ebf4270_128_128.jpg" class="img-circle">
								<div class="w3-container w3-center">
									<dl>
										<dt>수신자 </dt>
										<dd>${n.collabo_req_ID}</dd>
									</dl>
								</div>
							</div>

						</div>
						
						
						
						<!-- 중앙 글 입니다. -->

						<div style="float: left;" class="w3-panel w3-card-4">
							<div class="row">


								<dl class="col-sm-4">
									<dd>번호</dd>
									<dd class="collabo_req_index">${n.collabo_req_index}</dd>
								</dl>

								<dl class="col-sm-4">
									<dd>진행상태</dd>
									<dd>${n.collabo_req_state}</dd>
								</dl>

								<dl>

									<dd class="col-sm-12">제목:${n.collabo_req_title}</dd>
								</dl>


								<dl>

									<dd class="col-sm-12">작성일: ${n.collabo_req_date}</dd>
								</dl>

							</div>
							<div class="w3-panel w3-card-2" align="center">
							
							<input type="button" class="btn btn-primary " 
										onclick="detailReqCollabo(${n.collabo_req_index})"
										value="상세보기"></input>
							
								<c:choose>
									<c:when test="${n.collabo_req_state == '수락'}">
										<input type="button" class="btn btn-primary disabled" value="수락완료" readonly="readonly">
									</c:when>
									<c:when test="${n.collabo_req_state == '거절'}"></c:when>
									<c:otherwise>
									<c:if test="${sessionScope.info.user_id == n.user_ID}">
											<security:authorize
												access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERMGR')">
												<a class="btn btn-primary"
													href="proEdit.htm?collabo_req_index=${n.collabo_req_index}">수정</a>
											</security:authorize>
									</c:if>
									</c:otherwise>

								</c:choose>

							</div>

						</div>


						<!-- 수신자 쪽 그림 입니다. -->
						
						
						
						<div style="float: right;">

							<div class="w3-card-2" align="center" style="margin: 3px">
								<br> <img src="images/man2.PNG" alt="Norway"
									style="width: 100px; height: 100px; border-radius: 70%; ">
								<div class="w3-container w3-center">
									<dl>
										<dt>요청수신자 :</dt>
										<dd>${n.collabo_req_ID}</dd>
									</dl>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>


		</c:forEach>
</div>
		
		
		
		</div>
<div class="w3-panel w3-card-4">
		<!-- Pagination 추가 시작 -->
				<div class="container" style="text-align: center; margin-left: -80px;">
					<ul class="pagination">
						<c:if test="${pg>block}">
							<li><a href="#" onclick="pazingBtn()">««</a></li>
							<li><a href="listReplyRequest.htm?pg=1&st=${st_query}&me=${memo}&se=${search}">««</a></li>
							<li><a href="#" onclick="pazingBtn2()">«</a></li>
							<li><a href="listReplyRequest.htm?pg=${from_page-1}&st=${st_query}&me=${memo}&se=${search}">«</a></li>
						</c:if>
						<c:if test="${pg<=block}">
							<li><a href="#">««</a></li>
							<li><a href="#">«</a></li>
						</c:if>
						<c:forEach begin="${from_page}" end="${to_page}" var="i">
							<c:if test="${i==pg}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">
								<li><a href="#" onclick="pazing3Btn(${i})">${i}</a></li>
								<li><a href="listReplyRequest.htm?pg=${i}&st=${st_query}&me=${memo}&se=${search}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${to_page<all_page}">
							<li><a href="#" onclick="pazing4Btn()">»</a></li>
							<li><a href="#" onclick="pazing5Btn()">»»</a></li>
							<li><a href="listReplyRequest.htm?pg=${to_page+1}&st=${st_query}&me=${memo}&se=${search}">»</a></li>							
							<li><a href="listReplyRequest.htm?pg=${all_page}&st=${st_query}&me=${memo}&se=${search}">»»</a></li>
						</c:if>
						<c:if test="${to_page>=all_page}">
							<li><a href="#">»</a></li>
							<li><a href="#">»»</a></li>
						</c:if>
					</ul>
				</div>
				<!-- Pagination 추가 끝 -->
</div>
</div> --%>

</body>
</html>