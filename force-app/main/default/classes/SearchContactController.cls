public with sharing class SearchContactController {
     
     @AuraEnabled
     public static List<Contact> fetchContact(List<String> listcon){
         
      /*  String FName = '%' + listcon[0] +  '%';
          String LName = '%' + listcon[1] +  '%';
          String Email = '%' + listcon[2] +  '%';
          String Phone = '%' + listcon[3] +  '%';    */
         
          String FName =   listcon[0];
          String LName =   listcon[1];
          String Email =   listcon[2];
          String Phone =   listcon[3]; 
    
          String query = 'SELECT ID, FirstName, LastName,Email,Phone FROM Contact where id != NULL '; 
         
          if(listcon !=null && listcon.size() > 0)
          {
                 if(FName != '')
                 {
                   query += 'And firstname LIKE \'' +FName+'%\'';
                 }
                 if(LName != '')
                 {
                   query += ' AND LastName LIKE \'' +LName+ '%\'';
                 }
                 if(Email != '')
                 {
                   query += ' AND Email LIKE \'' + Email +'%\'';
                 }
                 if(Phone != '')
                 {
                   query += 'AND Phone LIKE \'' + Phone +'%\'';
                 }
         }
        
         List<Contact> contlist =Database.query(query);
         return contlist;
     } 
      @AuraEnabled
      public static List<Contact> loadContact(List<String> listcon){
                     
         List<Contact> conlist2 = [select id, FirstName, LastName,Email, Phone from Contact order by FirstName limit 20 ];              
         return conlist2;
     } 
}