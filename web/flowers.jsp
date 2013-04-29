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
       <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/flower.css" rel="stylesheet" type="text/css" />
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
                                   <span class="label label-important">${user.email}</span> 
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
                        <marquee>恋爱ing，爱的玫瑰火热传递中……</marquee>
                    </div>
                </div> 
              
                <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                <%
                ArrayList flowers=flower.GetFlowerData();
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
                            String count="count"+p.getId();
                    %>                     
                     <div class="sapn3">
                              <div class="input-prepend input-append">
                                  <script type="text/javascript">
                                            function minus(id)
                                            {
                                                    var count = document.getElementById(id).value;                                                    
                                                    document.getElementById(id).value = count-1;
                                            }
                                    </script>
                                    <script type="text/javascript">
                                            function plus(id)
                                            {
                                                    var number=document.getElementById(id).value;                                                                                                  
                                                    var cont=parseInt(number)+1;
                                                    document.getElementById(id).value = cont;
                                            }
                                    </script>
                                   <input type="button" class="btn" value="-" onclick="minus(<%=p.getId()%>)">
                                   <input type="text" class="span1"  value="1" id="<%=p.getId() %>">
                                   <input type="button"  class="btn" value="+" onclick="plus(<%=p.getId()%>)">                                     
                                  <input class="btn btn-info" value="加入小车" type="button" onclick="{window.location.href='MyCar.jsp?id=<%=p.getId()%>&count='+document.getElementById(<%=p.getId()%>).value;}">                                
                              </div>                                                          
                              </div>                                                   
                    <%
                        }
                        else{
                        
                         %>     
                         
                         
                         
                           <div class="sapn3">
                              <div class="input-prepend input-append">
                                   <input type="button" class="btn" value="-" onclick="minus()" disabled=true>
                                   <input type="text" class="span1" readonly value="1" id="count">
                                   <input type="button"  class="btn" value="+" onclick="plus()" disabled=true>                                     
                                  <input class="btn btn-info disabled" value="加入小车" type="button">                                
                              </div>                                                          
                              </div>                                 
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
