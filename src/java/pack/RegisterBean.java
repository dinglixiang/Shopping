/*
 * RegisterBean.java
 *
 * Created on April 15, 2013, 12:39 PM
 */

package pack;

import java.sql.*;
import java.beans.*;
import java.util.*;
import java.io.Serializable;

/**
 * @author B413
 */
public class RegisterBean extends Object implements Serializable {
    
    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";   
    private String sampleProperty;    
    private PropertyChangeSupport propertySupport;
    
    public String email,password,confirmpassword;

    
    public void setEmail(String email){
        if(email != null)
            this.email=email;
    }
    public String getEmail(){
        return this.email;
    }
    public String getPassword(){
        return this.password;
    }
    
    public String getConfirmpassword(){
        return this.confirmpassword;
    }
    
    public void setPassword(String password){
        if(password != null)
            this.password=password;
    }
    
    public void setConfirmpassword(String confirm){
        if(confirm!=null)
            this.confirmpassword=confirm;
    }
    
    public RegisterBean() {
        propertySupport = new PropertyChangeSupport(this);
    }
    
    public int insertRegisterData(){
        int result=0;
        try{
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName=Shopping";
            Class.forName(driverName);
            Connection con=DriverManager.getConnection(url,"sa","123456");
            
            if(password.equals(confirmpassword)){
                String strsql="insert into users(user_email,user_password,user_confirmpassword) values(?,?,?)";
                PreparedStatement stat=con.prepareStatement(strsql);
                stat.setString(1,email);
                stat.setString(2,password);
                stat.setString(3,confirmpassword);

                result = stat.executeUpdate();     
            }
            else{
                result =2;
            }
             
        }
        catch(Exception e){
            e.printStackTrace();
        }
         return result;
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
