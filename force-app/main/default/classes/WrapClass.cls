public class WrapClass
{
  public List<Account> acclist;
  public List<WrapperClass> wraplist{get;set;}
  public List<WrapperClass> wraplist2{get;set;}
  
  
  public WrapClass()
  {
     acclist=new List<Account>();
     wraplist= new List<WrapperClass>();
     wraplist2= new List<WrapperClass>();
     acclist = [select id,name,phone FROM Account];
     
      for(Account a : acclist)
      {
         WrapperClass wrap=new WrapperClass();
         wrap.acc=a;
         wraplist.add(wrap);
      }
  }
  
  public void selectedValue()
  {
   wraplist2.clear(); 
   for(WrapperClass ws: wraplist)
    {
      if(ws.check==true)
      wraplist2.add(ws);
    }
  }
  
  public class WrapperClass
  {
     public Account acc{get;set;}
     public boolean check{get;set;}
     public WrapperClass()
     {
        acc=new Account();
        check=false;
      
     }
  }
}