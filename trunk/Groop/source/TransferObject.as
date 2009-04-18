// RemoteObject mapping class- maps to examples.TransferObject on the server side
class TransferObject
{
    // the current logged in user.  Should only be used for display purposes
    var userName:String;

    // whether the currented logged in user is a manager.  Should only be used for display purposes.
    // Remember that anything that you want only a manager to see should be transferred from
    // a data service at runtime
    var isManager:Boolean;

    // an array of Employee objects
    var employees:Array;

    public function TransferObject()
    {
    }
}