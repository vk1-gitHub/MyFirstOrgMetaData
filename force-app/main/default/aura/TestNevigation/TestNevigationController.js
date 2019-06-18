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
        var defaultUrl = "#";
        navService.generateUrl(pageReference)
            .then($A.getCallback(function(url) {
                cmp.set("v.url", url ? url : defaultUrl);
            }), $A.getCallback(function(error) {
                cmp.set("v.url", defaultUrl);
            }));
       // alert(JSON.stringify(pageReference));
    },
    handleClick: function(cmp, event, helper) {
        var navService = cmp.find("navService");
        
        // Uses the pageReference definition in the init handler
        var pageReference = cmp.get("v.pageReference");
        //alert(JSON.stringify(pageReference));
        event.preventDefault();
        //"type":"standard__objectPage","attributes":{"objectApiName":"Account","actionName":"home"}
        navService.navigate(pageReference);
    }
})