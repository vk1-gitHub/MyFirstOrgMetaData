public class DeleteUsingMap{

  public List<Contact> listcon{get;set;}
  public Map<id,boolean> mp = new Map<id,boolean>();
  public boolean check{get;set;}
 
   public DeleteUsingMap()
   {  
     listcon = new List<Contact>();
     check = false;
     listcon = [SELECT id,lastname,phone from Contact Limit 10];   
     
     for(Contact c: listcon)
     {
       mp.put(c.id,check);
     }  
   }
   
   public List<Contact> getFillContact(){ 
      
     listcon = [SELECT id,lastname,phone from Contact Limit 10];   
      return listcon;
       
       /*   for(Contact c: listcon)
           {
            mp.put(c.id,check);
           }    */
    
   }
   
   public void deleteData()
   {
     for(Contact c: listcon)
     {
         if(mp.containsKey(c.id) && mp.get(c.id))
         delete [select id from Contact where id=:c.id];
     }
   }
   
}