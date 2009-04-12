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
		
		
		/// name space definitions
        static public const NAMESPACE_GD:Namespace    = new Namespace("http://schemas.google.com/g/2005")
        static public const NAMESPACE_GCAL:Namespace  = new Namespace("http://schemas.google.com/gCal/2005")
        static public const NAMESPACE_ATOM:Namespace  = new Namespace("http://www.w3.org/2005/Atom")
		
		
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