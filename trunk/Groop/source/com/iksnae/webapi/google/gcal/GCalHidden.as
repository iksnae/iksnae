package com.iksnae.webapi.google.gcal
{
	public class GCalHidden
	{
		public var value:Boolean;
		public function GCalHidden()
		{
		}
		private function hiddenXMLNode():String{
            return String("<gCal:hidden value='"+value+"'></gCal:hidden>")
        }

	}
}