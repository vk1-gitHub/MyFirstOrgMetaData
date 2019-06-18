public class WrapperDemo{

  public List<Contact> listcon;
  public List<WrapDemo> wraplist{get;set;}
  public WrapperDemo(){
    listcon = new List<Contact>();
    wraplist = new List<WrapDemo>();
    
    listcon = [select id,lastname,title,phone from Contact Limit 10];
  
     for(Contact c: listcon)
     {
        WrapDemo wrap = new WrapDemo();
        wrap.con = c;
        wraplist.add(wrap);
     }
  }
  
  public void deleteData(){
  
     for(WrapDemo wd : wraplist)
     {
        if(wd.check == true)
          delete [select id from Contact where id =:wd.con.id];
     }
  } 
 
  public class WrapDemo{
   
   public Contact con{get;set;}
   public boolean check{get;set;}
  
    public WrapDemo(){
    
      con= new Contact();
      check = false;
    
    }
    
  }

}