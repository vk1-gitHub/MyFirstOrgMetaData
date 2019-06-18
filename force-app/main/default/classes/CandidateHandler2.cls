public class CandidateHandler2{

       public static void createAccount(List<Candidate__c> candiList){
              Account obj;
              Account Mbrok_obj;
              Contact conobj;
              Task task_obj;
              
              List<Account>  newacclist = new List<Account>();
              List<Account>  newmanageacclist = new List<Account>();
              List<Contact>  conlist = new List<Contact>();
              List<Task>  tasklist = new List<Task>();
              
              for(Candidate__c c :candiList){
                  if(c.Brokerage__c != null){
                      obj = new Account(Name = c.brokerage__c);
                  
                      if(c.Brokerage__c != null && c.ManageBrokerage__c != null){
                           Mbrok_obj = new Account(parent = obj, Name = c.managebrokerage__c);
                           newmanageacclist.add(Mbrok_obj);
                           
                           conobj = new Contact(account = Mbrok_obj , lastname = Mbrok_obj.Name,candidate__c =c.id);  
                           conlist.add(conobj);
                           
                           
                       }
                  newacclist.add(obj); 
                  System.debug('New Account List : '+newacclist);  
              }          
        }
        
         if(newacclist.size()>0)
              insert newacclist;
        
         for(Account obj1 : newmanageacclist){
              obj1.parentid = obj1.parent.id; 
         } 
         
         if(newmanageacclist.size()>0)
               insert newmanageacclist;
            
         for(Contact cn : conlist){
               cn.accountid = cn.account.id;
               cn.lastname = cn.account.name;
         }   
         
         if(conlist.size() > 0)
                 insert conlist;    
             
         for(Contact cn : conlist){          
              task_obj = new Task(whoid=cn.id,whatid=cn.candidate__c,Subject='Portal Contact Setup');
              tasklist.add(task_obj);    
         }        
                    
         if(tasklist.size() > 0)
             insert tasklist;                   
   }
}