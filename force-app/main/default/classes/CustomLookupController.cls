public class CustomLookupController {
	@AuraEnabled
    public static list<LookupWrapper> fetchBillingAccount(String ObjectName, String nameField, String searchKeyWord, String recordId, String customCondition ) {
    	list<LookupWrapper > recordList = new list<LookupWrapper>();
        searchKeyWord = (String.isBlank(searchKeyWord) ? '': searchKeyWord);
        
        String sQuery =  'SELECT Id, ' + nameField + ' from ' + ObjectName + ' WHERE '+ nameField + ' LIKE \'%' + searchKeyWord + '%\'';  
        
        if(String.isNotBlank(recordId))
            sQuery += ' AND id=:recordId';
        
        if(String.isNotBlank(customCondition))
            sQuery += ' AND ' + customCondition;
        
        sQuery += ' order by createdDate DESC limit 10';
        System.debug(sQuery);
        
        for (sObject obj: Database.query(sQuery)) {
            LookupWrapper wrapObj = new LookupWrapper(String.valueOf(obj.get('Id')), String.valueOf(obj.get(nameField)));
            recordList.add(wrapObj);
        }

        return recordList;
    }
    
    public  class LookupWrapper{
        @AuraEnabled
        public String Id {get; set;}
        @AuraEnabled
        public String Name {get; set;}
        
        public LookupWrapper(String Id, String Name){
            this.Id = Id;
            this.Name = Name;
             
        }
    }
}