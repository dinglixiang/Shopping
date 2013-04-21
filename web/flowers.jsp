<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
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
                        <p class="navbar-text pull-right">
                            <a href="./Login.jsp" class="navbar-link">Login in</a>
                            <a href="./Register.jsp" class="navbar-link">   Register</a>
                        </p>
                        <ul class="nav">
                            <li><a href=".">首页</a></li>                  
                            <li><a href="./Cart.jsp">我的小车</a></li>
                            <li><a href="./Bill.jsp">历史订单</a></li>
                            <li><a href="./About.jsp">关于我们</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <br><br> <br>
        <div class="container">    
            
            <div class="span12">                     
                <div class="hero-flower">                        
                    <div class="item">
                        <marquee>恋爱ing，爱的玫瑰火热传递中……</marquee>
                    </div>
                </div> 
            </div>
            
            <div class="span12">     
                <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                <%
                ArrayList flowers=flower.GetFlowerData();
                Iterator iter=flowers.iterator();
                while(iter.hasNext()) {
                    Product p=(Product)iter.next();
                %>
                
                <div class="spanf">
                    <img class="img-rounded" src="images/molihua.jpg" width="200" height="200"> 
                    
                    <h5><%=p.getName()%></h5>
                    <h6><%=p.getDescribe()%></h6>
                    <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                    
                    <input class="btn btn-info" value="加入小车" type="button" onclick="{window.location.href='MyCar.jsp?id=<%=p.getId()%>&name=<%=p.getName()%>&price=<%=p.getPrice()%>&describe=<%=p.getDescribe()%>&sales=<%=p.getSales()%>'}">
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
