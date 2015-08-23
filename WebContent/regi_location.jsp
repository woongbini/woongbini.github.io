<%-- 장소게시판 등록폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>regi_location.html</title>
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
	<div class="regi_form">
		<form action="mydb" method="post">
			<section>
				<table>
					<tr>
						<td>제목:</td>
						<td><input type="text" name="title" 
							style="width: 400px"
							placeholder="제목을 입력해주세요" required autofocus></td>
					</tr>
					<tr>
						<td>경기장이 필요한 지역:</td>
						<td><input list="city" name="city" required> 
						<datalist id="city">
								<option value="부천시">
								<option value="고양시">
							</datalist> 
					</tr>
					<tr>
						<td>날짜:</td>
						<td><input type="date" name="date" min="2015-08-16" required></td>
					</tr>
					<tr>
						<td>시간:</td>
						<td><input type="time" name="time" required></td>
					</tr>
					<tr>
						<td>종목:</td>
						<td><input type="text" name="sport" disabled="disabled" value ="종목코드" required></td>
					</tr>
					
					
					<tr>
						<td>참여선수</td>
						<td><a href="#"
							onclick="javascript:popupOpen('member.html'); return false;">
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-search"></span>찾기
								</button>
						</a></td>
					</tr>
					<tr>
						<td>추가 내용</td>
						<td><textarea name="detail" rows="10" cols="50" data-provide="typeahead" position="relative"></textarea>
						<td>
					</tr>
					<tr>
						<td></td>
						
						<td>
							<input type="submit" class="btn btn-primary" value="등록" 	style="float: right; margin: 2px"> 
							<input type="hidden" name="command" value="register_location">
							
						</td>
						<td>
							<a href="main.jsp">
							<button type="button" class="btn btn-primary" style="float: right; margin: 2px">취소</button>
							</a> 
							
						</td>
					</tr>
				</table>
			</section>
		</form>
	</div>

	<script type="text/javascript">
		function popupOpen(popUrl) { //팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "main.html", popOption);
		}
	</script>

</body>
</html>