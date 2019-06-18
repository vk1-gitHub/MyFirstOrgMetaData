({  	
    handleLookupEvent : function(component, event,helper) {
        component.set("v.sObj",null);
        
    },
    handleRadioButtonEvent3 : function(component, event,helper) {
        var getSelected = event.getParam("radioButtonLabel");
        var selectedObj = event.getParam("selectedObj");
        var recordName = event.getParam("recordName");
        
        if(getSelected == 'Note')
        {
            component.set("v.var",false);
        }
        component.set("v.radioButton",event.getParam("radioButtonLabel"));
        component.set("v.obj",selectedObj);
        component.set("v.name",recordName);
        
        
        var action = component.get("c.getData");
        action.setParams({"radioButton": getSelected,
                          "parent": selectedObj ,
                          "name": recordName }); 
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.sObj",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    handleRadioButtonEvent4 : function(component, event,helper) {
        var getSelected = event.getParam("updatedRadioButton");
        
        if(getSelected == 'Note'){
            component.set("v.var",false);
        }
        else{ component.set("v.var",true);   } 
        component.set("v.radioButton",getSelected);
        
        
        var action = component.get("c.getData");
        action.setParams({"radioButton": component.get("v.radioButton"),
                          "parent": component.get("v.obj") ,
                          "name": component.get("v.name") }); 
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.sObj",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    }
})