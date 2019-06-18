global class UpdateAccount implements Database.Batchable<sObject>{

   global final String query;
   global final String entity;
   global final String field;
   global final String value;
      
   global UpdateAccount(String q,String e,String f,String v){
   
         query = q;
         entity = e;
         field = f;
         value = v;
   }
   global Database.QueryLocator start(Database.BatchableContext BC){
          return Database.getQueryLocator(query);
   
   }
   global void execute(Database.BatchableContext BC, List<sObject> objList){
        for(sObject sObj: objList){
          sObj.put(field,value);
        }
       update objList;
   }
   global void finish(Database.BatchableContext BC){
   
   }
   
}