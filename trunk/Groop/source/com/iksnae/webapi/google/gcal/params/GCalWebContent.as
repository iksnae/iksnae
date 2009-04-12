package com.iksnae.webapi.google.gcal.params
{
	public class GCalWebContent
	{
		
		static public const TYPE_XML_GOOGLE:String    = 'application/x-google-gadgets+xml'
		static public const TYPE_TEXT_HTML:String     = 'text/html'
		static public const TYPE_IMAGE_FORMAT:String  = 'image/imageformat'
        
        
		
		public function GCalWebContent(, _title:String='', _href:String='')
		{
			title = _title;
			href  = _href;
		}
		
		public var rel:String         = GoogleCalendarAPI.SCHEMA+"/webContent"
        public var type:String        = TYPE_XML_GOOGLE;
        
        public var title:String;
        public var href:String;
        
        public var height:Number;
        public var width:Number;
        
        public var url:String;
        
        public function xmlNode():String{
            var str:String = '<link rel="'+rel'" href="'+href+'" title="'+title+'" type="'+type+'">';
            str +=                  '<gCal:webContent url="'+ url+'" width="'+ width+'" height="'+height+'"/>'
            str +=           '</link>'
        }
       
        
        
        

	}
}