<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
  <head>
    <title>恋爱ing注册</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
      <div class="container">
          <form class="form-signin" method="post" action="RegisterUser.jsp">
              <h2>注册</h2>
              <input type="text" class="input-block-level" placeholder="Email address" name="email">
              <input type="password" class="input-block-level" placeholder="Password" name="password">
              <input type="password" class="input-block-level" placeholder="Confirm Password" name="confirmpassword">
              
               <button class="btn btn-large btn-primary" type="submit">Sign up</button>
           </form>
      </div>
  </body>
</html>
