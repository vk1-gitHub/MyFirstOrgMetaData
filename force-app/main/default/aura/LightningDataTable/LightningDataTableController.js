({ 
    doInit: function(component, event, helper) {
        
        var action = component.get("c.loadContact");
            action.setCallback(this, function(response) { 
                    var state = response.getState();
                    if (state === "SUCCESS") {
                            component.set("v.contact1", response.getReturnValue());
                            component.set("v.records",component.get("v.contact1")); 
                    }
                    else {
                            console.log("Failed with state: " + state);
                    }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
         component.set('v.mycolumns', [
                {label: 'First Name', fieldName: 'FirstName', type: 'text'},
                {label: 'Last Name', fieldName: 'LastName', type: 'text'},
                {label: 'Email', fieldName: 'Email', type: 'email'},
                {label: 'Phone', fieldName: 'Phone', type: 'phone'}
            ]);
         component.set('v.contact1', [{
                FirstName: component.get("v.contact1.FirstName"),
                LastName: component.get("v.contact1.LastName"), 
                Email: component.get("v.contact1.Email"),
                phone: component.get("v.contact1.Phone"),
               
            }]);

    },
    
    handleAddContact : function(component, event,helper) {

         var getCon =[];
             getCon = event.getParam("addcon");

         console.log('EventParam = '+getCon[1]);

          var action = component.get("c.fetchContact");
                  action.setParams({
                              "listcon": getCon
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                
                    component.set("v.contact1", response.getReturnValue());
                    component.set("v.records",component.get("v.contact1"));
               }
        });
   $A.enqueueAction(action);
    },
     filterData : function(component, event,helper) {


        var typedkey = component.find("filter");
        var search = typedkey.get("v.value");

        var searchKeyword = search.toLowerCase();
        var filterList = [];
       
        var  allRecord=  component.get("v.records");

        for(var i=0; i<allRecord.length; i++){

                  var record = allRecord[i];
                  var Firstname = record.FirstName;
                  var Lastname = record.LastName;
                  var Email = record.Email;
                  var phone = record.Phone;
              
                  var record1 = Firstname + Lastname + Email + phone;
                  var record2 =record1.toLowerCase();
          
                 if(record2.includes(searchKeyword))
                 {
                     filterList.push(record);
                } 
              
         }

          component.set("v.contact1",filterList);
    }
})