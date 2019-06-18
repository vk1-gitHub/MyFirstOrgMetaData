public class ServiceConsoleNewTestController {
    @AuraEnabled
    public static List<Case> getCasesList(String casePriority){
        System.debug('Priority ---'+casePriority);
        List<Case> caseList = [SELECT CaseNumber, ContactId, Contact.Name, AccountId, Account.Name FROM CASE WHERE Priority =: casePriority AND status != 'CLOSED'];
        System.debug('CaseList =  '+caseList);  
        return caseList;
    }
    @AuraEnabled
    public static void sendStatusMail(List<Id> caseIdList){
        System.debug('caseIdList @@## '+caseIdList);
        
        final String template = 'ServiceConsoleTestEmail';
        Id templateId; 
        System.debug('templateId @@## '+templateId);
        try {
            templateId = [select id from EmailTemplate where Name = :template].id;
        } catch (QueryException e) {}
        
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        // Send single mail to contact of each updated case
        for (Case uc : [select caseNumber, ContactId, Contact.Email from Case where Id in : caseIdList and Contact.HasOptedOutofEmail = false]) {
            
            // First, reserve email capacity for the current Apex transaction to ensure
// that we won't exceed our daily email limits when sending email after
// the current transaction is committed.
            Messaging.reserveSingleEmailCapacity(2);
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            // Strings to hold the email addresses to which you are sending the email.
            String[] toAddresses = new String[] {'vivekkumar231995@gmail.com'}; 
            String[] ccAddresses = new String[] {'Jha.Shweta2812@gmail.com'};
                    
                    
                    // Assign the addresses for the To and CC lists to the mail object.
                    mail.setToAddresses(toAddresses);
            mail.setCcAddresses(ccAddresses);
            
            // Specify the address used when the recipients reply to the email. 
            mail.setReplyTo('vivekkumar231995@gmail.com');
            
            // Specify the name used as the display name.
            mail.setSenderDisplayName('VK');
            
            // Specify the subject line for your email address.
            mail.setSubject('Ststus Report : ' + uc.Id);
            
            // Set to True if you want to BCC yourself on the email.
            mail.setBccSender(false);
            
            // Optionally append the salesforce.com email signature to the email.
            // The email address of the user executing the Apex Code will be used.
            mail.setUseSignature(false);
            
            // Specify the text content of the email.
            mail.setPlainTextBody('Hello Sir I am working on : ' + uc.Id +' Case.');
            
            mail.setHtmlBody('Hello Sir I am working on : ' + uc.Id +' Case. That is HTML Body');
            
            // Send the email you have created.
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
              
            /*Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTemplateId(templateId);
            message.setTargetObjectId(uc.ContactId);
            message.setWhatId(uc.Id);
            message.setToAddresses(new String[] {'VivekKumar231995@gmail.com'});
            messages.add(message);
           System.debug('messages =  '+messages);*/
        }
        Messaging.sendEmail(messages);
    }
}