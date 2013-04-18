
package pack;

import java.io.*;
import java.net.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import pack.FlowerBean;

public class ShopCart extends HttpServlet {
    
    public HttpSession session=null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       
       int id=Integer.parseInt(request.getParameter("id"));
       String name=request.getParameter("name");
       int sales=Integer.parseInt(request.getParameter("sales"));
       String describe=request.getParameter("describe");
       float price=Float.parseFloat(request.getParameter("price"));
       
       Product goods=new Product(id,name,price,describe,sales);
       session=request.getSession(true);
       ArrayList carts=null;
       if((ArrayList)session.getAttribute("car")==null)  
        {  
            carts = new ArrayList();  
            carts.add(goods);  
            session.setAttribute("car",carts);  
            response.sendRedirect("Cart.jsp");  
        } 
       else  
       {  
            carts=(ArrayList)session.getAttribute("car"); 
       }
              
       //如果ArrayList 对象为空，则直接添加到ArrayList对象当中
        if(carts.isEmpty())  
        {  
            carts.add(goods);  
            session.setAttribute("car",carts);  
            response.sendRedirect("Cart.jsp");  
        } 
        //◆如果ArrayList 对象不为空，则判断购入商品是否已经存在于车中
        else  
        {  
            Iterator it = carts.iterator();  
            for(int i = 0;i<carts.size();i++) //下面还有另一种遍历方法  
            {  
                Product shop = (Product)it.next(); 
                //◆如果购入商品已经存在，则打印输入提示信息
                if(shop.compareTo(goods))  
                {  
                    out.println("<script>alert('你已经订购了此商品！');window.close();script>");  
                } 
               // ◆如果购入商品不存在，则直接将商品添加到ArrayList对象当中，并写入 session
                else  
                {  
                    carts.add(goods);  
                    session.setAttribute("car",carts);  
                    response.sendRedirect("Cart.jsp");  
                }  
            }  
        }  
                
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }
}
