package pac;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class SAction2 extends ActionSupport
{
    private String email, pass, sq, sa, msg;
   private int ctr;
    @Override
    public String execute() throws Exception
    {
        HttpServletRequest req=ServletActionContext.getRequest();
       HttpSession ses=req.getSession(false);
       if(ses.getAttribute("id") ==null)
         {
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
     if(getCtr()==0)
         {
             
         
         
              //HttpServletRequest req=ServletActionContext.getRequest();
              //HttpSession ses=req.getSession(true);
              ServletContext ctx=req.getServletContext();
              int userid=Integer.parseInt(ses.getAttribute("id").toString());
          try
            { 
            ResultSet rs = db.DBConnect.getSData(userid);
            if(rs.next())
             {
            email = rs.getString(1);
            pass = rs.getString(2);
            sq = rs.getString(3);
            sa = rs.getString(4);
             }    
           } catch(Exception ex){}  
            return "DESIGN"; 
         }
     else if(ctr==1)
      {
          // HttpServletRequest req=ServletActionContext.getRequest();
              //HttpSession ses=req.getSession(true);
             // ServletContext ctx=req.getServletContext();
              int userid=Integer.parseInt(ses.getAttribute("id").toString());
         setMsg(db.DBConnect.secUpdate(userid,getEmail(),getPass(),getSq(),getSa())); 
         return "SUCCESS";
      }
     else
     {
       setMsg("update not change");
       return "FAILURE";
     }
      
       
    }

    
    
    
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email;
    }

    
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the sq
     */
    public String getSq() {
        return sq;
    }

    /**
     * @param sq the sq to set
     */
    public void setSq(String sq) {
        this.sq = sq;
    }

    /**
     * @return the sa
     */
    public String getSa() {
        return sa;
    }

    /**
     * @param sa the sa to set
     */
    public void setSa(String sa) {
        this.sa = sa;
    }

    /**
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * @return the ctr
     */
    public int getCtr() {
        return ctr;
    }

    /**
     * @param ctr the ctr to set
     */
    public void setCtr(int ctr) {
        this.ctr = ctr;
    }
    
    
}
