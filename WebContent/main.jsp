<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();

	if(request.getAttribute("msg") == null){
		response.sendRedirect("mydb?command=get_location");
		return;
	}
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="generator" content="Bootply" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel='stylesheet' 	href="http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css">
	<link rel='stylesheet' 	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
	<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
	<!-- light box start -->
	<link rel="stylesheet" href="css/style_lightbox.css" />
	<script type="text/javascript" src="js/tinybox_lightbox.js"></script>
	<!-- light box end-->
	
	<!-- floating start-->
		<link href="css/page_floating.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="js/jquery_mini_floating.js"></script>
		<script language="javascript" src="js/jquery.dimensions_floating.js"></script>
		<script language="javascript">
			var name = "#floatMenu";
			var menuYloc = null;
			
				$(document).ready(function(){
					menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
					$(window).scroll(function () { 
						offset = menuYloc+$(document).scrollTop()+"px";
						$(name).animate({top:offset},{duration:500,queue:false});
					});
				}); 
			 </script>
	<!-- floating end-->

	<title>main.html</title>
	<style type="text/css">
	.header {
		background: rgba(0, 153, 255, 0.6);
		color: white;
		font-size: 120px;
		font-family: "Nanum Brush Script";
		text-align: center;
		margin-bottom: 15px;
		height: 200px;
		padding: 8px;
	}
	
	body {
		font-family: "Nanum Gothic";
	}
	
	.icon {
		width: 35px;
		height: 35px;
		color: rgba(0, 153, 255, 0.6);
	}
	
	.logo_img {
		height: 150px;
	}
	
	/*floating start*/
	#floatMenu {
		position:absolute;
		top:0px;
		left:-100%;
		right:0%;
		margin-left:250px;
		width:300px;
		}
		#floatMenu ul {
			margin-bottom:20px;
			}
			#floatMenu ul li a {
				display:block;
				border:1px solid #999;
				background-color:#222;
				border-left:6px solid #999;
				text-decoration:none;
				color:#ccc;
				padding:5px 5px 5px 25px;
			}
			#floatMenu ul li a:hover {
				color:#fff;
				background-color:#333333;
			}
			#floatMenu ul.menu1 li a:hover {
				border-color:#09f;
			}
			#floatMenu ul.menu2 li a:hover {
				border-color:#9f0;
			}
			#floatMenu ul.menu3 li a:hover {
				border-color:#f09;
			}
			/*floating end*/
	
