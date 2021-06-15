sap.ui.define([ ], function () {
    "use strict"; 

    return {
        onInit: function () {
           
            alert("Hello");
         // functionality that is not applied when entering child object page
        },
        onAfterRendering: function(){
            debugger;
        }
        // You can also override other methods which are described in the controllerFrameworkExtension class here.
    };
  })