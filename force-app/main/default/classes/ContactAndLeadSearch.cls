public class ContactAndLeadSearch {
    
    public static List<List<SObject>>  searchContactsAndLeads(String str){
        List<List<SObject>> sObjListOfList = new List<List<SObject>>();
        List<Sobject> sObjList1 = [Select id FROM Contact WHERE firstName =: str OR lastName =: str];
        List<Sobject> sObjList2 = [Select id FROM Lead WHERE firstName =: str OR lastName =: str];
        sObjListOfList.add(sObjList1);
        sObjListOfList.add(sObjList2);
        return sObjListOfList;
    }

}