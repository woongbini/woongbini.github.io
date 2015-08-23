<%-- 사람게시판 등록폼 --%>
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
<title>regi_people.html</title>
<style>

table {
	display: block;
	margin: auto;
	font-family: "Nanum Gothic";
	padding-top: 0.625em;
	padding-bottom: 0.625em;
	padding-left: 5em;
	padding-right: 0.75em;
	border: 1px solid ;
	border-color: rgba(0, 153, 255, 0.6);
	width: 650px;
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
						<td>지역:</td>
						<td>
						<select data-placeholder="지역"  id="city" required>
								<option></option>
								    <option value="가평군">가평군</option>
									  <option value="고양시 덕양구">고양시 덕양구</option>
									  <option value="고양시 일산동구">고양시 일산동구</option>
									  <option value="고양시 일산서구">고양시 일산서구</option>
									  <option value="과천시">과천시</option>
									  <option value="광명시">광명시</option>
									  <option value="광명시">광명시</option>
									  <option value="광주시">광주시</option>
									  <option value="구리시">구리시</option>
									  <option value="군포시">군포시</option>
									  <option value="김포시">김포시</option>
									  <option value="남양주시">남양주시</option>
									  <option value="동두천시">동두천시</option>
									  <option value="부천시 소사구">부천시 소사구</option>
									  <option value="부천시 오정구">부천시 오정구</option>
									  <option value="부천시 원미구">부천시 원미구</option>
									  <option value="부천시">부천시</option>
									  <option value="성남시 분당구">성남시 분당구</option>
									  <option value="성남시 수정구">성남시 수정구</option>
									  <option value="성남시 중원구">성남시 중원구</option>
									  <option value="성남시">성남시</option>
									  <option value="수원시 권선구">수원시 권선구</option>
									  <option value="수원시 영통구">수원시 영통구</option>
									  <option value="수원시 장안구">수원시 장안구</option>
									  <option value="수원시 팔달구">수원시 팔달구</option>
									  <option value="시흥시">시흥시</option>
									  <option value="안산시 단원구">안산시 단원구</option>
									  <option value="안산시 상록구">안산시 상록구</option>
									  <option value="안성시">안성시</option>
									  <option value="안양시 동안구">안양시 동안구</option>
									  <option value="얀양시 만안구">얀양시 만안구</option>
									  <option value="양주시">양주시</option>
									  <option value="양평군">양평군</option>
									  <option value="여주시">여주시 </option>
									  <option value="연천군">연천군</option>
									  <option value="오산시">오산시</option>
									  <option value="용인시 기흥구">용인시 기흥구</option>
									  <option value="용인시 수지구">용인시 수지구</option>
									  <option value="용인시 처인구">용인시 처인구</option>
									  <option value="의왕시">의왕시</option>
									  <option value="의정부시">의정부시</option>
									  <option value="이천시">이천시</option>
									  <option value="파주시">파주시</option>
									  <option value="평택시">평택시</option>
									  <option value="포천시">포천시</option>
									  <option value="하남시">하남시</option>
									  <option value="화성시">화성시</option>

							</select>
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
						<td>나이대:</td>
						<td><input list="age" name="age" required> <datalist id="age">
								<option value='10대'>
								<option value='20대' selected>
								<option value='30대'>
								<option value='40대'>
								<option value='50대'>
								<option value='60대'>
							</datalist></td>
					</tr>
					<tr>
						<td>모집인원수:</td>
						<td><input type="number" name="number" min="1" required></td>
					</tr>
					<tr>
						<td>성별:</td>
						<td><input type="radio" name="gender" value="male">남자

							<input type="radio" name="gender" value="female">여자 <input
							type="radio" name="gender" value="coed">혼성</td>
					</tr>
					<tr>
						<td>장소:</td>
						<td><input type="text" name="location" required> <a
							href="#" onclick="javascript:popupOpen('map.jsp'); return false;">
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-search"></span>지도에서 찾기
								</button>
						</a></td>
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
						<td><textarea name="detail" rows="10" cols="50" data-provide="typeahead" position: relative"></textarea>
						<td>
					</tr>
					<tr>
						<td></td>
						<!-- 등록 취소 순서 바꾸고 취소코드 수정 start -->
						<td>
						<input type="submit" class="btn btn-primary" value="등록" 	style="float: right; margin: 2px"> 
							<input type="hidden" name="command" value="register_people">
								
							
						</td>
						<td>
							<!-- 취소버튼 수정부분-->
							  	<!-- <input type="button" onClick = "history.back()" 
							  	class="btn btn-primary"  style="float: right; margin: 2px"> -->
							  	<a href="main.jsp">
							  <button type="button" class="btn btn-primary" 
							 		style="float: right; margin: 2px"> 취소 </button>
							</a>
							<!-- 등록 취소 순서 바꾸고 취소코드 수정 end -->
							
						</td>
					</tr>
				</table>
			</section>
		</form>
	</div>

	<script type="text/javascript">
		function popupOpen(popUrl) { //팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
		}
	</script>

</body>
</html>