public class CollectionDemo{

    List<Account> listacc;
    public List<WrapAccount> wraplist{get;set;}
  
    public CollectionDemo(){
  
    listacc = new List<Account>();
    wraplist = new List<WrapAccount>();
    listacc = [select name,type,phone,fax,Parent.id FROM Account];
    
    for(Account a:listacc){
       WrapAccount wrap=new WrapAccount();
         wrap.acc=a;
         wraplist.add(wrap);   
    }
  }
  
  public class WrapAccount{
     
    public Account acc{get;set;}
    public boolean check{get;set;}
     public WrapAccount(){
     
       acc = new Account();
       check = false;
     }
  }
}