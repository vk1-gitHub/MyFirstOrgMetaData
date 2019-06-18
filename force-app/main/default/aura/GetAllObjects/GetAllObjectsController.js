({
    handleRadioButtonEvent4 : function(component, event,helper) {
        var getSelected = event.getParam("updatedRadioButton");
        component.set("v.selectedRadioButton",getSelected);
    },
    
    doInit: function(component, event, helper) {
        component.set("v.selectedRadioButton","Note");
        var getSelected = component.get("v.selectedRadioButton");
        
        var action = component.get("c.getObjectsName");
        action.setParams({
            "str": getSelected
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.objName", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    handleChange : function(component, event,helper) {       
        
        var getSelected = component.get("v.selectedRadioButton");
        var selectedObj = component.find("selectedval").get("v.value");
        
        var appEvent2 = $A.get("e.c:NotesAndAttachmentEvent");
        appEvent2.setParams({ "radioButtonLabel" : getSelected, 
                             "selectedObj" : selectedObj });
        appEvent2.fire(); 
        
        var lookup_Refresh_Event = $A.get("e.c:LookUpRefreshEvent");
        lookup_Refresh_Event.fire();
        
    },  
    
    handleRadioButtonEvent : function(component, event,helper) {
        
        var getSelected = event.getParam("radioButtonLabel");
        
        component.set("v.selectedRadioButton",event.getParam("radioButtonLabel"));
        
        var action = component.get("c.getObjectsName");
        action.setParams({
            "str": getSelected
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                
                component.set("v.objName", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
    
})