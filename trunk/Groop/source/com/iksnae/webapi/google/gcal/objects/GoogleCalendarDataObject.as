package  com.iksnae.webapi.google.gcal.objects
{
	import com.iksnae.webapi.google.gcal.params.GCalAccessLevel;
	import com.iksnae.webapi.google.gcal.params.GCalColor;
	import com.iksnae.webapi.google.gcal.params.GCalHidden;
	import com.iksnae.webapi.google.gcal.params.GCalSelected;
	import com.iksnae.webapi.google.gcal.params.GCalTimeZone;
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
	public class GoogleCalendarDataObject
	{
		public var title      :String;
		public var summary    :String;
		public var timezone   :GCalTimeZone = new GCalTimeZone('');
		public var hidden     :GCalHidden   = new GCalHidden(undefined);
		public var color      :GCalColor    = new GCalColor(undefined);
		public var where      :GCalWhere    = new GCalWhere('');
		public var accesslevel:GCalAccessLevel = new GCalAccessLevel('');
		public var timesCleaned:int;
		public var uid        :String;
		public var syncEvent  :Boolean;
		public var sequence   :int;
        public var selected   :GCalSelected = new GCalSelected();
        public var transparency:GDataTransparency = new GDataTransparency('','')
        
        
		
        
		public function GoogleCalendarDataObject()
		{
		}
		
		public function generateCalenderXML():XML{
			var str:String = "<entry xmlns='http://www.w3.org/2005/Atom' xmlns:gd='http://schemas.google.com/g/2005' xmlns:gCal='http://schemas.google.com/gCal/2005'>";
			str  += titleXMLNode()
            str  += summaryXMLNode()
            str  += timezone.xmlNode()
            str  += hidden.xmlNode()
            str  += color.xmlNode()
            str  += where.xmlNode()
            str  += "</entry>"
            return XML(str)
		}
		
		
		
		private function titleXMLNode():String{
			return String("<title type='text'>"+title+"</title>")
		}
		private function summaryXMLNode():String{
            return String("<title type='text'>"+title+"</title>")
        }
        
        public function parseCalendarXML(xml:XML):void{
        	
        }
        
        

	}
}