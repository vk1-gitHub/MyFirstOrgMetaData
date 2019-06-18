({

/*doInit: function(component, event, helper) {
        
        // Create the action
        var action = component.get("c.fetchContact");
        
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
                
                var state = response.getState();
                if (state === "SUCCESS") {
                        component.set("v.searchResult", response.getReturnValue());
                        console.log(response.getReturnValue());
                }
                else {
                	    console.log("Failed with state: " + state);
                }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
    },
  
  */

  /* doInit: function(component, event, helper) {
        
     //  var searchKeyWord = event.getParam("searchKeyWord");
   
      var searchKeyWord =  component.find("searchId").get("v.value");

     console.log('Values =='+searchKeyWord);
        var action = component.get("c.fetchContact");
        action.setParams({
            'searchKeyWord': searchKeyWord
        });
    },
    */

    Search: function(component, event, helper) {
    	
        var  firstname= component.find("firstname");
        var fname = firstname.get("v.value");

         var  lastname= component.find("lastname");
         var lname = lastname.get("v.value");

        console.log('FName = '+fname);
        console.log('LName = '+lname);
    
    
        var addcon = component.getEvent("addcon");

          // console.log('search keyword = '+searchKeyword);
           addcon.setParams({ "fname": fname,
                              "lname" : lname });
           console.log('Perameter Set');
           addcon.fire();

 

       /*   console.log('Searched value@@ '+srcValue);
         helper.SearchHelper(component,event,srcValue);

      setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {

            	  var ab = response.getReturnValue();
                 var items = component.get("v.items");
                    items.push(response.getReturnValue());
                    component.set("v.items", items);
                    
               }
        });
        $A.enqueueAction(addcon);
        */
        
     /*   if (srcValue == '' || srcValue == null) {
        	 console.log('Entered3');
            // display error message if input value is blank or null
           searchKeyFld.set("v.errors", [{
               message: "Enter Search Keyword."
            }]);
        } else {
            searchKeyFld.set("v.errors", null);
             console.log('Entered');

             var searchKeyword = component.get("v.searchKeyword");
             var searchKeyword = JSON.parse(JSON.stringify(searchKeyword));
             console.log('Seached '+searchKeyword);
            // call helper method
            helper.SearchHelper(component,event,searchKeyword);
            console.log('End @@@@@@@@');
        }
        */
    }
})