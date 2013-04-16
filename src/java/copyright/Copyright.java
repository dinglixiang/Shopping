package copyright;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;


public class Copyright extends TagSupport {

    public int doStartTag() throws JspException{
      try{
        JspWriter out=pageContext.getOut();
        out.println("<br><B>@ Copyright 2013 dinglixiang .<a href='http://dinglixiang.github.io'>ÎÒµÄblog</a></B>");
      }
      catch(Exception e){
        e.printStackTrace();
      }    
      
      return SKIP_BODY;
    }
    
    public int doEndTag() throws JspException{
        return SKIP_PAGE;
    }

}
