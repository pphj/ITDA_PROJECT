<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>

<h1>Search Results</h1>

<h2>Channels:</h2>
<ul>
  <%-- channelResults 모델 속성에서 채널 결과 데이터 가져오기 --%>
  <c:forEach var="channel" items="${channelResults}">
      <li>${channel.chName}</li> <%-- 원하는 방식으로 채널 정보 표시 --%>
  </c:forEach>
</ul>

<h2>Contents:</h2>
<ul>
  <%-- contentResults 모델 속성에서 컨텐츠 결과 데이터 가져오기 --%>
  <c:forEach var="content" items="${contentResults}">
      <li>${content.boardTitle}</li> <%-- 원하는 방식으로 컨텐츠 정보 표시 --%>
  </c:forEach>
</ul>

</body>
</html>
