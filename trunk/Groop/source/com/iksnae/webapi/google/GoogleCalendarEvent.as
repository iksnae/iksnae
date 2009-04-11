package com.iksnae.webapi.google
{
	import flash.events.Event;

	public class GoogleCalendarEvent
	{
		
		
		
		public function GoogleCalendarEvent()
		{
			
		}
		
		
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
        }
        
        private function categoryNode(scheme:String=GoogleCalendarAPI.KIND,term:String = GoogleCalendarAPI.EVENT ):String{
           return String("<category scheme='"+GoogleCalendarAPI.SCHEMA+scheme+"' term='"GoogleCalendarAPI.SCHEMA+term+"'></category>")
        }
        private function titleNode(t:String):String{
		   return String("<title type='text'>"+t+"</title>")
		}
		private function contentNode(content):String{
			return "<content type='text'>"+content+"</content>"
		}
		private function transparencyNode(value:String = EVENT_OPAQUE):String{
            return "<gd:transparency value='"+ GoogleCalendarAPI.SCHEMA+value+"'> </gd:transparency>"
        }
        private function eventStatusNode(value:String = GoogleCalendarAPI.EVENT_CONFIRMED):String{
            return "<gd:eventStatus value='"GoogleCalendarAPI.SCHEMA+value+"'> </gd:eventStatus>"
        }
        private function whereNode(v:String = "office"):String{
            return "<gd:where value='"+v+"'> </gd:where>"
        }
        private function recurrenceNode(startDate:String, endDate:String, frequency:String, byDate:String, until:String):String{
            return "<gd:recurrence>DTSTART;VALUE=DATE:"+startDate+" DTEND;VALUE=DATE:"+endDate+" RRULE:FREQ="+frequency+";BYDAY="+byDate+";UNTIL="+until+"</gd:recurrence>"
        }
        
        
		
	}
}