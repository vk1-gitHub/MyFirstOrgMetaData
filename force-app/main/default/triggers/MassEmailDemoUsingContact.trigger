trigger MassEmailDemoUsingContact on Contact (after update) {
    
   /* if(Trigger.isAfter && Trigger.isUpdate){
        List<Messaging.MassEmailMessage> massEmailList = new List<Messaging.MassEmailMessage>();
        Messaging.MassEmailMessage message = new Messaging.MassEmailMessage();
        Messaging.MassEmailMessage message2 = new Messaging.MassEmailMessage();
        final String template = 'TestEmailServicesOnContactInsertion'; 
        final String template2 = 'TestMassEmailServiceOnContactUpdate'; 
        
        message.setTemplateId([Select id FROM EmailTemplate where name = : template].Id);
        List<Id> targetObjectIdsList = new List<Id>();
        List<Id> whatIdsList = new List<Id>();
        for(Contact con : Trigger.New){
            if(con.FirstName == 'TestMass'){
                message2.setTemplateId([Select id FROM EmailTemplate where name = : template2].Id);
                message2.setTargetObjectIds(new List<Id>{con.Id});
            }else{
                targetObjectIdsList.add(con.Id);
            }
            if(targetObjectIdsList != null && targetObjectIdsList.size() > 0){
                message.setTargetObjectIds(targetObjectIdsList);
            }    
        }
        messaging.sendEmail(new List<Messaging.Email>{message, message2});
    }*/
}