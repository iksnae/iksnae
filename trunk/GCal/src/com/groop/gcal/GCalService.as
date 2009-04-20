package com.groop.gcal
{
	import com.adobe.xml.syndication.atom.Atom10;
	import com.adobe.xml.syndication.atom.Entry;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;

	public class GCalService extends HTTPService
	{
		[Bindable]
		private var _status:String;
		
		private const AUTHENTICATION:String = 'https://www.google.com/accounts/ClientLogin'
		private const ALL_CALENDARS:String = 'http://www.google.com/calendar/feeds/default/allcalendars/full'
		
		public var authToken:AsyncToken;
		[Bindable]
		public var calendars:ArrayCollection;
		private var gdata:RemoteObject;
		private var allCalsFeed:XML;
		
		
		private var gd:Namespace = new Namespace('http://www.w3.org/2005/Atom');
		private var gCal:Namespace = new Namespace('http://schemas.google.com/gCal/2005');
        private var atom:Namespace = new Namespace('http://schemas.google.com/g/2005');
        private var openSearch:Namespace = new Namespace('http://a9.com/-/spec/opensearchrss/1.0/')
        
		
		
		
		private function onResult(result:ResultEvent):void{
			
		    authToken = result.token;
		    trace(authToken.message['url'])
//		    trace(authToken.message.clientId)
//		    trace(authToken.message.destination)
//		    trace(authToken.message.headers.valueOf())
//		    trace(authToken.message.timeToLive)
//		    trace(authToken.message.timestamp)
		    
		    switch(authToken.message['url']){
		    	case AUTHENTICATION:
		    	dispatchEvent(new Event('user_athenticated'))
		    	break;
		    	case ALL_CALENDARS:
		    	allCalsFeed = XML(result.message.body)
		    	parseCalendars()
		    	
		    	break
		    }
		}
		private function onFault(fault:FaultEvent):void{
			trace(fault)
		  
		}
		
		public function makeCall():void{
			
		}
		public function authenticateUser(email:String,password:String):void{
		  trace('authenticating...')
		  url = AUTHENTICATION;
		  method = 'POST'
		  var obj:Object={Email:email,Passwd:password,service:'cl'};
		  send(obj)
        
		}
		
		public function getAllCalendars():void{
			url = ALL_CALENDARS;
			method = 'GET'
			send()
		}
		
		
		private function parseCalendars():void{
			status = 'parsing calendars..'
			//trace(allCalsFeed)
			var atom:Atom10 = new Atom10()
			atom.parse(allCalsFeed)
			var entries:Array = atom.entries;
			trace('found: '+entries.length)
			status = 'found calendars: '+entries.length;
			calendars = new ArrayCollection()
			
			for(var i:int=0;i<entries.length;i++){
				var entry:Entry = entries[i]
				var cal:GCalender = new GCalender()
				cal.entry = entry;
				calendars.addItem(cal)
				status = cal.label;
				
			
			}
			dispatchEvent(new Event('calenders_loaded'))
		}
		private function parseCalendarFeed():void{
		
		}
		public function set status(str:String):void{
			_status = str
			dispatchEvent(new Event('status_change'))
		}
		public function get status():String{
		  return _status
		}
		
		static private var _instance:GCalService=null
		static public function getInstance():GCalService{
			if(_instance==null) _instance = new GCalService(new singlee())
			return _instance;
		}
		public function GCalService(singleton_enforcer:singlee)
		{
			super(null, null);
			addEventListener(ResultEvent.RESULT, onResult)
			addEventListener(FaultEvent.FAULT, onFault)
            authenticateUser('flashydev@gmail.com','passw0rd')
		}
		
		
		
	}
}

class singlee{}