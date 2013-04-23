<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>删除产品</title>
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            flower.DeleteProduct(id);
            response.sendRedirect("AdminProducts.jsp");
        %>
    </body>
</html>
