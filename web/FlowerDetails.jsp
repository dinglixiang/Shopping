<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<jsp:useBean id="product" scope="application" class="pack.FlowerBean"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%
            String id=request.getParameter("id");
            Product p=product.FindProductById(Integer.parseInt(id));          
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title><%= p.getName()%></title>
        
        <script type="text/javascript" src="jquery-1.4.1.js"></script>
        <style type="text/css">
        .go{width:47px;height:65px;position:fixed;_position:absolute;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||200)-(parseInt(this.currentStyle.marginBottom,10)||0)));right:20px;bottom:30%; background-color: lightgoldenrodyellow; background-repeat:no-repeat;}
        .go a{text-indent:999em;width:37px;margin:5px;border:0;overflow:hidden;float:left; cursor:pointer;}
        .go .top{background-position:0 0px;height:22px;background-image: url(./images/a.jpg);}
        .go .feedback{background-position:0 -22px;height:32px}
        .go .bottom{background-position:0 -55px;height:22px;background-image: url(./images/a.jpg);}
        .go .top:hover{background-position:-38px -0px}
        .go .feedback:hover{background-position:-38px -22px }
        .go .bottom:hover{background-position:-38px -55px}
        </style>
        <script type="text/javascript">
            $(function () {

                $(".top").click(//定义返回顶部点击向上滚动的动画
                function () {
                    $('html,body').animate({ scrollTop: 0 }, 700);
                });
                $(".bottom").click(//定义返回顶部点击向上滚动的动画
                function () {
                    $('html,body').animate({ scrollTop: document.body.clientHeight }, 700);

                });


            })
        </script>
        
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
        <br><br><br>
        
        <div class="container">         
            
            <div class="span12">
                <a target=main onclick ="javascript:history.go(-1);">返回继续</a>
                <br> <br>
                <div class="row-fluid">
                    <div class="span5">
                        <img class="img-rounded" src="images/molihua.jpg" width="200" height="200"> 
                    </div>
                    <div class="span7">
                        <h4><%= p.getName()%></h4> <br><br>
                        
                        产品价格 <%= p.getPrice()%><br><br>
                        产品销量 <%= p.getSales()%><br><br>
                    </div>     
                </div>                                             
            </div>
            <br><br><br><br><br><br><br><br><br><br>
            <hr>
            <div class="span12">
                <div class="row-fluid">
                    <%= p.getDescribe()%>
                </div>  
            </div>
            
        </div>

    <div class="go">
	<a title="返回顶部" class="top"></a>

	<a title="返回底部" class="bottom" ></a>

    </div>       
    </body>
</html>
