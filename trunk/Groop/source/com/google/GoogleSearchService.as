/**
 * GoogleSearchServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
 /**
  * Usage example: to use this service from within your Flex application you have two choices:
  * Use it via Actionscript only
  * Use it via MXML tags
  * Actionscript sample code:
  * Step 1: create an instance of the service; pass it the LCDS destination string if any
  * var myService:GoogleSearchService= new GoogleSearchService();
  * Step 2: for the desired operation add a result handler (a function that you have already defined previously)  
  * myService.adddoGetCachedPageEventListener(myResultHandlingFunction);
  * Step 3: Call the operation as a method on the service. Pass the right values as arguments:
  * myService.doGetCachedPage(mykey,myurl);
  *
  * MXML sample code:
  * First you need to map the package where the files were generated to a namespace, usually on the <mx:Application> tag, 
  * like this: xmlns:srv="com.google.*"
  * Define the service and within its tags set the request wrapper for the desired operation
  * <srv:GoogleSearchService id="myService">
  *   <srv:doGetCachedPage_request_var>
  *		<srv:DoGetCachedPage_request key=myValue,url=myValue/>
  *   </srv:doGetCachedPage_request_var>
  * </srv:GoogleSearchService>
  * Then call the operation for which you have set the request wrapper value above, like this:
  * <mx:Button id="myButton" label="Call operation" click="myService.doGetCachedPage_send()" />
  */