</style>
</head>
<body>
	<div class="header">
		<p>
			<img class="logo_img" src="img/checkered12.png"> 이 구역의 체육인은 나야
			<img class="logo_img" src="img/logo.png">
		</p>

	</div>
	<div class="container-fluid">
		<!--left메뉴-->
		<div class="col-sm-2" >
			<!--  운동종목 카테고리 -->
			<div class="row" id="floatMenu">
				<div class="col-md-8">
					<div class="list-group">
						<a href="#" class="list-group-item active"
							style="background: rgba(0, 153, 255, 0.6)">Category</a> <a
							href="#" class="list-group-item"> <abbr title="축구"> <img
								class="icon" src="img/sport-pictos/soccer42.png" alt="Soccer">
								축구
						</abbr>
						</a> <a href="#" class="list-group-item"> <abbr title="야구">
								<img class="icon" src="img/sport-pictos/baseball23.png"
								alt="Baseball"> 야구
						</abbr>
						</a> <a href="#" class="list-group-item"> <abbr title="테니스">
								<img class="icon" src="img/sport-pictos/tennis17.png"
								alt="Tennis"> 테니스
						</abbr>
						</a> <a href="#" class="list-group-item"> <abbr title="농구">
								<img class="icon" src="img/sport-pictos/basketball34.png"
								alt="Basketball"> 농구
						</abbr>
						</a> <a href="#" class="list-group-item"> <span
							class="badge badge-primary">38</span> <abbr title="런닝"> <img
								class="icon" src="img/sport-pictos/sprint.png" alt="Running">
								런닝
						</abbr>
						</a>
					</div>
					<hr>
					<div>
						<h2>사용자정보</h2>
						<div class="col-md-16">
							<div class="thumbnail">
								<img class="img-rounded" src="img/thumbnail-1.jpg">
								<div class="caption text-center">
									<h3>아이디</h3>
									<p>
										간략한 정보<br>(관심지역,관심운동)
									</p>

									<div class="col-md-16">
										<div class="btn-group">
											<button type="button" class="btn btn-primary">
												<i class="glyphicon glyphicon-user"></i>
											</button>
											<button type="button" class="btn btn-primary">
												<i class="glyphicon glyphicon-comment"></i>
											</button>
											<button type="button" class="btn btn-primary">
												<i class="glyphicon glyphicon-cog"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
				</div>

			</div>
		</div>

		<!--/left 메뉴-->

		<!--center 메뉴-->
		<!-- 장소/사람 게시판 탭 -->
			<div class="col-sm-6">
				<div class="row">
					<div class="panel">
						<ul id="myTab1" class="nav nav-tabs nav-justified">
							<li class="active">
								<form name="loc1" action="mydb" method="post">
									<input type="hidden" name="command" value="get_location">
								</form> <a href="#location" data-toggle="tab"  onclick="myfunc('loc1');  ">장소게시판 </a>
							</li>

							<li >
							<form name="loc2" action="mydb" method="post">
									<input type="hidden" name="command" value="get_people">
								</form>
								
								  <a href="#people" data-toggle="tab" onclick="myfunc('loc2');  ">사람게시판</a> 
								 
								 </li>
						</ul>
						
						<div id="myTabContent" class="tab-content">
						<!-- 장소게시판 시작 -->
							<div class="tab-pane fade active in" id="location">
							
								<div class="col-xs-12">
									<c:forEach items="${requestScope.regiLocationData}" var="regiLocationData">
										<h2>${regiLocationData.article_number }.${regiLocationData.title}</h2>
										<p>
											지역 : ${regiLocationData.region}<br> 날짜: ${regiLocationData.regi_date}<br>
										<p class="lead">
											<button type="button" class="btn btn-default"
												data-toggle="collapse"
												data-target="#loc_readMore${regiLocationData.article_number}">더보기</button>
										</p>
										<div id="loc_readMore${regiLocationData.article_number}"
											class="panel-collapse collapse ">
											<div class="panel-body">
												<p>
												
													게시자 : ${regiLocationData.user_id} 상세 정보: ${regiLocationData.detail}
												</p>
											</div>
										</div>
										<div class="panel-group" id="accordion1">
											<div class="panel">
												<div class="panel-heading">
													<ul class="list-inline">
														<p class="pull-right">
															<span class="label label-default">keyword</span> <span
																class="label label-default">tag</span> <span
																class="label label-default">post</span>
														</p>
														<li><a href="#">2 Days Ago</a></li>
														<li><a type="button" data-toggle="collapse"
															data-target="#loc_comment${regiLocationData.article_number}"><i
																class="glyphicon glyphicon-comment"></i> 2 Comments</a></li>
														<li><a href="#"><i
																class="glyphicon glyphicon-share"></i> 14 Shares</a></li>
														<li><a href="#"><i
																class="glyphicon glyphicon-heart"></i> 찜하기</a></li>
													</ul>
												</div>
												<div id="loc_comment${regiLocationData.article_number}" class="panel-collapse collapse ">
													<div class="panel-body">
														<iframe style ="MIN-HEIGHT:200px ;MIN-WIDTH:600px"src="mydb?command=get_comment"  width="600px" height="1000px" frameborder="0" width="relative" height="relative" marginwidth="0" marginheight="0" scrolling="no" >
														</iframe>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 장소게시판 끝 -->
		
						 <!--  사람게시판 시작 -->
							<div id="people" >
							<div class="col-xs-12">
									<c:forEach items="${requestScope.regiPeopleData}" var="regiPeopleData">
										<h2>${regiPeopleData.article_number}.${regiPeopleData.title}</h2>
										<p>
											지역 : ${regiPeopleData.region}<br> 날짜: ${regiPeopleData.regi_date}<br>
										<p class="lead">
											<button type="button" class="btn btn-default"
												data-toggle="collapse"
												data-target="#pp_readMore${regiPeopleData.article_number}">더보기</button>
										</p>
										<div id="pp_readMore${regiPeopleData.article_number}"
											class="panel-collapse collapse ">
											<div class="panel-body">
												<p>
													모집 인원: ${regiPeopleData.number_of_person}<br> 나이대 :
													${regiPeopleData.age}<br> 성별 : ${regiPeopleData.gender}<br>
													게시자 : ${regiPeopleData.user_id}<br> 위치 x좌표:
													${regiPeopleData.location_x}<br> 위치 y좌표:
													${regiPeopleData.location_y}<br> 상세 정보: ${regiPeopleData.detail}
													게시자 : ${regiPeopleData.user_id}<br> 상세 정보: ${regiPeopleData.detail}
												</p>
											</div>
										</div>
										<div class="panel-group" id="accordion1">
											<div class="panel">
												<div class="panel-heading">
													<ul class="list-inline">
														<p class="pull-right">
															<span class="label label-default">keyword</span> <span
																class="label label-default">tag</span> <span
																class="label label-default">post</span>
														</p>
														<li><a href="#">2 Days Ago</a></li>
														<li><a type="button" data-toggle="collapse"
															data-target="#pp_comment${regiPeopleData.article_number}"><i
																class="glyphicon glyphicon-comment"></i> 2 Comments</a></li>
														<li><a href="#"><i
																class="glyphicon glyphicon-share"></i> 14 Shares</a></li>
														<li><a href="#"><i
																class="glyphicon glyphicon-heart"></i> 찜하기</a></li>
													</ul>
												</div>
												<div id="pp_comment${regiPeopleData.article_number}" class="panel-collapse collapse ">
													<div class="panel-body">댓글보여주는 페이지</div>
												</div>
											</div>
										</div>
									</c:forEach> 
								</div>
							</div>
						</div>    
					</div>
				</div>       
				<!--  /사람게시판 -->
	
		
				<!--  하단 버튼(글쓰기) -->
				<div class="col-md-3" style="float: right" id="testclick1">
					<input type="button" class="btn btn-primary btn-block" value="장소 글쓰기"
						style="align: 'right'">
				</div>
				<div class="col-md-3" style="float: right" id="testclick2">
					<input type="button" class="btn btn-primary btn-block" value="사람 글쓰기"
						style="align: 'right'">
				</div>
			</div>




		<!--/center 메뉴-->

		<!--right 메뉴-->
		<div class="col-sm-3">
			<h2>Side</h2>
			<div class="panel panel-default">
				<div class="panel-heading">나의 찜 리스트</div>
				<div class="panel-body">내가 찜한 게시글들</div>
			</div>
			<hr>
			<div class="panel panel-default">
				<div class="panel-heading">알림</div>
				<div class="panel-body">알림은 여기에</div>
			</div>
			<hr>
		</div>
		<!--/right 메뉴-->
		<hr>
	</div>


	<!--/container-fluid-->
	<!-- script references -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/js/bootstrap.min.js"></script>

	<!-- function -->
	<script type="text/javascript">
		
		function myfunc(loc) { //팝업창에 출력될 페이지 URL
			alert(loc);
			if(loc =="loc1"){
			document.loc1.submit();
			}else if(loc=="loc2"){
				document.loc2.submit();
			}
		}
		
	</script>
	
		<!-- light box start-->
		<script type="text/javascript">
		T$('testclick1').onclick = function(){TINY.box.show('regi_location.jsp',1,700,600,1)}
		T$('testclick2').onclick = function(){TINY.box.show('regi_people.jsp',1,700,600,1)}
		
		var content2 = "<img src='images/rhino.jpg' width='298' height='373' alt='' />";
		T$('testclick3').onclick = function(){TINY.box.show(content2,0,0,0,1)}
		
		var content3 = "This will disappear in 3 seconds.";
		T$('testclick4').onclick = function(){TINY.box.show(content3,0,0,0,0,3)}
		</script>
		<!-- light box end -->
	
</body>
</html>