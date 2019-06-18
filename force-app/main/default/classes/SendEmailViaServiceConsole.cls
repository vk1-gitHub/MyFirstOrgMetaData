public class SendEmailViaServiceConsole {
    
    public static void sendStatusMail(){
        final String template = 'ServiceConsoleTestEmail';
        Id templateId; 
        
        try {
            templateId = [select id from EmailTemplate where Name = :template].id;
        } catch (QueryException e) {
            //handle exception if no template is retrieved, or create condition to set email body in code
        }
        
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        // Send single mail to contact of each updated case
        // for (Case uc : [select ContactId, Contact.Email from Case where Id in :Trigger.new and Contact.HasOptedOutofEmail = false]) {
            
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTemplateId(templateId);
           // message.setTargetObjectId(uc.ContactId);
           // message.setWhatId(uc.Id);
            message.setToAddresses(new String[] {'Jha.Shweta2812@gmail.com','VivekKumar231995@gmail.com'});
            messages.add(message);
        //}
        Messaging.sendEmail(messages);
    }
    
}