package  com.iksnae.webapi.google.gcal.objects
{
	import com.adobe.utils.XMLUtil;
	import com.adobe.xml.syndication.atom.Atom10;
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
		
		public var summary        :String;
		public var timezone       :GCalTimeZone;
		public var hidden         :GCalHidden;
		public var color          :GCalColor;
		public var where          :GCalWhere;
		public var accesslevel    :GCalAccessLevel;
		public var timesCleaned   :int;
		public var uid            :String;
		public var syncEvent      :Boolean;
		public var sequence       :int;
        public var selected       :GCalSelected;
        public var transparency   :GDataTransparency;
        
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
		
		
		
		
        
        public function parse(xml:XML):void{
        	if(!XMLUtil.isValidXML(xml))
            {
                trace("Feed does not contain valid XML.");
                return;
            }else{
                trace("XML Validated.");
            }
            dates.removeAll()
            var atom:Atom10 = new Atom10()
            atom.parse(xml)
            
            var items:Array = atom.entries;
            for each(var entry:Entry in items)
            {
                //print out the title of each item
                trace(entry.title);
                trace(entry.id);
                dates.addItem({label:entry.title, title:entry.title,description: entry.content.value, date: entry.published, id: entry.content.src })
            }
        }
        
        

	}
}