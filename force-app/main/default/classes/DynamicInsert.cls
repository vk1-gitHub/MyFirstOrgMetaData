public class DynamicInsert{
   
    public Contact con{get;set;}
    
    public DynamicInsert(){
  
        con= new Contact();       
   }    
    public void InsertCon(){
     
     insert con; 
           
    }
   public void DeleteCon(){
    
  
     
     delete [select id from Contact where lastname =: con.lastName];
          
    }
    
 }