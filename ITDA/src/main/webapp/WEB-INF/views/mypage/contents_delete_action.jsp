<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>MY : 잇다ID</title>
<script>
		var msg = "<c:out value='${msg}'/>";
		alert(msg);
		location.href = "${pageContext.request.contextPath}/my/contents";
</script>
</head>
<body>
</body>
</html>