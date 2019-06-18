trigger Contacts_trigger on Contact (before insert,after insert,before update,after update,after delete,before delete) {


/*     
      if(Trigger.isInsert)
          ContactHandler.UpdateAccountsScore(Trigger.new,Trigger.newMap);
     
     
     if(Trigger.isUpdate)
          ContactHandler.UpdateAccountsScore(Trigger.new,Trigger.oldMap); */
       
     /*     if(Trigger.isInsert)
                ContactHandler.UpdateAccountScore(Trigger.new);
      
       
          if(Trigger.isUpdate)
               ContactHandler.RollUpAccountScoreAfterUpdate(Trigger.new,Trigger.oldMap); 
       
          if(Trigger.isDelete)
               ContactHandler.UpdateAccountScoreAfterDelete(Trigger.old); 
       */
        
      /*   if(Trigger.isAfter) {
          if( Trigger.isInsert)  {
               UpdateFamilyMemberContactHandler.PopulateFamilyMember(Trigger.new);
          }
          if( Trigger.isDelete){
               UpdateFamilyMemberContactHandler.UpdateFamilyMemberAfterDelete(Trigger.old);      
           }               
                          
            if(Trigger.isUpdate){
                system.Debug('----31----');
                UpdateFamilyMemberContactHandler.UpdateFamilyMember(Trigger.new,Trigger.oldMap);
            }
          }    
          */  
 /*           UpdateContactFamilyMemberHandler2   uc= new UpdateContactFamilyMemberHandler2();

          if(Trigger.isAfter && Trigger.isInsert){
                  uc.UpdateFamilyMemberWhileInsert(Trigger.new);
          }
          if(Trigger.isAfter && Trigger.isDelete){
                  uc.UpdateFamilyMemberAfterDelete(Trigger.old);
          } 
           if(Trigger.isAfter && Trigger.isUpdate){
                  uc.UpdateFamilyMemberAfterUpdate(Trigger.new,Trigger.oldMap);
          }         
      */
      
    /*    if(Trigger.isAfter && Trigger.isInsert){
                 UpdateFamilyMembers.UpdateFamilyMemberWhileInsert(Trigger.new);    
        }
        if(Trigger.isAfter && Trigger.isDelete){
                 UpdateFamilyMembers.UpdateFamilyMemberAfterDelete(Trigger.old);    
        } 
        if(Trigger.isAfter && Trigger.isUpdate){
                 UpdateFamilyMembers.UpdateFamilyMemberAfterUpdate(Trigger.new,Trigger.oldMap);    
        }     */    
        
     }