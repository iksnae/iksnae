package com.iksnae.webapi.google.gcal.objects
{
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
	public class GoogleCalendarEventDataObject
	{
		public var id:String;
		public var title:String;
        public var content:String;
        public var summary:String;
        public var pubDate:String;
        public var update:String;
        public var icon:String;
        public var logo:String;
        public var transparency:GDataTransparency;
        public var frequency:String;
        public var start:Date;
        public var end:Date;
        public var byDate:String;
        public var until:String;
        public var eventStatus:String;
        public var where:GCalWhere;
        
        
        
        
		public function GoogleCalendarEventDataObject()
		{
			
		}

	}
}