public class CandidateHandler{

    public static void createAccount(List<Candidate__c> candiList){
      
          List<Candidate__c> canList = new List<Candidate__c>(); 
          List<Candidate__c> canList2 = new List<Candidate__c>(); 
          
          for(Candidate__c c :candiList){
              if(c.Brokerage__c != null){
                  canList.add(c);
              }
              if(c.Brokerage__c != null && c.ManageBrokerage__c != null){
                 canList2.add(c);
              }
          }
          
          Map<String,id> mapsid = new Map<String,id>();
          List<Account> accList = new List<Account>();
          if(canList.size() > 0 && canList != null){
                                
                  for (Candidate__c cn : canList) {
                      String accountName = cn.FirstName__c + ' ' + cn.lastname__c;

                      Account a = new Account(name=accountName);
                      acclist.add(a);
                  }
                  insert accList;
          }
          
          if(canList2.size() > 0 && canList2 != null){
                
                  if(accList.size() >0  && accList != null){
                        for(Account  a:accList){
                        mapsid.put(a.name,a.id);
                      }
                  }
                
                  String parentid;
                  List<Account>  accList1 = new List<Account>();
                  Map<String,id> mapcid = new Map<String,id>();
                  List<id> cid = new List<id>();
                  
                  for(Candidate__c cn : canList) {
                      cid.add(cn.id);
                      String accountName = cn.FirstName__c + ' '+ cn.lastname__c;
               
                      mapcid.put(accountName,cn.id);
               
                      if(mapsid.containsKey(accountName))
                           parentid = mapsid.get(accountName);
                      
                      acclist1.add(new Account(name=accountName,parentid = parentid));
                  }
                  insert accList1;
                  
                  List<Contact> listcon = new List<Contact>();
                  String canid;
                  for(Account a: accList1){
                  
                      String lname = a.name;
                      
                      if(mapcid.containsKey(lname))
                           canid = mapcid.get(lname);
                      
                      listcon.add(new Contact(accountid=a.id,lastname=lname,Candidate__c=canid));
                  }
                  insert listcon;
                  
                  if(listcon.Size() > 0){
                  
                       List<Task> taskList = new List<Task>();
                       for(Contact c: listcon){           
                             taskList.add(new Task(whoid= c.id,whatid=c.Candidate__c,Subject='Portal Contact Setup'));            
                       }
                       insert taskList;
                  }
          }         
    }
}