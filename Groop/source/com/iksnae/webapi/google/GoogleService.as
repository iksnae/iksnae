package com.iksnae.webapi.google
{
	import com.iksnae.webapi.google.gcal.GoogleCalendarAPI;
	import com.kloke.model.types.NameValuePair;
	
	import mx.rpc.http.HTTPService;

	public class GoogleService extends HTTPService
	{
		
		
		
		static public var API_KEY:String      =   "";
		static public var BASE_URL:String;
		static public var AUTH_URL:String;
		static public var SEARCH:String;
		static public const SCHEMA:String       = "http://schemes.google.com/g/2005"
		
		public var authToken:Object;
        
        
        public var gCalAPI:GoogleCalendarAPI = GoogleCalendarAPI.getInstance();
        
		
        
		static private var _instance:GoogleService=null;	
		static public function getInstance():GoogleService{
			if(_instance==null) _instance = new GoogleService(BASE_URL)
			return _instance
		}
		
		public function GoogleService(rootURL:String=null)
		{
			super(rootURL);
		}
		
		
		private function init():void{
			if(API_KEY==""){
				throw new Error("You must provide an API key!");
			}
			
	
		}
		
		public function getToken():void{
			var params:Array = new Array()
			params.push(new NameValuePair("api_key",API_KEY))
		}
		public function makeApiCall(req:String, prams:Array):void{
			
		}
		
		
	}
}