package com.google
{
	import mx.rpc.AsyncToken;
	import flash.events.EventDispatcher;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;

    /**
     * Dispatches when a call to the operation doGetCachedPage completes with success
     * and returns some data
     * @eventType DoGetCachedPageResultEvent
     */
    [Event(name="DoGetCachedPage_result", type="com.google.DoGetCachedPageResultEvent")]
    
    /**
     * Dispatches when a call to the operation doSpellingSuggestion completes with success
     * and returns some data
     * @eventType DoSpellingSuggestionResultEvent
     */
    [Event(name="DoSpellingSuggestion_result", type="com.google.DoSpellingSuggestionResultEvent")]
    
    /**
     * Dispatches when a call to the operation doGoogleSearch completes with success
     * and returns some data
     * @eventType DoGoogleSearchResultEvent
     */
    [Event(name="DoGoogleSearch_result", type="com.google.DoGoogleSearchResultEvent")]
    
	/**
	 * Dispatches when the operation that has been called fails. The fault event is common for all operations
	 * of the WSDL
	 * @eventType mx.rpc.events.FaultEvent
	 */
    [Event(name="fault", type="mx.rpc.events.FaultEvent")]

	public class GoogleSearchService extends EventDispatcher implements IGoogleSearchService
	{
    	private var _baseService:BaseGoogleSearchService;
        
        /**
         * Constructor for the facade; sets the destination and create a baseService instance
         * @param The LCDS destination (if any) associated with the imported WSDL
         */  
        public function GoogleSearchService(destination:String=null,rootURL:String=null)
        {
        	_baseService = new BaseGoogleSearchService(destination,rootURL);
        }
        
		//stub functions for the doGetCachedPage operation
          

        /**
         * @see IGoogleSearchService#doGetCachedPage()
         */
        public function doGetCachedPage(key:String,url:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.doGetCachedPage(key,url);
            _internal_token.addEventListener("result",_doGetCachedPage_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IGoogleSearchService#doGetCachedPage_send()
		 */    
        public function doGetCachedPage_send():AsyncToken
        {
        	return doGetCachedPage(_doGetCachedPage_request.key,_doGetCachedPage_request.url);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _doGetCachedPage_request:DoGetCachedPage_request;
		/**
		 * @see IGoogleSearchService#doGetCachedPage_request_var
		 */
		[Bindable]
		public function get doGetCachedPage_request_var():DoGetCachedPage_request
		{
			return _doGetCachedPage_request;
		}
		
		/**
		 * @private
		 */
		public function set doGetCachedPage_request_var(request:DoGetCachedPage_request):void
		{
			_doGetCachedPage_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _doGetCachedPage_lastResult:flash.utils.ByteArray;
		[Bindable]
		/**
		 * @see IGoogleSearchService#doGetCachedPage_lastResult
		 */	  
		public function get doGetCachedPage_lastResult():flash.utils.ByteArray
		{
			return _doGetCachedPage_lastResult;
		}
		/**
		 * @private
		 */
		public function set doGetCachedPage_lastResult(lastResult:flash.utils.ByteArray):void
		{
			_doGetCachedPage_lastResult = lastResult;
		}
		
		/**
		 * @see IGoogleSearchService#adddoGetCachedPage()
		 */
		public function adddoGetCachedPageEventListener(listener:Function):void
		{
			addEventListener(DoGetCachedPageResultEvent.DoGetCachedPage_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _doGetCachedPage_populate_results(event:ResultEvent):void
		{
			var e:DoGetCachedPageResultEvent = new DoGetCachedPageResultEvent();
		            e.result = event.result as flash.utils.ByteArray;
		                       e.headers = event.headers;
		             doGetCachedPage_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the doSpellingSuggestion operation
          

        /**
         * @see IGoogleSearchService#doSpellingSuggestion()
         */
        public function doSpellingSuggestion(key:String,phrase:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.doSpellingSuggestion(key,phrase);
            _internal_token.addEventListener("result",_doSpellingSuggestion_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IGoogleSearchService#doSpellingSuggestion_send()
		 */    
        public function doSpellingSuggestion_send():AsyncToken
        {
        	return doSpellingSuggestion(_doSpellingSuggestion_request.key,_doSpellingSuggestion_request.phrase);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _doSpellingSuggestion_request:DoSpellingSuggestion_request;
		/**
		 * @see IGoogleSearchService#doSpellingSuggestion_request_var
		 */
		[Bindable]
		public function get doSpellingSuggestion_request_var():DoSpellingSuggestion_request
		{
			return _doSpellingSuggestion_request;
		}
		
		/**
		 * @private
		 */
		public function set doSpellingSuggestion_request_var(request:DoSpellingSuggestion_request):void
		{
			_doSpellingSuggestion_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _doSpellingSuggestion_lastResult:String;
		[Bindable]
		/**
		 * @see IGoogleSearchService#doSpellingSuggestion_lastResult
		 */	  
		public function get doSpellingSuggestion_lastResult():String
		{
			return _doSpellingSuggestion_lastResult;
		}
		/**
		 * @private
		 */
		public function set doSpellingSuggestion_lastResult(lastResult:String):void
		{
			_doSpellingSuggestion_lastResult = lastResult;
		}
		
		/**
		 * @see IGoogleSearchService#adddoSpellingSuggestion()
		 */
		public function adddoSpellingSuggestionEventListener(listener:Function):void
		{
			addEventListener(DoSpellingSuggestionResultEvent.DoSpellingSuggestion_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _doSpellingSuggestion_populate_results(event:ResultEvent):void
		{
			var e:DoSpellingSuggestionResultEvent = new DoSpellingSuggestionResultEvent();
		            e.result = event.result as String;
		                       e.headers = event.headers;
		             doSpellingSuggestion_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the doGoogleSearch operation
          

        /**
         * @see IGoogleSearchService#doGoogleSearch()
         */
        public function doGoogleSearch(filter:Boolean,key:String,restrict:String,start:Number,ie:String,safeSearch:Boolean,lr:String,maxResults:Number,oe:String,q:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.doGoogleSearch(filter,key,restrict,start,ie,safeSearch,lr,maxResults,oe,q);
            _internal_token.addEventListener("result",_doGoogleSearch_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IGoogleSearchService#doGoogleSearch_send()
		 */    
        public function doGoogleSearch_send():AsyncToken
        {
        	return doGoogleSearch(_doGoogleSearch_request.filter,_doGoogleSearch_request.key,_doGoogleSearch_request.restrict,_doGoogleSearch_request.start,_doGoogleSearch_request.ie,_doGoogleSearch_request.safeSearch,_doGoogleSearch_request.lr,_doGoogleSearch_request.maxResults,_doGoogleSearch_request.oe,_doGoogleSearch_request.q);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _doGoogleSearch_request:DoGoogleSearch_request;
		/**
		 * @see IGoogleSearchService#doGoogleSearch_request_var
		 */
		[Bindable]
		public function get doGoogleSearch_request_var():DoGoogleSearch_request
		{
			return _doGoogleSearch_request;
		}
		
		/**
		 * @private
		 */
		public function set doGoogleSearch_request_var(request:DoGoogleSearch_request):void
		{
			_doGoogleSearch_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _doGoogleSearch_lastResult:GoogleSearchResult;
		[Bindable]
		/**
		 * @see IGoogleSearchService#doGoogleSearch_lastResult
		 */	  
		public function get doGoogleSearch_lastResult():GoogleSearchResult
		{
			return _doGoogleSearch_lastResult;
		}
		/**
		 * @private
		 */
		public function set doGoogleSearch_lastResult(lastResult:GoogleSearchResult):void
		{
			_doGoogleSearch_lastResult = lastResult;
		}
		
		/**
		 * @see IGoogleSearchService#adddoGoogleSearch()
		 */
		public function adddoGoogleSearchEventListener(listener:Function):void
		{
			addEventListener(DoGoogleSearchResultEvent.DoGoogleSearch_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _doGoogleSearch_populate_results(event:ResultEvent):void
		{
			var e:DoGoogleSearchResultEvent = new DoGoogleSearchResultEvent();
		            e.result = event.result as GoogleSearchResult;
		                       e.headers = event.headers;
		             doGoogleSearch_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//service-wide functions
		/**
		 * @see IGoogleSearchService#getWebService()
		 */
		public function getWebService():BaseGoogleSearchService
		{
			return _baseService;
		}
		
		/**
		 * Set the event listener for the fault event which can be triggered by each of the operations defined by the facade
		 */
		public function addGoogleSearchServiceFaultEventListener(listener:Function):void
		{
			addEventListener("fault",listener);
		}
		
		/**
		 * Internal function to re-dispatch the fault event passed on by the base service implementation
		 * @private
		 */
		 
		 private function throwFault(event:FaultEvent):void
		 {
		 	dispatchEvent(event);
		 }
    }
}
