package com.iksnae.groop
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class GroopModel extends EventDispatcher
	{
		public function GroopModel()
		{
		}
		static private var _instance:GroopModel=null;
        static public function getInstance():GroopModel{
            if(_instance==null) _instance = new GroopModel();
            return _instance;
        }
        
        private var _loggedIn:Boolean;
        private var _minimized:Boolean;
        public var app:Groop2;
        
        
        public function get loggedIn():Boolean{
        	return _loggedIn;
        }
        public function get minimized():Boolean{
            return _minimized;
        }
        public function set minimized(bool:Boolean):void{
            _minimized = bool;
            dispatchEvent(new Event('min_max_event'))
        }
        
        
        
        public function get userPreferredAlignment():String{
        	return 'top';
        }
       
        
        

	}
}