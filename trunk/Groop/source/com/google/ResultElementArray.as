/**
 * ResultElementArray.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.google
{
	import mx.utils.ObjectProxy;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ICollectionView;
	import mx.rpc.soap.types.*;
	/**
	 * Typed array collection
	 */

	public class ResultElementArray extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function ResultElementArray(source:Array = null)
		{
			super(source);
		}
        
        
		public function addResultElementAt(item:ResultElement,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addResultElement(item:ResultElement):void 
		{
			addItem(item);
		} 

		public function getResultElementAt(index:int):ResultElement 
		{
			return getItemAt(index) as ResultElement;
		}

		public function getResultElementIndex(item:ResultElement):int 
		{
			return getItemIndex(item);
		}

		public function setResultElementAt(item:ResultElement,index:int):void 
		{
			setItemAt(item,index);
		}

		public function asIList():IList 
		{
			return this as IList;
		}
        
		public function asICollectionView():ICollectionView 
		{
			return this as ICollectionView;
		}
	}
}
