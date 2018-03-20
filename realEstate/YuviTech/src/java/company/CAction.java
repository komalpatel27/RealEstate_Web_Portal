package company;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;



public class CAction extends ActionSupport
{
    private int ctr;
    private int uid;
    private String cpmob;
    private String name;
    private String addr;
    private String cpname;
    private String cpmid;
    private String msg;
    private int compid;
    private List<Integer> complist;
   
    public static String insert="INSERT";
     public static String update="UPDATE";
    @Override
    public String execute()throws Exception
  { 
      complist=db.DBConnect.getList();
       HttpServletRequest req1=ServletActionContext.getRequest();
       HttpSession ses=req1.getSession(false);
       if(ses.getAttribute("id") ==null)
         {
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
      if(getCtr()==0)
      {
          
          return "design";
      }
      else if(getCtr()==1)
      {
       
      setMsg(db.DBConnect.addupdatecompany(insert,'0', getName(),getAddr(),getCpname(),getCpmob(),getCpmid(),getUid()));
      return "success";
      }
      else if(getCtr()==2)
      {
         
          return "view";
      }
      else if(getCtr()==3)
      { 
          setMsg(db.DBConnect.delcompany(getCompid()));
          return "del";
      }
      else if(getCtr()==4)
      {
          setMsg(db.DBConnect.addupdatecompany(update,getCompid(),getName(),getAddr(),getCpname(),getCpmob(),getCpmid(),getUid()));
          return "update";
      }
      else 
      {
           ResultSet rs=db.DBConnect.getcompany1(getCompid());
                if(rs.next())
                {
                    setName(rs.getString(2));
                    setAddr(rs.getString(3));
                    setCpname(rs.getString(4));
                    setCpmob(rs.getString(5));
                    setCpmid(rs.getString(6));
                    setUid(rs.getInt(7));
                   
                } 
              HttpServletRequest req = ServletActionContext.getRequest();
              HttpSession session= req.getSession();
              session.setAttribute("id", getCompid()); 
              return "design";
        }
      
  }

    @Override
    public void validate() 
    {
       if(getCtr()==1)
        {
           if(getName().equals(""))
                addFieldError("name","please enter company name");
           if(getAddr().equals(""))
                addFieldError("addr","please enter address");
           if(getCpname().equals(""))
                addFieldError("cpname","please enter contact person name");
           if(getCpmob().equals(""))
                addFieldError("cpmob","please enter mobile num");
           if(getCpmid().equals(""))
                addFieldError("cpmid","please enter mail id");
           if(getUid()==0)
                addFieldError("uid","please enter userid"); 
        }
    }
 
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getCpmob() {
        return cpmob;
    }

    public void setCpmob(String cpmob) {
        this.cpmob = cpmob;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAddr() {
        return addr;
    }
    public void setAddr(String addr) {
        this.addr = addr;
    }
    public String getCpname() {
        return cpname;
    }
    public void setCpname(String cpname) {
        this.cpname = cpname;
    }
    public String getCpmid() {
        return cpmid;
    }
    public void setCpmid(String cpmid) {
        this.cpmid = cpmid;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCtr() {
        return ctr;
    }
    public void setCtr(int ctr) {
        this.ctr = ctr;
    }
    public int getCompid() {
        return compid;
    }
    public void setCompid(int compid) {
        this.compid = compid;
    }

    public List<Integer> getComplist() {
        return complist;
    }
    
}
