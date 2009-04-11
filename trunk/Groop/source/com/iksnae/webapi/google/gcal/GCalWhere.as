package com.iksnae.webapi.google.gcal
{
	public class GCalWhere
	{
		public var valueString:String;
		public var rel:String;
		public var label:String;
		public function GCalWhere()
		{
		}
		
		public function xmlNode():String{
            return String("<gd:where rel='"+rel+"' label='"+label+"' valueString='"+valueString+"'></gd:where>")
        }

	}
}