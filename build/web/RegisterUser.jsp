<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pack.RegisterBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册用户</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="register" scope="application" class="pack.RegisterBean"/>
        <jsp:setProperty name="register" property="*"/>
    </head>
    <body>
        <% 
            String name=request.getParameter("email");
            String pass=request.getParameter("password");
            String confirm=request.getParameter("confirmpassword");
            if(name==null){
                out.print("<script language=javascript>alert('email为空！');history.go(-1)</script>");
               // response.sendRedirect("Register.jsp");
            }           
            if(pass==null){
                out.print("<script language=javascript>alert('密码为空！');history.go(-1)</script>");
               // response.sendRedirect("Register.jsp");
            }
            if(confirm==null){
                out.print("<script language=javascript>alert('确认密码为空！');history.go(-1)</script>");
               // response.sendRedirect("Register.jsp");
            }
            
            int flag=register.insertRegisterData();
            if(flag==1){                
                 %> 
                <BR> 
                <HR> 
                <font color="#add8e6" size="5"> 
                <%
                 out.println("<div align='center'>");
                 out.println("<h3>注册成功</h3>");

                out.println("<h3>正在进行页面跳转...</h3>");
                out.println("</div>");
                String content=1.5+";URL="+"Login.jsp";
                response.setHeader("REFRESH",content);
            }
            else if(flag==2){
                out.print("<script language=javascript>alert('密码不一致！');history.go(-1)</script>");
            }
            else{
                %>
                   <BR> 
                   <HR> 
                  <font color="#add8e6" size="5"> 
                 <%
                   out.println("<div align='center'>");
                   out.println("<h3>Sorry, 注册失败！</h3>");

                  out.println("<h3>正在返回注册页面...</h3>");
                  out.println("</div>");
                  String content=1.5+";URL="+"Register.jsp";
                  response.setHeader("REFRESH",content);
             }
        %>
       
        
    </body>
</html>
