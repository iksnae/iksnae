package com.iksnae.webapi.google.gcal
{
	public class GCalColor
	{
		public var value:uint;
		public function GCalColor()
		{
		}
		public function xmlNode():String{
            return String("<gCal:color value='"+value+"'></gCal:color")
        }

	}
}