trigger TestCaseTrigger on Case (before insert, after insert, after update, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            System.debug('Before Insert Trigger is Called at Time : '+System.now());
            System.debug(Trigger.new[0].ownerId); 
            System.debug(Trigger.new[0].status);
        }
        if(Trigger.isUpdate){
            System.debug('Before update Trigger is Called at Time : '+System.now());
            System.debug(Trigger.new[0].ownerId); 
            System.debug(Trigger.new[0].status);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            System.debug('After Insert Trigger is Called at Time : '+System.now());
            System.debug(Trigger.new[0].ownerId); 
            System.debug(Trigger.new[0].status);
        }
        if(Trigger.isupdate){
            System.debug('After Update Trigger is Called at Time : '+System.now());
            System.debug(Trigger.new[0].ownerId);
            System.debug(Trigger.new[0].status); 
        }    
    }
}