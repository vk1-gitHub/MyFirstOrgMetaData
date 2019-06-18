({
    doInit : function(component, event, helper) {
        var action = component.get("c.modifiedCaseList");
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.caseList", response.getReturnValue());
            }
            //alert(JSON.stringify(component.get("v.caseList")));
        });
        $A.enqueueAction(action);
    },

    openTab : function(component, event, helper) {
        var tabId = event.target.id;
        var name = event.target.name;
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            //recordId: tabId,
            url: '#/sObject/'+tabId+'/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
                tabId: response
            }).then(function(tabInfo) {
                console.log("The url for this tab is: " + tabInfo.url);
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getAllTabInfo : function(component, event, helper) {
        var newArray = [];
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getAllTabInfo().then(function(response) {
            response.forEach(function(element){
                newArray.push(element.recordId);
            });
            alert(JSON.stringify(newArray));
            console.log(JSON.stringify(response));
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getEnclosingTabId : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getEnclosingTabId().then(function(tabId) {
            console.log(JSON.stringify(tabId));
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getOpenedTabURL : function(component, event, helper) {
        var tabId = event.target.id;
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '#/sObject/5007F00000KdP7tQAF/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabURL({
                tabId: response
            }).then(function(response) {
                alert(JSON.stringify(response));
                console.log(response);
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    openTabWithSubtab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '#/sObject/5007F00000B0qKZQAZ/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.openSubtab({
                parentTabId: response,
                url: '#/sObject/0037F00000LRu59QAD/view',
                focus: true
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    setFocusedTabHighlighted : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabHighlighted({
                tabId: focusedTabId,
                highlighted: true
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    setFocusedTabIcon : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabIcon({
                tabId: focusedTabId,
                icon: "action:approval",
                iconAlt: "Approval"
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    setFocusedTabLabel : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabLabel({
                tabId: focusedTabId,
                label: "(: Vivek ka Tab :)"
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})