package com.iksnae.webapi.google
{
	import flash.events.Event;

	public class GoogleCalendarEvent extends Event
	{
		
		
		public function GoogleCalendarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
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
            str += recurrenceNode(o.start,o.end,o.frequency .... )
            
            str += "</entry>"
        }
        
        private function categoryNode(s:String='http://schemas.google.com/g/2005#kind',t:String = 'http://schemas.google.com/g/2005#event' ):String{
           return String("<category scheme='"+s+"' term='"+t+"'></category>")
        }
        private function titleNode(t:String):String{
		   return String("<title type='text'>"+t+"</title>")
		}
		private function contentNode(c):String{
			return "<content type='text'>"+c+"</content>"
		}
		private function transparencyNode(v:String = "http://schemas.google.com/g/2005#event.opaque"):String{
            return "<gd:transparency value='"+v+"'> </gd:transparency>"
        }
        private function eventStatusNode(v:String = "http://schemas.google.com/g/2005#event.confirmed"):String{
            return "<gd:eventStatus value='"+v+"'> </gd:eventStatus>"
        }
        private function whereNode(v:String = "office"):String{
            return "<gd:where value='"+v+"'> </gd:where>"
        }
        private function recurrenceNode(startDate:String, endDate:String, frequency:String, byDate:String, until:String):String{
            return "<gd:recurrence>DTSTART;VALUE=DATE:"+startDate+" DTEND;VALUE=DATE:"+endDate+" RRULE:FREQ="+frequency+";BYDAY="+byDate+";UNTIL="+until+"</gd:recurrence>"
        }
        
        
		
	}
}