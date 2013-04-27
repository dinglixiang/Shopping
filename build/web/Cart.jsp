<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ page import="pack.LoginBean" %>
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
                 <% 
                            LoginBean user=(LoginBean)session.getAttribute("user");
                            if(user!=null){
                                %>
                                <p class="navbar-text pull-right">
                                    <span class="label label-important">${user.email}</span> 
                                    <a href="./Exit.jsp" class="navbar-link">退出</a>
                                </p>  
                                    <ul class="nav">
                                      <li><a href=".">首页</a></li>                 
                                      <li  class="active"><a href="./Cart.jsp">我的小车</a></li>
                                      <li><a href="./About.jsp">关于我们</a></li>

                                    </ul>
                                <%
                            }
                            else{
                                response.sendRedirect("Login.jsp");
                            %>
                            <p class="navbar-text pull-right">
                            <a href="./Login.jsp" class="navbar-link">Login in </a>
                            <a href="./Register.jsp" class="navbar-link">   Register</a>
                            </p> 
                            <ul class="nav">
                                      <li  class="active"><a href=".">首页</a></li>                 
                                      <li><a href="./About.jsp">关于我们</a></li>
                             </ul>
                            <%
                            }
                %>
              </div>
            </div>
          </div>
      </div>
  <br><br> <br>
         <div class=container>
         <div class="span9"> 
             
             
              <%
                     ArrayList carts=(ArrayList)session.getAttribute("car");
                     float totalprice=0;
                     String name="";
                     
                     if(carts==null){
                           out.println("<h4 align='center'>Sorry,您还未选购任何产品哦~~</h4>");
                     }
                    else{
                        
                        Iterator iter=carts.iterator();                   
                         while(iter.hasNext())
                         {
                              
                               Product p=(Product)iter.next();
                                name=name.concat(p.getName()+",");
                                 session.setAttribute("order_product_name",name);
                                 String count=(String)session.getAttribute("count"+(p.getId()));
                                 
                                 int cnt=Integer.parseInt(count);
                                %>
                              <div class="row-fluid">
                                  <div class="span12">
                                      <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                                      <div class="span3">
                                          <img class="img-rounded" src="images/molihua.jpg" width="350" height="350"> 
                                      </div>
                                      <div class="span4">

                                            <h4><a href="FlowerDetails.jsp?id=<%= p.getId()%>"><%=p.getName()%></a></h4>
                                            <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                                      </div>
                                      <div class="span3">
                                          <br><br><br>
                                          <div class="input-prepend input-append">
                                              <!--<input type="button" class="btn" value="-">
                                               <input type="text" class="span3" value="" id="count">
                                               <input type="button"  class="btn" value="+"> -->
                                               
                                             <span class="add-on">数量：</span>
                                              <input type="text" class="span3 disabled" readonly value="<%= count%>" name="count">
                                              <span class="add-on">个</span>
                                          </div>                                          
                                      </div>
                                      <div class="span1">
                                          <br>
                                          <br>
                                          <br>
                                           <input class="btn btn-info" value="delete" type="button" onclick="{window.location.href='removeGoods.jsp?id=<%=p.getId()%>'}">
                                      </div>
                                  </div>
                                  
                              </div>
                              <%
                              totalprice+=cnt*(p.getPrice());                             
                          }
                          
                          %>
                            <div class="row-fluid">
                               <hr size="3" color="#ADADAD"> 
                                <div class="pull-right">
                                    <input class="btn btn-danger pull-right" value="确认购买" type="button" onclick="{window.location.href='OrderInfo.jsp'}">                                   
                                </div>
                                <script>
                                   
                                </script>
                              <div class="pull-right">
                                  <h4>总价：<span class="label label-important"><%= totalprice%></span> ￥&nbsp;&nbsp;&nbsp;</h4>
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
