package com.iksnae.webapi.google.gcal.params
{
	public class GCalColor
	{
		public var value:uint = undefined;
		
		
		/**
		 * This class is used for storing and retreiving "color" value of a Google Calendar
		 * @param c
		 * 
		 */		
		public function GCalColor(c:uint)
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
			if(value==undefined){
				throw new Error('You must set the "value" property before calling GCalColor.xmlNode()')
			}
            return String("<gCal:color value='"+value+"'></gCal:color")
        }

	}
}