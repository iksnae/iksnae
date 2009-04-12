package  com.iksnae.webapi.google.gcal.objects
{
	import com.iksnae.webapi.google.GoogleService;
	import com.iksnae.webapi.google.gcal.params.GCalAccessLevel;
	import com.iksnae.webapi.google.gcal.params.GCalColor;
	import com.iksnae.webapi.google.gcal.params.GCalHidden;
	import com.iksnae.webapi.google.gcal.params.GCalSelected;
	import com.iksnae.webapi.google.gcal.params.GCalTimeZone;
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
	

	public class GoogleCalendarEventDataObject extends GCalDataObject
	{
		
		public var id:String;
        public var summary:String;
        public var pubDate:Date;
        public var update:Date;
        public var icon:String;
        public var logo:String;
        public var transparency:GDataTransparency;
        public var frequency:String;
        public var start:Date;
        public var end:Date;
        public var byDate:String;
        public var until:Date;
        public var eventStatus:String;
        public var where:GCalWhere;
        public var timezone:GCalTimeZone;
        public var hidden:GCalHidden;
        public var accesslevel:GCalAccessLevel;
        public var color:GCalColor;
        public var selected:GCalSelected;
        
        
		
		
		public function GoogleCalendarEventDataObject()
		{
			super()
			init()
		}
		
		
		public function xmlNode():XML{
            var str:String = "<entry xmlns='"+GoogleService.NAMESPACE_ATOM+"' xmlns:gd='"+ GoogleService.NAMESPACE_GD+"'>";
            str += categoryNode();
            str += titleNode(title);
            str += contentNode(content);
            str += transparencyNode(transparency);
            str += eventStatusNode(eventStatus);
            str += whereNode(where)
            str += recurrenceNode(start,end,frequency,byDate,until)
            str += "</entry>"
            return XML(str)
        }
        /**
         * init method 
         * 
         */     
        private function init():void{

            timezone       = new GCalTimeZone();
            hidden         = new GCalHidden();
            color          = new GCalColor();
            where          = new GCalWhere();
            accesslevel    = new GCalAccessLevel();
            selected       = new GCalSelected();
            transparency   = new GDataTransparency()
            
            
        }
        public function titleXML():XML{
            return XML(titleNode(title))
        }
        public function contentXML(type:String = 'text'):XML{
            return XML(contentNode(content,type))
        }
        public function categoryXML():XML{
            return XML(categoryNode())
        }
        public function transparencyXML():XML{
            return XML(transparencyNode(transparency))
        }
        public function eventStatusXML():XML{
        	return XML(eventStatusNode(eventStatus))
		}
		public function whenXML():XML{
            return XML(whenNode(start,end))
        }
        public function whereXML():XML{
            return XML(whereNode(where))
        }
        
        
        
        
        
        
		
	}
}