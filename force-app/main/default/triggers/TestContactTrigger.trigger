trigger TestContactTrigger on Contact (before insert, after insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('Before Trigger is Being called');
        for(Contact con : Trigger.New){
            con.email = 'vivekkumar231995@gmail.com';
        }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        System.debug(Trigger.New);
        System.debug('After Trigger is Being called');
    }

}