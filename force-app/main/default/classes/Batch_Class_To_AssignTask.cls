global class Batch_Class_To_AssignTask implements Database.Batchable<SObject>,Database.Stateful{
           
        global List<String> emailList = new List<String>(); 
        global List<Task> taskList = new List<Task>();
        global Map<String,List<Task>> emailMap = new Map<String,List<Task>>();
        global Set<Contact> contSet = new Set<Contact>();
     
        global Database.QueryLocator start(Database.BatchableContext BC){
               datetime dt = System.now()-1;
               String Record_Type_Name = 'Trainee';
        return Database.getQueryLocator('Select id,Email,name from Contact where createdDate > : dt AND RecordType.Name =: Record_Type_Name');
       
        }
        
        global void execute(Database.BatchableContext BC, List<Contact> conList){
            contSet.addAll(conList);
            
            for(Contact con: conList){  
                  if(String.isNotBlank(con.Email)){
                      emailList.add(con.Email);
                   }   
                   for(Integer i=1;i<=100;i++){
                        Task tsk = new Task(whoId = con.id,status ='Not Started');
                        taskList.add(tsk);
                   } 
                  emailMap.put(con.name,taskList);            
            } insert taskList;
   }
   global void finish(Database.BatchableContext BC){
     
         for(Contact con2 : contSet){
           if(emailMap.containsKey(con2.name)){
                
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setSubject('Task Assignment');
                email.setPlainTextBody('Testing Apex Scheduler-Body'+emailMap.get(con2.name));
                email.setToAddresses(emailList);
                Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
            
            }            
         }
   } 
}