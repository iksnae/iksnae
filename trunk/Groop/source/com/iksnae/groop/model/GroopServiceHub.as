package com.iksnae.groop.model
{
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;
	/**
	 *  
	 * @author iksnae
	 * 
	 */
	public class GroopServiceHub extends EventDispatcher
	{
		
		static private var _instance:GroopServiceHub=null;
		static public function getInstance():GroopServiceHub{
			if(_instance==null) _instance = new GroopServiceHub(new se());
			return _instance;
		}
		
        public var appID:String;
        public var devID:String;
        public var secret:String;
        		
		public function GroopServiceHub(e:se)
		{
			super(null);
			init()
		}
		private function init():void{
			Debug.log('GroopServiceHub.init')
		}
	}
}
class se{}