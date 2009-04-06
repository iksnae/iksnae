package com.iksnae.groop.model
{
	import com.iksnae.groop.model.services.GroopServiceEvent;
	import com.kloke.util.debug.Debug;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
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
        
        private var _username:String       = 'flashydev@gmail.com';
        private var _password:String       = 'passw0rd';
        
        
        public var authVars:URLVariables;
       
        
   
        
        
        
        		
		public function GroopServiceHub(e:se)
		{
			super(null);
			init()
		}
		private function init():void{
			Debug.log('GroopServiceHub.init')
		}
		
		
		public function login(username:String,password:String):void{
			trace('logging into google services..')
			_username = username;
			_password = password;
			authVars = new URLVariables()
			
			authVars['accountType']='HOSTED_OR_GOOGLE';
			authVars['Email']     = _username;
			authVars['Passwd']    = _password;
			authVars['service']   = 'cl';
			authVars['session']   = 1;
			var l:URLLoader = new URLLoader()
			var r:URLRequest= new URLRequest(BaseURL+ClientLogin)
		
			l.addEventListener(Event.COMPLETE,onLoginResponse)
			
			l.addEventListener(IOErrorEvent.IO_ERROR,onIOError)
			l.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,onHttpStatus)
			l.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHttpStatus)
			l.addEventListener(ProgressEvent.PROGRESS,onProgress)
			l.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError)
			l.addEventListener(Event.ACTIVATE,onEvent)
			l.addEventListener(Event.COMPLETE,onEvent)
			l.addEventListener(Event.DEACTIVATE,onEvent)
			l.addEventListener(Event.OPEN,onEvent)
		
			
			r.method = URLRequestMethod.POST;
			r.data = authVars;
			l.load(r)
		}
		private function onLoginResponse(e:Event):void{
		    var raw:String = String(URLLoader(e.target).data)
            trace('onLoginResponse:'+raw)
            _SID = raw.substr(raw.search('SID=')+4,187);
            _LSID= raw.substr(raw.search('LSID=')+5,187);
            _AUTH= raw.substr(raw.search('Auth=')+5,187);
		    trace("SID:"+_SID)
            trace("LSID:"+_LSID)
            trace("AUTH:"+_AUTH)
            
		}
		////
		
		public function get SID():String{
			return _SID;
		}
		public function get LSID():String{
            return _LSID;
        }
        public function get Auth():String{
            return _AUTH;
        }
		
		
		
		//// EVENT HANDLERS
		private function onCal(e:Event):void{
		      var raw:String = String(URLLoader(e.target).data)
		      trace('onCal:'+raw)
		}
		private function onEvent(e:Event):void{
		      trace('onEvent: '+e.type)
		}
		private function onHttpStatus(e:HTTPStatusEvent):void{
		      trace('onHttpStatus: '+e.status)
		      switch(e.status){
		      	case 200:
		      	   dispatchEvent(new Event(GroopServiceEvent.CONNECTION_SUCCESS));
		           
		      	break;
		      }
		}
		private function onIOError(e:IOErrorEvent):void{
		      trace('onIOError: '+e.type)
		}
		private function onProgress(e:ProgressEvent):void{
		      trace('onProgress: '+e.type)
		}
		private function onSecurityError(e:SecurityErrorEvent):void{
		      trace('onSecurityError: '+e.type)
		}
		
		
		
	}
}
class se{}