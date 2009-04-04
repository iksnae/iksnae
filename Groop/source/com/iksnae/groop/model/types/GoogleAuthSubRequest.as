package com.iksnae.groop.model.types
{
	/**
	 *AuthSubRequest
	 * Call AuthSubRequest to acquire single-use authentication. AuthSubRequest is called as a URL; make a request to https://www.google.com/accounts/AuthSubRequest with the following query parameters:
	 * Parameter   Description
	 * next    (required) URL the user should be redirected to after a successful login. This value should be a page on the web application site, and can include query parameters.
	 * hd  (optional) String value identifying a particular hosted domain account to be accessed (for example, 'mycollege.edu'). Use "default" to specify a regular Google account ('username@gmail.com').
	 * scope   (required) URL identifying the service(s) to be accessed; see documentation for the service for the correct value(s). The resulting token enables access to the specified service(s) only. To specify more than one scope, list each one separated with a space (encodes as "%20").
	 * secure  (optional) Boolean flag indicating whether the authentication transaction should issue a secure token (1) or a non-secure token (0). Secure tokens are available to registered applications only.
	 * session (optional) Boolean flag indicating whether the one-time-use token may be exchanged for a session token (1) or not (0)
	 *  
	 * @author iksnae
	 * 
	 */	
	public class GoogleAuthSubRequest
	{
		public function GoogleAuthSubRequest()
		{
		}
		/**
		 * next (required) URL the user should be redirected to after a successful login.
		 * This value should be a page on the web application site, and can include query parameters. 
		 */		
		public var next:String = 'default';
		/**
		 * hd (optional) String value identifying a particular hosted domain
		 * account to be accessed (for example, 'mycollege.edu'). 
		 * Use "default" to specify a regular Google account ('username@gmail.com'). 
		 */		
		public var hd:String = 'default';
		/**
		 * scope (required) URL identifying the service(s) to be accessed; 
		 * see documentation for the service for the correct value(s).
		 * The resulting token enables access to the specified service(s) only.
		 * To specify more than one scope, list each one separated with a space (encodes as "%20"). 
		 */		
		public var scope:String = 'http://iksnae.com';
		/**
		 * secure (optional) Boolean flag indicating whether the authentication
		 * transaction should issue a secure token (1) or a non-secure token (0). 
		 * Secure tokens are available to registered applications only. 
		 */		
		public var secure:Boolean = 1;
		/**
		 * session (optional) Boolean flag indicating whether the one-time-use 
		 * token may be exchanged for a session token (1) or not (0)
		 */		
		public var session:Boolean = 1;

	}
}