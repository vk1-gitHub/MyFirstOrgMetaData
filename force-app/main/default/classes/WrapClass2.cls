public class WrapClass2
{
   public List<Account> listacc;
   public List<WrapperClass> wraplist{get;set;}
   public WrapClass2()
   {
     listacc = new List<Account>();
     wraplist = new List<WrapperClass>();
     listacc = [select name,type,phone FROM Account];
     
     for(Account a : listacc)
     {
       WrapperClass wrap=new WrapperClass();
       wrap.acc = a;
       wraplist.add(wrap);
     }
   }
   
   public class WrapperClass
   {
     public Account acc{get;set;}
     public boolean check{get;set;}
     
     public WrapperClass()
     {
       acc=new Account();
       check = false;
     }
   }
}