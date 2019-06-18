public class ContactController{


       public Account acc;
       public List<Contact> con;
       public List<Contact> conn;
       public String accid =ApexPages.currentPage().getParameters().get('id');  
    
       public Integer counter = 0;
       public Integer limitSize = 5;
       public Integer totalSize =0; 
    

       public ContactController(){

           con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid];            
           totalSize = con.size();
           conn = con;
       }  
  
       public Account getAcc(){
        
             acc = [select id,name,type,phone,fax from Account where id = :accid ];   
             return acc;
       }
  
       public List<Contact> getCon1(){

              con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid LIMIT:limitSize OFFSET:counter];
              return con;       
       }
 
       public void getupdateDept()
       {    
           Integer HR=0;
           Integer IT=0;
          
           for(Contact c : conn)
           {
                 if(c.department__c=='HR'){
                       HR++;     
                 }
                 else if(c.department__c=='IT'){
                       IT++; 
                 }   
           }
           for(Contact c : conn)
           {   
                c.HR__c=HR;
                c.IT__c=IT; 
           } 
           
         update conn;     
       }
          
       public void first(){
   
              counter=0;
              con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid LIMIT:limitSize OFFSET:counter];
       }
       public void next(){
   
               counter=counter+limitSize;
               con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid LIMIT:limitSize OFFSET:counter];
       }
   
       public void previous(){
    
               counter=counter-limitSize;       
               con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid LIMIT:limitSize OFFSET:counter];   
       }
       public void last(){
         
               counter = limitsize * (totalSize/limitSize);
               con = [select id,name,title,department__c,HR__C,IT__c from Contact where accountid = :accid LIMIT:limitSize OFFSET:counter];   
       }
       
       public Boolean getDisableNext(){
    
              if((counter + limitSize) >= totalSize )
                     return true ;
              else
                     return false ;
       }
          
       public Boolean getDisablePrevious(){
   
                if(counter == 0)
                    return true ;
                else
                    return false ;
       }
        
       public Boolean getDisableFirst(){
   
                if(counter == 0)
                    return true ;
                else
                    return false ;
       }
        
       public Boolean getDisableLast(){
              if((counter + limitSize) >= totalSize )
                    return true ;
                else
                    return false ;
       } 
}