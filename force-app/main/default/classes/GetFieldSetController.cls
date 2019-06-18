public class GetFieldSetController {
    
    @AuraEnabled
    public static List<DescribeFieldset> getFieldset() {
        String fsetName = 'Personal_Information';
        Schema.FieldSet fs1 = Schema.SObjectType.Contact.fieldSets.getMap().get(fsetName);
        
        System.debug('Return Value = '+fs1);
        
        List<DescribeFieldset> getField = new List<DescribeFieldset>();
        System.debug('Path = '+fs1.getFields());
        
        for(Schema.FieldSetMember f: fs1.getFields()){     
            getField.add(new DescribeFieldset(f.getLabel(),f.getFieldPath(),f.getDBRequired(),f.getType()));   
        }
        return getField;
    }
    
    
    @AuraEnabled
    public static List<DescribeFieldset> getSummaryFieldset() {
        String sfSet = 'Summary';
        Schema.FieldSet fs1 = Schema.SObjectType.Contact.fieldSets.getMap().get(sfSet);
        
        System.debug('Return Value = '+fs1);
        
        List<DescribeFieldset> getField = new List<DescribeFieldset>();
        System.debug('Path = '+fs1.getFields());
        
        for(Schema.FieldSetMember f: fs1.getFields()){  
            getField.add(new DescribeFieldset(f.getLabel(),f.getFieldPath(),f.getDBRequired(),f.getType()));   
        }
        return getField;
    }

    @AuraEnabled
    public static Contact saveDetail(Contact con) {
        System.debug(con);
        upsert con;
        return con;
    }
    
    @AuraEnabled
    public static List<DescribeExperience> getFieldsSet(String fieldSet) {
        
        List<DescribeExperience> getExpField = new List<DescribeExperience>();    
        List<ResumeFieldType__mdt> mdtList = new List<ResumeFieldType__mdt>();
        
        mdtList = [select APIName__c,Label,SortOrder__c,type__c from ResumeFieldType__mdt where section__c =: fieldSet ORDER BY SortOrder__c];
        System.debug('mdtList = '+mdtList);
        for(ResumeFieldType__mdt mdt : mdtList){
            getExpField.add(new DescribeExperience(mdt.Label ,mdt.APIName__c ,mdt.type__c )); 
        }
        
        System.debug(getExpField);
        return getExpField;
    }
    
}