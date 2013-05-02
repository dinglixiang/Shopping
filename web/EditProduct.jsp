<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>
<%@ page import="java.util.*" %>
<%@ page import="pack.Product" %>
<%
    request.setCharacterEncoding("GBK");
    response.setCharacterEncoding("GBK");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>新建产品</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="ckeditor/contents.css">
        <jsp:useBean id="flower" scope="application" class="pack.FlowerBean"/>
        
        <script type ="text/javascript " >
            function vailFloatNumberPerfect(evnt,obj){
             evnt=evnt||window.event;
             var keyCode=window.event?evnt.keyCode:evnt.which;
             if((obj.value.length==0 || obj.value.indexOf(".")!=-1) && keyCode==46) return false;
             return keyCode>=48&&keyCode<=57||keyCode==46||keyCode==8;
            }
       </script>
    </head>
    
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            Product p=flower.FindProductById(id);
            
        %>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="./AdminProducts.jsp">恋爱ing</a>

                            <%
                            String email=(String)session.getAttribute("admin_e");
                            if(email==null){
                                response.sendRedirect("AdminLogin.jsp");
                            }
                        %>
                </div>
            </div>
        </div>
        <br><br> <br>
        <div class="container">
            <h3 align="center">编辑产品</h3>
            <h4><a target=main onclick ="javascript:history.go(-1);">返回继续</a></h4>
            <form method="post" action="UpdateProduct.jsp?id=<%= p.getId()%>&sales=<%= p.getSales()%>">
                <h4>
                    产品名称
                    <input type="text" name="name" value="<%= p.getName()%>"/>
                </h4>

                <h4>
                    产品价格
                    <input type="text" name="price" value="<%= p.getPrice()%>" onkeypress = "return vailFloatNumberPerfect(event,this) "   
onpaste = "return !clipboardData.getData('text').match(/\D/) "   
ondragenter = "return false "   
style = "ime-mode:Disabled " />
                </h4>

                <h4>
                    产品销量
                    <input type="text" name="sales"  disabled=true value="<%= p.getSales()%>"/>
                </h4>

                <h4>
                产品描述</h4>
                <textarea rows="10" cols="10" id="describe" name="describe"><%= p.getDescribe()%></textarea>
                
                <br>
                <tr><input class="btn btn-sure btn-primary" type="submit" value="保存更新"/></tr> 
            </form>
        </div>
        <ck:replace replace="describe" basePath="ckeditor"></ck:replace>
    </body>
</html>
