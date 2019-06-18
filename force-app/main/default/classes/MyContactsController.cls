public class MyContactsController{

     @AuraEnabled
     public static List<Contact> getContacts(List<id> accountids){
        List<Contact> contactList=[select id,accountid,phone,name,email from Contact where accountid in: accountids];
        return contactList;
    }
}