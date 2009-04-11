package com.iksnae.webapi.google
{
	import com.google.GoogleSearchService;
	
	import mx.rpc.http.HTTPService;

	public class GoogleService extends HTTPService
	{
		
		static private var _instance:String=null;
		
		
		static public var SEARCH_KEY_WORDS
		
			
		static public function getInstance():GoogleSearchService{
			if(_instance==null)_instance = new GoogleSearchService()
			return _instance
		}
		public function GoogleService(rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
		}
		
		public var authToken:Object;
		publ
		
		
	}
}