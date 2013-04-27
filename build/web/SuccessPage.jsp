<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successful Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("GBK");
            response.setCharacterEncoding("GBK");
            String message=request.getParameter("message");
        %>
        <a href=".">返回首页</a>
        <%= message%>
    </body>
</html>
