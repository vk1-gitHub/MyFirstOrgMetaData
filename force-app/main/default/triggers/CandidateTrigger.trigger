trigger CandidateTrigger on Candidate__c (before Insert,after insert) {

  /*     Set<String> fnameSet = [select frirstName__c from Candidate__c];
       Set<String> lNameSet = [select lastName__c from Candidate__c];
       
       if(Trigger.isBefore && Trigger.isInsert){
             for(Candidate__c : Trigger.new){
               
                  if(c.firstName__c In : fnameSet && c.lastName__c in : lNameSet)
                     System.addError('Candidate Already Exist Please Provide Different Candidate Name');
               }
       }
  */

    /*  if(Trigger.isAfter){
            CandidateHandler.createAccount(Trigger.new);
       } */
       
     /*  if(Trigger.isAfter){
            CandidateHandler2.createAccount(Trigger.new);
       } */
       
      if(Trigger.isAfter){
            CandidateHandler3.createAccount(Trigger.new);
       } 
       
}