package  com.iksnae.webapi.google.gcal.objects
{
	import com.adobe.xml.syndication.atom.Entry;
	import com.iksnae.webapi.google.GoogleService;
	import com.iksnae.webapi.google.gcal.params.GCalAccessLevel;
	import com.iksnae.webapi.google.gcal.params.GCalColor;
	import com.iksnae.webapi.google.gcal.params.GCalHidden;
	import com.iksnae.webapi.google.gcal.params.GCalSelected;
	import com.iksnae.webapi.google.gcal.params.GCalTimeZone;
	import com.iksnae.webapi.google.gcal.params.GCalWhere;
	import com.iksnae.webapi.google.gd.GDataTransparency;
	
	import mx.collections.ArrayCollection;
	/**
	 * this class is for storing and handling Google Calendar objects 
	 * @author iksnae
	 * 
	 */	
	public class GoogleCalendarDataObject extends GCalDataObject
	{
		
		
		
		
		// public properties...
		
		[Bindable] public var summary        :String;
		[Bindable] public var timezone       :GCalTimeZone;
		[Bindable] public var hidden         :GCalHidden;
		[Bindable] public var color          :GCalColor;
		[Bindable] public var where          :GCalWhere;
		[Bindable] public var accesslevel    :GCalAccessLevel;
		[Bindable] public var timesCleaned   :int;
		[Bindable] public var uid            :String;
		[Bindable] public var syncEvent      :Boolean;
		[Bindable] public var sequence       :int;
        [Bindable] public var selected       :GCalSelected;
        [Bindable] public var transparency   :GDataTransparency;
        [Bindable] public var published      :Date;
        [Bindable] public var updated        :Date;
        

        private var gCal:Namespace = GoogleService.NAMESPACE_GCAL;
        private var gd:Namespace = GoogleService.NAMESPACE_GD;
        private var atom:Namespace = GoogleService.NAMESPACE_ATOM;
        
        
        
        [Bindable]
        public var dates:ArrayCollection = new ArrayCollection();
        [Bindable]
        public var events:ArrayCollection = new ArrayCollection();
        
        
		
		/**
		 *constructor 
		 * 
		 */        
		public function GoogleCalendarDataObject()
		{
			super()
			init()
		}
		/**
		 * init method 
		 * 
		 */		
		private function init():void{
			
            dates          = new ArrayCollection()
	        timezone       = new GCalTimeZone();
	        hidden         = new GCalHidden();
	        color          = new GCalColor();
	        where          = new GCalWhere();
	        accesslevel    = new GCalAccessLevel();
	        selected       = new GCalSelected();
	        transparency   = new GDataTransparency()
	        
	        
		}
		/**
		 * generates Google Calendaer XML object  
		 * @return 
		 * 
		 */		
		public function xmlNode():XML{
			var str:String = "<entry xmlns='"+GoogleService.NAMESPACE_ATOM+"' xmlns:gd='"+GoogleService.NAMESPACE_GD+"' xmlns:gCal='"+GoogleService.NAMESPACE_GCAL+"'>";
			str  += titleXMLNode()
            str  += summaryXMLNode()
            str  += timezone.xmlNode()
            str  += hidden.xmlNode()
            str  += color.xmlNode()
            str  += where.xmlNode()
            str  += "</entry>"
            return XML(str)
		}
		
		
		
		
        
        public function parse(entry:Entry):void{
        	
        	var xml:XML = entry.xml[0]
        	
        	title               = entry.title;
            content             = entry.content.src;
            published           = entry.published;
            updated             = entry.updated;
            accesslevel.value   = xml.gCal::accesslevel[0].@value;
            timezone.value      = xml.gCal::timezone[0].@value;
            color.parse(xml.gCal::color[0].@value);
            hidden.value        = xml.gCal::hidden[0].@value; 
            selected.value      = xml.gCal::selected[0].@value; 
            timesCleaned        = xml.gCal::timesCleaned[0].@value; 
            timesCleaned        = xml.gCal::timesCleaned[0].@value; 
            
            
            trace(xml.gCal::accesslevel[0].@value)
            trace('title: '+ title+' & '+xml.gCal::color[0].@value)
     
        	
        	
            GoogleService.getInstance().status = 'idle.'
        }
    
        public function get label():String{
        	return title
        }
        

	}
}