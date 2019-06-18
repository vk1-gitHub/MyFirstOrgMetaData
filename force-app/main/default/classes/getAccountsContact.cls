public class getAccountsContact{
    
    // String conid =ApexPages.currentPage().getParameters().get('id');
    // String accid =ApexPages.currentPage().getParameters().get('id');
    public String delid{get;set;}
    public String editid{get;set;}
    
    //   public String accid{get;set;}
    
    Account acc{get;set;}
    List<Contact> con{get;set;}
    
    public getAccountsContact(){
        
        acc = new Account();
        con = new List<Contact>();
    }
    
    public Account GetAccount(){
        String accid =ApexPages.currentPage().getParameters().get('id');
        acc = [select name,type,phone,fax from Account where id = :accid];
        return acc;
    }
    
    public List<Contact> GetContact(){
        String conid =ApexPages.currentPage().getParameters().get('id');  
        con = [select id, name,title,phone,fax,email from Contact where Accountid =: conid];
        return con;
    }
    
    public PageReference Edit(){
        PageReference px =Page.EditContact;
        px.getParameters().put('editid',editid);
        px.setRedirect(true);
        return px;
    }
    public void DeleteCon(){  
        delete [select id from Contact where id =:delid];
    }
    
    
}