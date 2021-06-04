<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>테스트</title>
</head>
<body>
<script>

<%--  <%--%>
<%--	response.sendRedirect("main.do");--%>
<%--  %>--%>
<%session.setAttribute("userid","testsignup2");%>
  location.href="memberInfoCheck.do";
</script>

</body>
</html>
