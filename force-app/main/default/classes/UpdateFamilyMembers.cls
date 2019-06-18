public class UpdateFamilyMembers{

     /* public static void commonMethod(Set<id> idset){
      
              Map<id,Integer> intMap = new Map<id,Integer>();
              
              List<Contact> listcon1 = [select id,accountid from Contact where accountid in : idset];
            
              Integer total = 0;
              for(Contact c: listcon1){
                     if(!intmap.containsKey(c.accountid)){
                          total = 0;
                          intmap.put(c.accountid,++total);
                     }
                     else{
                          if(intmap.containsKey(c.accountid))
                          {   
                              total = intmap.get(c.accountid);
                              intmap.put(c.accountid,++total);
                          }    
                     }   
              }
                  
              System.debug('All Contacts = '+intmap.values());
              
              List<Contact> listcon2 = new List<Contact>();
              for(Contact c : listcon1){
              
                   if(intMap.containskey(c.accountid)){
                        c.TotalFamilyMember__c = intMap.get(c.accountid);
                        listcon2.add(c);
                    }    
              }
              if(listcon2 != null && listcon2.size() > 0)
                 update listcon2;
      }

      public static void UpdateFamilyMemberWhileInsert(List<Contact> listcon){
      
           Set<id> idset = new Set<id>();
       
           for(Contact c:listcon){
               idset.add(c.accountid);
           }
          
           commonMethod(idset);
      }
      public static void UpdateFamilyMemberAfterDelete(List<Contact> listcon){
      
           Set<id> idset = new Set<id>();
       
           for(Contact c:listcon){
               idset.add(c.accountid);
           }
          
           commonMethod(idset);
      }
      public static void UpdateFamilyMemberAfterUpdate(List<Contact> listcon,Map<id,contact> oldMap){
      
           Set<id> idset = new Set<id>();
       
           for(Contact c:listcon){
           
           
               if(oldMap.get(c.id).accountid != c.accountid){
                     idset.add(oldMap.get(c.id).accountid);
                     idset.add(c.accountid);
               }      
           }

           commonMethod(idset);
                  
      }*/
}