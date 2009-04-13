package com.iksnae.webapi.google.gcal.params
{
	[Bindable]
	public class GCalColor
	{
		
		/**
		 * color value 
		 */		
		public var value:uint;
		
		
		/**
		 * This class is used for storing and retreiving "color" value of a Google Calendar
		 * @param c color value
		 * 
		 */		
		public function GCalColor(c:uint=0xff0000)
		{
			value = c
		}
		/**
		 * generates xml-formatted string for use in Google Calender objects 
		 * @return XMLString in gCal format
		 * 
		 */		
		public function xmlNode():String{
			return String("<gCal:color value='"+value+"'></gCal:color")
        }
        /**
         * parses uint value by removing "#" and replacing with "0x" 
         * example: #ff0000 is stored as 0xff0000
         * @param str
         * 
         */        
        public function parse(str:String):void{
        	var start:int = str.search('#')+1;
        	value = parseInt('0x'+str.substr(start,6))
        }

	}
}