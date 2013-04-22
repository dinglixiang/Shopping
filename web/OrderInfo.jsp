<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pack.FlowerBean" %>
<%@ page import="pack.Product" %>
<%@ taglib uri="/WEB-INF/tlds/myCopyright.tld" prefix="copyright" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>订单信息</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <jsp:useBean id="product" scope="application" class="pack.FlowerBean"/>
    </head>
    <body> 
        <div class="container">
            <div class="row-fluid">
                <div class="span12">
                    <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                    <%
                    String id=(String)session.getAttribute("order_product_id");
                    session.removeAttribute("car");
                    String ids[]=id.split(",");
                    if(ids.length !=0){
                        for(int i=0;i<ids.length;i++){
                            
                            Product p=product.FindProductById(Integer.parseInt(ids[i]));
                            product.UpdateSalesById(Integer.parseInt(ids[i]),p.getSales());
                    
                    %>                         
                    <div class="span5">
                        
                        <div class="span4">
                            <img class="img-rounded" src="images/molihua.jpg" width="200" height="200"> 
                        </div>
                        <div class="span4">
                            
                            <h4><a href="FlowerDetails.jsp?id=<%= p.getId()%>"><%=p.getName()%></a></h4>
                            <h6>销量：<%=p.getSales()%> 价格：<%=p.getPrice()%></h6>
                        </div>
                    </div>               
                    
                    <%
                        }
                    } else{
                        out.println("id传参出错！");
                    }
                    %>
                    <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=1)" width="100%" color=#987cb9 SIZE=3>
                    <form align="center" action="StoreBills.jsp">
                        <h3>订单信息表</h3>
                        <th>收件人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td><input type="text" name="receiver"/></td><br>
                        <th>送货地址&nbsp;&nbsp;</th><td><input type="text" name="address"/></td><br>
                        <th>联系方式&nbsp;&nbsp;</th><td><input type="text" name="tel"/></td><br>
                        <br>
                        <td align="center"><input class="btn btn-sure btn-danger" type="submit" value="确认付款"></td>                     
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
