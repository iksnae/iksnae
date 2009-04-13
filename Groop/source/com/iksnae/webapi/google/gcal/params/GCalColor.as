package com.iksnae.webapi.google.gcal.params
{
	[Bindable]
	public class GCalColor
	{
		
		
		public var value:uint;
		
		
		/**
		 * This class is used for storing and retreiving "color" value of a Google Calendar
		 * @param c
		 * 
		 */		
		public function GCalColor(c:uint=0xff0000)
		{
			value = c
		}
		/**
		 * generates xml-formatted string for use in Google Calender objects 
		 * requires "value" property to be set, else throws error
		 * @return 
		 * 
		 */		
		public function xmlNode():String{
			return String("<gCal:color value='"+value+"'></gCal:color")
        }
        
        public function parse(str:String):void{
        	var start:int = str.search('#')+1;
        	value = parseInt('0x'+str.substr(start,6))
        }

	}
}