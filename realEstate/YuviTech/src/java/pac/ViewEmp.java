package pac;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class ViewEmp extends ActionSupport
{
     private String msg;
     private int ctr;
     private int uid;
     
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
        if(getCtr()==1)
        {
            String m=db.DBConnect.delEmp(getUid());
            return "DelEmp";
        }
        else
            return "DESIGN";
             
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

    /**
     * @return the uid
     */
    public int getUid() {
        return uid;
    }

    /**
     * @param uid the uid to set
     */
    public void setUid(int uid) {
        this.uid = uid;
    }
    
}
