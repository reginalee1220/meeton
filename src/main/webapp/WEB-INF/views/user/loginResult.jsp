<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">
    <script>
        alert("등록되지 않은 회원 입니다.");
        history.go(-1);

    </script>
</c:if>

<c:if test="${result == 2}">
    <script>
        alert("회원정보가 틀렸습니다.");
        history.go(-1);
    </script>
</c:if>