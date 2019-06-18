public class CandidateHandler3{

    public static void createAccount(List<Candidate__c> candiList){
    
      Map<id,Account> brokMap = new Map<id,Account>();
      Map<id,Account> manageBrokMap = new Map<id,Account>();
      Map<id,Contact> conMap = new Map<id,Contact>();
      Map<id,Task> taskMap = new Map<id,Task>();
      
      for(Candidate__c can: candiList){
           if(can.brokerage__c != null){
               brokmap.put(can.id,new Account(name = can.brokerage__c));
           }  
      }
      if(brokmap.size() > 0)
           insert brokMap.values();
    
      for(Candidate__c can: candiList){
           if(can.brokerage__c != null){
               if(can.managebrokerage__c != null){
                  manageBrokMap.put(can.id,new Account(parentid = brokMap.get(can.id).id, name = can.managebrokerage__c));
               }
           }  
      }
      if(manageBrokMap.size() > 0)
          insert manageBrokMap.values();  
          
      for(Candidate__c can: candiList){
           if(can.brokerage__c != null){
               if(can.managebrokerage__c != null)
                  conMap.put(can.id,new Contact(accountid = manageBrokMap.get(can.id).id, lastname = can.managebrokerage__c,candidate__c=can.id));
           }  
      }         
      if(conMap.size() > 0)
          insert conMap.values();
          
      for(Candidate__c can: candiList){
           if(can.brokerage__c != null){
               if(can.managebrokerage__c != null)
                  taskMap.put(can.id,new Task(whoid = conMap.get(can.id).id, whatid = can.id, subject = 'Portal Contact Setup'));
           }  
      }  
      if(taskMap.size() > 0)
          insert taskMap.values();
         
    } 
}