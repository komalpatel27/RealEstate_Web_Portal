package db;
import java.io.File;
import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
public class DBConnect
{
    static CallableStatement cs;
    static ResultSet rs,rs1;
    static public Connection connect() throws Exception
  {
      Class.forName("com.mysql.jdbc.Driver");
      return DriverManager.getConnection("jdbc:mysql://localhost:3306/yuvitech1","root","");      
  }
  public static String addUpdateProperty(String op,int prop_code,String prop_category,String prop_price_type,int prop_area_feet,String prop_type,String prop_name,String prop_image,String prop_details,int prop_floor,String isfreehold,String status,int userId,int rpc,int bedroom,int bathroom,int hall,int kitchen,int mfloor,String prosubtype) throws Exception
  {
        cs=connect().prepareCall("{call proAddUpdateInformation_property(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        File f =new File(prop_image);
        FileInputStream fi=new FileInputStream(prop_image);
        cs.setString(1, op);
        cs.setInt(2, prop_code);
        cs.setString(3, prop_category);
        cs.setString(4, prop_price_type);
        cs.setInt(5,prop_area_feet);
        cs.setString(6,prop_type);
        cs.setString(7, prop_name);
        cs.setBinaryStream(8, fi,(int)f.length());
        cs.setString(9,prop_details);
        cs.setInt(10,prop_floor);
        cs.setString(11, isfreehold);
        //cs.setString(12,reg_date);
        cs.setString(12, status);
        cs.setInt(13, userId);
        cs.setInt(14, rpc);
        cs.setInt(15, bedroom);
        cs.setInt(16,bathroom);
        cs.setInt(17,hall);
        cs.setInt(18, kitchen);
        cs.setInt(19,mfloor);
        cs.setString(20,prosubtype);
        cs.registerOutParameter(21,Types.VARCHAR);
        cs.execute();
         return cs.getString(21);      
  }
  public static String addOpeningPool(String ques,String ans)throws Exception
  {
           cs=connect().prepareCall("{call proAddOpening_Pool(?,?,?)}");
           cs.setString(1, ques);
           cs.setString(2, ans);
           cs.registerOutParameter(3,Types.VARCHAR); 
           cs.execute();
           return cs.getString(3);
   }
public static ResultSet getSPhoto(int pCode) throws Exception
{
    return connect().createStatement().executeQuery("select property_image from tblproperty_information where property_code="+pCode);
}
  public static ResultSet getDataAll(int pCode)throws Exception
   {
      cs=connect().prepareCall("{call proGetAll(?)}");
      cs.setInt(1,pCode);
      return cs.executeQuery();
   }
  public static ResultSet getPhoto1(int i) throws Exception
  {
           cs=connect().prepareCall("{call proGetPPhoto(?,?)}");
           cs.setInt(1,i);
           cs.registerOutParameter(2, Types.VARCHAR);
           return cs.executeQuery();
   }
  
  public static int getRPC()throws Exception
  {
      int a=0;
      ResultSet rs=connect().createStatement().executeQuery("select max(RESIDENTIAL_PROPERTY_CODE) from tblresidential_property");
      if(rs.next())
          a=rs.getInt(1);
      return a;
  }
  public static int getCPC()throws Exception
  {
      int a=0;
      ResultSet rs=connect().createStatement().executeQuery("select max(COMMERCIAL_PROPERTY_CODE) from tblcommercial_property");
      if(rs.next())
          a=rs.getInt(1);
      return a;
  }
  public static ResultSet getPropImage(int id) throws Exception
    {
        return connect().createStatement().executeQuery("select property_image from tblproperty_information where property_code="+id);
    }
  public static int getPropCode2(int userId)throws Exception
  {
          
            cs=connect().prepareCall("{call getPropInfoCode(?,?)}");
            cs.setInt(1, userId);
            cs.registerOutParameter(2,Types.INTEGER);
            cs.execute();
            return cs.getInt(2);
            
  }

  public static void addPropertyAddress(String op,int pac,int pc,String street,String loc,String city,String state,int zip) throws Exception
  {
      cs=connect().prepareCall("{call proAddUpdateAddress(?,?,?,?,?,?,?,?)}");
      cs.setString(1, op);
      cs.setInt(2, pac);
      cs.setInt(3, pc);
      cs.setString(4, street);
      cs.setString(5,loc);
      cs.setString(6,city);
      cs.setString(7, state);
      cs.setInt(8, zip);
      cs.execute();      
     
  }
  public static ResultSet getEmail() throws Exception
  {
      cs=connect().prepareCall("{call getEmailId()}");
      return cs.executeQuery();
  }
  public static void addTradingInformation(String op,int ptc,int pc,double vrp,double bup,double asp,double vtp,String status)throws Exception
  {
      cs=connect().prepareCall("{call proAddUpdatePropertyTrading(?,?,?,?,?,?,?,?)}");
      cs.setString(1,op);
      cs.setInt(2, ptc);
      cs.setInt(3, pc);
      cs.setDouble(4,vrp);
      cs.setDouble(5,bup);
      cs.setDouble(6,asp);      
      cs.setDouble(7, vtp);
      cs.setString(8,status);
      cs.execute();
  }
  public static void addRentEntry(String op,int prc,int pc,int duration,double vrp,double bop,double arp,double vtp,String status)throws Exception
  {
      cs=connect().prepareCall("{call proAddUpdateRental(?,?,?,?,?,?,?,?,?)}");
      cs.setString(1,op);
      cs.setInt(2, prc);
      cs.setInt(3, pc);
      cs.setInt(4,duration);
      cs.setDouble(5,vrp);
      cs.setDouble(6,bop);      
      cs.setDouble(7, arp);
      cs.setDouble(8,vtp);
      cs.setString(9,status);
      cs.execute();
  }
   public static ResultSet getPropList() throws Exception
  {
      cs= connect().prepareCall("{call getProList()}");
      rs = cs.executeQuery();
      return rs;
  }
  public static ResultSet getCommPropFeature() throws Exception
  {
      cs= connect().prepareCall("{call getProCommFeature()}");
      rs = cs.executeQuery();
      return rs;
  }
  public static ResultSet getResPropFeature() throws Exception
  {
      cs= connect().prepareCall("{call getProResiFeature()}");
      rs = cs.executeQuery();
      return rs;
  }
 public static ResultSet getAllRPF(int rfc)throws Exception
  {
      cs=connect().prepareCall("{call progetRFC(?)}");  
      cs.setInt(1, rfc);
       return cs.executeQuery(); 
  }

  
  public static List<Integer> getResidentialFeatureCode() throws Exception
  {
      List<Integer> li=new ArrayList<Integer>();
  ResultSet rs= connect().createStatement().executeQuery("select residential_feature_code from tblfeature_residential order by 1");
      while(rs.next())
      {
          li.add(rs.getInt(1));
          
      }
      return li;
  }
  public static ResultSet getAllCPF(int cfc)throws Exception
  {
      cs=connect().prepareCall("{call progetCFC(?)}");  
      cs.setInt(1, cfc);
       return cs.executeQuery(); 
  }

 public static List<Integer> getCommercialFeatureCode() throws Exception
  {
      List<Integer> li=new ArrayList<Integer>();
  ResultSet rs= connect().createStatement().executeQuery("select commercial_feature_code from tblfeature_Commercial order by 1");
      while(rs.next())
      {
          li.add(rs.getInt(1));
          
      }
      return li;
  }

  public static List<Integer> getPropertyCode1()throws Exception
        {
            List<Integer> list =new ArrayList<Integer>();
            cs =connect().prepareCall("{call proGetPropertyCode()}");
            ResultSet rs=cs.executeQuery();
            while(rs.next())
                list.add(rs.getInt(1));
            return list;
        }
    public static List<Integer> getResidentialPropertyCode()throws Exception
        {
            List<Integer> list =new ArrayList<Integer>();
            cs =connect().prepareCall("{call proGetResidentialPropertyCode()}");
            ResultSet rs=cs.executeQuery();
            while(rs.next())
                list.add(rs.getInt(1));
            return list;
        }
    public static ResultSet upcomingproject()throws Exception
    {
        cs= connect().prepareCall("{call pro_upcomming(?)}");
      return cs.executeQuery();
    }
            
    public static List<Integer> getCommercialPropertyCode()throws Exception
    {
            List<Integer> list =new ArrayList<Integer>();
            cs =connect().prepareCall("{call proGetCommercialPropertyCode()}");
            ResultSet rs=cs.executeQuery();
            while(rs.next())
                list.add(rs.getInt(1));
            return list;
    }
  public static String aURPropertyFeature(String op,int rfc,int rpc,String parking,String spool,String ac,String lift,String furnished,int hd,int bd,int rd,int hpd,int sd)
  {
      try
      {
          cs=connect().prepareCall("{call proAddUpdateResidentialProp_Feature(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
          cs.setString(1, op);
          cs.setInt(2, rfc);
          cs.setInt(3, rpc);
          cs.setString(4,parking);
          cs.setString(5, spool);
          cs.setString(6, ac);
          cs.setString(7,lift);
          cs.setString(8, furnished);
          cs.setInt(9, hd);
          cs.setInt(10, bd);
          cs.setInt(11, rd);
          cs.setInt(12, hpd);
          cs.setInt(13, sd);
          cs.registerOutParameter(14,Types.VARCHAR);
          cs.execute();
          return cs.getString(14);
          
      }
      catch(Exception ex){return ex.toString();}
  }
    public static String aUCPropertyFeature(String op,int cfc, int cpc,String parking,String spool,String ac,int bathroom,int hd,int bd,int rd,int hpd)
  {
      try
      {
          cs=connect().prepareCall("{call proAddUpdateCommercialProp_Feature(?,?,?,?,?,?,?,?,?,?,?,?)}");
          cs.setString(1,op);
          cs.setInt(2,cfc);
          cs.setInt(3, cpc);
          cs.setString(4,parking);
          cs.setString(5, spool);
          cs.setString(6, ac);
          cs.setInt(7, bathroom);
          cs.setInt(8, hd);
          cs.setInt(9, bd);
          cs.setInt(10, rd);
          cs.setInt(11, hpd);
          cs.registerOutParameter(12,Types.VARCHAR);
          cs.execute();
          return cs.getString(12);
          
      }
      catch(Exception ex){return ex.toString();}
  }
  public static String deletePropertyInformation(int propCode)
  {
      try
      {
          cs=connect().prepareCall("{call proDeleteProp_Information(?,?)}");
          cs.setInt(1, propCode);
          cs.registerOutParameter(2,Types.VARCHAR);
          cs.execute();
          return cs.getString(2);
      }
      catch(Exception ex){return ex.toString();}
  }
  public static String addUser (String op,String pass,int uid,String ustatus,String cname,String ctype,String email, String sq1,String sa1, String dob,String addr,String state,String cntry,int pin,String city,String stdcd,String lndline,String mbl)
  {
    try
    {
      cs = connect().prepareCall("{call pro_add_client_per_det(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
      cs.setString(1, op);
      cs.setString(2, pass);
      cs.setInt(3, uid);
      cs.setString(4, ustatus);
      cs.setString(5, cname);
      cs.setString(6, ctype);
      cs.setString(7, email);
      cs.setString(8, sq1);
      cs.setString(9, sa1);
      cs.setString(10, dob);
      cs.setString(11, addr);
      cs.setString(12, state);
      cs.setString(13, cntry);
      cs.setInt(14, pin);
      cs.setString(15, city);
      cs.setString(16, stdcd);
      cs.setString(17, lndline);
      cs.setString(18, mbl);
      cs.registerOutParameter(19,Types.VARCHAR);
      cs.execute();
      return cs.getString(19);
    }catch(Exception ex) { return ex.getMessage(); }
  }
 public static String getCode(String e) 
  {
    try
    {
         cs = connect().prepareCall("{call pro_get_vcode(?,?)}");
         cs.setString(1, e);
        cs.registerOutParameter(2, Types.VARCHAR);
        cs.executeQuery();
        return cs.getString(2);
    } catch(Exception ex){return ex.getMessage(); }
   
  }

  public static List<String> getCity() 
  {
    List<String> ar = new ArrayList<String>();
    try
    {
      ResultSet rs = connect().createStatement().executeQuery("select * from tblcity order by 1");
      while(rs.next())
      {
        ar.add(rs.getString(1));
      }
    } catch(Exception ex){ ar.add(ex.getMessage()); }
    return ar;
  }
   public static List<String> getState() 
  {
    List<String> ar = new ArrayList<String>();
    try
    {
      ResultSet rs = connect().createStatement().executeQuery("select * from tblstate order by 1");
      while(rs.next())
      {
        ar.add(rs.getString(1));
      }
    } catch(Exception ex){ ar.add(ex.getMessage()); }
    return ar;
  }

   public static String updStatus(String email) 
  {
    try
    {
          cs = connect().prepareCall("{call upd_status(?,?)}");
          cs.setString(1, email);
        cs.registerOutParameter(2, Types.VARCHAR);
        cs.executeQuery();
        return cs.getString(2);
       
    } catch(Exception ex){ return ex.getMessage(); }
  }
    
 public static String getQuestion(String email)
   {
     try
      {
          cs = connect().prepareCall("{call pro_getSq(?,?)}");
          cs.setString(1, email);
          cs.registerOutParameter(2, Types.VARCHAR);
          cs.executeQuery();
          return cs.getString(2);
       
       } catch(Exception ex){ return ex.getMessage(); }
   }
 public static String getAns(String email)
   {
     try
      {
          cs = connect().prepareCall("{call pro_getSa(?,?)}");
          cs.setString(1, email);
          
          cs.registerOutParameter(2, Types.VARCHAR);
          cs.executeQuery();
          return cs.getString(2);
       
       } catch(Exception ex){ return ex.getMessage(); }
   }
 
    public static String changePass(String email,String op,String np)
      {
          try
          {
           cs = connect().prepareCall("{call pro_cpass(?,?,?,?)}");
           cs.setString(1, email);
           cs.setString(2, op);
           cs.setString(3, np);
           cs.registerOutParameter(4, Types.VARCHAR);
           cs.executeQuery();
           return cs.getString(4);
          } catch(Exception ex){ return ex.getMessage(); }
                
       }    
      public static String feedBack(String name,int u,String email,String mob,String msg )
      {
          try
          {
           cs = connect().prepareCall("{call  Pro_add_feedback(?,?,?,?,?,?)}");
           cs.setString(1,name);
           cs.setInt(2, u);
           cs.setString(3, email);
           cs.setString(4, mob);
           cs.setString(5, msg);
           cs.registerOutParameter(6, Types.VARCHAR);
           cs.executeQuery();
           return cs.getString(6);
          } catch(Exception ex){ return ex.getMessage(); }
                
       }
                
      public static String complaint(String op,String name,int u,String cmsg,String cstatus,String rdate )
      {
        try
        {
           cs = connect().prepareCall("{call pro_complaint(?,?,?,?,?,?,?)}");
           cs.setString(1, op);           
           cs.setInt(2,u);
           cs.setString(3, name);
           cs.setString(4, cmsg);
           cs.setString(5, cstatus);
           cs.setString(6, rdate);
           cs.registerOutParameter(7, Types.VARCHAR);
           cs.executeQuery();
           return cs.getString(7);
        } catch(Exception ex){ return ex.getMessage(); }  
      }
      public static String checkId(String email,String pass)
      {
          try
          {
           cs = connect().prepareCall("{call pro_checkId(?,?,?)}");
           cs.setString(1, email);
           cs.setString(2, pass);
           cs.registerOutParameter(3, Types.VARCHAR);
           cs.executeQuery();
           return cs.getString(3);
          } catch(Exception ex){ return ex.getMessage(); }
                
       }
    public static String getPass(String email)
   {
     try
      {
          cs = connect().prepareCall("{call pro_fpass(?,?)}");
          cs.setString(1, email);
          cs.registerOutParameter(2, Types.VARCHAR);
          cs.executeQuery();
          return cs.getString(2);
       
       } catch(Exception ex){ return ex.getMessage(); }
   }

    
     public static String secUpdate( int uid ,String email ,String pass ,String sq,String sa)
   {
     try
      {
          cs = connect().prepareCall("{call pro_up_security(?,?,?,?,?,?)}");
          cs.setInt(1, uid);
          cs.setString(2,email);
          cs.setString(3,pass);
          cs.setString(4,sq);
          cs.setString(5,sa);
          cs.registerOutParameter(6, Types.VARCHAR);
          cs.executeQuery();
          return cs.getString(6);
       
       } catch(Exception ex){ return ex.getMessage(); }
   }
     public static ResultSet getCityL(String x) 
   {
     try
     {
       cs = connect().prepareCall("{call getCity(?)}");
       cs.setString(1,x);
       return cs.executeQuery();
     }catch(Exception ex){ return null;}
   }
     public static List<Integer> getNumb()
    {
        List<Integer> LN=new ArrayList<Integer>();
        for(int i=0;i<10;i++)
        {
            LN.add(i);
        }
        return LN;
        
    }
     public static int getUserid(String x) 
       {
       try
        {
        cs = connect().prepareCall("{call pro_getUserid(?,?)}");
        cs.setString(1,x);
        cs.registerOutParameter(2, Types.VARCHAR);
        cs.executeQuery();
        return cs.getInt(2);
        }catch(Exception ex){ }
        return 0;
   }
       public static ResultSet getSData(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" select EMAIL,PASSWORD,S_QUESTION,S_ANSWER FROM TBLLOGIN WHERE USER_ID="+u);
        }
     public static ResultSet getPData(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" select CLIENT_NAME,CLIENT_TYPE,DOB FROM TBLCLIENT_PERSONAL_DETAILS WHERE USER_ID="+u);
        }
 public static ResultSet getPData1(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" select STD_CODE,LANDLINE_NO,MOBILE_NO FROM TBLCLIENT_PHONE_DETAILS WHERE USER_ID="+u);
        }

