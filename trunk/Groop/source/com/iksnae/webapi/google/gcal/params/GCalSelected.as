package com.iksnae.webapi.google.gcal.params
{
	public class GCalSelected
	{
		public var value:Boolean;
		
		public function GCalSelected(bool:Boolean=false)
		{
			value = bool
		}
		public function xmlNode():String{
			return '<gCal:seleced value="'+value +'"/>'
        }

	}
}