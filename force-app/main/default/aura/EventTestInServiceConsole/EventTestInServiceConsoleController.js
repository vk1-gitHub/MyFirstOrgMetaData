({
    
    onTabClosed : function(component, event, helper) {
        var tabId = event.getParam('tabId');
        alert(tabId);
        console.log("Tab closed: " +tabId);
    },
    
    onTabCreated : function(component, event, helper) {
        console.log("Tab created.");
        var newTabId = event.getParam('tabId');
        alert(newTabId);
        var workspaceAPI = component.find("workspace");
        workspaceAPI.setTabLabel({
            tabId: newTabId,
            label: 'New Tab'
        });
    },
    
    onTabFocused : function(component, event, helper) {
        console.log("Tab Focused");
        var focusedTabId = event.getParam('currentTabId');
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getTabInfo({
            tabId : focusedTabId
        }).then(function(response) {
            console.log(response);
        });
    },
    
    onTabRefreshed : function(component, event, helper) {
        console.log("Tab Refreshed");
        var refreshedTabId = event.getParam("tabId");
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getTabInfo({
            tabId : refreshedTabId
        }).then(function(response) {
            console.log(response);
            alert(JSON.stringify(response));
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
        console.log(updatedTabId);
        alert(JSON.stringify(updatedTabId));
    },
})