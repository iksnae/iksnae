/**
 * DoGetCachedPageResultEvent.as
 * This file was auto-generated from WSDL
 * Any change made to this file will be overwritten when the code is re-generated.
*/
package com.google
{
	import mx.utils.ObjectProxy;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
	/**
	 * Typed event handler for the result of the operation
	 */
    
	public class DoGetCachedPageResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var DoGetCachedPage_RESULT:String="DoGetCachedPage_result";
		/**
		 * Constructor for the new event type
		 */
		public function DoGetCachedPageResultEvent()
		{
			super(DoGetCachedPage_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:flash.utils.ByteArray;
		public function get result():flash.utils.ByteArray
		{
			return _result;
		}

		public function set result(value:flash.utils.ByteArray):void
		{
			_result = value;
		}

		public function get headers():Object
		{
			return _headers;
		}

		public function set headers(value:Object):void
		{
			_headers = value;
		}
	}
}