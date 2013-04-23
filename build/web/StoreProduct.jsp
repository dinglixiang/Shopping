<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>保存产品信息</title>
         <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
    </head>
    <body>
        <%
        request.setCharacterEncoding("GBK");
        response.setCharacterEncoding("GBK");
        String name=request.getParameter("name");
        float price=Float.parseFloat(request.getParameter("price"));
        int sales=0;
        String describe=request.getParameter("describe");
        int flag=flower.StoreProduct(name,price,describe,sales);
        response.sendRedirect("flowers.jsp");
        %>
    </body>
</html>
