public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lName, String mAddress){
        return [Select id FROM Contact where lastName =: lName AND MailingPostalCode =: mAddress];
    }

}