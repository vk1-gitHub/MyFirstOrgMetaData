public class UpdateFamilyMemberContactHandler{

   /*  public static void CommonData(Set<id> idSet){
   
           Map<Id, Integer> intMap = new Map<Id, Integer>();
           
           List<AggregateResult> agResults = [SELECT AccountId, count(id) total FROM Contact where AccountId in :idset  GROUP BY AccountId];
           
           for(AggregateResult ar : agResults)  {
                   id accountId = (id)ar.get('accountId');
                   Integer total= (Integer)ar.get('total');
                   intMap.put(accountId,total);  
           }  
           
           List<Contact> list1 = [select id,accountid,TotalFamilyMember__c from contact where accountid in:idSet]; 
           List<Contact> list2 = new List<Contact>();
           for(Contact c: list1)   
           {
               if(intMap.containsKey(c.accountId))
                       c.TotalFamilyMember__c = intMap.get(c.accountId);
                       list2.add(c);
           }
           system.debug(list2);
           if(list2.size()> 0 && list2 != null)
              update list2;
              System.debug('List 2 : '+list2);
   
     } */

     public static void PopulateFamilyMember(List<Contact> listcon){
           
           Set<id> idSet=new Set<id>();
  
           for(Contact c: listcon){      
              idSet.add(c.accountId);
           }
           
           Map<Id, Integer> intMap = new Map<Id, Integer>();
           
           List<AggregateResult> agResults = [SELECT AccountId, count(id) total FROM Contact where AccountId in :idset  GROUP BY AccountId];
           
           for(AggregateResult ar : agResults)  {
                   id accountId = (id)ar.get('accountId');
                   Integer total= (Integer)ar.get('total');
                   intMap.put(accountId,total);  
           }  
           
           List<Contact> list1 = [select id,accountid,TotalFamilyMember__c from contact where accountid in:idSet]; 
           List<Contact> list2 = new List<Contact>();
           for(Contact c: list1)   
           {
               if(intMap.containsKey(c.accountId))
                       c.TotalFamilyMember__c = intMap.get(c.accountId);
                       list2.add(c);
           }
           system.debug(list2);
           if(list2.size()> 0 && list2 != null)
              update list2;
              System.debug('List 2 : '+list2);
     }
     
     public static void UpdateFamilyMemberAfterDelete(List<Contact> listcon){
           
           Set<id> idSet=new Set<id>();
  
           for(Contact c: listcon){      
              idSet.add(c.accountId);
           }
           
           Map<Id, Integer> intMap = new Map<Id, Integer>();
           
           List<AggregateResult> agResults = [SELECT AccountId, count(id) total FROM Contact where AccountId in :idset  GROUP BY AccountId];
           
           for(AggregateResult ar : agResults)  {
                   id accountId = (id)ar.get('accountId');
                   Integer total= (Integer)ar.get('total');
                   intMap.put(accountId,total);  
           }  
           
           List<Contact> list1 = [select id,accountid,TotalFamilyMember__c from contact where accountid in:idSet]; 
           List<Contact> list2 = new List<Contact>();
           for(Contact c: list1)   
           {
               if(intMap.containsKey(c.accountId))
                       c.TotalFamilyMember__c = intMap.get(c.accountId);
                       list2.add(c);
           }
           system.debug(list2);
           if(list2.size()> 0 && list2 != null)
              update list2;
              System.debug('List 2 : '+list2);
     }
     
     public static void UpdateFamilyMember(List<Contact> listcon,Map<Id,contact> oldMap){
             System.debug('listcon  '+listcon+'  oldMap '+oldMap); 
            Set<id> idSet = new Set<id>();
  
            for(Contact c : listcon){
                      if(oldMap.get(c.id).accountId != c.accountId)
                      {
                         idSet.add(oldMap.get(c.id).accountId);
                         idSet.add(c.accountId);   
                      }            
            }
            System.debug('set  '+idSet);
      
            Map<Id, Integer> intMap = new Map<Id, Integer>();
           
            List<AggregateResult> agResults = [SELECT AccountId, count(id) total FROM Contact where AccountId in :idset  GROUP BY AccountId];
           
            for(AggregateResult ar : agResults)  {
                   id accountId = (id)ar.get('accountId');
                   Integer total= (Integer)ar.get('total');
                   intMap.put(accountId,total);  
           }  
           
           List<Contact> list1 = [select id,accountid,TotalFamilyMember__c from contact where accountid in:idSet]; 
           List<Contact> list2 = new List<Contact>();
           for(Contact c: list1)   
           {
               if(intMap.containsKey(c.accountId))
                       c.TotalFamilyMember__c = intMap.get(c.accountId);
                       list2.add(c);
           }
           if(list2.size()> 0 && list2 != null)
              update list2;
          System.debug('List 2 : '+list2);
     }
}