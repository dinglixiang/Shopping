
package pack;

import java.beans.*;
import java.util.*;
import java.sql.*;
import java.io.Serializable;

public class LoginBean extends Object implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";
    
    private String sampleProperty;
    
    private PropertyChangeSupport propertySupport;
    private String email,password;
    
    public void setEmail(String email){
        if(email != null)
            this.email=email;
    }
    public String getEmail(){
        return this.email;
    }
    public void setPassword(String password){
        if(password != null)
            this.password=password;
    }
    public String getPassword(){
        return this.password;
    }
    
    
     public boolean LoginValidate(){
         boolean result=false;
        try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
            
           PreparedStatement pstmt=null;
            String query=null;
            query="select * from users where user_email=? and user_password=?";
            
            pstmt=con.prepareStatement(query);
            pstmt.setString(1,email);     
            pstmt.setString(2,password);         
            ResultSet rs=pstmt.executeQuery();  
            
            if(rs.next()){
                result=true;
            }
            else{
                result=false;
             } 
        }
        catch(Exception e){
            e.printStackTrace();
        }
         return result;
    }
    
    public LoginBean() {
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
