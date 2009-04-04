package com.iksnae.groop.model
{
	import com.kloke.util.debug.Debug;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	/**
	 *  
	 * @author iksnae
	 * 
	 */
	public class GroopServiceHub extends EventDispatcher
	{
		private var _SID:String;
		private var _LSID:String;
        private var _AUTH:String;
        
		static private var _instance:GroopServiceHub=null;
		static public function getInstance():GroopServiceHub{
			if(_instance==null) _instance = new GroopServiceHub(new se());
			return _instance;
		}
		
        public var appID:String;
        public var devID:String;
        public var secret:String;
        
        public const BaseURL:String         = 'https://www.google.com/accounts/'
        public const RequestToken:String    = 'OAuthGetRequestToken'
        public const UpgradeToken:String    = 'AuthGetRequestToken'
        public const ClientLogin:String     = 'ClientLogin'
        
        protected var password:String       = 'flashydev@gmail.com';
        protected var username:String       = 'passw0rd';
        
        
        		
		public function GroopServiceHub(e:se)
		{
			super(null);
			init()
		}
		private function init():void{
			Debug.log('GroopServiceHub.init')
			login(username,password)
		}
		
		
		public function login(username:String,password:String):void{
			var urlVars:URLVariables = new URLVariables()
			urlVars['accountType']='HOSTED_OR_GOOGLE';
			urlVars['Email']     = username 
			urlVars['Passwd']    = password
			urlVars['service']   = 'cl';
			var l:URLLoader = new URLLoader()
			var r:URLRequest= new URLRequest(BaseURL+ClientLogin)
			l.addEventListener(Event.COMPLETE,onLoginResponse)
			r.method = URLRequestMethod.POST;
			r.data = urlVars;
			l.load(r)
		}
		private function onLoginResponse(e:Event):void{
		    var raw:String = String(URLLoader(e.target).data)
            trace('onLoginResponse:'raw)
            _SID = raw.substr(raw.search('SID=')+4,187);
            _LSID= raw.substr(raw.search('LSID=')+5,187);
            _AUTH= raw.substr(raw.search('Auth=')+5,187);
		    trace("SID:"+_SID)
            trace("LSID:"+_LSID)
            trace("AUTH:"+_AUTH)
            
		}
		private function onCal(e:Event):void{
		      var raw:String = String(URLLoader(e.target).data)
		      trace('onCal:'+raw)
		      
              
		}
	}
}
class se{}