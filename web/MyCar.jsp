<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>

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
       int id=Integer.parseInt(request.getParameter("id"));
       String count=request.getParameter("count");
       session.setAttribute("count"+id,count);
       Product tmp=flower.FindProductById(id);  
       String name=tmp.getName();
       int sales=tmp.getSales();
       String describe=tmp.getDescribe();
       float price=tmp.getPrice();
        
       Product goods=new Product(id,name,price,describe,sales);
       ArrayList bills=null;

              
        if((ArrayList)session.getAttribute("car")==null)  
        {  
            bills = new ArrayList();  
            bills.add(goods);  
            session.setAttribute("car",bills);  
            response.sendRedirect("flowers.jsp");  
        } 
       else 
       {  
            bills=(ArrayList)session.getAttribute("car");
            
            
                Iterator iter=bills.iterator();
                for(int i=0;i<bills.size();i++){
                    Product p1=(Product)bills.get(i);
                    if(p1.getId()==goods.getId())
                    {
                        out.println("<script language=javascript>alert('已购买！');history.go(-1)</script>");
                        return;
                    }
            }
                 bills.add(goods);
                 response.sendRedirect("flowers.jsp");
       }
        
        
        
       
        %>
    </body>
</html>
