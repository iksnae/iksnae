package com.iksnae.groop.model.services
{
	import com.kloke.model.interfaces.IService;
	
	import flash.events.EventDispatcher;

	public class GroopCalendarService extends EventDispatcher implements IService
	{
		
		private const BaseURL:String = 'http://www.google.com/calendar/'
	
		
		
		
		public function GroopCalendarService()
		{
			//TODO: implement function
		}

		public function get connected():Boolean
		{
			//TODO: implement function
			return false;
		}
		
		public function get status():String
		{
			//TODO: implement function
			return null;
		}
		
		public function open():void
		{
			//TODO: implement function
		}
		
		public function close():void
		{
			//TODO: implement function
		}
		
		
		
	}
}