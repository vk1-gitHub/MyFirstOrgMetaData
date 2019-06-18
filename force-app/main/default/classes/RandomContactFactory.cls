public class RandomContactFactory {
    public static List<Contact> conList = new List<Contact>();
    public static List<Contact> generateRandomContacts(Integer numOfCont, String lastName){
        
        for(Integer i=1; i<=numOfCont; i++){
            conList.add(new Contact(firstName ='Test'+i, lastName = lastName));
        }
        return conList;
    }

}