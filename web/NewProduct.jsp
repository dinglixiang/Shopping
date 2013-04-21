<%@page contentType="text/html"%>
<%@page pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>新建产品</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body> 
        <br> 
        <br> 
        <br> 
        <form align="center" method="post" action="StoreProduct.jsp">
            <tr>
                <div class="input-prepend">
                  <span class="add-on">产品名称</span>
                  <input type="text" name="name" />
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">产品价格</span>
                  <input type="text" name="price" />
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">产品销量</span>
                  <input type="text" name="sales" value=0  disabled=true/>
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">产品描述</span>
                  <input type="text" name="describe" />
                </div>
                <br>
            <tr><input class="btn btn-sure btn-primary" type="submit" value="新建"/></tr> 
        </form>
    </body>
</html>
