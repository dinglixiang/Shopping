<%@page contentType="text/html"%>
<%@page pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>�½���Ʒ</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body> 
        <br> 
        <br> 
        <br> 
        <form align="center" method="post" action="StoreProduct.jsp">
            <tr>
                <div class="input-prepend">
                  <span class="add-on">��Ʒ����</span>
                  <input type="text" name="name" />
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">��Ʒ�۸�</span>
                  <input type="text" name="price" />
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">��Ʒ����</span>
                  <input type="text" name="sales" value=0  disabled=true/>
                </div>
                <br>
                <div class="input-prepend">
                  <span class="add-on">��Ʒ����</span>
                  <input type="text" name="describe" />
                </div>
                <br>
            <tr><input class="btn btn-sure btn-primary" type="submit" value="�½�"/></tr> 
        </form>
    </body>
</html>
