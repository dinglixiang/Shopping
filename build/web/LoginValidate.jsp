<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.LoginBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录验证</title>
        <jsp:useBean id="login" scope="application" class="pack.LoginBean"/>
        <jsp:setProperty name="login" property="*"/>
    </head>
    <body>
        <%
            boolean flag=login.LoginValidate();
             if(flag=true)
                 out.println("Successful");
             else
                 out.println("Unsuccessful");
        %>
    </body>
</html>
