package  com.iksnae.webapi.google.gcal
{
	import com.iksnae.webapi.google.gcal.GCalColor;
	import com.iksnae.webapi.google.gcal.GCalHidden;
	import com.iksnae.webapi.google.gcal.GCalTimeZone;
	import com.iksnae.webapi.google.gcal.GCalWhere;
	
	public class GoogleCalendarDataObject
	{
		public var title      :String;
		public var summary    :String;
		public var timezone   :GCalTimeZone;
		public var hidden     :GCalHidden;
		public var color      :GCalColor;
		public var where      :GCalWhere;
		
        
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