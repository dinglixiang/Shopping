
package pack;

import java.beans.*;
import java.util.*;
import java.sql.*;
import java.io.Serializable;

public class BillBean extends Object implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";
    
    private String sampleProperty;
    
    private PropertyChangeSupport propertySupport;
    public ArrayList result;
    
     public ArrayList GetBills(){
        result=new ArrayList();
         try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
            String strsql="select * from orders";
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
    
    
    public BillBean() {
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