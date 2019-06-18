trigger EmailDemoSendMass on Case (after update) {
    final String template = 'Test Email Services';
    Messaging.MassEmailMessage message = new Messaging.MassEmailMessage();
    
    message.setTemplateId([select Id from EmailTemplate where Name = :template].Id);
        // Send mass email to contacts of account associated with each updated case
        for (Case uc : Trigger.new) {
            Contact[] contacts = [select HasOptedOutofEmail, Id from Contact where AccountId = :uc.AccountId];
            Id[] targetObjectIds = new Id[] {};
                Id[] whatIds = new Id[] {};
                    
                    for (Contact c : contacts) {
                        targetObjectIds.add(c.Id);
                        whatIds.add(uc.Id);
                    }
            
            message.setTargetObjectIds(targetObjectIds);
            message.setWhatIds(whatIds);
            Messaging.sendEmail(new Messaging.Email[] {message});
        }
}