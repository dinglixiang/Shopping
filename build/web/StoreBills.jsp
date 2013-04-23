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
        <title>JSP Page</title>
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
    </head>
    <body>
    <%
            String product_id=(String)session.getAttribute("order_product_id");
            String receiver=request.getParameter("receiver");
            String address=request.getParameter("address");
            String tel=request.getParameter("tel");           
            int flag=flower.StoreBill(product_id,receiver,address,tel);
           // response.sendRedirect("Bill.jsp");
            request.getRequestDispatcher("Bill.jsp").forward(request,response);
     %>
    </body>
</html>
