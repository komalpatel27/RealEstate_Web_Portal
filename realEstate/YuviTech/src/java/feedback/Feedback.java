/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package feedback;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author sushil
 */
public class Feedback extends ActionSupport
{
    private int ctr;
    private String cname;
    private String email;
    private String mbl;
    private String fmsg;
    private String msg;
    @Override
    public String execute() throws Exception
    {
    
       HttpServletRequest req=ServletActionContext.getRequest();
       HttpSession ses=req.getSession(false);        
       if(getCtr()==0)
           return "DESIGN";
       if(getCtr()==10)
       {
           return "FEEDBACK";
       }
       else if(getCtr()==9 )
        {
             String mm="";
            ///String m=(String)ses.getAttribute("id");
               if(ses.getAttribute("id") ==null)
               {
                 mm=db.DBConnect.feedBack(getCname(),0, getEmail(),getMbl(), getFmsg()); 
                 req.setAttribute("m", mm);
                 setCname("");
                 setEmail("");
                 setMbl("");
                 setFmsg("");
               }
               else
               {
                 int userid=Integer.parseInt(ses.getAttribute("id").toString());   
                 mm=db.DBConnect.feedBack(getCname(),userid, getEmail(),getMbl(), getFmsg());
                 req.setAttribute("m", mm);
                    setCname("");
                 setEmail("");
                 setMbl("");
                 setFmsg("");
               }            
               return"SUCCESS";
         }
        else 
        {
          setMsg("feedback not saved");
          return "FAILURE";
        }
    }

    @Override
    public void validate()
    {
         if(getCtr()==9)
        {
            if(getCname().equals(""))
            addFieldError("cname","please enter name ");
            if(getEmail().equals(""))
                addFieldError("email", "please enter your email");
              if(getMbl().equals(""))
                addFieldError("mbl", "please enter your mobile no");
               if(getFmsg().equals(""))
                addFieldError("fmsg", "please enter the message");
             
        
        }
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

    /**
     * @return the cname
     */
    public String getCname() {
        return cname;
    }

    /**
     * @param cname the cname to set
     */
    public void setCname(String cname) {
        this.cname = cname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the mbl
     */
    public String getMbl() {
        return mbl;
    }

    /**
     * @param mbl the mbl to set
     */
    public void setMbl(String mbl) {
        this.mbl = mbl;
    }

    /**
     * @return the fmsg
     */
    public String getFmsg() {
        return fmsg;
    }

    /**
     * @param fmsg the fmsg to set
     */
    public void setFmsg(String fmsg) {
        this.fmsg = fmsg;
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
}
