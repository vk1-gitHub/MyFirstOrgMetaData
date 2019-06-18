public class EditContact{

 public Contact cont{get;set;}


 public String id = ApexPages.currentPage().getParameters().get('editid');

  public EditContact(){
   
    cont = new Contact(); 
    
     cont = [select firstname,title,phone,fax,email FROM Contact where Id= : id];
     
      
   //  String id = ApexPages.currentPage().getParameters().get('editid');
    
  }
  

  public void updateCon(){
  
 // PageReference pr = new PageReference('/apex/GetAccountsContact');
  
 /* Contact cid = [select Accountid from contact where id = :id];
  
  String accid = String.valueOf(cid);
  
  PageReference pr = Page.getAccountsContact;
   pr.getParameters().put('accid',accid);

  
  Contact con = new Contact();
  
  con.id =cont.id;
  con.firstname = cont.firstname;
  con.title = cont.title;
  con.phone = cont.phone;
  con.fax = cont.fax;
  con.email = cont.email;
  */
   //update [select id from Contact where id=:id];
   update cont;
//   pr.setRedirect(true);
 
 //  return pr;
  }
  
  
  
 
}