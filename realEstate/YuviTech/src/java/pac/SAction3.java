package pac;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class SAction3 extends ActionSupport
{
    private String  name,dob,clt,addr,state,city,cntry,stdcd,lndline,mbl,msg;
   private int ctr,pin;
    private List<String> cityList,stateList;
   
    @Override
    public String execute() throws Exception
    {
        cityList = db.DBConnect.getCity();   
        stateList = db.DBConnect.getState();
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
             // HttpSession ses=req.getSession(true);
              //ServletContext ctx=req.getServletContext();
              int userid=Integer.parseInt(ses.getAttribute("id").toString());
         
            ResultSet rs = db.DBConnect.getPData(userid);
            if(rs.next())
             {
            name = rs.getString(1);
            clt = rs.getString(2);
            dob = rs.getString(3);
            
             } 
            ResultSet rs1 = db.DBConnect.getPData1(userid);
            if(rs1.next())
             {
            stdcd = rs1.getString(1);
            lndline = rs1.getString(2);
            mbl = rs1.getString(3);
            
             }
             ResultSet rs2 = db.DBConnect.getPData2(userid);
            if(rs2.next())
             {
            addr = rs2.getString(1);
            city = rs2.getString(2);
            state = rs2.getString(3);
            cntry= rs2.getString(4);
            pin =   rs2.getInt(5);
             }            
            return "DESIGN"; 
         }
     else if(getCtr()==1)
      {
           //HttpServletRequest req=ServletActionContext.getRequest();
            //  HttpSession ses=req.getSession(true);
              //ServletContext ctx=req.getServletContext();
              int userid=Integer.parseInt(ses.getAttribute("id").toString());
         setMsg(db.DBConnect.Pupdate(userid, getName(), getDob(), getClt(), getAddr(), getState(), getCity(),getPin() , getCntry(), getStdcd(), getLndline(), getMbl())) ;
         return "SUCCESS";
      }
     else
     {
       setMsg("update not change");
       return "FAILURE";
     }
      
       
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
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the clt
     */
    public String getClt() {
        return clt;
    }

    /**
     * @param clt the clt to set
     */
    public void setClt(String clt) {
        this.clt = clt;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }


    /**
     * @return the cntry
     */
    public String getCntry() {
        return cntry;
    }

    /**
     * @param cntry the cntry to set
     */
    public void setCntry(String cntry) {
        this.cntry = cntry;
    }

    /**
     * @return the stdcd
     */
    public String getStdcd() {
        return stdcd;
    }

    /**
     * @param stdcd the stdcd to set
     */
    public void setStdcd(String stdcd) {
        this.stdcd = stdcd;
    }

    /**
     * @return the lndline
     */
    public String getLndline() {
        return lndline;
    }

    /**
     * @param lndline the lndline to set
     */
    public void setLndline(String lndline) {
        this.lndline = lndline;
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
     * @return the pin
     */
    public int getPin() {
        return pin;
    }

    /**
     * @param pin the pin to set
     */
    public void setPin(int pin) {
        this.pin = pin;
    }

    /**
     * @return the cityList
     */
    public List<String> getCityList() {
        return cityList;
    }

    /**
     * @return the stateList
     */
    public List<String> getStateList() {
        return stateList;
    }

    
    
    
}
