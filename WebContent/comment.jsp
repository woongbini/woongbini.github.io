<%-- 장소게시판 등록폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'	href="http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css">
<link rel='stylesheet'	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link	 rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<link rel="stylesheet" href="css/site.min.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>comment.jsp</title>
<style>

table {
	display: block;
	margin: auto;
	font-family: "Nanum Gothic";
	padding-top: 0.625em;
	padding-bottom: 0.9em;
	padding-left: 2em;
	padding-right: 0.75em;
	border: 1px solid ;
	border-color: rgba(0, 153, 255, 0.6);
	width: 600px;
	vertical-align: center;
	border-spacing: 2px;
}
.regi_form{
 	font-family: Nanum Gothic;

}
</style>
</head>
<body>
				<!-- <input type="hidden" name="command" value="get_comment">	 -->		
	
	<div class="regi_form">
	
		<form action="mydb" method="post">
				
			<section> 
			
					<table >
					<c:forEach items="${requestScope.commData}" var="commData">
					
						<tr>
						 	<td>
								<a class="pull-left" href="#">
									<img class="media-object img-rounded" src = "img/thumbnail-1.jpg" style="height:50px; width:50px">
								</a>
							</td>
							<td>
								<p>닉넹 : ${commData.nickname} <br> 등록시간 : ${commData.comm_regi_time}</p>
							</td>
						</tr>
						<tr>		
								<td colspan="2"><p style="font-size:20px">댓글 : ${commData.comm}</p></td>
						</tr>		
							
						</c:forEach>
					
						<tr>
							<td>
								댓글:
							</td>
							<td>
								<input type="text" name="comm" style="width: 400px" placeholder="제목을 입력해주세요" required autofocus>
								
								
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" class="btn btn-primary" value="등록" style="float: right; margin: 2px"> 
								<input type="hidden" name="command" value="register_comment">
								
							</td>
							<td>
								<a href="commnet.jsp">
								<button type="button" class="btn btn-primary" style="float: right; margin: 2px">취소</button>
								</a>
							</td>
						</tr>
						
						

					</table>
			</section>
		</form>
	</div>

	<script type="text/javascript">
		function popupOpen(popUrl) { //팝업창에 출력될 페이지 URLinfo 	
			var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "main.html", popOption);
		}
	</script>
	
</body>
</html>