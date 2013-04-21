<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>恋爱ing</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
                  <li  class="active"><a href=".">首页</a></li>                 
                  <li><a href="./Cart.jsp">我的小车</a></li>
                  <li><a href="./Bill.jsp">历史订单</a></li>
                  <li><a href="./About.jsp">关于我们</a></li>
                  <li><a href="./NewProduct.jsp">新建产品</a></li>
                </ul>
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
                  <div class="hero-unit">
                      <div id="myCarousel" class="carousel slide">
                          <div class="carousel-inner">
                            <div class="item active">
                              <img src="images/slide-01.jpg" alt="">                           
                            </div>
                            <div class="item">
                              <img src="images/slide-02.jpg" alt="">    
                            </div>
                            <div class="item">
                              <img src="images/slide-03.jpg" alt="">
                            </div>
                          </div>
                          <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                          <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                        </div>
                        
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
              <footer align="center">
                  <copyright:myCopyright/>
              </footer>
              
          </div>
      </div>
      
    </body>
</html>
