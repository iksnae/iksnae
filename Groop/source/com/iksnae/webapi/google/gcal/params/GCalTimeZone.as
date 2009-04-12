package com.iksnae.webapi.google.gcal.params
{
	public class GCalTimeZone
	{
		static public const EASTERN_STANDARD:String   = 'America/New_York';
		static public const PACIFIC_STANDARD:String   = 'America/Los_Angeles';
        
		
		public var value:String;
		public function GCalTimeZone(v:String='')
		{
			value = v
		}
		public function xmlNode():String{
			if(value==''){
				throw new Error('You must set the "value" property before calling GCalTimeZone.xmlNode()')
			}
            return String("<gCal:timezone value='"+value+"'></gCal:timezone>")
        }

	}
}