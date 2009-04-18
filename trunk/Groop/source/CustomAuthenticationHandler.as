import mx.core.Application;
import mx.managers.PopUpManager;

/**
 *  Fault handler that generically handles custom authentication
 **/
class CustomAuthenticationHandler
{
    /**
     * data service object to be used with dataServiceCall
     **/
    var dataService;

    /**
     * method to call on dataService when the user is authenticated/authorized
     **/
    var dataServiceCall;

    function faultHandler(fault) {

        if (fault.faultcode == "Client.Authentication" ||
            fault.faultcode == "401") {

            if (dataService == null || dataServiceCall == null) {

                Application.alert(fault.faultcode + " could not be handled because dataService or dataServiceCall is null", "Error");
            }
            else {
                loginPopup();
            }
        }
        else if (fault.faultcode == "Client.Authorization" ||
            fault.faultcode == "403") {

            Application.alert("No data will be shown since the current user is not authorized to access " +
                              "this service.  Please make sure you have proper permissions for access.",
                              "Error");
        }
        else {

            // Some other error- just show an alert
            Application.alert(fault.faultcode + ": " + fault.faultstring, "Error");
        }
    }

    function loginPopup() {
        // User is not authenticated- display a logon window
        var app = Application.application;
        var popup = PopUpManager.createPopUp(app, LogonWindow, true, {deferred: true});
        popup.centerPopUp();
        popup.addEventListener("logonWindowEvent", this);
    }

    function logonWindowEvent(event) {

        if (event.action=="authenticate") {

            dataService.setUsernamePassword(event.username, event.password);
            if (dataServiceCall != "none") {

                dataServiceCall.call(dataService);
            }
        }
        else {

            dataService.clearUsernamePassword();
        }
    }

}

