trigger SingleEmailDemoUsingContact on Contact (after insert) {
    
 /*   Final  String template = 'TestEmailServicesOnContactInsertion';
    Id templateId;
    
    List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    try{
        templateId = [Select id FROM EmailTemplate where name = : template ].Id;
    }
    catch(Exception ex){
        System.debug('Exception Occour : '+ex);
    }
    
    for(Contact con : [Select id, email FROM Contact where id IN : Trigger.New AND HasOptedOutOfEmail = false ]){
        message.setTemplateId(templateId);
        message.setTargetObjectId(con.id);
        message.setToAddresses(new List<String> {con.Email, 'Vivekkumar231995@gmail.com','diwakarraj.cloud@gmail.com'});
        messages.add(message);
    }
    messaging.sendEmail(messages);    */
}