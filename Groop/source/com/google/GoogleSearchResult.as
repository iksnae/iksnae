/**
 * GoogleSearchResult.as
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
    
	public class GoogleSearchResult
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function GoogleSearchResult() {}
            
		public var documentFiltering:Boolean;
		public var searchComments:String;
		public var estimatedTotalResultsCount:Number;
		public var estimateIsExact:Boolean;
		public var resultElements:com.google.ResultElementArray;
		public var searchQuery:String;
		public var startIndex:Number;
		public var endIndex:Number;
		public var searchTips:String;
		public var directoryCategories:com.google.DirectoryCategoryArray;
		public var searchTime:Number;
	}
}