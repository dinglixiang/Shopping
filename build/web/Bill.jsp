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
        <title>订单列表</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="flower.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
        <jsp:useBean id="bill" scope="application" class="pack.BillBean"/>
    </head>
    <body> 
        <div class="container">
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            int flag=flower.StoreBill(id);
            if(flag==1)
            {
                ArrayList flowers=flower.GetFlowerData();
                Iterator iter=flowers.iterator();
                while(iter.hasNext()){
                    Product p=(Product)iter.next();
                    
                    %>
                              
                              <div class="row-fluid">
                                  <div class="span8">
                                      <h3>历史订单产品列表</h3>
                                      <hr width="100%" color=#987cb9 SIZE=3>
                                      <div class="span4">
                                          <img class="img-rounded" src="images/molihua.jpg" width="350" height="350"> 
                                      </div>
                                      <div class="span4">

                                            <h2><%=p.getName()%></h2>
                                            <h6><%=p.getDescribe()%></h6>
                                            <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                                      </div>
                                  </div>
                                  
                              </div>
                             
                              <%
                }
                %>
                    <footer class="copyright" align="center">
                      <copyright:myCopyright/>
                     </footer>
                </div>    
                <%
            }
            else{
                out.println("提交订单失败！");
            }
        %>
    </body>
</html>
