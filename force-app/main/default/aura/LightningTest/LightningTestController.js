({
   init : function(cmp, event, helper) {
        var navService = cmp.find("navService");
        // Sets the route to /lightning/o/Account/home
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'
            }
        };
        cmp.set("v.pageReference", pageReference);
        // Set the URL on the link or use the default if there's an error
        
        navService.generateUrl(pageReference)
            .then($A.getCallback(function(url) {
                cmp.set("v.url", 'https://developer.salesforce.com/docs/component-library/bundle/lightning:insertImageButton/documentation');
            }), $A.getCallback(function(error) {
                cmp.set("v.url", 'https://developer.salesforce.com/docs/component-library/bundle/lightning:insertImageButton/documentation');
            }));
    },
    
     handleShowNotice : function(component, event, helper) {
        component.find('notifLib').showNotice({
            "variant": "error",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    
     handleSelect : function (component, event, helper) {
     var stepName = event.getParam("detail").value;
     var toastEvent = $A.get("e.force:showToast");
         alert('stepName '+stepName);
         alert('toastEvent '+toastEvent);
     toastEvent.setParams({
       "title": "Success!",
        "message": "Toast from " + stepName
        });
        toastEvent.fire();
    },
    
   
})