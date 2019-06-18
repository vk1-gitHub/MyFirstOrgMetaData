trigger UpdateContactDescrption on Contact (before update) {
     
    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('In Trigger !!@@ '+Trigger.New);
       Database.executeBatch(new UpdateContactDescription(Trigger.New), 5);
    }
}