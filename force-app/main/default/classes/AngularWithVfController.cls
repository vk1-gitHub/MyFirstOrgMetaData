public class AngularWithVfController{
    
    public String jsonString{get;set;}
    
    public AngularWithVfController(){
        jsonString = JSON.serialize([Select id, FirstName , lastname, phone, Email FROM Contact where FirstName != null LIMIT 10]);
        System.debug('JSON String !!@@ '+jsonString);
    }

    /*public static String getContacts() {
       return JSON.serialize([select id, firstName, LastName, Email,Phone from contact where FirstName != null LIMIT 10]);
    } */
    

}