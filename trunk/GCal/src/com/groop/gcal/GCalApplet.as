package com.groop.gcal
{
	import flash.events.EventDispatcher;

	public class GCalApplet extends EventDispatcher
	{
		
		public var service:GCalService = GCalService.getInstance()
		
		public function GCalApplet()
		{
			super(null);
		}
		
		
	}
}