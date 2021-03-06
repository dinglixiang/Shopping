package pack;

import java.beans.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable;
import pack.Order;


public class FlowerBean extends Object implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";
    
    private String sampleProperty;
    
    private PropertyChangeSupport propertySupport;
    public ArrayList result;
    
    public Connection ConnectDB(){
        Connection con=null;
         try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            con=DriverManager.getConnection(url,"sa","123456");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
    
    public ArrayList SearchResult(String condition){
        result=new ArrayList();
         try{
            //String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
           // String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
           // Class.forName(driverName);
           // Connection con=DriverManager.getConnection(url,"sa","123456");
            Connection con=ConnectDB();
            String strsql="select * from products where product_name like "+"'%"+condition+"%'";
            PreparedStatement stat=con.prepareStatement(strsql);          
            ResultSet rs=stat.executeQuery();
            
            while(rs.next()){
                Product flower=new Product();
                flower.setId(rs.getInt("product_id"));
                flower.setName(rs.getString("product_name"));
                flower.setPrice(rs.getFloat("product_price"));
                flower.setDescribe(rs.getString("product_describe"));
                flower.setSales(rs.getInt("product_sales"));
                result.add(flower);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public void DeleteProduct(int id){
        try{
            //String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            //String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
           // Class.forName(driverName);
            //Connection con=DriverManager.getConnection(url,"sa","123456");
            Connection con=ConnectDB();
            String strsql="delete from products where product_id = "+id;
            PreparedStatement stat=con.prepareStatement(strsql);
            stat.executeUpdate();
            
            stat.close();
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void UpdateProduct(int id,String name,float price,String describe,int sales){
        try{
           /* String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            String strsql="update products set product_name=?,product_price=?,product_describe=?,product_sales=?  WHERE product_id = "+id;
            PreparedStatement stat=con.prepareStatement(strsql);
            stat.setString(1,name);
            stat.setFloat(2,price);
            stat.setString(3,describe);
            stat.setInt(4,sales);
            stat.executeUpdate();
            
            stat.close();
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void UpdateSalesById(int id,int sales,int cnt){
        try{
            /*String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            String strsql="update products set product_sales = "+(sales+cnt)+" WHERE product_id = "+id;
            PreparedStatement stat=con.prepareStatement(strsql);        
            stat.executeUpdate();
            
            stat.close();
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public int StoreProduct(String name,float price,String describe,int sales){
         int result=0;
        try{
            /*String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            //String strsql="insert into orders(product_id) values(?)";
             String strsql="insert into products(product_name,product_price,product_describe,product_sales) values(?,?,?,?)";
            PreparedStatement stat=con.prepareStatement(strsql);
            stat.setString(1,name);
            stat.setFloat(2,price);
            stat.setString(3,describe);
            stat.setInt(4,sales);
            result = stat.executeUpdate();     
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public int StoreBill(String name,String receiver,String address,String tel){
        int result=0;
        try{
           /* String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            //String strsql="insert into orders(product_id) values(?)";
             String strsql="insert into orders(order_product_name,order_receiver,order_address,order_tel) values(?,?,?,?)";
            PreparedStatement stat=con.prepareStatement(strsql);
            stat.setString(1,name);
            stat.setString(2,receiver);
            stat.setString(3,address);
            stat.setString(4,tel);
            result = stat.executeUpdate();     
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
      
    }
    
    public Product FindProductById(int id){
        Product flower=null;
        try{
            /*String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            String strsql="select * from products where product_id="+id;
            PreparedStatement stat=con.prepareStatement(strsql);        
            ResultSet rs=stat.executeQuery();
            
            while(rs.next()){
                flower=new Product();              
                flower.setId(id);
                flower.setName(rs.getString("product_name"));
                flower.setPrice(rs.getFloat("product_price"));
                flower.setDescribe(rs.getString("product_describe"));
                flower.setSales(rs.getInt("product_sales"));
            }
            stat.close();
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flower;
    }
    
    public Product FindProductByName(String name){
        Product flower=null;
        try{
            /*String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            String strsql="select * from products where product_name="+"'"+name+"'";
            PreparedStatement stat=con.prepareStatement(strsql);        
            ResultSet rs=stat.executeQuery();
            
            while(rs.next()){
                flower=new Product();              
                flower.setId(rs.getInt("product_id"));
                flower.setName(name);
                flower.setPrice(rs.getFloat("product_price"));
                flower.setDescribe(rs.getString("product_describe"));
                flower.setSales(rs.getInt("product_sales"));
            }
            stat.close();
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flower;
    }
    
    
    public ArrayList GetFlowerData(){
        result=new ArrayList();
         try{
            /*String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");*/
            Connection con=ConnectDB();
            String strsql="select * from products";
            PreparedStatement stat=con.prepareStatement(strsql);          
            ResultSet rs=stat.executeQuery();
            
            while(rs.next()){
                Product flower=new Product();
                flower.setId(rs.getInt("product_id"));
                flower.setName(rs.getString("product_name"));
                flower.setPrice(rs.getFloat("product_price"));
                flower.setDescribe(rs.getString("product_describe"));
                flower.setSales(rs.getInt("product_sales"));
                result.add(flower);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public FlowerBean() {
        propertySupport = new PropertyChangeSupport(this);
    }
    
    public String getSampleProperty() {
        return sampleProperty;
    }
    
    public void setSampleProperty(String value) {
        String oldValue = sampleProperty;
        sampleProperty = value;
        propertySupport.firePropertyChange(PROP_SAMPLE_PROPERTY, oldValue, sampleProperty);
    }
    
    
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertySupport.addPropertyChangeListener(listener);
    }
    
    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertySupport.removePropertyChangeListener(listener);
    }
    
}
