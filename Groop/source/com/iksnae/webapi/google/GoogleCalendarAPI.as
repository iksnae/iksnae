package com.iksnae.webapi.google
{
	/**
	 * This class is a refrection of the properties and requests of the Google Calendar API.
	 * It's designed to help in communicating with the Google Calendar Service, by providing local references of the values used by the webservice.
	 * 
	 * @author iksnae
	 * 
	 */	
	public class GoogleCalendarAPI
	{
		static public const BASE_URL:String       = 'http://www.google.com/calendar/feeds/';
        static public const SEARCH:String         = 'q';
        static public const SCHEMA:String         = "http://schemas.google.com/g/2005#";
        static public const EVENT_OPAQUE:String   = 'event.opaque';
        static public const EVENT_CONFIRMED:String= 'event.confirmed';
        static public const KIND:String           = 'kind';
        static public const EVENT:String          = 'event';
        static public const ALL_CALENDARS:String  = 'default/allcalendars/full'
        static public const USER_CALENDARS:String = 'default/owncalendars/full'
		
		
		public function GoogleCalendarAPI()
		{
		}
		
		
        
        
        /**
         * this method returns xml formatted calendaer event for submitting new events to google calendar 
         * @param o
         * @return 
         * 
         */        
        public function generateEventXML(o:GoogleCalendarEventDataObject):XML{
            var str:String = "<entry xmlns='http://www.w3.org/2005/Atom' xmlns:gd='http://schemas.google.com/g/2005'>";
            str += categoryNode();
            str += titleNode(o.title);
            str += contentNode(o.content);
            str += transparencyNode();
            str += eventStatusNode();
            str += transparencyNode();
            str += whereNode()
            str += recurrenceNode(o.start,o.end,o.frequency,o.byDate,o.until)
            str += "</entry>"
            return XML(str)
        }
        
        public function generateCalendarXML(o:GoogleCalendarEventDataObject):XML{
            var str:String = "<entry xmlns='http://www.w3.org/2005/Atom' xmlns:gd='http://schemas.google.com/g/2005' xmlns:gCal='http://schemas.google.com/gCal/2005'>";
            str += categoryNode();
            str += titleNode(o.title);
            str += contentNode(o.content);
            str += transparencyNode();
            str += eventStatusNode();
            str += transparencyNode();
            str += whereNode()
            str += recurrenceNode(o.start,o.end,o.frequency,o.byDate,o.until)
            str += "</entry>"
            return XML(str)
        }
        
        
        
        
        
        
        private function categoryNode(scheme:String=KIND,term:String = EVENT ):String{
           return String("<category scheme='"+SCHEMA+scheme+"' term='"SCHEMA+term+"'></category>")
        }
        private function titleNode(t:String):String{
           return String("<title type='text'>"+t+"</title>")
        }
        private function contentNode(content):String{
            return "<content type='text'>"+content+"</content>"
        }
        private function transparencyNode(value:String = EVENT_OPAQUE):String{
            return "<gd:transparency value='"+ SCHEMA+value+"'> </gd:transparency>"
        }
        private function eventStatusNode(value:String = EVENT_CONFIRMED):String{
            return "<gd:eventStatus value='"SCHEMA+value+"'> </gd:eventStatus>"
        }
        private function whereNode(v:String = "office"):String{
            return "<gd:where value='"+v+"'> </gd:where>"
        }
        private function recurrenceNode(startDate:String, endDate:String, frequency:String, byDate:String, until:String):String{
            return "<gd:recurrence>DTSTART;VALUE=DATE:"+startDate+" DTEND;VALUE=DATE:"+endDate+" RRULE:FREQ="+frequency+";BYDAY="+byDate+";UNTIL="+until+"</gd:recurrence>"
        }
        
        
        

	}
}