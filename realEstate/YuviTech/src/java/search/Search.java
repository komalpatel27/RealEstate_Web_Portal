package search;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;

public class Search extends ActionSupport
{
    private String pricetype;
    private String resi_property_type;
    private String comm_property_type;
    private String prop_category;
    private String state_name;
    private String city_name;
    private int start_area_in_feet;
    private int end_area_in_feet;
    private int number_of_bedroom;
    private int number_of_hall;
    private int start_price;
    private int end_price;
    private String property_type;
private int ctr;
private String msg;
private  List<String> cityList;
private List<String> stateList;

    @Override
    public String execute() throws Exception
    {
      cityList = db.DBConnect.getCity();   
      stateList = db.DBConnect.getState();
      //  setMsg(state_name+"   "+city_name);      
     if(getCtr()==0)
         return "DESIGN";
    if(getCtr()==1)
    {
       if(getState_name().equalsIgnoreCase("all") && getCity_name().equalsIgnoreCase("all"))
       {
           setMsg(state_name+" --  "+city_name);
            if(getProperty_type().equalsIgnoreCase("residential"))
             {
            if(getEnd_price()==0)
            {
             setEnd_price(1000000);
             ResultSet rs= db.DBConnect.GetSearch_Property_remCS (getStart_price(),getEnd_price(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());   
             
                 if(rs==null)
                 {
                 setMsg("please select property category");
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }
            
            else
              {
                ResultSet rs= db.DBConnect.GetSearch_Property_remCS (getStart_price(),getEnd_price(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                 setMsg("please select property category");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
               }

          }   //residentiial else close
         else
            {
             if(getEnd_price()==0)
             {
             setEnd_price(1000000);
             ResultSet rs= db.DBConnect.GetSearch_Property_remCS (getStart_price(),getEnd_price(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                 setMsg(getState_name()+"8");   
                 return "Failure";
                 }
                 else
                   {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }
            
         else
            {ResultSet rs= db.DBConnect.GetSearch_Property_remCS (getStart_price(),getEnd_price(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                  setMsg(getState_name()+"9");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }

       }//commercial

       }
       else if(getCity_name().equalsIgnoreCase("all"))
      {
       if(getProperty_type().equalsIgnoreCase("residential"))
        {
            if(getEnd_price()==0)
            {
             setEnd_price(1000000);
             ResultSet rs= db.DBConnect.GetSearch_Property_remState1 (getStart_price(),getEnd_price(),getState_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                setMsg(getState_name()+"10");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }
            
         else
            {ResultSet rs= db.DBConnect.GetSearch_Property_remState1 (getStart_price(),getEnd_price(),getState_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                  setMsg(getState_name()+"11");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }

          }   //residentiial else close
         else
            {
             if(getEnd_price()==0)
            {
             setEnd_price(1000000);
             ResultSet rs= db.DBConnect.GetSearch_Property_remState1 (getStart_price(),getEnd_price(),getState_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                 setMsg(getState_name()+"12");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }
            
         else
            {
                ResultSet rs= db.DBConnect.GetSearch_Property_remState1 (getStart_price(),getEnd_price(),getState_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());                    
                 if(rs==null)
                 {
                 setMsg(getState_name()+"1");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
            }

       }//commercial
      
    } 
       else if(!(getCity_name().equalsIgnoreCase("all"))&& !(getState_name()).equalsIgnoreCase("all")) // both city state
       {
          if(getProperty_type().equalsIgnoreCase("residential"))
            {
            if(getEnd_price()==0)
            {
                setPricetype("");
             setEnd_price(1000000);
             ResultSet rs= db.DBConnect.GetSearch_Property (getStart_price(),getEnd_price(),getState_name(),getCity_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());               
               if(rs==null)
                 {
                 setMsg(getState_name()+"2");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
               }
            else
            {
                 setPricetype("");
             ResultSet rs= db.DBConnect.GetSearch_Property (getStart_price(),getEnd_price(),getState_name(),getCity_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());               
               if(rs==null)
                 {
                  setMsg("please select the property catagory");   
                  return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  setMsg(getStart_price()+getEnd_price()+getState_name()+"------------------   "+getCity_name()+"   -----"+getNumber_of_bedroom()+getStart_area_in_feet()+getEnd_area_in_feet()+getProperty_type()+getPricetype()+getProp_category()+"1");      
                     return "SUCCESS";
                 }
            }
            
            }
          else
          {
                   if(getEnd_price()==0)
            {
             setEnd_price(1000000);
              setPricetype("Square");
             ResultSet rs= db.DBConnect.GetSearch_Property (getStart_price(),getEnd_price(),getState_name(),getCity_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());               
               if(rs==null)
                 {
                  setMsg(getState_name()+"3");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
               }
            else
            {
                 setPricetype("Square");
             ResultSet rs= db.DBConnect.GetSearch_Property (getStart_price(),getEnd_price(),getState_name(),getCity_name(),getNumber_of_bedroom(),getStart_area_in_feet(),getEnd_area_in_feet(),getProperty_type(),getPricetype(),getProp_category());               
               if(rs==null)
                 {
               setMsg("Please select property category");      
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                   setMsg(getStart_price()+getEnd_price()+getState_name()+getCity_name()+getNumber_of_bedroom()+getStart_area_in_feet()+getEnd_area_in_feet()+getProperty_type()+getPricetype()+getProp_category());      
                     return "SUCCESS";
                 }
            }
          
          }
       }
       else
       {
           ResultSet rs= db.DBConnect.GetSearch_Property_city(getCity_name());               
               if(rs==null)
                 {
                 setMsg(getState_name()+"5");   
               return "Failure";
                 }
               else
                 {
                   HttpServletRequest req=ServletActionContext.getRequest();
                   HttpSession ses=req.getSession(true);
                   ServletContext ctx=req.getServletContext();
                   req.setAttribute("rs", rs);
                  // setMsg(getState_name()); 
                     return "SUCCESS";
                 }
       }
     
  }
  return null;
    }


    public String getState_name() {
        return state_name;
    }

    /**
     * @param state_name the state_name to set
     */
    public void setState_name(String state_name) {
        this.state_name = state_name;
    }

    /**
     * @return the city_name
     */
    public String getCity_name() {
        return city_name;
    }

    /**
     * @param city_name the city_name to set
     */
    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    /**
     * @return the start_area_in_feet
     */
    public String getResi_property_type() {
        return resi_property_type;
    }

    /**
     * @param resi_property_type the resi_property_type to set
     */
    public void setResi_property_type(String resi_property_type) {
        this.resi_property_type = resi_property_type;
    }

    /**
     * @return the comm_property_type
     */
    public String getComm_property_type() {
        return comm_property_type;
    }

    /**
     * @param comm_property_type the comm_property_type to set
     */
    public void setComm_property_type(String comm_property_type) {
        this.comm_property_type = comm_property_type;
    }

    public String getPricetype() {
        return pricetype;
    }

    /**
     * @param pricetype the pricetype to set
     */
    public void setPricetype(String pricetype) {
        this.pricetype = pricetype;
    }

    /**
     * @return the start_area_in_feet
     */
    public int getStart_area_in_feet() {
        return start_area_in_feet;
    }

    /**
     * @param start_area_in_feet the start_area_in_feet to set
     */
    public void setStart_area_in_feet(int start_area_in_feet) {
        this.start_area_in_feet = start_area_in_feet;
    }

    /**
     * @return the end_area_in_feet
     */
    public int getEnd_area_in_feet() {
        return end_area_in_feet;
    }

    /**
     * @param end_area_in_feet the end_area_in_feet to set
     */
    public void setEnd_area_in_feet(int end_area_in_feet) {
        this.end_area_in_feet = end_area_in_feet;
    }

    /**
     * @return the number_of_bedroom
     */
    public int getNumber_of_bedroom() {
        return number_of_bedroom;
    }

    /**
     * @param number_of_bedroom the number_of_bedroom to set
     */
    public void setNumber_of_bedroom(int number_of_bedroom) {
        this.number_of_bedroom = number_of_bedroom;
    }

    /**
     * @return the number_of_hall
     */
    public int getNumber_of_hall() {
        return number_of_hall;
    }

    /**
     * @param number_of_hall the number_of_hall to set
     */
    public void setNumber_of_hall(int number_of_hall) {
        this.number_of_hall = number_of_hall;
    }

    /**
     * @return the start_price
     */
    public int getStart_price() {
        return start_price;
    }

    /**
     * @param start_price the start_price to set
     */
    public void setStart_price(int start_price) {
        this.start_price = start_price;
    }

    /**
     * @return the end_price
     */
    public int getEnd_price() {
        return end_price;
    }

    /**
     * @param end_price the end_price to set
     */
    public void setEnd_price(int end_price) {
        this.end_price = end_price;
    }

    
      public void setProperty_type(String property_type) {
        this.property_type = property_type;
    }

    /**
     * @return the property_type
     */
    public String getProperty_type() {
        return property_type;
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
     * @return the cityList
     */
    public List<String> getCityList() {
        return cityList;
    }

    /**
     * @return the prop_category
     */
    public String getProp_category() {
        return prop_category;
    }

    /**
     * @param prop_category the prop_category to set
     */
    public void setProp_category(String prop_category) {
        this.prop_category = prop_category;
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
     * @return the stateList
     */
    public List<String> getStateList() {
        return stateList;
    }

    
    
}