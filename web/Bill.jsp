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
        <title>历史订单列表</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/flower.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
        <jsp:useBean id="bill" scope="application" class="pack.BillBean"/>
    </head>
    <body> 
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="./AdminProducts.jsp">Admin | 恋爱ing</a>
                    <div class="nav-collapse collapse">
                        <%
                            String admin=(String)session.getAttribute("admin_e");
                            if(admin==null){
                                response.sendRedirect("admin.jsp");
                            }
                            else{
                        %>
                        <p class="navbar-text pull-right">
                            <span class="label label-important"> ${initParam.email}</span>
                           <a href="./Exit.jsp" class="navbar-link">退出</a>
                        </p>
                        <ul class="nav">
                             <li><a href=".">首页</a></li>
                            <li><a href="./AdminProducts.jsp">产品管理</a></li>
                            <li class="active"><a href="./Bill.jsp">历史订单</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <br><br> <br>
        <div class="container">
            <h3>历史订单产品列表</h3>
            <div class="row-fluid">
                <div class="span12">
                    <br>
                    <table class="table table-hover">
                        <th width="10%">订单号</th>
                        <th width="40%">订单商品</th>
                        <th width="10%">收件人</th>
                        <th width="20%">送货地址</th>
                        <th width="20%">操作</th>
                        <%
                        ArrayList orders=bill.GetBills();
                        if(orders==null) {
                            out.println("您还未订购过任何商品哦~~~");
                            
                        } else{
                            Iterator oiter=orders.iterator();
                            while(oiter.hasNext()){
                                Order o=(Order)oiter.next();
                                String product_name=o.getProduct_name();
                                String names[]=product_name.split(",");
                        %>                       
                        <tr>  
                            <td><%= o.getOrder_id()%></td>
                            <td>                                                                                                     
                                <%
                                for(int i=0;i<names.length;i++){                
                                %>                                                                                                  
                                 <%= (String)names[i]%>
                                <br>                               
                                <%  
                                }
                                %>
                            </td> 
                            <td><%= o.getReceiver()%></td>
                            <td><%= o.getAddress()%></td> 
                            <td><h5><a href="DeleteBill.jsp?id=<%= o.getOrder_id()%>">删除</a></h5></td>
                        </tr> 
                        
                        <%
                            }
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
