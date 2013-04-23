<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ page import="pack.Order" %>
<%@ page import="pack.BillBean" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>产品管理</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
        <jsp:useBean id="bill" scope="application" class="pack.BillBean"/>
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
            <h3>产品列表</h3>
            <div class="row-fluid">
                <div class="span12">
                    <br>
                    <table class="table table-hover">
                        <th width="10%">产品Id</th>
                        <th width="20%">产品名称</th>
                        <th width="20%">产品价格</th>
                        <th width="20%">产品销量</th>
                        <th width="30%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
                        <%
                        ArrayList flowers=flower.GetFlowerData();
                        Iterator iter=flowers.iterator();
                        while(iter.hasNext()) {
                            Product p=(Product)iter.next();
                        %>                        
                         <tr>
                             <td><h5><%= p.getId()%></h5></td>
                             <td>
                                <h5><a href="FlowerDetails.jsp?id=<%= p.getId()%>"><%=p.getName()%></a></h5>
                            </td>
                            
                            <td>
                                <h6><%=p.getPrice()%>￥</h6>
                            </td>
                            <td>
                                    
                                <h6><span class="badge badge-info"><%=p.getSales()%> </span></h6>
                            </td> 
                            <td>
                                <h6>
                                <a href="FlowerDetails.jsp?id=<%= p.getId()%>">显示</a>&nbsp;|&nbsp;
                                <a href="EditProduct.jsp?id=<%= p.getId()%>">编辑</a>&nbsp;|&nbsp;
                                <a href="DeleteProduct.jsp?id=<%= p.getId()%>">删除</a>
                                </h6>
                            </td>
                        </tr>                                                                                    
                        <%
                        }           
                        %>
                    </table>
                </div>
                
            </div>
            <footer class="copyright" align="center">
                <hr width="100%" color="#ADADAD" SIZE=3>
                <copyright:myCopyright/>
            </footer> 
        </div>    
    </body>
</html>
