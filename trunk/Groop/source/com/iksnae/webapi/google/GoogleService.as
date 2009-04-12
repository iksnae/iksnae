package com.iksnae.webapi.google
{
	import com.google.GoogleSearchService;
	import com.kloke.model.types.NameValuePair;
	
	import mx.rpc.http.HTTPService;

	public class GoogleService extends HTTPService
	{
		
		
		
		static public var API_KEY:String      =   "";
		static public var BASE_URL:String;
		static public var AUTH_URL:String;
		static public var SEARCH:String;
		
		public var authToken:Object;
        
		
        
		static private var _instance:String=null;	
		static public function getInstance():GoogleSearchService{
			if(_instance==null)_instance = new GoogleSearchService()
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
			params.push(new NameValuePair("api_key",API_KEY)
		}
		public function makeApiCall(req:String, prams:Array):void{
			
		}
		
		
	}
}