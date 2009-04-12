package com.iksnae.webapi.google.gcal
{
	import com.iksnae.webapi.google.GoogleService;
	import com.iksnae.webapi.google.gcal.objects.GoogleCalendarDataObject;
	import com.iksnae.webapi.google.gcal.objects.GoogleCalendarEventDataObject;
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
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
        
        
        
        
        static public const EVENT_OPAQUE:String   = 'event.opaque';
        static public const EVENT_CONFIRMED:String= 'event.confirmed';
        static public const KIND:String           = 'kind';
        static public const EVENT:String          = 'event';
        static public const ALL_CALENDARS:String  = 'default/allcalendars/full';
        static public const USER_CALENDARS:String = 'default/owncalendars/full';
        
		
		/**
		 * Query Parameters 
		 * 
		 */		
		static public const FUTURE_EVENTS:String                  = "futureevents";
		static public const ORDER_BY:String                       = "orderby";
        static public const RECURRENCE_EXPANSION_START:String     = "recurrence-expansion-start";
        static public const RECURRENCE_EXPANSION_END:String       = "recurrence-expansion-end";
        static public const SINGLE_EVENTS:String                  = "singleevents";
        static public const SORT_ORDER:String                     = "sortorder";
        static public const START_MIN:String                      = "start-min";
        static public const START_MAX:String                      = "start-max";
        static public const CTX:String                            = "ctx";
        
        
        static private var _instance:GoogleCalendarAPI=null;
        static public function getInstance():GoogleCalendarAPI{
        	if(_instance==null) _instance = new GoogleCalendarAPI()
        	return _instance
        }
		
		public var currentCalendar:GoogleCalendarDataObject;
		
		public function GoogleCalendarAPI()
		{
		}
		
		
        
        
        /**
         * this method returns xml formatted calendaer event for submitting new events to google calendar 
         * @param o (GoogleCalendarEventDataObject)
         * @return 
         * 
         */        
        public function generateEventXML(o:GoogleCalendarEventDataObject):XML{
            var str:String = "<entry xmlns='"+GoogleService.NAMESPACE_ATOM+"' xmlns:gd='"+ GoogleService.NAMESPACE_GD+"'>";
            str += categoryNode();
            str += titleNode(o.title);
            str += contentNode(o.content);
            str += transparencyNode(o.transparency);
            str += eventStatusNode(o.eventStatus);
            str += whereNode(o.where)
            str += recurrenceNode(o.start,o.end,o.frequency,o.byDate,o.until)
            str += "</entry>"
            return XML(str)
        }
        
        public function generateCalendarXML(o:GoogleCalendarDataObject):XML{
            var str:String = "<entry xmlns='"+ GoogleService.NAMESPACE_ATOM+"' xmlns:gd='"+ GoogleService.NAMESPACE_GD+"' xmlns:gCal='"+ GoogleService.NAMESPACE_GCAL+"'>";
            str += categoryNode();
            str += titleNode(o.title);
            str += transparencyNode(o.transparency);
            str += "</entry>"
            return XML(str);
        }
        
        
        public function genderateQuickEventXML(o:GoogleCalendarEventDataObject):XML{
        	var str:String = "<entry xmlns='"+ GoogleService.NAMESPACE_ATOM+"' xmlns:gCal='"+ GoogleService.NAMESPACE_GCAL+"'>"+contentNode(o.content,"html")+"<gCal:quickadd value='true'></entry>"
        	return XML(str)
        }
        
        public function generateSingleOccurenceEventXML(o:GoogleCalendarEventDataObject):XML{
        	var str:String = "<entry xmlns='"+GoogleService.NAMESPACE_ATOM+"' xmlns:gd='"+GoogleService.NAMESPACE_GD+"'>"
        	str += categoryNode()
        	str += titleNode(o.title)
        	str += contentNode(o.content)
        	str += transparencyNode(o.transparency)
        	str += eventStatusNode(o.eventStatus)
        	str += whereNode(o.where)
        	str += whenNode(o.start,o.end)
        	return XML(str)
        	
        }
        
        
        
        
        
        
        
        
        
        
        
        
        private function categoryNode():String{
           return String("<category scheme='"+ GoogleService.NAMESPACE_GD+"#kind"+"' term='"+GoogleService.NAMESPACE_GD+"#event'/>")
        }
        private function titleNode(text:String):String{
           return String("<title type='text'>"+text+"</title>")
        }
        private function contentNode(content:String,type:String='text'):String{
            return "<content type='"+type+"'>"+content+"</content>"
        }
        private function transparencyNode(value:GDataTransparency):String{
        	return value.xmlNode()
        }
        private function eventStatusNode(value:String):String{
            return "<gd:eventStatus value='"+GoogleService.NAMESPACE_GD+'#'+value+"'> </gd:eventStatus>"
        }
        private function whereNode(v:GCalWhere):String{
        	return v.xmlNode()
        }
        private function whenNode(start:Date,end:Date):String{
            return "<gd:when startTime='"+start+"' endTime='"+end+"'/>"
        }
        private function recurrenceNode(startDate:Date, endDate:Date, frequency:String, byDate:String, until:String):String{
            return "<gd:recurrence>DTSTART;VALUE=DATE:"+startDate+" DTEND;VALUE=DATE:"+endDate+" RRULE:FREQ="+frequency+";BYDAY="+byDate+";UNTIL="+until+"</gd:recurrence>"
        }
        
        
        

	}
}