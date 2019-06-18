public class UpdateContactFamilyMemberHandler2{

      public void commonData(Set<id> idset){
      
          Map<id,integer> countContactMap = new Map<id,integer>();
          List<AggregateResult> aggresult = [select accountid, count(id) total from Contact where accountid in:idset GROUP BY accountid];
           
          for(AggregateResult agg:aggresult){
                
                id accid = (id)agg.get('accountid');
                Integer total = (Integer)agg.get('total');
                countContactMap.put(accid,total);
           }
           
           List<Contact> listcon = [select id,accountid,TotalFamilyMember__c from Contact where accountid in:idset];
           List<Contact> listcon2 = new List<Contact>();
           for(Contact c:listcon){
               if(countContactMap.containsKey(c.accountid))
                    c.TotalFamilyMember__c = countContactMap.get(c.accountid);
                    listcon2.add(c);
           }
           
           if(listcon2.size() > 0)
                update listcon2;      
      }
        
      public void UpdateFamilyMemberWhileInsert(List<Contact> conlist){

          Set<id> idset=new Set<id>();
          for(Contact c:conlist){
               idset.add(c.accountid);
          } 
          
          commonData(idset);
      }
      public void UpdateFamilyMemberAfterDelete(List<Contact> conlist){

          Set<id> idset=new Set<id>();
          for(Contact c:conlist){
               idset.add(c.accountid);
          } 
          
          commonData(idset);
      }
      public void UpdateFamilyMemberAfterUpdate(List<Contact> conlist,map<id,Contact> oldMap){

          Set<id> idset=new Set<id>();
          for(Contact c:conlist){
               if(oldMap.get(c.id).accountid != c.accountid){
                   idset.add(oldMap.get(c.id).accountid);
                   idset.add(c.accountid);
               }    
          } 
          
          commonData(idset);
      }
}