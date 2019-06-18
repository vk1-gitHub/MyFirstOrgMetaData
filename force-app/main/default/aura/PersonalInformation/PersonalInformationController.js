({
    
    handleNext : function(component,evet,helper){
          var appEvent = $A.get("e.c:SummaryEvent");
          appEvent.fire();
    },
      
    handleSave : function(component,evet,helper){
        
        var arr = [];
        
        var js = '{';
        var valid = component.find("pInfoForm").reduce(function (validSoFar, inputCmp) {
            
              arr.push(inputCmp.get("v.value"));
            
                if(inputCmp.get("v.name") == 'Address__c'){
                     js += '"'+inputCmp.get("v.name")+'":"'+inputCmp.get("v.value")+'"';
                }
                else{
                     js += '"'+inputCmp.get("v.name")+'":"'+inputCmp.get("v.value")+'",';  
                }
          }, true);  
        
        js += '}';
        console.log(js);
      //  console.log(arr);
        
       var action = component.get("c.saveDetail");
        action.setParams({
            "con": js
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                  alert("Saved");
            }
            if (state === "ERROR"){
                  alert(JSON.stringify(response.getError()));
            }
          
        });
        $A.enqueueAction(action);
        
        
     /*   var action = component.get("c.saveDetail2");
        action.setParams({
            "liststr": arr
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {    
                 alert('Record Saved');
            }
            if (state === "ERROR"){
                  alert(JSON.stringify(response.getError()));
            }
        });
        $A.enqueueAction(action); */
    },
    
   doInit : function(cmp,event,helper) {
       var action = cmp.get("c.getFieldset");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
    
                cmp.set("v.Result",(response.getReturnValue()));
              
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
     
     
    /*    $A.createComponent(
            "lightning:input",
            {
                "aura:id": "findableAuraId",
                "label": "FirstName"
            },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newButton);
                    cmp.set("v.body", body);
                } 
            } 
        );
        $A.createComponent(
            "lightning:input",
            {
                "aura:id": "findableAuraId",
                "label": "LastName"
            },
            function(newInput, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newInput);
                    cmp.set("v.body", body);
                }
            }
        );
     $A.createComponent(
            "lightning:input",
            {  
                "type" : "email",
                "aura:id": "findableAuraId",
                "label": "Email"
            },
            function(newInput, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newInput);
                    cmp.set("v.body", body);
                }
            }
        );
     $A.createComponent(
            "lightning:input",
            {
                "type": "tel",
                "aura:id": "findableAuraId",
                "label": "Phone"
            },
            function(newInput, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newInput);
                    cmp.set("v.body", body);
                }
            }
        );
     $A.createComponent(
            "lightning:input",
            {
                "type": "date",
                "aura:id": "findableAuraId",
                "label": "DOB"
            },
            function(newInput, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newInput);
                    cmp.set("v.body", body);
                }
            }
        );$A.createComponent(
            "lightning:textarea",
            {
                "aura:id": "findableAuraId",
                "label": "Address",
                "maxlength" : "300"
            },
            function(newInput, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newInput);
                    cmp.set("v.body", body);
                }
            }
        );
    },
    

    handlePress : function(cmp) {
        console.log("button pressed");*/
    } 
})