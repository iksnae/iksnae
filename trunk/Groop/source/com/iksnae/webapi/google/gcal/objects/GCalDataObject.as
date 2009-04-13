package com.iksnae.webapi.google.gcal.objects
{
	import com.iksnae.webapi.google.GoogleService;
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
	public class GCalDataObject
	{
		
		[Bindable] public var title:String;
		[Bindable] public var content:String;
        
        
        
		public function GCalDataObject()
		{
		}
		protected function titleXMLNode():String{
            return String("<title type='text'>"+title+"</title>")
        }
        protected function summaryXMLNode():String{
            return String("<title type='text'>"+title+"</title>")
        }
        protected function contentXMLNode(type:String):String{
            return String("<content type='"+type+"'>"+title+"</title>")
        }
		
		protected function categoryNode():String{
           return String("<category scheme='"+ GoogleService.NAMESPACE_GD.uri+"#kind"+"' term='"+GoogleService.NAMESPACE_GD.uri+"#event'/>")
        }
        protected function titleNode(text:String):String{
           return String("<title type='text'>"+text+"</title>")
        }
        protected function contentNode(content:String,type:String='text'):String{
            return "<content type='"+type+"'>"+content+"</content>"
        }
        protected function transparencyNode(value:GDataTransparency):String{
            return value.xmlNode()
        }
        protected function eventStatusNode(value:String):String{
            return "<gd:eventStatus value='"+ GoogleService.NAMESPACE_GD.uri+'#'+value+"'> </gd:eventStatus>"
        }
        protected function whereNode(v:GCalWhere):String{
            return v.xmlNode()
        }
        protected function whenNode(start:Date,end:Date):String{
            return "<gd:when startTime='"+start+"' endTime='"+end+"'/>"
        }
        protected function recurrenceNode(startDate:Date, endDate:Date, frequency:String, byDate:String, until:Date):String{
            return "<gd:recurrence>DTSTART;VALUE=DATE:"+startDate+" DTEND;VALUE=DATE:"+endDate+" RRULE:FREQ="+frequency+";BYDAY="+byDate+";UNTIL="+until+"</gd:recurrence>"
        }

	}
}