package admin;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;
import org.apache.struts2.ServletActionContext;
public class AddUpdatePropertyLogic extends ActionSupport
{
    private List<Integer> propertyCodeList;
    private List<Integer> cpcList;
    private List<Integer> rpcList;
    private List<String> cList;
    private List<String> rList;
    private int zip;   
    private String proSType;
    private String street;
    private String loc;
    private String state;
    private String city;
    private String parking;
    private String swimpool;
    private String aircon;
    private String lift;
    private String furnished;
    private String proCategory;
    private String proPrice;
    private String proType;
    private String proName;
    private String proImage;
    private String isFreehold;
    private String proFloor;
    private String proStatus;
    private String proDetails;
    private String dateOfReg;
    private String ques;
    private String vote;
    private int rentDur;
    private int floorNo;
    private int nhd;
    private int nbd;
    private int nrd;
    private int nhsd;
    private int nsd;
    private int bedRoom;
    private int bathRoom;
    private int hall;
    private int kitchen;
    private int maxFloor;
    private int propCode;
    private int userId;
    private int proAreafeet;
    private int counter;
    private int cpc;
    private int rpc;
    private int rpf;
    private int cpf;
    private double totPrice;
    private List<String> cityList,stateList;
    private List<Integer> number;
    private List<Integer>rpfList;
    private List<Integer>cpfList;
    private String pType;
    private String msg;
    @Override
    public String execute() throws Exception 
    {
        
        number=db.DBConnect.getNumb();
        cityList = db.DBConnect.getCity();   
        stateList = db.DBConnect.getState();
        propertyCodeList=db.DBConnect.getPropertyCode1();
        cpcList=db.DBConnect.getCommercialPropertyCode();
        rpcList=db.DBConnect.getResidentialPropertyCode();
        rList=db.DBConnect.addResiList();
        cList=db.DBConnect.addComList();
        rpfList=db.DBConnect.getResidentialFeatureCode();
        cpfList=db.DBConnect.getCommercialFeatureCode();
         HttpServletRequest req1=ServletActionContext.getRequest();
         HttpSession ses=req1.getSession(false);
         ServletContext ctx=req1.getServletContext();
         //int s=ses.getAttribute("id").toString();
         if(getCounter()==13)
        {
         String s=db.DBConnect.addOpeningPool("Do you think it's a good time for end users to invest in property?",getVote());
          HttpServletRequest req=ServletActionContext.getRequest();
        HttpSession session=req.getSession();
        session.setAttribute("m",s);
         return "INSERT";
                
        }

        if(ses.getAttribute("id") ==null)
         {
           
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
        int uid=Integer.parseInt((ses.getAttribute("id")).toString());
        if(getCounter()==10)
        {
            if(getpType().equalsIgnoreCase("Residential"))
                return "RESIDENTIAL";
            if(getpType().equalsIgnoreCase("Commercial"))
                return "COMMERCIAL";           
        }
       
        if(getCounter()==1)
        {
            int getprop=db.DBConnect.getPropCode2(uid);
            String m=db.DBConnect.addUpdateProperty("INSERT",getprop,getProCategory(), getProPrice(),getProAreafeet(),getProType(),getProName(),getProImage(),getProDetails(),getFloorNo(),getIsFreehold(),getProStatus(),uid,0,getBedRoom(),getBathRoom(),getHall(),getKitchen(),getMaxFloor(),getProSType());            
            int rpc=db.DBConnect.getRPC();
            HttpServletRequest req=ServletActionContext.getRequest();
            HttpSession session=req.getSession(true);
            session.setAttribute("rpc",rpc);
            int getprop1=db.DBConnect.getPropCode2(uid);
            db.DBConnect.addPropertyAddress("INSERT",0,getprop1,getStreet(),getLoc(),getCity(),getState(),getZip());
            if(getProCategory().equalsIgnoreCase("Sale")||getProCategory().equalsIgnoreCase("Buy"))
            {
              db.DBConnect.addTradingInformation("INSERT",0,getprop1,0,0,0,getTotPrice(),"Available");
            }
            if(getProCategory().equalsIgnoreCase("Rent"))
            {
                db.DBConnect.addRentEntry("INSERT",0,getprop1,getRentDur(),getTotPrice(), 0,0,getTotPrice(),"Available");
            }
            HttpServletRequest req2=ServletActionContext.getRequest();
            req2.setAttribute("m",m);
            return "INSERT";
        } 
        if(getCounter()==11)
        {
            int getprop=db.DBConnect.getPropCode2(uid);            
            String m=db.DBConnect.addUpdateProperty("INSERT",getprop,getProCategory(), getProPrice(),getProAreafeet(),getProType(),getProName(),getProImage(),getProDetails(),getFloorNo(),getIsFreehold(),getProStatus(),uid,0,getBedRoom(),getBathRoom(),getHall(),getKitchen(),getMaxFloor(),getProSType());            
            int getprop1=db.DBConnect.getPropCode2(uid);
            db.DBConnect.addPropertyAddress("INSERT",0,getprop1,getStreet(),getLoc(),getCity(),getState(),getZip());
            if(getProCategory().equalsIgnoreCase("Sale")||getProCategory().equalsIgnoreCase("Buy"))
            {
              db.DBConnect.addTradingInformation("INSERT",0,getprop1,0,0,0,getTotPrice(),"Available");
            }
            if(getProCategory().equalsIgnoreCase("Rent"))
            {
                db.DBConnect.addRentEntry("INSERT",0,getprop1,getRentDur(),getTotPrice(), 0,0,getTotPrice(),"Available");
            }
            HttpServletRequest req=ServletActionContext.getRequest();
            req.setAttribute("m",m);
            return "INSERT";
        } 
        if(getCounter()==12)
        {
            ResultSet rs=db.DBConnect.getDataAll(getPropCode());
            if(rs.next())
            {
                proCategory=rs.getString(1);
               // proPrice=rs.getString(2);
                proAreafeet=rs.getInt(2);
                proType=rs.getString(3);
                proName=rs.getString(4);
               proDetails=rs.getString(10);
             //  street=rs.getString(7);
              
               isFreehold=rs.getString(6);
                proFloor=rs.getString(7);
                dateOfReg=rs.getString(8);
                proStatus=rs.getString(9);
                userId=rs.getInt(11);
            //    maxFloor=rs.getInt(11);
                   
            } 
            HttpServletRequest req=ServletActionContext.getRequest();
            HttpSession session=req.getSession();
            session.setAttribute("id", getPropCode());
             return "VIEW";
            }

        if(getCounter()==2)
        {
            String m=db.DBConnect.addUpdateProperty("UPDATE",getPropCode(), getProCategory(), getProPrice(),getProAreafeet(),getProType(),getProName(),getProImage(),getProDetails(),getFloorNo(),getIsFreehold(),getProStatus(),0,0,getBedRoom(),getBathRoom(),getHall(),getKitchen(),getMaxFloor(),getProSType());            
            HttpServletRequest req=ServletActionContext.getRequest();
            req.setAttribute("m",m);
            return "UPDATE";
        }
        if(getCounter()==3)
        {
          String m=db.DBConnect.deletePropertyInformation(getPropCode()); 
          HttpServletRequest req=ServletActionContext.getRequest();
          req.setAttribute("m",m);
          return "DELETE";
        }
        if(getCounter()==4)
        {
           int cpc=db.DBConnect.getCPC();
           String m=db.DBConnect.aUCPropertyFeature("INSERT",0,cpc,getParking(), getSwimpool(),getAircon(),getBathRoom(),getNhd(),getNbd(),getNrd(),getNhsd());          
            HttpServletRequest req=ServletActionContext.getRequest();
            req.setAttribute("m",m);
            return "INSERT";
        }
        if(getCounter()==5)
        {
            int rpc=db.DBConnect.getRPC();
            String m=db.DBConnect.aURPropertyFeature("INSERT",0,rpc,getParking(),getSwimpool(),getAircon(),getLift(),getFurnished(),getNhd(),getNbd(),getNrd(),getNhsd(),getNsd());
            HttpServletRequest req=ServletActionContext.getRequest();
            req.setAttribute("m",m);
            return "INSERT";
        }
        if(getCounter()==7)
        {
            String m = db.DBConnect.deletePropertyInformation(getPropCode());
            return "DELETE";
        }
        if(getCounter()==6)
        {
        ResultSet rs=db.DBConnect.getAllRPF(getRpf());
        if(rs.next())
        {
            setParking(rs.getString(3));
            setSwimpool(rs.getString(4));
            setAircon(rs.getString(5));
            setLift(rs.getString(6));
            setFurnished(rs.getString(7));
            setNhd(rs.getInt(8));
            setNbd(rs.getInt(9));
            setNrd(rs.getInt(10));
            setNhsd(rs.getInt(11));
            setNsd(rs.getInt(12));
        }
        HttpServletRequest req=ServletActionContext.getRequest();
        HttpSession session=req.getSession();
        session.setAttribute("rpf", getRpf());
        return "DESIGN";
    }
    
    if(getCounter()==9)
    {
          rpfList=db.DBConnect.getResidentialFeatureCode();
         String m=db.DBConnect.aURPropertyFeature("UPDATE",getRpf(),getRpc(),getParking(),getSwimpool(),getAircon(),getLift(),getFurnished(),getNhd(),getNbd(),getNrd(),getNhsd(),getNsd());
            HttpServletRequest req=ServletActionContext.getRequest();
            req.setAttribute("m",m);
            return "UPDATE";
    }
    if(getCounter()==8)
    {
        ResultSet rs=db.DBConnect.getAllCPF(getCpf());
        if(rs.next())
        {
            setParking(rs.getString(3));
            setSwimpool(rs.getString(4));
            setAircon(rs.getString(5));
            setBathRoom(rs.getInt(6));
            setNhd(rs.getInt(7));
            setNbd(rs.getInt(8));
            setNrd(rs.getInt(9));
            setNhsd(rs.getInt(10));
           
        }
        HttpServletRequest req=ServletActionContext.getRequest();
        HttpSession session=req.getSession();
        session.setAttribute("cpf", getCpf());
        return "DESIGN";
    }
     if(getCounter()==9)
    {
          rpfList=db.DBConnect.getCommercialFeatureCode();
          String m=db.DBConnect.aUCPropertyFeature("UPDATE",getCpf(),getCpc(),getParking(),getSwimpool(),getAircon(),getBathRoom(),getNhd(),getNbd(),getNrd(),getNhsd());
          HttpServletRequest req=ServletActionContext.getRequest();
          req.setAttribute("m",m);
          return "UPDATE";
    }
     else
            return "DESIGN";
    
    }

    @Override
    public void validate() 
    {
        try
        {
        number=db.DBConnect.getNumb();
        cityList = db.DBConnect.getCity();   
        stateList = db.DBConnect.getState();
        propertyCodeList=db.DBConnect.getPropertyCode1();
        cpcList=db.DBConnect.getCommercialPropertyCode();
        rpcList=db.DBConnect.getResidentialPropertyCode();
        rList=db.DBConnect.addResiList();
        cList=db.DBConnect.addComList();
        rpfList=db.DBConnect.getResidentialFeatureCode();
        cpfList=db.DBConnect.getCommercialFeatureCode();
        if(getCounter()==1)
        {
            if(proCategory==null) 
             addFieldError("proCategory","Please select the property Category");
            if(getProName().equals(""))
                addFieldError("proName","Plz Enter Property Name");
            if(getStreet().equals(""))
                addFieldError("street","Plz Enter Street Name");
            if(getLoc().equals(""))
                addFieldError("loc","Plz Enter Location"); 
            if(getBedRoom()==0)
               addFieldError("bedRoom","Plz Select No. Of Bedroom");
            if(getBathRoom()==0)
                addFieldError("bathRoom","Plz Select No. Of Bathroom");
            if(getKitchen()==0)
                addFieldError("kitchen","Plz Select No. Of Kitchen");
            if(getHall()==0)
               addFieldError("hall","Plz Select No. Of hall");
              
            if(getProImage()==null)
                addFieldError("proImage","Plz Select Property Image");
            if(getZip()==0)
                addFieldError("zip","Plz Enter Zip Code");
            if(getTotPrice()==0)
                addFieldError("totPrice","Plz Enter Total Price");
            if(getMaxFloor()==0)
                addFieldError("maxFloor","Plz Enter Maximum Floor");
            if(getProAreafeet()==0)
                addFieldError("proAreafeet","Plz Enter Area Feet");
            if(getProDetails().equals(""))
                addFieldError("proDetails","Plz Enter Property Description");
        }
        if(getCounter()==11)
        {
             if(proCategory==null) 
             addFieldError("proCategory","Please select the property Category");
           
            if(getProName().equals(""))
                addFieldError("proName","Plz Enter Property Name");
            if(getStreet().equals(""))
                addFieldError("street","Plz Enter Street Name");
            if(getLoc().equals(""))
                addFieldError("loc","Plz Enter Location"); 
               if(getBathRoom()==0)
                addFieldError("bathRoom","Plz Select No. Of Bathroom");
            if(getProImage()==null)
                addFieldError("proImage","Plz Select Property Image");
           // if(getZip()==0)
           //     addFieldError("zip","Plz Enter Zip Code");
            if(getTotPrice()==0)
                addFieldError("totPrice","Plz Enter Total Price");
            if(getMaxFloor()==0)
                addFieldError("maxFloor","Plz Enter Maximum Floor");
            if(getProAreafeet()==0)
                addFieldError("proAreafeet","Plz Enter Area Feet");
            if(getProDetails().equals(""))
                addFieldError("proDetails","Plz Enter Property Description");
        }

        if(getCounter()==5)
        {
            if(getParking().equalsIgnoreCase("0"))
                addFieldError("parking","please select parking");
            if(getSwimpool().equalsIgnoreCase("0"))
                addFieldError("swimpool","please select swimpool");
            if(getAircon().equalsIgnoreCase("0"))
                addFieldError("aircon","please select aircondition");
            if(getLift().equalsIgnoreCase("0"))
                addFieldError("lift","please select lift");
            if(getFurnished().equalsIgnoreCase("0"))
                addFieldError("furnished","please select furnished");
            if(getNhd()==0)
                addFieldError("nhd","please enter nhd");
            if(getNbd()==0)
                addFieldError("nbd","please enter nbd");
            if(getNrd()==0)
                addFieldError("nfd","please enter nrd");
            if(getNhsd()==0)
                addFieldError("nhsd","please enter nhsd");
            if(getNsd()==0)
                addFieldError("nsd","please enter nsd"); 
        }
        else if(getCounter()==4)
        {
            if(getParking().equalsIgnoreCase("0"))
                addFieldError("parking","please select parking");
            if(getSwimpool().equalsIgnoreCase("0"))
                addFieldError("swimpool","please select swimpool");
            if(getAircon().equalsIgnoreCase("0"))
                addFieldError("aircon","please select aircondition");
            if(getBathRoom()==0)
                addFieldError("bathroom","please select num of bathroom");
            if(getNhd()==0)
                addFieldError("nhd","please enter nhd");
            if(getNbd()==0)
                addFieldError("nbd","please enter nbd");
            if(getNrd()==0)
                addFieldError("nrd","please enter nrd");
            if(getNhsd()==0)
                addFieldError("nhsd","please enter nhsd");
        }

        }
        catch(Exception e){e.toString();}
        
    }
    
    public String getProCategory() {
        return proCategory;
    }
    public void setProCategory(String proCategory) {
        this.proCategory = proCategory;
    }
    public String getProPrice() {
        return proPrice;
    }
    public void setProPrice(String proPrice) {
        this.proPrice = proPrice;
    }
    public String getProType() {
        return proType;
    }
    public void setProType(String proType) {
        this.proType = proType;
    }
    public String getProName() {
        return proName;
    }
    public void setProName(String proName) {
        this.proName = proName;
    }
    public String getProImage() {
        return proImage;
    }
    public void setProImage(String proImage) {
        this.proImage = proImage;
    }
    public String getIsFreehold() {
        return isFreehold;
    }
    public void setIsFreehold(String isFreehold) {
        this.isFreehold = isFreehold;
    }
    public String getProFloor() {
        return proFloor;
    }
    public void setProFloor(String proFloor) {
        this.proFloor = proFloor;
    }
    public String getProStatus() {
        return proStatus;
    }
    public void setProStatus(String proStatus) {
        this.proStatus = proStatus;
    }
    public String getProDetails() {
        return proDetails;
    }
    public void setProDetails(String proDetails) {
        this.proDetails = proDetails;
    }
    public String getDateOfReg() {
        return dateOfReg;
    }
    public void setDateOfReg(String dateOfReg) {
        this.dateOfReg = dateOfReg;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getProAreafeet() {
        return proAreafeet;
    }
    public void setProAreafeet(int proAreafeet) {
        this.proAreafeet = proAreafeet;
    }
    public int getCounter() {
        return counter;
    }
    public void setCounter(int counter) {
        this.counter = counter;
    }
   
    public List<Integer> getPropertyCodeList() {
        return propertyCodeList;
    }
    public int getPropCode() {
        return propCode;
    }

    public void setPropCode(int propCode) {
        this.propCode = propCode;
    }

    public int getBedRoom() {
        return bedRoom;
    }
    public void setBedRoom(int bedRoom) {
        this.bedRoom = bedRoom;
    }
    public int getBathRoom() {
        return bathRoom;
    }
    public void setBathRoom(int bathRoom) {
        this.bathRoom = bathRoom;
    }
    public int getHall() {
        return hall;
    }
    public void setHall(int hall) {
        this.hall = hall;
    }
    public int getKitchen() {
        return kitchen;
    }
    public void setKitchen(int kitchen) {
        this.kitchen = kitchen;
    }
    public int getMaxFloor() {
        return maxFloor;
    }
    public void setMaxFloor(int maxFloor) {
        this.maxFloor = maxFloor;
    }
    public String getParking() {
        return parking;
    }
    public void setParking(String parking) {
        this.parking = parking;
    }
    public String getSwimpool() {
        return swimpool;
    }
    public void setSwimpool(String swimpool) {
        this.swimpool = swimpool;
    }
    public String getAircon() {
        return aircon;
    }
    public void setAircon(String aircon) {
        this.aircon = aircon;
    }
    public String getLift() {
        return lift;
    }
    public void setLift(String lift) {
        this.lift = lift;
    }
    public String getFurnished() {
        return furnished;
    }
    public void setFurnished(String furnished) {
        this.furnished = furnished;
    }
    public List<Integer> getCpcList() {
        return cpcList;
    }
    public void setCpcList(List<Integer> cpcList) {
        this.cpcList = cpcList;
    }
    public int getCpc() {
        return cpc;
    }
    public void setCpc(int cpc) {
        this.cpc = cpc;
    }
    public void setNhd(int nhd) {
        this.nhd = nhd;
    }
    public void setNbd(int nbd) {
        this.nbd = nbd;
    }
    public void setNrd(int nrd) {
        this.nrd = nrd;
    }
    public void setNhsd(int nhsd) {
        this.nhsd = nhsd;
    }
    public void setNsd(int nsd) {
        this.nsd = nsd;
    }
    public int getNhd() {
        return nhd;
    }
    public int getNbd() {
        return nbd;
    }
    public int getNrd() {
        return nrd;
    }
    public int getNhsd() {
        return nhsd;
    }
    public int getNsd() {
        return nsd;
    }
    public List<Integer> getRpcList() {
        return rpcList;
    }

    public int getRpc() {
        return rpc;
    }
    public void setRpc(int rpc) {
        this.rpc = rpc;
    }
    public int getZip() {
        return zip;
    }
    public void setZip(int zip) {
        this.zip = zip;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getLoc() {
        return loc;
    }
    public void setLoc(String loc) {
        this.loc = loc;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public double getTotPrice() {
        return totPrice;
    }
    public void setTotPrice(double totPrice) {
        this.totPrice = totPrice;
    }
    public List<String> getStateList() {
        return stateList;
    }
    public List<String> getCityList() {
        return cityList;
    }
    public List<Integer> getNumber() {
        return number;
    }
    public int getFloorNo() {
        return floorNo;
    }
    public void setFloorNo(int floorNo) {
        this.floorNo = floorNo;
    }
    public String getProSType() {
        return proSType;
    }
    public void setProSType(String proSType) {
        this.proSType = proSType;
    }
    public List<String> getcList() {
        return cList;
    }
    public List<String> getrList() {
        return rList;
    }
    public int getRentDur() {
        return rentDur;
    }
    public void setRentDur(int rentDur) {
        this.rentDur = rentDur;
    }

    /**
     * @return the pType
     */
    public String getpType() {
        return pType;
    }

    /**
     * @param pType the pType to set
     */
    public void setpType(String pType) {
        this.pType = pType;
    }

    /**
     * @return the rpfList
     */
    public List<Integer> getRpfList() {
        return rpfList;
    }

    /**
     * @return the rpf
     */
    public int getRpf() {
        return rpf;
    }

    /**
     * @param rpf the rpf to set
     */
    public void setRpf(int rpf) {
        this.rpf = rpf;
    }

    /**
     * @return the cpfList
     */
    public List<Integer> getCpfList() {
        return cpfList;
    }

    /**
     * @return the cpf
     */
    public int getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(int cpf) {
        this.cpf = cpf;
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
     * @return the ques
     */
    public String getQues() {
        return ques;
    }

    /**
     * @param ques the ques to set
     */
    public void setQues(String ques) {
        this.ques = ques;
    }

    /**
     * @return the vote
     */
    public String getVote() {
        return vote;
    }

    /**
     * @param vote the vote to set
     */
    public void setVote(String vote) {
        this.vote = vote;
    }
   
}