
package pack;

import java.util.*;
public class Product {
    
    private int id,sales;
    private float price;
    private String name,describe;
    
    public Product(){
        id=0;
        sales=0;
        price=0;
        name=null;
        describe=null;
    }
    
    public Product(int id,String name,float price,String describe,int sales){
        this.id=id;
        this.name=name;
        this.price=price;
        this.describe=describe;
        this.sales=sales;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
    
    public boolean compareTo(Object m) {  
        Product n= (Product) m;
        if(id==n.id){
            return true;
        }else{
            return false;
        }
    }  
    
}
