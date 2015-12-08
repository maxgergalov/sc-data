<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Relation editor</title>
</head>
<body>
<div id="relation-list">
    <div class="header-row">
        <div class="relation-panel-header">Sс идентификатор</div>
        <div class="relation-panel-header">Русский идентификатор</div>
        <div class="relation-panel-header">Английский идентификатор</div>
    </div>
    <c:forEach var="relation" items="${relationList}">
        <div class="relation-row">
            <input class="node-name" type="text" value="${relation.nodeName}" placeholder="Sс идентификатор">
            <input class="rus-name" type="text" value="${relation.rus}" placeholder="Русский идентификатор">
            <input class="eng-name" type="text" value="${relation.eng}" placeholder="Английский идентификатор">
        </div>
    </c:forEach>
</div>
<button id="add-relation">Добавить отношение</button>
<button id="make-file">Создать Scs файл</button>
<script src="<c:url value="/resources/scripts/jquery-2.1.4.min.js" />"></script>
<script src="<c:url value="/resources/scripts/relation-panel.js" />"></script>
</body>
</html>
