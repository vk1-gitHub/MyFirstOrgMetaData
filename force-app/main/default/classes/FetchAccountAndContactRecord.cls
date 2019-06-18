public class FetchAccountAndContactRecord
{
   public List<Account> listacc;
   public List<Contact> listcon;
   
   public List<WrapperConAcc> listwrap{get;set;}
   public List<WrapperConAcc> listwrap2{get;set;}
  public FetchAccountAndContactRecord()
  {
    listacc = new List<Account>();
    listcon = new List<Contact>();
    listwrap = new List<WrapperConAcc>();
    listwrap2 = new List<WrapperConAcc>();
    listacc = [select name,type,industry,phone,fax FROM Account];
    listcon = [select name,title,phone,email,fax FROM Contact];
    
    for(Account a: listacc)
    {
      WrapperConAcc wrapacc = new WrapperConAcc();
      
      wrapacc.acc=a;
      listwrap.add(wrapacc);
    }
    
    for(Contact c: listcon)
    {
      WrapperConAcc wrapacc = new WrapperConAcc();
      wrapacc.con=c;
      listwrap.add(wrapacc);
    }
  } 
  
  public void selectedValue()
  {
     for(WrapperConAcc ac : listwrap)
     {
       if(ac.check==true)
       {
        
       /*  if(ac.acc.phone == ac.con.phone)
        if(boolean.valueOf(ac.acc.phone == ac.con.phone))
         {
          
          listwrap2.add(ac);
         }
         System.debug('ac.acc.phone'+ac.acc.phone); */
         listwrap2.add(ac);
       }
       
       
     }
  }
  
  public class WrapperConAcc
  {
    public Account acc{get;set;}
    public Contact con{get;set;}
    public boolean check{get;set;}
    public WrapperConAcc()
    {
      acc=new Account();
      con=new Contact();
      check = false;
    }
  }
}