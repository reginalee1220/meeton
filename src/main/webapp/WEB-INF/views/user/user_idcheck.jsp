<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String id=request.getParameter("userid");
    String pass=request.getParameter("userpw");
    System.out.println("userid="+id);
    System.out.println("passwd="+pass);

    UserDAO userDAO =new UserDAO();

    int re = userDAO.checkUserId(id);
    //1이면 중복 -1이면 사용가능 아이디

    out.println(re);
%>
