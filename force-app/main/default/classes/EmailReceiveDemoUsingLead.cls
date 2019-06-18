global class EmailReceiveDemoUsingLead implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.Inboundenvelope envelope) {
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        Lead leadObj = new Lead();
        try {
            System.debug('email.plainTextBody '+email.plainTextBody);
            String str = email.plainTextBody;
            str = str.replace('\n',',');
            str = str.deleteWhitespace();
            System.debug('New String = '+str);
            List<String> listStr = new List<String>();
            for(String str1 : str.split(',')){
                if(str1.contains(':')) 
                    listStr.add(str1);
            }
            System.debug('Array = '+listStr);
            System.debug('Array Size = '+listStr.size());
            Map<String,String> strMap = new Map<String,String>();
            for(String str2 : listStr){
                
                List<String> strlist = str2.split(':');
                strMap.put(strlist[0], strlist[1]);
            }
            for(TestEmailServices__mdt  fconfig : [SELECT FieldName__c, FieldConfiguration__c FROM TestEmailServices__mdt]){
                for(String sttr : strMap.keyset()){
                    if(fconfig.FieldConfiguration__c.containsIgnoreCase(sttr)){
                        leadObj.put(fconfig.FieldName__c, strMap.get(sttr));
                    }
                }
            }  
            System.debug('Lead @@## '+leadObj);
            insert leadObj;
            System.debug('Lead @@## '+leadObj);
            result.success = true;
            
        }catch (Exception e) {
            System.debug('Exception @@@@@ '+e);
            result.success = false;
            System.debug('Exception = '+e.getMessage());
            System.debug(e.getMessage().deleteWhitespace().substringBetween('[',']'));
            String errorString = e.getMessage().deleteWhitespace().substringBetween('[',']');
            if(errorString.contains(',')){
                for(String reqField : errorString.split(',')){
                    leadObj.put(reqField, 'Unknown');
                }
            }
            else{
                leadObj.put(errorString, 'Unknown');
            }
            System.debug('Lead Record Now @@## '+leadObj);
            insert leadObj;
            //result.message = e.getMessage();
        }
        if(leadObj.Id != null){
            EmailMessage e1 = new EmailMessage();
            e1.TextBody =email.plainTextBody;
            e1.Subject = email.subject;
            e1.ToAddress = email.toAddresses[0];
            insert e1;
            System.debug('EmailMessage == '+e1);
            
            EmailMessageRelation emr = new EmailMessageRelation();
            emr.EmailMessageId = e1.Id;
            emr.RelationId = leadObj.Id;
            emr.RelationType = 'FromAddress'; 
            insert emr;
            System.debug('emr@@## '+emr);
            Product2 product =  [Select ProductId__c FROM Product2 where ProductId__c =: email.subject];
            if(email.textAttachments != null && email.textAttachments.size() >0){
                for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                    Attachment attachment = new Attachment();
                    attachment.Name = tAttachment.fileName;
                    attachment.Body = Blob.valueOf(tAttachment.body);
                    attachment.ParentId = product.Id;
                    insert attachment;
                    System.debug('TextAttachment attachment @@## '+attachment);
                }
            }
            if(email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                    Attachment attachment = new Attachment();
                    attachment.Name = bAttachment.fileName;
                    attachment.Body = bAttachment.body;
                    attachment.ParentId = product.Id;
                    insert attachment; 
                    System.debug('BinaryAttachment @@## '+attachment);
                }
            }
        }
        return result;
    }
}