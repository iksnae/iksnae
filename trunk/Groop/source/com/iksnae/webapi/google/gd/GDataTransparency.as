package com.iksnae.webapi.google.gd
{
	import com.iksnae.webapi.google.GoogleService;
	
	public class GDataTransparency
	{
		
		static public const OPAQUE:String = 'opaque'
		
		
		public var value:String = ''
		public var type:String  = ''
		
		public function GDataTransparency(v:String,t:String)
		{
			value = v;
		}
		public function xmlNode():String{
			if(value=="" || type==""){
				throw new Error("You msust set the 'value' and 'type' properties before calling GDataTransparency.xmlNode()")
			}
			return String('<gd:transparency value="'+GoogleService.SCHEMA+'/#'+type+'.'+value+'"></gd:transparency>')
		}

	}
}