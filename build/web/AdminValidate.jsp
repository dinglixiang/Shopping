<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String configemail=application.getInitParameter("email");
        String configpass=application.getInitParameter("password");
        
        if(email.equals(configemail)&& password.equals(configpass)){
            session.setAttribute("admin_e",configemail);
            response.sendRedirect("AdminProducts.jsp");
        }
        else{
            response.sendRedirect("admin.jsp");
        }
        %>
    </body>
</html>
