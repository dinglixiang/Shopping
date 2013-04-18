
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
              
       //���ArrayList ����Ϊ�գ���ֱ����ӵ�ArrayList������
        if(carts.isEmpty())  
        {  
            carts.add(goods);  
            session.setAttribute("car",carts);  
            response.sendRedirect("Cart.jsp");  
        } 
        //�����ArrayList ����Ϊ�գ����жϹ�����Ʒ�Ƿ��Ѿ������ڳ���
        else  
        {  
            Iterator it = carts.iterator();  
            for(int i = 0;i<carts.size();i++) //���滹����һ�ֱ�������  
            {  
                Product shop = (Product)it.next(); 
                //�����������Ʒ�Ѿ����ڣ����ӡ������ʾ��Ϣ
                if(shop.compareTo(goods))  
                {  
                    out.println("<script>alert('���Ѿ������˴���Ʒ��');window.close();script>");  
                } 
               // �����������Ʒ�����ڣ���ֱ�ӽ���Ʒ��ӵ�ArrayList�����У���д�� session
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
