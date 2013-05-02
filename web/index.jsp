<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.LoginBean" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>恋爱ing</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        
        <!--<script language="javascript" src="bootstrap/js/bootstrap.js" type="text/javascript"></script>-->
    </head>
    <body>
      
   <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container-fluid">
              <a class="brand" href=".">恋爱ing</a>
              <div class="nav-collapse collapse">
                
                <% 
                            session.removeAttribute("admin_e");
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
                            <a href="admin.jsp">| Admin</a>
                            </p> 
                            <ul class="nav">
                                      <li  class="active"><a href=".">首页</a></li>                 
                                      <li><a href="./About.jsp">关于我们</a></li>
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
      <div class="container-fluid">
          <div class="row-fluid">
              <div class="span3">
                  <div class="well sidebar-nav">
                      <ul class="nav nav-list">
                          <li class="nav-header">点滴幸福</li>
                          <li><a href="./flowers.jsp">鲜花</a></li>
                          <li><a href="#"  title="现在只能点击鲜花哦~">饰品</a></li>
                          <li class="nav-header">惊喜瞬间</li>
                          <li><a href="#" title="现在只能点击鲜花哦~">创意礼品</a></li>
                          <li><a href="#" title="现在只能点击鲜花哦~">自制礼品</a></li>
                          <li class="nav-header">Big趴体</li>
                          <li><a href="#" title="现在只能点击鲜花哦~">生日趴</a></li>
                          <li><a href="#" title="现在只能点击鲜花哦~">聚会趴</a></li>
                          <li><a href="#" title="现在只能点击鲜花哦~">旅游趴</a></li>
                      </ul>
                  </div>
              </div>
              <div class="span9">
                  <div class="hero-unit">            
                   <a href="#"><img src="images/slide-01.jpg"></a>
                            
                </div>           
                        
                  
                  <div class="row-fluid">
                      <div class="span4">
                          <h2>点滴幸福</h2>
                          <p>花</p>
                          <p><a class="btn" href="#">View details »</a></p>
                      </div>
                      <div class="span4">
                          <h2>惊喜瞬间</h2>
                          <p>创意礼品 </p>
                          <p><a class="btn" href="#">View details »</a></p>
                      </div>
                      <div class="span4">
                          <h2>Big趴体</h2>
                          <p>生日趴 </p>
                          <p><a class="btn" href="#">View details »</a></p>
                      </div>
                  </div>
                  <hr width="100%" color="#ADADAD" SIZE=3>
                  </div>
                  
              </div>
              <footer align="center">
                  <copyright:myCopyright/>
              </footer>
               
          </div>
      </div>
      
    </body>
</html>