 public static ResultSet getPData2(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" select ADDRESS,CITY,STATE,COUNTRY,PIN FROM TBLCLIENT_ADDRESS_DETAILS WHERE USER_ID="+u);
        }
 public static ResultSet getCstatus(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" select COMPLAINT_STATUS FROM tblcomplaint_details WHERE USER_ID="+u);
        }
 public static ResultSet getCtype(int u)  throws Exception
       {
       return connect().createStatement().executeQuery(" SELECT CLIENT_TYPE FROM tbllogin WHERE USER_ID="+u);
        }

 
  public static String Pupdate (int uid,String cname,String dob,String clt  ,String addr,String state,String city,int pin,String cntry,String stdcd,String lndline,String mbl )
  {
    try
    {
      cs = connect().prepareCall("{call pro_up_per_details(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
      cs.setInt(1, uid);
      cs.setString(2, cname);
      cs.setString(3, dob);
      cs.setString(4, clt);
      cs.setString(5, addr);
      cs.setString(6, state);
      cs.setString(7, city);
      cs.setInt(8, pin);
      cs.setString(9, cntry);
      cs.setString(10, stdcd);
      cs.setString(11, lndline);
      cs.setString(12, mbl);
      cs.registerOutParameter(13,Types.VARCHAR);
      cs.execute();
      return cs.getString(13);
    }catch(Exception ex) { return ex.getMessage(); }
  } 
  //offer & Scheme
  public static List<Integer> getListoffer_scheme()
  {
      List<Integer> oidList = new ArrayList<Integer>();
      try
      {
        ResultSet rs = connect().createStatement().executeQuery("select * from tbloffer_scheme");
        while(rs.next())
        {
            oidList.add(rs.getInt(1));
        }
            return oidList;
      }
      catch(Exception ex) {return null;}
      
  }
 
  public static String AUoffer_scheme(String op,int oid,String prop_name,String prop_type,String rdate,String sdate,String edate,String st,String dis_count,String img)throws Exception
  {
          cs=connect().prepareCall("{call proAUoffer_scheme(?,?,?,?,?,?,?,?,?,?,?)}");
          File f = new File(img);
          FileInputStream r = new FileInputStream(img);
          cs.setString(1, op);
          cs.setInt(2, oid);
          cs.setString(3,prop_name);
          cs.setString(4,prop_type);
          cs.setString(5,rdate);
          cs.setString(6,sdate);
          cs.setString(7,edate);
          cs.setString(8,st);
          cs.setString(9,dis_count);
          cs.setBinaryStream(10,r,(int)f.length());
          cs.registerOutParameter(11,Types.VARCHAR);
          cs.execute();
          return cs.getString(11);      
  }
 
  public static String Deloffer_scheme(int oid)throws Exception
  {
          cs=connect().prepareCall("{call proDeloffer_scheme(?,?)}");
          cs.setInt(1, oid);
          cs.registerOutParameter(2,Types.VARCHAR);
          cs.execute();
          return cs.getString(2);     
  }
 /* public static String updateoffer_scheme(String op,int oid,String prop_name,String prop_type,String rdate,String sdate,String edate,String st,String dis_count,String img)throws Exception
  {
          connect().prepareCall("{call proAUoffer_scheme(?,?,?,?,?,?,?,?,?,?,?)}");
          File f = new File(img);
          FileInputStream r = new FileInputStream(img);
          cs.setString(1, op);
          cs.setInt(2,oid);
          cs.setString(3,prop_name);
          cs.setString(4,prop_type);
          cs.setString(5,rdate);
          cs.setString(6,sdate);
          cs.setString(7,edate);
          cs.setString(8,st);
          cs.setString(9,dis_count);          
          cs.setBinaryStream(10,r,(int)f.length());
          cs.registerOutParameter(11,Types.VARCHAR);
          cs.execute();
          return cs.getString(11);     
  }*/
  public static ResultSet getPhotooffer_scheme(int oid)throws Exception
   {
           CallableStatement cs = connect().prepareCall("{call proGetPhoto(?)}");
           cs.setInt(1,oid);
           return cs.executeQuery();      
   }
  public static ResultSet getDataoffer_scheme(int oid)throws Exception
   {
           CallableStatement cs = connect().prepareCall("{call proGetData(?)}");
           cs.setInt(1,oid);
           return cs.executeQuery();
      
   }
  public static String getName(int  u)throws Exception
   {
          cs = connect().prepareCall("{call proget_name(?,?)}");
          cs.setInt(1, u);
          cs.registerOutParameter(2, Types.VARCHAR);
          cs.executeQuery();
          return cs.getString(2);
   }

  public static List<String> addComList()
    {
        
        List<String> CL=new ArrayList<String>();
        try
        {
          String CList[]={"Office in It Park","Commercial Land","Commercial Office Space","Commercial Shop","Commercial Showroom","Kiosik","Hotel","Hotel Sites","Guest House","Business Center","Wherehouse/Godown","Industrial Land","Industrial Building","Industrial Shed"};
            for(String ar : CList)
            {
               CL.add(ar);
            }
           return CL;  
        }catch(Exception e){ return null;}
             
    }
     public static List<String> addResiList()
    {
        
        List<String> RL=new ArrayList<String>();
        try
        {
          String RList[]={"Residential Plot","Residential House","MultiStorey Apartment","Builder Floor Apartment","Service Apartment","Villa","Holiday Home"};
            for(String ar : RList)
            {
               RL.add(ar);
            }
           return RL;  
        }catch(Exception e){ return null;}
             
    }
     //offer & scheme
    
   public static ResultSet getOfferScheme() throws Exception
    {
        return connect().createStatement().executeQuery("select * from tbloffer_scheme order by 1");
    }
   public static String proAUofferscheme(String op,int i,String prop_name,String prop_type,String rdate,String sdate,String edate,String st,String dis_count,String image)throws Exception
   {
        cs=connect().prepareCall("{call proAUoffer_scheme(?,?,?,?,?,?,?,?,?,?,?)}");
      if(image!=null) 
      {
          File f = new File(image);     
          FileInputStream r = new FileInputStream(image);
          cs.setBinaryStream(10,r,(int)f.length());
          return "Error";
      }
      else
      {
        cs.setString(10, image);
        cs.setString(1,op);
        cs.setInt(2,i);
        cs.setString(3,prop_name);
        cs.setString(4,prop_type);
        cs.setString(5,rdate);
        cs.setString(6,sdate);
        cs.setString(7,edate);
        cs.setString(8,st);
        cs.setString(9,dis_count);      
        cs.registerOutParameter(11,Types.VARCHAR);
        cs.execute();   
        return cs.getString(11);
     }
      
   }
   public static List<Integer> getlist()
    {
        List<Integer> idlist=new ArrayList<Integer>();
        try
        {
           ResultSet rs=connect().createStatement().executeQuery("select offrId from tblofferscheme order by 1 ");
           while(rs.next())
           {
               idlist.add(rs.getInt(1));
           }
        }
        catch(Exception ex){}
        return idlist;
    }
   
  public static ResultSet getPhoto(int i) throws Exception
   {
           cs=connect().prepareCall("{call proGetPhoto(?,?)}");
           cs.setInt(1,i);
           cs.registerOutParameter(2, Types.VARCHAR);
           return cs.executeQuery();
   }
   public static ResultSet getOffr(int i) throws Exception
   {
     ResultSet rs= connect().createStatement().executeQuery("select prptyName,prptyType,regsDate,startDate,endDate,stats,disc,offrId  from tblofferscheme where offrId ="+i);
     return rs;
   }
     //getAll Data for ajax
    public static ResultSet getAlldata1(int i) throws Exception
    {            
     ResultSet rs= connect().createStatement().executeQuery("select OFFER_ID ,PROPERTY_NAME ,PROPERTY_TYPE ,REGISTER_DATE,START_DATE ,END_DATE ,STATUS ,DISCOUNT,IMAGE   from tbloffer_scheme where OFFER_ID="+i);
     return rs;
    }
  
      public static ResultSet getAlldata() throws Exception
    {            
     ResultSet rs= connect().createStatement().executeQuery("select offrId , prptyName ,prptyType ,regsDate ,startDate ,endDate ,stats ,disc ,img  from tblofferscheme ");
     return rs;
    }
    //insert into tblofferscheme values(i,prop_name,prop_type,regsdate=sysdate(),sdate,edate,st,dis_count,imge);
    public static String delOffr(int i) throws Exception
    {
      int x =connect().createStatement().executeUpdate("delete from tblOfferScheme where offrId="+i);
      return x+". Record No."+i+" Deleted";
    }
    // COMPANY MODULE
    public static String addupdatecompany(String op,int comp_id,String nm,String addr,String cpn,String cpmob,String cpmid,int uid )
{
    try
    {
    cs=connect().prepareCall("{call proAddUpdatecompany(?,?,?,?,?,?,?,?,?)}");
    cs.setString(1,op);
    cs.setInt(2,comp_id);
    cs.setString(3,nm);
    cs.setString(4,addr);
    cs.setString(5,cpn);
    cs.setString(6,cpmob);
    cs.setString(7,cpmid);
    cs.setInt(8,uid);
    cs.registerOutParameter(9,Types.VARCHAR);
    cs.execute();
    return cs.getString(9);
    }catch(Exception ex){return ex.toString();}
}
public static ResultSet getcompany()throws Exception
 {
   
 cs=connect().prepareCall("{call progetCompany()}");
 return cs.executeQuery();
 
 }
public static ResultSet getcompany1(int compid)throws Exception
 {
   
 cs=connect().prepareCall("{call progetCompany1(?)}");
 cs.setInt(1, compid);
 return cs.executeQuery();
 
 }

public static List<Integer> getList()
 {
 
  List<Integer> complist=new ArrayList<Integer>();
   try{
    ResultSet rs=connect().createStatement().executeQuery("select company_id from tblcompany order by 1"); 
    while(rs.next())
        complist.add(rs.getInt(1));
   }catch(Exception ex){ex.toString();}
return complist; 
 }
public static String delcompany(int comp_id)
 {
    try
    {
   
      cs=connect().prepareCall("{call proDeletecompany(?,?)}");
      cs.setInt(1,comp_id);
      cs.registerOutParameter(2,Types.VARCHAR);
      cs.execute();
      return cs.getString(2);
    }catch(Exception ex){return ex.toString();} 
 }
// search & Filter Module
   public static ResultSet GetSearch_Property_remState1 
            ( int start_price,
                int end_price,
               String state_name1,
                int badroom1,
                
               int  start_property_area_feet1,
                int end_property_area_feet1,
                String property_type1 ,
                 String pricetype ,
                String property_category)
         {
    try
    {
      cs = connect().prepareCall("{call proSearch_Property_remState1(?,?,?,?,?,?,?,?,?,?)}");
      cs.setInt(1, start_price);
      cs.setInt(2, end_price);
      cs.setString(3,state_name1);
      cs.setInt(4, badroom1);
      
      cs.setInt(5, start_property_area_feet1);
      cs.setInt(6, end_property_area_feet1);
      cs.setString(7, property_type1);
      cs.setString(8, pricetype);
      cs.setString(9,property_category );
      cs.registerOutParameter(10,Types.VARCHAR);
      rs = cs.executeQuery();
      if(cs.getString(10)!=null)
          return rs;
      else
          return null;
     
    }catch(Exception ex) {}
       // return null;
        return null;
  } 
   public static ResultSet GetSearch_Property_city( String city_name1)
   {
    try
    {
      cs = connect().prepareCall("{call proSearch_Property_city(?,?)}");
      cs.setString(1, city_name1);
      cs.registerOutParameter(2,Types.VARCHAR);
      rs = cs.executeQuery();
      if(cs.getString(2)!=null)
          return rs;
      else
          return null;
     
    }catch(Exception ex) {}
       // return null;
        return null;
  }
   public static ResultSet GetSearch_Property_Location( String Location,String city_name1)
   {
    try
    {
      cs = connect().prepareCall("{call proSearch_Property_Location(?,?,?)}");
      cs.setString(1, Location);
      cs.setString(2, city_name1);
      cs.registerOutParameter(3,Types.VARCHAR);
      rs = cs.executeQuery();
      if(cs.getString(3)!=null)
          return rs;
      else
          return null;
     
    }catch(Exception ex) {}
       // return null;
        return null;
  }
     
 public static ResultSet GetSearch_Property_remCS 
            ( int start_price,
               int end_price,
              int badroom1,
            
               int  start_property_area_feet1,
                int end_property_area_feet1,
                String property_type1 ,
                 String pricetype ,
                String property_category)
         {
    try
    {
      cs = connect().prepareCall("{call proSearch_Property_remCS(?,?,?,?,?,?,?,?,?)}");
      cs.setInt(1, start_price);
      cs.setInt(2, end_price);
     
      cs.setInt(3, badroom1);
      
      cs.setInt(4, start_property_area_feet1);
      cs.setInt(5, end_property_area_feet1);
      cs.setString(6, property_type1);
      cs.setString(7, pricetype);
      cs.setString(8,property_category );
          cs.registerOutParameter(9,Types.VARCHAR);
      rs=cs.executeQuery();
      if(cs.getString(9)!=null)
          return rs;
      else
          return null;
     
    }catch(Exception ex) {  }
        return null;
  } 

 public static ResultSet GetSearch_Property 
            ( int start_price,
                int end_price,
               String state_name1,
               String city_name1,
                int badroom1,
              
               int  start_property_area_feet1,
                int end_property_area_feet1,
                String property_type1 ,
                 String pricetype ,
                String property_category)
         {
    try
    {
      cs = connect().prepareCall("{call proSearch_Property(?,?,?,?,?,?,?,?,?,?,?)}");
      cs.setInt(1, start_price);
      cs.setInt(2, end_price);
      cs.setString(3,state_name1);
      cs.setString(4,city_name1);
      cs.setInt(5, badroom1);
     
      cs.setInt(6, start_property_area_feet1);
      cs.setInt(7, end_property_area_feet1);
      cs.setString(8, property_type1);
      cs.setString(9, pricetype);
      cs.setString(10,property_category );
          cs.registerOutParameter(11,Types.VARCHAR);
      rs=cs.executeQuery();
if(cs.getString(11)!=null)
          return rs;
      else
          return null;
    }catch(Exception ex) { }
        return null;
  } 
 
    public static String postQutation(String desc,String email,String ph)throws Exception
    {
        cs=connect().prepareCall("{call prosend_quotation(?,?,?,?)}");
        cs.setString(1, desc);
        cs.setString(2, email);
        cs.setString(3, ph);
        cs.registerOutParameter(4,Types.VARCHAR);
        cs.execute();
        return cs.getString(4);
    }
    public static ResultSet viewEmp()throws Exception
    {
       cs=connect().prepareCall("{call ViewEmp(?)}");
       cs.registerOutParameter(1,Types.VARCHAR);
       return cs.executeQuery();
    }
    public static ResultSet viewCustomer()throws Exception
    {
       cs=connect().prepareCall("{call ViewCustomer(?)}");
       cs.registerOutParameter(1,Types.VARCHAR);
       return cs.executeQuery();
    }
    public static ResultSet viewBuilder()throws Exception
    {
       cs=connect().prepareCall("{call ViewBuilder(?)}");
       cs.registerOutParameter(1,Types.VARCHAR);
       return cs.executeQuery();
    }
    public static String delEmp(int uid)throws Exception
    {
        cs=connect().prepareCall("{call delEmp(?,?)}");
        cs.setInt(1, uid);
        cs.registerOutParameter(2,Types.VARCHAR);
        cs.execute();
        return cs.getString(2);
    }
    public static ResultSet getFeedBack() 
  {
     try
    { 
        cs = connect().prepareCall("{call pro_getfeedback()}");
          return cs.executeQuery();
          } catch(Exception ex) { return null; }
  }
    public static ResultSet getcomplaint()
   {
     try
      {
          cs = connect().prepareCall("{call pro_complaintview()}");
           rs = cs.executeQuery();
      
          return rs;
       } catch(Exception ex){ }
        return null;
   }
     public static String resolvecomp(int c) throws Exception
   {
   
          cs = connect().prepareCall("{call pro_ResolveC(?,?)}");
          cs.setInt(1, c);
          cs.registerOutParameter(2,Types.VARCHAR);
          cs.execute();
           return cs.getString(2);
      
          
       
   }



 }
 