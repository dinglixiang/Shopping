<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ page import="pack.LoginBean" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>恋爱ing</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="flower.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
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
                                    ${user.email}
                                    <a href="./Exit.jsp" class="navbar-link">退出</a>
                                </p>  
                                    <ul class="nav">
                                      <li  class="active"><a href=".">首页</a></li>                 
                                      <li><a href="./Cart.jsp">我的小车</a></li>
                                      <li><a href="./About.jsp">关于我们</a></li>
                                        <li></li>
                                    </ul>
                                    <form class="navbar-search pull-search" action="SearchResult.jsp">                                
                                        <input type="text" class="search-query" name="condition">
                                        <button type="submit" class="btn" >搜索</button>
                                     </form>
                                <%
                            }
                            else{
                            %>
                            <p class="navbar-text pull-right">
                            <a href="./Login.jsp" class="navbar-link">Login in </a>
                            <a href="./Register.jsp" class="navbar-link">   Register</a>
                            </p> 
                            <ul class="nav">
                                      <li  class="active"><a href=".">首页</a></li>                 
                                      <li><a href="./About.jsp">关于我们</a></li>
                                      <li></li>
                             </ul>
                             
                             <form class="navbar-search pull-search" action="SearchResult.jsp">                                
                                        <input type="text" class="search-query" name="condition">
                                        <button type="submit" class="btn" >搜索</button>
                             </form>
                            
                            <%
                            }
                %>
                    </div>
                </div>
            </div>
        </div>
        
        <br><br> <br>
        <div class="container">    
            
            <div class="span12">                     
                <div class="hero-flower">                        
                    <div class="item">
                        以下为您搜索的结果：
                    </div>
                </div> 
            </div>
            
            <div class="span12">     
                <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                <%
                String condition=request.getParameter("condition");
                ArrayList flowers=flower.SearchResult(condition);
                Iterator iter=flowers.iterator();
                while(iter.hasNext()) {
                    Product p=(Product)iter.next();
                %>
                
                <div class="spanf">
                    <img class="img-rounded" src="images/molihua.jpg" width="200" height="200"> 
                    <h5><a href="FlowerDetails.jsp?id=<%= p.getId()%>"><%=p.getName()%></a></h5>
                    <h6>销量：<span class="badge badge-info"><%=p.getSales()%> </span>&nbsp;&nbsp;&nbsp;价格：<%=p.getPrice()%>￥</h6>
                    <%
                        if(user!=null)
                            {
                    %>
                    <input class="btn btn-info" value="加入小车" type="button" onclick="{window.location.href='MyCar.jsp?id=<%=p.getId()%>'}">
                    <%
                        }
                        else{
                         %>
                              <input class="btn btn-info disabled" value="加入小车" type="button">      
                        <%
                        }
                    %>
                </div>                                                              
                
                <%
                }                        
                %>   
                <br>
                <hr size="3" width="100%" color="#ADADAD">
            </div>
            
            <footer class="copyright" align="center"> 
                
                <copyright:myCopyright/>
            </footer>
        </div> 
        </div>
        </div>
        
    </body>
</html>