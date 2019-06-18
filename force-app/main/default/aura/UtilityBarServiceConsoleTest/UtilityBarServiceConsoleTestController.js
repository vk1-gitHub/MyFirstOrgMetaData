({
    getAllUtilityInfo : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getAllUtilityInfo().then(function(response) {
            var myUtilityInfo = response;
            alert(JSON.stringify(myUtilityInfo));
            //var myUtilityInfo = response[0];
            utilityAPI.openUtility({
                utilityId: myUtilityInfo[0].id
                
            });
        }).catch(function(error) {
            console.log(error);
        });
    },
    
    getEnclosingUtilityId : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getEnclosingUtilityId().then(function(utilityId) {
            alert(JSON.stringify(utilityId));
            console.log(utilityId);
        })
        .catch(function(error) {
            console.log(JSON.stringify(error));
        });
    },
    
   /* getUtilityInfo : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getUtilityInfo().then(function(response) {
            if (response.utilityVisible) {
                utilityAPI.minimizeUtility();
            }
            else {
                utilityAPI.openUtility();
            }
        })
        .catch(function(error) {
            console.log(error);
        });
    },*/
    
    minimizeUtility : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.minimizeUtility();
    },
    
    openUtility : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.openUtility();
    },
    
    setPanelHeaderIcon : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setPanelHeaderIcon({
            icon: "frozen"
        });
    },
    
    setPanelHeaderLabel : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setPanelHeaderLabel({
            label: "My Utility"
        });
    },
    
    setPanelHeight : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setPanelHeight({
            heightPX: 500
        });
    },
    
    setPanelWidth : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setPanelWidth({
            widthPX: 800
        });
    },
    
    setUtilityHighlighted : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar").setUtilityHighlighted({highlighted: true });
    },
    
    setUtilityIcon : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setUtilityIcon({
            icon: "insert_tag_field"
        });
    },
    
    setUtilityLabel : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setUtilityLabel({
            label: "My Favorite Utility"
        });
    },
    
    toggleModalMode : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.toggleModalMode({
            enableModalMode: true
        });
    }
})