package com.groop.gcal
{
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.InvokeEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;

	public class GCalService extends HTTPService
	{
		
		private const authURL:String = 'https://www.google.com/accounts/ClientLogin'
		
		
		public var authToken:AsyncToken;
		private var gdata:RemoteObject;
		
		
		private function onResult(result:ResultEvent):void{
			trace(result)
		    dispatchEvent(result)
		    authToken = result.token;
		    switch(authToken.message.destination){
		    	
		    }
		}
		private function onFault(fault:FaultEvent):void{
			trace(fault)
		    dispatchEvent(fault)
		}
		private function onInvoke(invoke:InvokeEvent):void{
            trace(invoke)
            dispatchEvent(invoke)
        }
		
		public function makeCall():void{
			
		}
		public function authenticateUser(email:String,password:String):void{
		  trace('authenticating...')
		  gdata = new RemoteObject(authURL)
		  gdata.addEventListener(InvokeEvent.INVOKE, onInvoke)
		  gdata.addEventListener(ResultEvent.RESULT, onResult)
		  gdata.addEventListener(FaultEvent.FAULT,onFault)
          gdata.setRemoteCredentials(email,password)
        
		}
		
		
		
		
		static private var _instance:GCalService=null
		static public function getInstance():GCalService{
			if(_instance==null) _instance = new GCalService(new singlee())
			return _instance;
		}
		public function GCalService(singleton_enforcer:singlee)
		{
			super(null, null);
			authenticateUser('flashdev@gmail.com','passw0rd')
		}
		
	}
}

class singlee{}