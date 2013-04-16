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
                  <li><a href="./About.jsp">关于我们</a></li>

                </ul>
              </div>
            </div>
          </div>
      </div>
      
      <br><br> <br>
      <div class="container-fluid">
          <div class="row-fluid">
              <div class="span3 site">
                  <div class="well sidebar-nav">
                      <ul class="nav nav-list">
                          <li class="nav-header">点滴幸福</li>
                          <li class="active"><a href="./flowers.jsp">鲜花</a></li>
                          <li><a href="#">饰品</a></li>
                          <li class="nav-header">惊喜瞬间</li>
                          <li><a href="#">创意礼品</a></li>
                          <li><a href="#">自制礼品</a></li>
                          <li class="nav-header">Big趴体</li>
                          <li><a href="#">生日趴</a></li>
                          <li><a href="#">聚会趴</a></li>
                          <li><a href="#">旅游趴</a></li>
                      </ul>
                  </div>
              </div>
                        
                  <div class="span9">                     
                      
                         
                      <%
                        ArrayList flowers=flower.GetFlowerData();
                        Iterator iter=flowers.iterator();
                        while(iter.hasNext())
                        {
                              Product p=(Product)iter.next();
                              %>
                              <div class="row-fluid">
                                  <div class="span8">
                                      <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="80%" color=#987cb9 SIZE=3>
                                      <div class="span3">
                                          <img class="img-rounded" src="images/molihua.jpg" width="350" height="350"> 
                                      </div>
                                      <div class="span4">

                                            <h2><%=p.getName()%></h2>
                                            <h6><%=p.getDescribe()%></h6>
                                            <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                                      </div>
                                      <div class="span1">
                                          <br>
                                          <br>
                                          <input class="btn btn-info" value="Buy" type="button" onclick="{window.location.href='Cart.jsp?id=<%=p.getId()%>'}">
                                      </div>
                                  </div>
                                  
                              </div>
                              <%
                         }                        
                      %>
                      
                      <hr size="3" color="#ADADAD">
                 </div>
        

              <footer class="copyright" align="center">
                  <copyright:myCopyright/>
              </footer>
            </div> 
          </div>
      </div>
      
    </body>
</html>
