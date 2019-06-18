({
    handleLookupEvent : function(component, event,helper) {   
        component.set("v.acc.name",null);
    },
    
    handleComponentEvent : function(component, event,helper) {   
        component.set("v.recordName",event.getParam("RecordName"));
    },
    
    handleRadioButtonEvent2 : function(component, event,helper) {
        
        component.set("v.radioButtonLabel",event.getParam("radioButtonLabel"));
        component.set("v.selectedObj",event.getParam("selectedObj"));
    },
    handleRadioButtonEvent4 : function(component, event,helper) {
        var getSelected = event.getParam("updatedRadioButton");
        component.set("v.radioButtonLabel",getSelected);
    },
    searchResult : function(component, event, helper) {
        
        var getSelected = component.get("v.radioButtonLabel");
        var selectedObj = component.get("v.selectedObj");
        var name = component.get("v.recordName");
        
        var recordName = component.get("v.acc.name");
        
        if(recordName !== '' && recordName !== undefined && name !== '' && name !== undefined)
        {   
            var appEvent3 = $A.get("e.c:NotesAndAttachmentEvent");
            appEvent3.setParams({ "radioButtonLabel" : getSelected, 
                                 "selectedObj" : selectedObj,
                                 "recordName" : name });
            appEvent3.fire(); 
        }
        else if(name != '' && name != null ){
            
            var appEvent3 = $A.get("e.c:NotesAndAttachmentEvent");
            appEvent3.setParams({ "radioButtonLabel" : getSelected, 
                                 "selectedObj" : selectedObj,
                                 "recordName" : name });
            appEvent3.fire(); 
            
        }
        
            else{       
                var appEvent3 = $A.get("e.c:NotesAndAttachmentEvent");
                appEvent3.setParams({ "radioButtonLabel" : getSelected, 
                                     "selectedObj" : selectedObj,
                                     "recordName" : recordName });
                appEvent3.fire(); 
            }
    }
})