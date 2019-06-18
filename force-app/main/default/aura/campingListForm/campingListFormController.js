({  
     clickCreateItem: function(component, event, helper) {
        var items = component.find('Camping_Itemform').reduce(function (validSoFar, inputCmp){
                    inputCmp.showHelpMessageIfInvalid();   
                    return validSoFar && inputCmp.get('v.validity').valid;
          },true);
        
        if(items){    
                 var newItem = component.get("v.newItem");
                 var newItem = JSON.parse(JSON.stringify(newItem));
                 helper.createItem(component,newItem);
        }
	}
    
})