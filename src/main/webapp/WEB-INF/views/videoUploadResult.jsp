<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result == 1 }">
    <script>
        alert("최대 업로드 용량을 초과했습니다.");
        history.go(-1);
    </script>
</c:if>

<c:if test="${result == 2 }">
    <script>
        alert("첨부가능한 파일이 아닙니다..");
        history.go(-1);
    </script>
</c:if>