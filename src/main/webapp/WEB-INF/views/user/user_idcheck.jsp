<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String userid=request.getParameter("userid");
    String passwd=request.getParameter("passwd");
    System.out.println("userid="+userid);
    System.out.println("passwd="+passwd);

    UserDAO userDAO =new UserDAO();

    int re = userDAO.checkUserId(userid);
    //1이면 중복 -1이면 사용가능 아이디

    out.println(re);
%>
