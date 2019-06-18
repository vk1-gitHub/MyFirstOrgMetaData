({
    SearchHelper: function(component,event,searchKeyword) {
    var addcon = component.getEvent("addcon");

    console.log('search keyword = '+searchKeyword);
    addcon.setParams({ "searchKeyWord": searchKeyword });
    addcon.fire();


      addcon.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {

            	  var ab = response.getReturnValue();
                   /* var items = component.get("v.items");
                    items.push(response.getReturnValue());
                    component.set("v.items", items);
                    */
               }
        });
        $A.enqueueAction(addcon);
  }
})