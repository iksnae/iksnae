package com.iksnae.webapi.google.gcal.params
{
	public class GCalHidden
	{
		public var value:Boolean;
		
		public function GCalHidden(v:Boolean=false)
		{
			value = v
		}
		public function xmlNode():String{
            return String("<gCal:hidden value='"+value+"'></gCal:hidden>")
        }

	}
}