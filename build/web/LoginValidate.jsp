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
            String name=request.getParameter("email");
            String pass=request.getParameter("password");
            if(name==null){
                out.print("<script language=javascript>alert('email为空！');history.go(-1)</script>");
            }           
            if(pass==null){
                out.print("<script language=javascript>alert('password为空！');history.go(-1)</script>");
            }            
            
            boolean flag=login.LoginValidate();
            response.setCharacterEncoding("GBK");
            request.setCharacterEncoding("GBK");
            
             if(flag==true){
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                LoginBean user=new LoginBean();
                user.setEmail(email);
                user.setPassword(password);
                session.setAttribute("user",user);
                 //response.sendRedirect("SuccessPage.jsp?message=Login Successful");
                 response.sendRedirect("index.jsp");
                 }
             else{
                 
                 response.sendRedirect("Login.jsp");
                 }
        %>
    </body>
</html>
