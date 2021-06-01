<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String aka=request.getParameter("aka");
    System.out.println("aka="+aka);

    UserDAO userDAO =new UserDAO();

    int re = userDAO.checkUserAka(aka);
    //1이면 중복 -1이면 사용가능 아이디

    out.println(re);
%>
