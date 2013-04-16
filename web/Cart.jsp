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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="flower.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
        <title>购物车</title>
    </head>
    <body>    
        <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container-fluid">
              <a class="brand" href=".">恋爱ing</a>
              <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                   <a href="./Login.jsp" class="navbar-link">Login in </a>
                   <a href="./Register.jsp" class="navbar-link">   Register</a>
                </p>
                <ul class="nav">
                  <li><a href=".">首页</a></li>
                  <li><a href="./About.jsp">关于我们</a></li>
                  <li  class="active"><a href="./Cart.jsp">我的购物车</a></li>
                </ul>
              </div>
            </div>
          </div>
      </div>
  <br><br> <br>
         <div class=container>
         <div class="span9">                         
              <%
                int id=Integer.parseInt(request.getParameter("id"));
                ArrayList flowers=flower.FindProductById(id);
                Iterator iter=flowers.iterator();
                while(iter.hasNext())
                {
                    Product p=(Product)iter.next();
                      %>
                              <div class="row-fluid">
                                  <div class="span12">
                                      <h3>我的小车</h3>
                                      <hr width="100%" color=#987cb9 SIZE=3>
                                      <div class="span3">
                                          <img class="img-rounded" src="images/molihua.jpg" width="350" height="350"> 
                                      </div>
                                      <div class="span4">
                                            <h2><%=p.getName()%></h2>
                                            <h6><%=p.getDescribe()%></h6>
                                            <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                                      </div>
                                      <div class="span3">
                                          <br><br><br>
                                          <div class="input-prepend input-append">
                                              <span class="add-on">数量：</span>
                                              <input type="text" class="span3" value="1">
                                              <span class="add-on">个</span>
                                            </div>
                                          
                                           </div>
                                          <div class="span1">
                                              <br><br><br>
                                              <input class="btn btn-info" value="确认购买" type="button" onclick="{window.location.href='Bill.jsp?id=<%=p.getId()%>'}">
                                          </div>
                                     
                                  </div>
                                  
                              </div>
                              <%
                         }    
                                                 
                      %>
                      
                      
                      <footer align="center">
                          <hr size="3" color="#ADADAD" width="">
                          <copyright:myCopyright/>
                      </footer>
                 </div>
                 
        </div>
    </body>
</html>
