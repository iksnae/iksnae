package com.iksnae.groop.model.services
{
	import flash.net.URLVariables;
	
	import mx.rpc.remoting.RemoteObject;
	
	public class GoogleCalender
	{
		public function GoogleCalender()
		{
			_remoteObject = new RemoteObject('http://www.google.com/calendar/feeds/');
		}
		
		
		private var _remoteObject:RemoteObject;
		
		
		public function makeCall(call:String, args:URLVariables):void{
			_remoteObject.destination = call;
		}

	}
}