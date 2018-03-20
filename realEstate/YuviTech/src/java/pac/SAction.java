package pac;

import com.opensymphony.xwork2.ActionSupport;
import java.security.Security;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class SAction extends ActionSupport
{
    private int userid,ctr,pin,msg2;
    private String pass ,cname,clt,email,dob,ustates,sq,sa,op,addr,state,cntry,city,stdcd,lndline,mbl;
    private String msg,msg1,vcode,op1,np,fmsg;
    private List<String> cityList,stateList;
    
    /*HttpServletRequest req=ServletActionContext.getRequest();
    HttpSession ses=req.getSession(true);
    ServletContext ctx=req.getServletContext();*/
    @Override
    public String execute() throws Exception
    {
        HttpServletRequest req=ServletActionContext.getRequest();
        HttpSession ses=req.getSession(true);
       
       if(ses.getAttribute("email") ==null && getCtr()!=8 && getCtr()!=0 && getCtr()!=1  && getCtr()!=5 && getCtr()!=6)
         {
           setMsg("Sorry! You can't continue. Login First"); 
           return "RELOGIN";
         }
        
       
        
        cityList = db.DBConnect.getCity();   
        stateList = db.DBConnect.getState();
        if(getCtr()==0)
         {
          return "DESIGN";
         }
         else if(getCtr()==10)
         {
          op="insert";
          ustates="YES";
          setMsg(db.DBConnect.addUser(op, getPass(), getUserid(),ustates ,getCname(), getClt(), getEmail(), getSq(), getSa(), getDob(),getAddr(),getState(),getCntry(),getPin(),getCity(),getStdcd(),getLndline(),getMbl()));
          return "SUCCESS";
         }
        
        else if(getCtr()==1)
         {
          op="insert";
          ustates="no";
          String email=getEmail();
          setMsg1(db.DBConnect.addUser(op, getPass(), getUserid(),ustates ,getCname(), getClt(), getEmail(), getSq(), getSa(), getDob(),getAddr(),getState(),getCntry(),getPin(),getCity(),getStdcd(),getLndline(),getMbl()));
       // HttpServletRequest req=ServletActionContext.getRequest();
          req.setAttribute("email", email);
        //  HttpSession ses=req.getSession(true);
          ses.setAttribute("email", email);
          ServletContext ctx=req.getServletContext();
          ctx.setAttribute("email", email);
          if(msg1.indexOf("Sorry")!=-1)
          {
            setMsg(msg1);
            return"Failure";
          }
          else
          {
          setMsg(db.DBConnect.getCode(email));
          
        
          String code=db.DBConnect.getCode(email);
          String tomail = getEmail();
       // String emailMsgTxt = code+"<br>This password send on ur request for password recovery";
          try
            {
                String to=tomail; // admin 
                String subject = "Password Recovery msg on ur request";
                String emailMsgTxt = code+"<br>This password send on ur request for password recovery";
                String SMTP_HOST_NAME = "smtp.gmail.com";
                String SMTP_PORT = "465";
                final String SMAILID = "yuvitechagile"; 
                final String SPASS="agile@gzb";
                String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                String[] EMAIL_TO_ADDRESS = {to,tomail};
                Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                Properties props = new Properties();
                props.put("mail.smtp.host", SMTP_HOST_NAME);
                props.put("mail.smtp.auth", "true");
                props.put("Mail.smtp.starttls.enable", "true");
                props.put("mail.transport.protocol","smtp");
                props.put("mail.debug", "true");
                props.put("mail.smtp.port", SMTP_PORT);
                props.put("mail.smtp.socketFactory.port", SMTP_PORT);
                props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                props.put("mail.smtp.socketFactory.fallback", "false");
                Session ses1 = Session.getDefaultInstance(props,new javax.mail.Authenticator() 
                {
                    protected PasswordAuthentication getPasswordAuthentication() 
                    {
                        return new PasswordAuthentication(SMAILID, SPASS);//Please Provide The Sender Address
                    }
                });
                ses1.setDebug(true);
                Message msg = new MimeMessage(ses1);
                InternetAddress addressFrom = new InternetAddress(SMAILID);
                msg.setFrom(addressFrom);
                InternetAddress[] ADDRESS_TO = new InternetAddress[EMAIL_TO_ADDRESS.length];
                  for (int i = 0; i < EMAIL_TO_ADDRESS.length; i++) {
                      ADDRESS_TO[i] = new InternetAddress(EMAIL_TO_ADDRESS[i]);
                }
                msg.setRecipients(Message.RecipientType.TO, ADDRESS_TO); // TO / CC/BCC
               // Setting the Subject and Content Type
                msg.setSubject(subject);
                msg.setContent(emailMsgTxt, "text/html");
                Transport.send(msg);
                //out.println("ur password send to ur mail id.......");
               
            } catch(Exception e) {setMsg(e.getMessage());
               
            }
           return "SUCCESS";
         }
          }
          else if(getCtr()==2)
           {
          //     HttpServletRequest req=ServletActionContext.getRequest();
            //    HttpSession ses=req.getSession(true);
               // ServletContext ctx=req.getServletContext();
                String email=(String)ses.getAttribute("email");
               // String email="abc@";
                     if(getVcode().equals(db.DBConnect.getCode(email)))
                   {
                   setMsg(db.DBConnect.updStatus(email));
                   return "SUCCESS";
                    }
                else
                 {
                setMsg("invalid verification");
                return "Failure";
                 }
            }
         else if(getCtr()==4)
           {
            
             setMsg(db.DBConnect.changePass(getEmail(), getOp1(), getNp()));
             
             return "SUCCESS";
        
           }
        else if(getCtr()==5)
            {
             String email=getEmail();
             String ques=db.DBConnect.getQuestion(getEmail());
             //HttpServletRequest req=ServletActionContext.getRequest();
             req.setAttribute("qa", ques);
            // HttpSession ses=req.getSession(true);
             ses.setAttribute("qa", ques);
            ServletContext ctx=req.getServletContext();
            ctx.setAttribute("qa", ques);
   
             //setMsg(db.DBConnect.getQuestion(email));
             return "VALIDATE";
            }
         else if(getCtr()==6)
           {
               String ans=db.DBConnect.getAns(getEmail());
          if(getSa().equals(ans))
             {
             setMsg(db.DBConnect.getPass(getEmail()));
             setMsg1("Password send your E-Mail Id ");
         
             
             String code=db.DBConnect.getPass(getEmail());
             String tomail = getEmail();
             
     
            try
            {
                String to=tomail; // admin 
                String subject = "Password Recovery msg on ur request";
                String emailMsgTxt = code+"<br>This password send on ur request for password recovery";
                String SMTP_HOST_NAME = "smtp.gmail.com";
                String SMTP_PORT = "465";
                final String SMAILID = "yuvitechagile"; 
                final String SPASS="agile@gzb";
                String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                String[] EMAIL_TO_ADDRESS = {to,tomail};
                Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                Properties props = new Properties();
                props.put("mail.smtp.host", SMTP_HOST_NAME);
                props.put("mail.smtp.auth", "true");
                props.put("Mail.smtp.starttls.enable", "true");
                props.put("mail.transport.protocol","smtp");
                props.put("mail.debug", "true");
                props.put("mail.smtp.port", SMTP_PORT);
                props.put("mail.smtp.socketFactory.port", SMTP_PORT);
                props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                props.put("mail.smtp.socketFactory.fallback", "false");
                Session ses1 = Session.getDefaultInstance(props,new javax.mail.Authenticator() 
                {
                    protected PasswordAuthentication getPasswordAuthentication() 
                    {
                        return new PasswordAuthentication(SMAILID, SPASS);//Please Provide The Sender Address
                    }
                });
                ses1.setDebug(true);
                Message msg = new MimeMessage(ses1);
                InternetAddress addressFrom = new InternetAddress(SMAILID);
                msg.setFrom(addressFrom);
                InternetAddress[] ADDRESS_TO = new InternetAddress[EMAIL_TO_ADDRESS.length];
                  for (int i = 0; i < EMAIL_TO_ADDRESS.length; i++) {
                      ADDRESS_TO[i] = new InternetAddress(EMAIL_TO_ADDRESS[i]);
                }
                msg.setRecipients(Message.RecipientType.TO, ADDRESS_TO); // TO / CC/BCC
               // Setting the Subject and Content Type
                msg.setSubject(subject);
                msg.setContent(emailMsgTxt, "text/html");
                Transport.send(msg);
                //out.println("ur password send to ur mail id.......");
               
            } catch(Exception e) {setMsg(e.getMessage()); }
             return "SUCCESS";
             }
           else
             {
             setMsg("Invalid answer , please enter the correct answer");
             return "FAILURE";
             }
      
           }
         
         
         
         
        else if(getCtr()==7)
           {
               //setMsg("hello");
               int  u=getUserid();
               setMsg(db.DBConnect.secUpdate(u, email, pass, sq, sa));
           return "VIEW";
              
           }
      else if(getCtr()==8)
        {
          String status=db.DBConnect.checkId(getEmail(), getPass());
          String email=getEmail();
          userid=db.DBConnect.getUserid(getEmail());
          //HttpServletRequest req=ServletActionContext.getRequest();
          req.setAttribute("id", userid);
         // HttpSession ses=req.getSession(true);
          
             ResultSet rs = db.DBConnect.getCtype(userid);
             String nm=db.DBConnect.getName(userid);
            if(rs.next())
             {
            clt = rs.getString(1);
             ses.setAttribute("clt",clt); 
             ses.setAttribute("nm",nm);
             }    
            

              if(status.indexOf("Sorry")==-1)
                {
                 if(status.equals("YES"))
                  {
                      if(clt.equalsIgnoreCase("Admin"))
                      {
                     ses.setAttribute("id", userid);
                      ses.setAttribute("email",email);
                       setMsg1("Welcome "  +nm);
                       return "ADMIN";
                      }
                      else if(clt.equalsIgnoreCase("Customer"))
                      {
                           ses.setAttribute("id", userid);
                      ses.setAttribute("email",email);
                   setMsg1("Welcome "  +nm);
                   return "CUSTOMER";
                      }
                       else if(clt.equalsIgnoreCase("Dealer"))
                      {
                           ses.setAttribute("id", userid);
                      ses.setAttribute("email",email);
                   setMsg1("Welcome "  +nm);
                   return "DEALER";
                      }
                    else if(clt.equals("Builder"))
                      {
                           ses.setAttribute("id", userid);
                      ses.setAttribute("email",email);
                   setMsg1("Welcome "  +nm);
                   return "BUILDER";
                      }
                  }
                  else
                   {
                  setMsg1("you are not a valid user please verify your code");
                  return "FAILURE";
                    }
                 }
               else
                {
                 setMsg1(status);
                 return "SECURITY";
                }
            }
       else if(getCtr()==9 )
        {
             String mm="";
            //HttpServletRequest req=ServletActionContext.getRequest();
             HttpSession ses1=req.getSession(false);        
               
            ///String m=(String)ses.getAttribute("id");
               if(ses1==null)
               {
                 setMsg(db.DBConnect.feedBack(getCname(),0, getEmail(),getMbl(), getFmsg())); 
              
               }
               else
               {
                 int userid=Integer.parseInt(ses.getAttribute("id").toString());   
                 setMsg(db.DBConnect.feedBack(getCname(),userid, getEmail(),getMbl(), getFmsg()));
              
               }
            
             return"SUCCESS";
        
        
         }
        else 
        {
          setMsg("feedback not saved");
          return "FAILURE";
        }
        
         return "SUCCESS";  
    }

    @Override
    public void validate()
    {
        cityList = db.DBConnect.getCity();   
        stateList = db.DBConnect.getState();
        if(getCtr()==8)
        {
           if(getEmail().equals(""))
            addFieldError("email","email can't be blank");
           if(getPass().equals(""))
            addFieldError("pass","passward can't be blank.");
        }
        else if(getCtr()==1)
        {
            
         if(getEmail().equals(""))
            addFieldError("email","email can't be blank");
           if(getPass().equals(""))
            addFieldError("pass","passward can't be blank.");
          if(getCname().equals(""))
            addFieldError("cname","name can't be blank");
           if(getDob().equals(""))
            addFieldError("dob","date of birth  can't be blank.");
           if(getClt().equals(""))
            addFieldError("clt","client can't be blank");
           if(getAddr().equals(""))
            addFieldError("addr","address can't be blank.");
           if(getState().equals(""))
            addFieldError("state","state can't be blank");
           if(getCity().equals(""))
            addFieldError("city","city can't be blank.");
           if(getCntry().equals(""))
            addFieldError("cntry","please select your country");
           if(getStdcd().equals(""))
            addFieldError("stdcd","please enter your std code");
           if(getSq().equals(""))
            addFieldError("sq","please select your question");
           if(getSa().equals(""))
            addFieldError("sa","please enter your security answer");
           if(getPin()==0)
            addFieldError("Pin","please enter your pin code");
          
        }
      else if(getCtr()==10)
        {
         if(getEmail().equals(""))
            addFieldError("email","email can't be blank");
           if(getPass().equals(""))
            addFieldError("pass","passward can't be blank.");
          if(getCname().equals(""))
            addFieldError("cname","name can't be blank");
           if(getDob().equals(""))
            addFieldError("dob","date of birth  can't be blank.");
           if(getClt().equals(""))
            addFieldError("clt","client can't be blank");
           if(getAddr().equals(""))
            addFieldError("addr","address can't be blank.");
           if(getState().equals(""))
            addFieldError("state","state can't be blank");
           if(getCity().equals(""))
            addFieldError("city","city can't be blank.");
           if(getCntry().equals(""))
            addFieldError("cntry","please select your country");
           if(getStdcd().equals(""))
            addFieldError("stdcd","please enter your std code");
           if(getSq().equals(""))
            addFieldError("sq","please select your question");
           if(getSa().equals(""))
            addFieldError("sa","please enter your security answer");
           if(getPin()==0)
            addFieldError("Pin","please enter your pin code");
          
        }
        

        
         if(getCtr()==4)
        {
            if(getEmail().equals(""))
            addFieldError("email","please enter your email id ");
            if(getOp1().equals(""))
                addFieldError("op1", "please enter your old passward");
              if(getNp().equals(""))
                addFieldError("np", "please enter your new passward");
        
        }
           
      
         if(getCtr()==5)
         {
           if(getEmail().equals(""))
               addActionError("please enter the email id");
         }
        
    }
    
    

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
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
     * @return the sq
     */
    public String getSq() {
        return sq;
    }

    /**
     * @param sq the sq to set
     */
    public void setSq(String sq) {
        this.sq = sq;
    }

    /**
     * @return the sa
     */
    public String getSa() {
        return sa;
    }

    /**
     * @param sa the sa to set
     */
    public void setSa(String sa) {
        this.sa = sa;
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
     * @return the msg1
     */
    public String getMsg1() {
        return msg1;
    }

    /**
     * @param msg1 the msg1 to set
     */
    public void setMsg1(String msg1) {
        this.msg1 = msg1;
    }

    /**
     * @return the userid
     */
    public int getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(int userid) {
        this.userid = userid;
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
     * @return the stateList
     */
    public List<String> getStateList() {
        return stateList;
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
     * @return the vcode
     */
    public String getVcode() {
        return vcode;
    }

    /**
     * @param vcode the vcode to set
     */
    public void setVcode(String vcode) {
        this.vcode = vcode;
    }

    /**
     * @return the op1
     */
    public String getOp1() {
        return op1;
    }

    /**
     * @param op1 the op1 to set
     */
    public void setOp1(String op1) {
        this.op1 = op1;
    }

    /**
     * @return the np
     */
    public String getNp() {
        return np;
    }

    /**
     * @param np the np to set
     */
    public void setNp(String np) {
        this.np = np;
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
     * @return the msg2
     */
    public int getMsg2() {
        return msg2;
    }

    /**
     * @param msg2 the msg2 to set
     */
    public void setMsg2(int msg2) {
        this.msg2 = msg2;
    }


  
   
}
