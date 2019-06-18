public class WrappClass {
    
   public List<Account> listacc;
   public List<Contact> listcon;
    public List<TestWrapper> wraptxt{get;set;}

     public WrappClass()
     {
        listacc=new List<Account>();
        listcon=new List<Contact>();
    
        wraptxt=new List<TestWrapper>();
    
       listacc = [select name,type,industry,phone,fax FROM Account];
       listcon = [select name,title,phone,email,fax FROM Contact];
         
         for(Account a : listacc)
         {
             TestWrapper tw=new TestWrapper();
             
             System.debug(a.phone);
             
             //tw.acc=a;
             //wraptxt.add(tw);
               
         }
     }
      
    public class TestWrapper
    {
        public Account acc{get;set;}
        Public Contact con{get;set;}
        public boolean check{get;set;}
        
        public TestWrapper()
        {
            acc=new Account();
            con=new Contact();
            check = false;
        }
    }
}