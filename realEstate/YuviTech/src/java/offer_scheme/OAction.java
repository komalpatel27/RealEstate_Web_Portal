package offer_scheme;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
public class OAction extends ActionSupport
{
    private List<Integer> oidList;
    private int oid;
    private String propertyname;
    private String propertytype;
    private String registerdate;
    private String startdate;
    private String enddate;
    private String status;
    private String discount;
    private String file;
    private String msg;
    private int ctr;

    @Override
    public String execute() throws Exception
    {
        oidList = db.DBConnect.getListoffer_scheme();
        //String m=(db.Admin.proAUoffer_scheme(propertyname, propertytype,registerdate , startdate, enddate, status, discount, file)); 
        HttpServletRequest req1=ServletActionContext.getRequest();
       HttpSession ses=req1.getSession(false);
       if(ses.getAttribute("id") ==null)
         {
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
        if(getCtr()==0)
           return "DESIGN";
        else if(getCtr()==1)
        {  
           String s=db.DBConnect.AUoffer_scheme("INSERT",0,getPropertyname(),getPropertytype(),getRegisterdate(),getStartdate(),getEnddate(),getStatus(),getDiscount(),getFile());
           HttpServletRequest req = ServletActionContext.getRequest();
           req.setAttribute("s", s);
            
            return "SUCCESS";
            
        }
        else if(getCtr()==2)
        {
            String s=db.DBConnect.Deloffer_scheme(getOid());
            HttpServletRequest req = ServletActionContext.getRequest();
            req.setAttribute("s", s);
            return "DELETE";
        }
        else if(getCtr()==3)
        {
             ResultSet rs=db.DBConnect.getAlldata1(getOid());
                if(rs.next())
                {
                    setPropertyname(rs.getString(2));
                    setPropertytype(rs.getString(3));
                    setRegisterdate(rs.getString(4));
                    setStartdate(rs.getString(5));
                    setEnddate(rs.getString(6));
                    setStatus(rs.getString(7));
                    setDiscount(rs.getString(8));
                    setFile(rs.getString(9)); 
                } 
              HttpServletRequest req = ServletActionContext.getRequest();
              HttpSession session= req.getSession();
              session.setAttribute("id", getOid()); 
              return "DESIGN";
        }
         else if(getCtr()==4)
        {
            
            String s=db.DBConnect.AUoffer_scheme("UPDATE",getOid(),getPropertyname(),getPropertytype(),getRegisterdate(),getStartdate(),getEnddate(),getStatus(),getDiscount(),getFile());
            HttpServletRequest req = ServletActionContext.getRequest();
            req.setAttribute("s", s);
            return "SUCCESS";
          }
         else if(getCtr()==5)
         {
                   String s=db.DBConnect.Deloffer_scheme(getOid());
                   setMsg(s);
                   return "DELOFFER";
         }

        else
         {
           HttpServletRequest req = ServletActionContext.getRequest();
           HttpSession session= req.getSession();
           session.setAttribute("id", getOid());
           return "VIEW";
         }
    }

    @Override
    public void validate()
    {
        
        if(getCtr()==1)
        {
            if(getPropertyname().equals(""))
                addFieldError("propertyname","please enter property name");
            if(getPropertytype().equalsIgnoreCase("select"))
                 addFieldError("propertytype","please choose property type");
            if(getRegisterdate().equals(""))
                addFieldError("registerdate","register date can't blank");
            if(getStartdate().equals(""))
                addFieldError("startdate"," start date can't blank");
            if(getEnddate().equals(""))
                addFieldError("enddate","end date can't blank");
            if(getStatus().equalsIgnoreCase("Select"))
                addFieldError("status","status can't blank");
            if(getDiscount().equalsIgnoreCase("Select"))
                addFieldError("discount","discount can't blank");
            if(getFile()==null)
                addFieldError("file","please choose file");  
        }
    }
    
    public String getPropertyname() {
        return propertyname;
    }    
    public void setPropertyname(String propertyname) {
        this.propertyname = propertyname;
    }    
    public String getPropertytype() {
        return propertytype;
    }    
    public void setPropertytype(String propertytype) {
        this.propertytype = propertytype;
    }    
    public String getRegisterdate() {
        return registerdate;
    }    
    public void setRegisterdate(String registerdate) {
        this.registerdate = registerdate;
    }    
    public String getStartdate() {
        return startdate;
    }    
    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }    
    public String getEnddate() {
        return enddate;
    }   
    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }    
    public String getStatus() {
        return status;
    }    
    public void setStatus(String status) {
        this.status = status;
    }    
    public String getFile() {
        return file;
    }
    public void setFile(String file) {
        this.file = file;
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
    public String getDiscount() {
        return discount;
    }
    public void setDiscount(String discount) {
        this.discount = discount;
    }    
    public int getOid() {
        return oid;
    }
    public void setOid(int oid) {
        this.oid = oid;
    }
    public List<Integer> getOidList() {
        return oidList;
    }
}