global class EmailDemoReceive implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.Inboundenvelope envelope) {
        
        Account account;
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        try {
            if ([select count() from Account where Name = :email.subject] == 0) {
                account = new Account();
                account.Name = email.subject;
                System.debug('account !!@@ == '+account);
                insert account;
                System.debug('account Id = '+account.Id);
            } else {
                account = [select Id from Account where Name = :email.subject];
                System.debug('account in else !!@@ == '+account);
            }
            if(email.ccAddresses != null && email.ccAddresses.size() > 1){
                for (String address : email.ccAddresses) {
                Contact contact = new Contact();
                Matcher matcher = Pattern.compile('<.+>').matcher(address);
                
                // Parse addresses to names and emails
                if (matcher.find()) {
                    String[] nameParts = address.split('[ ]*<.+>')[0].replace('"', '').split('[ ]+');
                    
                    contact.FirstName = nameParts.size() > 1 ? nameParts[0] : '';
                    contact.LastName = nameParts.size() > 1 ? nameParts[nameParts.size()-1] : nameParts[0];
                    contact.Email = matcher.group().replaceAll('[<>]', '');
                } else {
                    contact.LastName = address;
                    contact.Email = address;
                    System.debug('contact.Email @@## '+contact.Email);
                    System.debug('contact.LastName @@## '+contact.LastName);
                }
                
                // Add if new
                if ([select count() from Contact where Email = :contact.Email] == 0) {
                    contact.AccountId = account.Id;
                    insert contact;
                    System.debug('contact @@## '+contact);
                }
                if(email.textAttachments != null && email.textAttachments.size() >1){
                    for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                        Attachment attachment = new Attachment();
                        
                        attachment.Name = tAttachment.fileName;
                        attachment.Body = Blob.valueOf(tAttachment.body);
                        attachment.ParentId = account.Id;
                        insert attachment;
                        System.debug('TextAttachment attachment @@## '+attachment);
                    }
                }
                if(email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                    for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                        Attachment attachment = new Attachment();
                        attachment.Name = bAttachment.fileName;
                        attachment.Body = bAttachment.body;
                        attachment.ParentId = account.Id;
                        insert attachment;
                        System.debug('BinaryAttachment @@## '+attachment);
                    }
                }
                
                Note note = new Note();
                
                note.Title = email.fromName + ' (' + DateTime.now() + ')';
                note.Body = email.plainTextBody;
                note.ParentId = account.Id;
                insert note;
                System.debug('note @@## '+note);
                result.success = true;
            }
            }
        }catch (Exception e) {
            result.success = false;
            result.message = e.getMessage();
        }
        System.debug('result @@## '+result);
        return result;
    }
}