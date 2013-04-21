<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>花</title>
        <jsp:useBean id="product" scope="application" class="pack.FlowerBean"/>
    </head>
    <body>
        <%
            String id=request.getParameter("id");
            Product p=product.FindProductById(Integer.parseInt(id));          
        %>
        <div class="container">
            <%= p.getId()%>
            <%= p.getName()%>
            <%= p.getDescribe()%>
            <%= p.getPrice()%>
            <%= p.getSales()%>
            
        </div>
    </body>
</html>
