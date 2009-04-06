
/**
 * Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.google{
	import mx.rpc.AsyncToken;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
               
    public interface IGoogleSearchService
    {
    	//Stub functions for the doGetCachedPage operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param key
    	 * @param url
    	 * @return An AsyncToken
    	 */
    	function doGetCachedPage(key:String,url:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function doGetCachedPage_send():AsyncToken;
        
        /**
         * The doGetCachedPage operation lastResult property
         */
        function get doGetCachedPage_lastResult():flash.utils.ByteArray;
		/**
		 * @private
		 */
        function set doGetCachedPage_lastResult(lastResult:flash.utils.ByteArray):void;
       /**
        * Add a listener for the doGetCachedPage operation successful result event
        * @param The listener function
        */
       function adddoGetCachedPageEventListener(listener:Function):void;
       
       
        /**
         * The doGetCachedPage operation request wrapper
         */
        function get doGetCachedPage_request_var():DoGetCachedPage_request;
        
        /**
         * @private
         */
        function set doGetCachedPage_request_var(request:DoGetCachedPage_request):void;
                   
    	//Stub functions for the doSpellingSuggestion operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param key
    	 * @param phrase
    	 * @return An AsyncToken
    	 */
    	function doSpellingSuggestion(key:String,phrase:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function doSpellingSuggestion_send():AsyncToken;
        
        /**
         * The doSpellingSuggestion operation lastResult property
         */
        function get doSpellingSuggestion_lastResult():String;
		/**
		 * @private
		 */
        function set doSpellingSuggestion_lastResult(lastResult:String):void;
       /**
        * Add a listener for the doSpellingSuggestion operation successful result event
        * @param The listener function
        */
       function adddoSpellingSuggestionEventListener(listener:Function):void;
       
       
        /**
         * The doSpellingSuggestion operation request wrapper
         */
        function get doSpellingSuggestion_request_var():DoSpellingSuggestion_request;
        
        /**
         * @private
         */
        function set doSpellingSuggestion_request_var(request:DoSpellingSuggestion_request):void;
                   
    	//Stub functions for the doGoogleSearch operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param filter
    	 * @param key
    	 * @param restrict
    	 * @param start
    	 * @param ie
    	 * @param safeSearch
    	 * @param lr
    	 * @param maxResults
    	 * @param oe
    	 * @param q
    	 * @return An AsyncToken
    	 */
    	function doGoogleSearch(filter:Boolean,key:String,restrict:String,start:Number,ie:String,safeSearch:Boolean,lr:String,maxResults:Number,oe:String,q:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function doGoogleSearch_send():AsyncToken;
        
        /**
         * The doGoogleSearch operation lastResult property
         */
        function get doGoogleSearch_lastResult():GoogleSearchResult;
		/**
		 * @private
		 */
        function set doGoogleSearch_lastResult(lastResult:GoogleSearchResult):void;
       /**
        * Add a listener for the doGoogleSearch operation successful result event
        * @param The listener function
        */
       function adddoGoogleSearchEventListener(listener:Function):void;
       
       
        /**
         * The doGoogleSearch operation request wrapper
         */
        function get doGoogleSearch_request_var():DoGoogleSearch_request;
        
        /**
         * @private
         */
        function set doGoogleSearch_request_var(request:DoGoogleSearch_request):void;
                   
        /**
         * Get access to the underlying web service that the stub uses to communicate with the server
         * @return The base service that the facade implements
         */
        function getWebService():BaseGoogleSearchService;
	}
}