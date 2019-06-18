public class WrapperUpdateDeleteDemo{  
  
      public Account acc{get;set;}
      public List<Contact> listcon{get;set;}
      public List<Wrapperdemo> wraplist1{get;set;}
      public List<Contact> conlst = new List<Contact>();
      
      public id sid;
                
      public WrapperUpdateDeleteDemo(){
     
          sid =ApexPages.currentPage().getParameters().get('id');  
          if(sid !=null){
              acc=new Account();
              acc = [select name,type,phone,fax,rating,industry from Account where id =:sid];
            
              listcon = new List<Contact>(); 
              wraplist1 = new List<WrapperDemo>(); 
         }
      }
  
     public class WrapperDemo{
  
        public Contact con{get;set;}
        public boolean check{get;set;}
        
        public WrapperDemo(){   
             con = new Contact();
             check = false ;
         }     
      }
  
       public List<Wrapperdemo> getwraplist(){
           listcon.clear();
           listcon = [select id,firstname,lastname,title from Contact where Accountid= :sid limit 10];
      
           wraplist1.clear();  
             
           for(Contact c : listcon){
                 WrapperDemo wrap = new WrapperDemo();
                 wrap.con = c;
                 wraplist1.add(wrap);  
           }
           return wraplist1;
      } 

    public PageReference deleteRecord(){
        conlst.clear();
        for(WrapperDemo w: wraplist1)
        {
            if(w.check == true){  
                     conlst.add(w.con); 
            }
        }
          delete conlst;
          getwraplist();
          return null;
      }
 
      public PageReference UpdateRecord(){
         conlst.clear();
         for(WrapperDemo w: wraplist1)
         {
           if(w.check == true){
                conlst.add(w.con);     
           }
         }
         update conlst;
         getwraplist();
         return null;
  }
}