({
	 /* handleAddContact : function(component, event) {

         var searchKeyWord = event.getParam("searchKeyWord");

        var action = component.get("c.fetchContact");
        action.setParams({
            'searchKeyWord': searchKeyWord
        });
    
     action.setCallback(this, function(response) {
            var state = response.getState();
            console.log()
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                console.log('All Result ' +storeResponse);

                // if storeResponse size is 0 ,display no record found message on screen.
              if (storeResponse.length == 0) {
                    component.set("v.Message", true);
                } else {
                    component.set("v.Message", false);
                }
                // set numberOfRecord attribute value with length of return value from server
                component.set("v.numberOfRecord", storeResponse.length);
                // set searchResult list with return value from server.
                component.set("v.searchResult", storeResponse);
                console.log("v.searchResult");
                
            }
  
        });
       
        $A.enqueueAction(action);
 
    }
    */
})