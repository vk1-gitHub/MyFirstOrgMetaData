({
      handleAddItem: function(component,event, helper) {
      
          var item = event.getParam("item");
          var action = component.get("c.saveItem");
                  action.setParams({
                    		  "item": item
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                    var items = component.get("v.items");
                    items.push(response.getReturnValue());
                    component.set("v.items", items);
               }
        });
        $A.enqueueAction(action);
    },

    
 /*	clickCreateItem: function(component, event, helper) {
        var items = component.find('Camping_Itemform').reduce(function (validSoFar, inputCmp){
                    inputCmp.showHelpMessageIfInvalid();   
                    return validSoFar && inputCmp.get('v.validity').valid;
          },true);
        
         if(items){    
               var newItem = component.get("v.newItem");
               var items = component.get("v.items");
               var newItem = JSON.parse(JSON.stringify(newItem));
               items.push(newItem);
               component.set("v.items", items);
               component.set("v.newItem", {'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Price__c': 0,
                        'Quantity__c': 0,                       
                        'Packed__c': false });
        }
	},
  */  
    
/*    clickCreateItem: function(component, event, helper) {
        var items = component.find('Camping_Itemform').reduce(function (validSoFar, inputCmp){
                    inputCmp.showHelpMessageIfInvalid();   
                    return validSoFar && inputCmp.get('v.validity').valid;
          },true);
        
        if(items){    
                 var newItem = component.get("v.newItem");
                 var newItem = JSON.parse(JSON.stringify(newItem));
                 helper.createItem(component,newItem);
        }
	},
*/   
    doInit: function(component, event, helper) {
        
        // Create the action
        var action = component.get("c.getItems");
        
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
                
                var state = response.getState();
                if (state === "SUCCESS") {
                        component.set("v.items", response.getReturnValue());
                        console.log(response.getReturnValue());
                }
                else {
                	    console.log("Failed with state: " + state);
                }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
})