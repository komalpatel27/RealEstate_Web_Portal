package feedback;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class Complain extends ActionSupport
{
    private String  cmsg,msg,cstatus,op,name;
   private int ctr ,cid;
    private List<String> cityList,stateList;
   
    @Override
    public String execute() throws Exception
    {
         HttpServletRequest req=ServletActionContext.getRequest();
         HttpSession ses=req.getSession(true);
        if(ses.getAttribute("id") ==null)
         {
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
        op="INSERT";
        if(getCtr()==0)
        {
        return "DESIGN";
        }
        else if(getCtr()==1)
         {
            cstatus="no";
            String rdate="0000-00-00";
             
              ServletContext ctx=req.getServletContext();
              int userid=Integer.parseInt(ses.getAttribute("id").toString());
              db.DBConnect.complaint(op,getName(),userid, cmsg, cstatus, rdate);
              setMsg("Complaint Successfully Submitted");
            return "SUCCESS"; 
         }
         else if(getCtr()==2)
        {
            String rdate="0000-00-00";
            op="UPDATE";
          int c=getCid();
          setMsg(db.DBConnect.resolvecomp(c));
          
        }
             return "SUCCESS";
            
    }
    
    @Override
    public void validate()
    {
        if(getCtr()==1)
        {
            if(getName().equals(""))
                addFieldError("name","please enter name");
            if(getCmsg().equals(""))
                addFieldError("cmsg", "please enter message");
        }
    }

    /**
     * @return the cmsg
     */
    public String getCmsg() {
        return cmsg;
    }

    /**
     * @param cmsg the cmsg to set
     */
    public void setCmsg(String cmsg) {
        this.cmsg = cmsg;
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the cid
     */
    public int getCid() {
        return cid;
    }

    /**
     * @param cid the cid to set
     */
    public void setCid(int cid) {
        this.cid = cid;
    }
}
