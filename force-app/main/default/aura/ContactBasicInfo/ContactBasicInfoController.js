({
	 handleChange: function (cmp, event) {
        //  var toggleVal = cmp.find('inputcheck').get('v.value');
          var isChecked = cmp.find('inputcheck').get('v.checked');
          cmp.set('v.box1',isChecked);
    }
})