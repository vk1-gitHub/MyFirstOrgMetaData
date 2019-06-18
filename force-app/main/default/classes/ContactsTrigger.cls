public class ContactsTrigger{

  // A funtion for Updating the other Address Of Contact On the basis of Mailing Address

  /* public static void updateOtherAddress(List<Contact> listcon){
  
        for(Contact c:listcon)
        {
           c.othercity = c.mailingcity;
           c.otherstate = c.mailingstate;
           c.otherpostalcode = c.mailingpostalcode;
          c.othercountry = c.mailingcountry;
        }  
      }
   */
  
  
  
     /* public static void RollUpAccountScore(List<Contact> listcon){
            listcon = [select Accountid,score1__c,score2__c From Contact];
            List<Account> listacc = new List<Account>();
            
            Set<id> accid = new Set<id>(); 
    
            for(Contact c: listcon){
                  accid.add(c.Accountid);   
            }
        
            for(String aid:accid){
                Integer rollScore1 =0;
                Integer rollScore2 =0; 
                  
                for(Contact c: listcon){
                
                    if(c.Accountid ==aid){     
                          rollScore1+= c.score1__c.intValue();
                          rollScore2+= c.score2__c.intValue();
                    }
                }
                for(Account a: listacc)
                {
                    if(a.id ==aid)
                     {
                       a.RollUpScore1__c = rollScore1;
                       a.RollUpScore2__c = rollScore2;
                     }
                }
                update [select id from Account where id=:aid];
            }
      }*/
}