package com.groop.gcal
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class GCalApplet extends EventDispatcher
	{
		
		public var service:GCalService = GCalService.getInstance()
		
		public function GCalApplet()
		{
			super(null);
			service.addEventListener('user_athenticated', onUserAuthenticated)
			
			
		}
		public function onUserAuthenticated(e:Event):void{
			trace('USER AUTHENTICATED')
			service.getAllCalendars()
		}
		
		
	}
}