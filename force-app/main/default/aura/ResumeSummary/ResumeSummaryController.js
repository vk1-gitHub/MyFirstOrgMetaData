({
    handleBack : function(component,event,helper){
        var appEvent = $A.get("e.c:PersonalInformationEvent");
        appEvent.fire();
    },
    handleNext : function(component,event,helper){
        var appEvent = $A.get("e.c:ExperienceEvent");
        appEvent.fire();
    },
    
   doInit : function(cmp,event,helper) {
       var action = cmp.get("c.getSummaryFieldset");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
    
              cmp.set("v.Summary",(response.getReturnValue()));
               
                console.log(response.getReturnValue());
                 
			}
            else if (state === "INCOMPLETE") {
                // do something
                alert("INCOMPLETE");
            }
            else if (state === "ERROR") {
                alert("ERROR");
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    } 
})