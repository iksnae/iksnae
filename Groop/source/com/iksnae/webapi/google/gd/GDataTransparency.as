package com.iksnae.webapi.google.gd
{
	import com.iksnae.webapi.google.GDataAPI;
	
	public class GDataTransparency
	{
		
		static public const OPAQUE:String = 'opaque'
		
		
		public var value:String = ''
		public var type:String  = ''
		
		public function GDataTransparency(v:String='',t:String='')
		{
			value = v;
			type  = t;
		}
		public function xmlNode():String{
			if(value=="" || type==""){
				throw new Error("You msust set the 'value' and 'type' properties before calling GDataTransparency.xmlNode()")
			}
			return String('<gd:transparency value="'+ GDataAPI.NAMESPACE_GD.uri+'/#'+type+'.'+value+'"></gd:transparency>')
		}

	}
}