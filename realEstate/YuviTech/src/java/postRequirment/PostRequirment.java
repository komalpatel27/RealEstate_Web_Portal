package postRequirment;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class PostRequirment extends ActionSupport
{
    private String email;
    private String mb;
    private String desc;
    private int counter;
    private String msg;
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
        if(getCounter()==1)
        {
            String m=db.DBConnect.postQutation(desc, email, mb);
            //HttpServletRequest req = ServletActionContext.getRequest();
            req.setAttribute("m", m);            
            return "SUCCESS";
        }
        else
            return "DESIGN";
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
     * @return the mb
     */
    public String getMb() {
        return mb;
    }

    /**
     * @param mb the mb to set
     */
    public void setMb(String mb) {
        this.mb = mb;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the counter
     */
    public int getCounter() {
        return counter;
    }

    /**
     * @param counter the counter to set
     */
    public void setCounter(int counter) {
        this.counter = counter;
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
