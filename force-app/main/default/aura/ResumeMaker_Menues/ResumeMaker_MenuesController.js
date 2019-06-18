({
    doneRendering :function(component,event,helper){
        
        if(!component.get("v.isDoneRendering")){
            component.set("v.isDoneRendering", true);
            
            var selected = component.find("xyz").get("v.selectedItem");
            var getMenuList = component.get("v.menuList");
            var appEvent = $A.get("e.c:MenuEvent");
            appEvent.setParams({ name : selected,
                                menuLabel : getMenuList
                               });
            appEvent.fire();  
        
        }
    },
    
    handleMenuEvent2 : function(component,event,helper){
       var selected = event.getParam("name");
        component.set("v.select",selected);
    },
    
    init: function (component,event,helper) {
         var sections = [
          {
            label: "Resume Builder",
            items: [
              {
                label: "Personal_Information",
                name: "Personal_Information",
                icon : "action:user"
              },
              {
                label: "Summary",
                name: "Summary",
                icon : "action:new_contact"
              },
              {
                label: "Experience",
                name: "Experience",
                icon : "action:description"
              },
              {
                label: "Education",
                name: "Education",
                icon : "action:new_notebook"
              },
              {
                label: "Skill",
                name: "Skill",
                icon : "action:new_task"
              },
               {
                label: "Language",
                name: "Language",
                icon : "action:flow"
              } 
            ]
          },
          
        ];
        component.set('v.navigationData', sections);
            var menuLabel = [];
           var arr = component.get("v.navigationData[0].items");
            for(var i=0;i<arr.length;i++){
                menuLabel.push(arr[i].label);  
            }
        component.set("v.menuList",menuLabel);   
        
    },
          
    handleSection : function(component, event, helper) {
            var selected = component.find("xyz").get("v.selectedItem");
            var getMenuList = component.get("v.menuList");
            var appEvent = $A.get("e.c:MenuEvent");
            appEvent.setParams({ name : selected,
                                menuLabel : getMenuList
                               });
            appEvent.fire();        
     }
})