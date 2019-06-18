public class GetAllObjects {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by Name';
        List < sObject > lstOfRecords = Database.query(sQuery);
       
        for (sObject obj: lstOfRecords) {   
            returnList.add(obj);
        }
        return returnList;
    }
   @AuraEnabled
    public static List<String> getObjectsName(String str){
       String query = 'Select parent.Type From'; 
       if(str == 'Note')
       {
           query += ' Note';
           List<Note> noteList= Database.query(query);
           Set<String> strSet =new Set<String>();
           for(Note n : noteList)
           {
             String a = (String) n.parent.type;
             strSet.add(a);  
           }
           
           List<String> slist = new List<String>(); 
           slist.addAll(strSet); 
           
          return slist;
       }
      else{
            query +=' Attachment';
            List<Attachment> attachList= Database.query(query);
            Set<String> strSet =new Set<String>();
          
            for(Attachment attach : attachList){
                 String a= (String) attach.parent.type;
                 strSet.add(a); 
            }
          
            List<String> slist = new List<String>();
             slist.addAll(strSet); 
                    
            System.debug('All Notes Objects = '+slist);
           return slist;
       }
   }
   @AuraEnabled
    public static List<sObject> getData(String radioButton, String parent, String name){
      // String query = 'Select id,Title,parent.Type From'; 
         String nm = name;
         String radio = radioButton;
         String obj = parent;
         System.debug('Name = '+nm);
         System.debug('radionButton = '+radio);
         System.debug('Object = '+obj);
        
         String query1 = 'Select id From ' +parent+' where name =\'' +name+'\'';
     
         System.debug('Query = '+query1);
       
         List<sObject> abc =Database.query(query1);
         String idd;
         For(sObject sobj:abc){
            idd = sobj.id;
        }
        System.debug('String Id = '+idd);
            
        if(radioButton == 'Note')
        {
           String query = 'Select id, Title, parent.Type From Note where parent.Type = \'' +parent+'\' AND parentId = \'' +idd+'\'';
           
           System.debug('Query = '+query);
            
           List<Note> noteList= Database.query(query);
           
           List<SObject> sList=new List<SObject>();
            
           for(sObject sobj : noteList){
              sList.add(sobj);
           }
        
          System.debug('All data = '+sList);
          return sList;
       }
   
      else{
           String query ='Select id, name, parent.Type From Attachment where parent.Type = \'' +parent+'\' AND parentId = \'' +idd+'\'';
              System.debug('Query = '+query);
            
          List<Attachment> attachList = Database.query(query); 
          List<SObject> sList = new List<SObject>();
          for(sObject sobj : attachList){
              sList.add(sobj);
          }
        
        System.debug('All data = '+sList);
         return sList;         
       }
    }
}