<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
  <head>
    <title>恋爱ing登录</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="login.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
      <div class="container">
          <form class="form-signin" method="get" action="LoginValidate.jsp">
              <h2>登录</h2>
              <input type="text" class="input-block-level" placeholder="Email address" name="email">
              <input type="password" class="input-block-level" placeholder="Password" name="password">

               <button class="btn btn-large btn-primary" type="submit">Sign in</button>
           </form>
      </div>
  </body>
</html>
