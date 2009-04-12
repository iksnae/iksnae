package com.iksnae.webapi.google.gd
{
	import com.iksnae.webapi.google.GoogleService;
	
	public class GDataClientLogin
	{
		
		
		
		
		static public var username:String;
		static public var password:String;
		static public var authToken:String;
		
		private var _service:GoogleService;
        
		
		public function GDataClientLogin()
		{
			_service = GoogleService.getInstance()
		}
		public function login():void{
			_service.url = GoogleService.AUTH_URL;
		}

	}
}