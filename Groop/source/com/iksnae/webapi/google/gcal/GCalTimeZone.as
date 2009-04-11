package com.iksnae.webapi.google.gcal
{
	public class GCalTimeZone
	{
		static public const EASTERN_STANDARD:String   = 'America/New_York';
		static public const PACIFIC_STANDARD:String   = 'America/Los_Angeles';
        
		
		public var value:String;
		public function GCalTimeZone()
		{
		}
		public function xmlNode():String{
            return String("<gCal:timezone value='"+value+"'></gCal:timezone>")
        }

	}
}