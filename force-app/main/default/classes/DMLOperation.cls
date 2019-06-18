public class DMLOperation{
  
   public List<Contact> listcon = new List<Contact>();
   
     public List<Contact> getListcon(){
       return listcon;
     }
   
    public PageReference show(){
       listcon = [select name from Contact Limit:5];
       return null;
    }
    
    public Contact con;
    
    public PageReference insertcon(){
      con = new Contact(FirstName = 'Amit',LastName = 'Sharma', email = 'amit@cloud.com');
       insert con;     
       return null;
    }
    
    
}