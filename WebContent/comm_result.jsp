<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<title>comm_result.jsp</title>
	</head>
	<body>
		등록하는 정보입니다.<br><br>
		<font color="purple">${requestScope.insertComm.comm}</font><br>
		db에서 불러온 정보
		<table border="1" bgcolor="#FF7575" bordercolor="white">
			<c:forEach items="${requestScope.regiComm}" var="regiComm">
				<tr>
					<td>${regiComm.article_number }</td>
					<td>${regiComm.nickname }</td>
					<td>${regiComm.comment_num }</td>
					<td>${regiComm.comm_regi_time }</td>
					<td>${regiComm.comm }</td>
					<td>${regiComm.kakao_key }</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
