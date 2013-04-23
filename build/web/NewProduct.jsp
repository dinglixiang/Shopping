<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>
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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="ckeditor/contents.css">
    </head>
    
    <body>
        <div class="container">
            <form method="post" action="StoreProduct.jsp">
                <h4>
                    产品名称
                    <input type="text" name="name"/>
                </h4>

                <h4>
                    产品价格
                    <input type="text" name="price" />
                </h4>

                <h4>
                    产品销量
                    <input type="text" name="sales" value=0  disabled=true />
                </h4>

                <h4>
                产品描述</h4>
                <textarea rows="10" cols="10" id="describe" name="describe"></textarea>
                
                <br>
                <tr><input class="btn btn-sure btn-primary" type="submit" value="新建产品"/></tr> 
            </form>
        </div>
        <ck:replace replace="describe" basePath="ckeditor"></ck:replace>
    </body>
</html>
