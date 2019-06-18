({

	searchContact : function(component, event, helper) {
		
        
        var firstname = component.get("v.con.FirstName");
        var lastname = component.get("v.con.LastName");
        var email = component.get("v.con.Email");
        var phone = component.get("v.con.Phone");
   
        var con= [];
            con.push(firstname);
            con.push(lastname);
            con.push(email);
            con.push(phone);

          console.log('Contact ='+con);

        var conEvent = component.getEvent("addcon1");
            conEvent.setParams({ "addcon" : con });
            conEvent.fire();
        
	}
})