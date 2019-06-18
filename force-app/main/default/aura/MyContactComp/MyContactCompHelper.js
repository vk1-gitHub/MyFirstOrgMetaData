({
	fetchContacts : function(component,event , helper) {
		var action = component.get("c.getContacts");
        var accountid = component.get("v.recordId");
        
        action.setParams({
            accountids :accountid
       });
        action.setCallback(this, function(response){
        var state=response.getState();
        
        if(state === 'SUCCESS'){
            var contactList = response.getReturnValue();
            Console.log(contactList);
        }
        else{
            alert('Error in Getting data');
        }
      });
      $A.enqueueAction(action);  
	}
})