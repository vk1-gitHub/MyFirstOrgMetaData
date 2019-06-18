({
    getAllUtilityInfo : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getAllUtilityInfo().then(function(response) {
            alert(JSON.stringify(response));
            var myUtilityInfo = response[0];
            utilityAPI.openUtility({
                utilityId: myUtilityInfo.id
            });
        })
        .catch(function(error) {
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
            console.log(error);
        });
    },
    
    getUtilityInfo : function(component, event, helper) {
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
    },
    
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
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setUtilityHighlighted({
            highlighted: true
        });
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
    },
    
    onTabRefreshed : function(component, event, helper) {
        console.log("Tab Refreshed");
        var refreshedTabId = event.getParam("tabId");
        alert(JSON.stringify(refreshedTabId));
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getTabInfo({
            tabId : refreshedTabId
        }).then(function(response) {
            alert(JSON.stringify(response));
            console.log(response);
        });
    },
    
    onTabReplaced : function(component, event, helper) {
        console.log("Tab Replaced");
        var replacedTabId = event.getParam("tabId");
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getTabURL({
            tabId : replacedTabId
        }).then(function(response) {
            alert(JSON.stringify(response));
            console.log(response);
        });
    },
    
    onTabUpdated : function(component, event, helper) {
        console.log("Tab Updated");
        var updatedTabId = event.getParam("tabId");
        alert(JSON.stringify(updatedTabId));
        console.log(updatedTabId);
    },
})