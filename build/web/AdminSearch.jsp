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
                    <a class="brand" href="./AdminProducts.jsp">Admin | 恋爱ing</a>
                    <div class="nav-collapse collapse">
                         
                        <p class="navbar-text pull-right">
                            <%
                            String email=(String)session.getAttribute("admin_e");
                            if(email==null){
                                response.sendRedirect("AdminLogin.jsp");
                            }
                            else{
                        %>
                           ${initParam.email}
                           <a href="./Exit.jsp" class="navbar-link">退出</a>
                        </p>
                        <ul class="nav">
                            <li><a href=".">首页</a></li>
                            <li class="active"><a href="./AdminProducts.jsp">产品管理</a></li>
                            <li><a href="./Bill.jsp">历史订单</a></li>                            
                        </ul>
                         <form class="navbar-search pull-search" action="AdminSearch.jsp">                                
                               <input type="text" class="search-query" name="condition">
                               <button type="submit" class="btn" >搜索</button>
                          </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br> <br>
        
        <div class="container">
            <h3>产品列表<a class="pull-right" href="./NewProduct.jsp"><h4>新建产品</h4></a></h3>
                      
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
                        String condition=request.getParameter("condition");
                        ArrayList flowers=flower.SearchResult(condition);
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
