/**
 * DoGoogleSearch_request.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */

package com.google
{
	import mx.utils.ObjectProxy;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
	/**
	 * Wrapper class for a operation required type
	 */
    
	public class DoGoogleSearch_request
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function DoGoogleSearch_request() {}
            
		public var filter:Boolean;
		public var key:String;
		public var restrict:String;
		public var start:Number;
		public var ie:String;
		public var safeSearch:Boolean;
		public var lr:String;
		public var maxResults:Number;
		public var oe:String;
		public var q:String;
	}
}