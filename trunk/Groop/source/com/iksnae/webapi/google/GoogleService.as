package com.iksnae.webapi.google
{
	import com.iksnae.webapi.google.gcal.GoogleCalendarAPI;
	import com.iksnae.webapi.google.gd.GDataClientLogin;
	import com.kloke.model.interfaces.IObserver;
	import com.kloke.model.interfaces.ISubject;
	import com.kloke.model.types.NameValuePair;
	import com.kloke.util.debug.Debug;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLVariables;
	import flash.utils.Dictionary;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GoogleService extends HTTPService implements ISubject
	{
		
		
		
		static public var API_KEY :String      =   "";
		static public var BASE_URL:String;
		static public var AUTH_URL:String =  'https://www.google.com/accounts/ClientLogin';
		static public var SEARCH:String;
		
		
		/// name space definitions
        static public const NAMESPACE_GD  :Namespace  = new Namespace("http://schemas.google.com/g/2005")
        static public const NAMESPACE_GCAL:Namespace  = new Namespace("http://schemas.google.com/gCal/2005")
        static public const NAMESPACE_ATOM:Namespace  = new Namespace("http://www.w3.org/2005/Atom")
		
		
		public var authToken:AsyncToken;
        public var connected:Boolean
        [Bindable]
        public var gCalAPI:GoogleCalendarAPI;
        public var gDataClientLogin:GDataClientLogin;
        [Bindable]
        public var status:String
		
        
		static private var _instance:GoogleService=null;	
		static public function getInstance():GoogleService{
			if(_instance==null) _instance = new GoogleService(BASE_URL)
			return _instance
		}
		
		public function GoogleService(rootURL:String=null)
		{
			super(rootURL);
			init()
		}
		
		
		private function init():void{
			gDataClientLogin = new GDataClientLogin()
			gCalAPI= GoogleCalendarAPI.getInstance()
			addEventListener(ResultEvent.RESULT, onResult)
			addEventListener(FaultEvent.FAULT, onFault)
			method = 'POST'
	
		}
		
		public function getToken():void{
			var params:Array = new Array()
			params.push(new NameValuePair("api_key",API_KEY))
		}
		public function makeApiCall(request:String, params:URLVariables=null):void{
			
			url = request;
			
			updateStatus(url)
			if(params==null){
				params = new URLVariables()
			}
			params['Email']  = gDataClientLogin.username
			params['Passwrd']= gDataClientLogin.password
            trace('making api call: '+request+' with'+params)
			send(params)
			
			
		}
		private function onResult(e:ResultEvent):void{
		    trace("onResult: ")
		    authToken = AsyncToken(e.token)
		 
		    trace(e.token.message['url'])
		    switch(e.token.message['url']){
		    	case GDataAPI.CLIENT_LOGIN_URL:
		    	trace("User Login Successful")
		    	dispatchEvent(new Event('login_successful'))
		    	gCalAPI.getAllCalendars()
		    	var vars:URLVariables = new URLVariables()
//		    	var apps:File = File.applicationDirectory;
//		    	vars['scope'] = "http://www.google.com/calendar/feeds"
//		    	vars['next'] = "http://iksnae.com"
//                vars['session'] = "1"
//		    	vars['secure'] = "1"
//		    	method = "POST"
//                makeApiCall('https://www.google.com/accounts/AuthSubRequest',vars)
//		    	
		    	break;
		    	case GoogleCalendarAPI.ALL_CALENDARS:
		    	dispatchEvent(new Event('calendars_loaded'))
		    	gCalAPI.onCalendarResult(e)
		    	
		    	break;
		    }
		   
		}
		private function updateStatus(call:String):void{
		  switch(call){
		  	case GoogleCalendarAPI.ALL_CALENDARS:
		  	status = 'loading calendars...'
		  	break;
		  	case GoogleService.AUTH_URL:
            status = 'authenticating user...'
            break
            
		  }
		}
		
		private function onFault(e:FaultEvent):void{
		  trace("onFault: "+e.message)
		}
		/**
         * dictionary for storing observers/retreiving listening for events 
         */
        private var observers:Dictionary=new Dictionary()
        
        /**
         * this method is inherited from the ISubject interface.
         * - checks to see if there's an event registered
         * - if the event is registered, the observer is stored
         * - else the event is registered, then the observer is stored
         * @param eventName
         * @param observer
         * @see ISubject
         */     
        public function subscribe(eventName:String,observer:IObserver):void{
            var obs:Array;
            if(observers[eventName]!=null){
                obs = observers[eventName];
                Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName,{eventName:eventName});
            }else{
                Debug.log('No Observers for: '+ eventName +' so a list was created.');
                obs = new Array();
                observers[eventName] = obs;
            }
            Debug.log('Storing '+observer+' for "'+eventName+'" event',{observer:observer,eventName:eventName})
            obs.push(observer);
        }
        
        
        
        /**
         * this method is inherited from the ISubject interface.
         * - checks for observer/eventName pair
         * - if found, item is removed from array ( still needs to be removed from dictionary object )
         * 
         * @param eventName
         * @param observer
         */     
        public function unSubscribe(eventName:String,observer:IObserver):void{
            var obs:Array;
            if(observers[eventName]!=null){
                obs = observers[eventName];
                Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName);
                for(var ob:int = 0; ob < obs.length; ob++){
                    if(obs[ob]==observer){
                        obs.splice(ob,1)
                        break;
                    }
                }
            }else{
                Debug.log('No Observers for: '+ eventName);
            }
        }
        
        
        
        /**
         * this method is inherited from the ISubject interface.
         * - notifies all observers of the specified eventName
         * @param event
         * @param data
         */     
        public function notify(eventName:String, data:*=null):void{
            var list:Array;
            if(observers[eventName]!=null){
                list = observers[eventName];
                Debug.log('('+list.length+') Observers Found')
                for(var ob:int = 0; ob < list.length; ob++){
                //  Debug.log('('+ob+') Found: '+list[ob])
                    list[ob].update(data)
                }
            }else{
                Debug.log('No Observers for: '+ eventName,eventName);
            }
        }
		
		
	}
}