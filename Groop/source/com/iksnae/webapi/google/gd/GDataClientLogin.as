package com.iksnae.webapi.google.gd
{
	import com.iksnae.webapi.google.GDataAPI;
	import com.iksnae.webapi.google.GoogleService;
	
	import flash.net.URLVariables;
	
	public class GDataClientLogin
	{
		
		
		
		
		static public const ACCOUNT_TYPE_GOOGLE:String ='OOGLE';
		static public const ACCOUNT_TYPE_HOSTED:String='HOSTED';
        static public const ACCOUNT_TYPE_HOHSTED_OR_GOOGLE:String='HOSTED_OR_GOOGLE';
        
        
		
		
		private var _p_accountType:String = ACCOUNT_TYPE_HOHSTED_OR_GOOGLE;
		private var _p_Email:String;
        private var _p_Password:String;
        private var _p_source:String;
        private var _p_service:String = 'cl';
        private var _p_session:int = 1;
        
        private var _p_logintoken:Object;
        private var _p_logincaptcha:Object;
        
        
        
		
		public function get username():String{
			return _p_Email;
		}
		public function get password():String{
            return _p_Password;
        }
		
		
		

        
        
		
		public function GDataClientLogin()
		{
			
		}
		public function login(user:String = null, pass:String =null):void{
			_p_Email=user;_p_Password = pass;
			var vars:URLVariables = new URLVariables()
			if(!_p_accountType || !_p_Email || !_p_Password){
                throw new Error("check your login credentials!");
            }
			vars['accountType'] = _p_accountType;
			vars['Email'] = _p_Email;
            vars['Passwd'] = _p_Password;
            vars['session'] = _p_session;
            trace('logging into google services...')
        
			GoogleService.getInstance().makeApiCall(GDataAPI.CLIENT_LOGIN_URL,vars)
		}

	}
}