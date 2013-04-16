

package pack;

import java.beans.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable;


public class FlowerBean extends Object implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";
    
    private String sampleProperty;
    
    private PropertyChangeSupport propertySupport;
    public ArrayList result;
    
    public int StoreBill(int id){
        int result=0;
        try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
            String strsql="insert into orders(product_id) values(?)";
            PreparedStatement stat=con.prepareStatement(strsql);
            stat.setInt(1,id);
            result = stat.executeUpdate();     
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
      
    }
    
    public ArrayList FindProductById(int id){
        result=new ArrayList();
        try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
            String strsql="select * from products where product_id="+id;
            PreparedStatement stat=con.prepareStatement(strsql);        
            ResultSet rs=stat.executeQuery();
            
            while(rs.next()){
                Product flower=new Product();              
                flower.setId(id);
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
    
    
    public ArrayList GetFlowerData(){
        result=new ArrayList();
         try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
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
