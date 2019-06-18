({
	clickCreateItem : function(component, event, helper) {
        var validCamping = component.find('Camping_Itemform').reduce(function (validSoFar, inputCmpt){
                  inputCmpt.showHelpMessageIfInvalid();   
                  return validSoFar && inputCmpt.get('v.validity').valid;
          },true);
        
        if(validCamping){    
             var newCamping_Item = component.get("v.newCamping_Item");
            console.log("Create newCamping_Item: " + JSON.stringify(newCamping_Item));
            helper.createExpense(component, newCamping_Item);
        }
	}
    
})