package  com.iksnae.webapi.google.gcal.objects
{
	import com.adobe.xml.syndication.atom.Entry;
	import com.iksnae.webapi.google.GDataAPI;
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
		
		// public properties... bindable
		[Bindable] public var id             :String 
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
        [Bindable] public var dates          :ArrayCollection;
        [Bindable] public var events         :ArrayCollection;
        [Bindable] public var links          :Array;
        [Bindable] public var xml            :XML;
        
        
        // load namspaces
        private var gCal:Namespace          = GDataAPI.NAMESPACE_GCAL;
        private var gd:Namespace            = GDataAPI.NAMESPACE_GD;
        private var atom:Namespace          = GDataAPI.NAMESPACE_ATOM;
        
        
        
    	/**
		 *constructor 
		 * 
		 */        
		public function GoogleCalendarDataObject()
		{
			super()
			dates = new ArrayCollection()
			events= new ArrayCollection()
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
	        links          = new Array()
		}
		
		
		
		/**
		 * generates Google Calendaer XML object  
		 * @return 
		 * 
		 */		
		public function xmlNode():XML{
			var str:String = "<entry xmlns='"+ GDataAPI.NAMESPACE_ATOM.uri+"' xmlns:gd='"+ GDataAPI.NAMESPACE_GD.uri+"' xmlns:gCal='"+GDataAPI.NAMESPACE_GCAL.uri+"'>";
			str  += titleXMLNode()
            str  += summaryXMLNode()
            str  += timezone.xmlNode()
            str  += hidden.xmlNode()
            str  += color.xmlNode()
            str  += where.xmlNode()
            str  += "</entry>"
            return XML(str)
		}
		
		
		
		
        /**
         * parses the Entry object, storing all Calendar values 
         * @param entry
         * 
         */        
        public function parse(entry:Entry):void{
        	GoogleService.getInstance().status = 'parsing calendar...'
        	xml                 = entry.xml[0]
        	id                  = entry.id;
        	title               = entry.title;
            content             = entry.content.src;
            published           = entry.published;
            updated             = entry.updated;
            accesslevel.value   = xml.gCal::accesslevel[0].@value;
            timezone.value      = xml.gCal::timezone[0].@value;
            hidden.value        = xml.gCal::hidden[0].@value; 
            selected.value      = xml.gCal::selected[0].@value; 
            timesCleaned        = xml.gCal::timesCleaned[0].@value; 
            links               = entry.links;
            // parse color value
            color.parse(xml.gCal::color[0].@value);
            
        }
	}
}