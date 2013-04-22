<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>删除购物车商品</title>
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
    </head>
    <body>
        <%
        int id=Integer.parseInt(request.getParameter("id"));
       Product tmp=flower.FindProductById(id);  
       String name=tmp.getName();
       int sales=tmp.getSales();
       String describe=tmp.getDescribe();
       float price=tmp.getPrice();
           
       Product goods=new Product(id,name,price,describe,sales);
        ArrayList products=(ArrayList)session.getAttribute("car");
        
        Iterator iter=products.iterator();
        while(iter.hasNext()){
            Product p=(Product)iter.next();
            
            if(p.getId()==goods.getId()){
                int index=products.indexOf(p);
                products.remove(index);  
                session.setAttribute("car",products); 
                response.sendRedirect("Cart.jsp"); 
                return;
            }
        }
        
        %>
    </body>
</html>
