package com.iksnae.groop.model.services
{
	import com.adobe.utils.XMLUtil;
	import com.adobe.xml.syndication.atom.Atom10;
	import com.adobe.xml.syndication.atom.Entry;
	import com.adobe.xml.syndication.atom.Link;
	import com.iksnae.groop.model.GroopServiceHub;
	import com.kloke.model.interfaces.IService;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;

	public class GroopCalendarService extends EventDispatcher implements IService
	{
		[Bindable] public var dates:ArrayCollection = new ArrayCollection();
		[Bindable] public var events:ArrayCollection = new ArrayCollection();
	
		private const BASE_URL:String = 'http://www.google.com/calendar/'
		private const DEFAULT:String = 'feeds/default'
		private const ALL:String = 'feeds/default/allcalendars/full'
		private const CALENDAR_EVENTS:String = 'feeds/default/private/full?q='
		
		private const xmlns:Namespace = new Namespace('http://www.w3.org/2005/Atom')
        private const gd:Namespace = new Namespace('http://www.w3.org/2005/Atom')
        private const gCal:Namespace = new Namespace('http://www.w3.org/2005/Atom')
        private const openSearch:Namespace=new Namespace('http://a9.com/-/spec/opensearchrss/1.0/')
		
		private var calenderLoader:URLLoader;
		private var authHeader:URLRequestHeader;
	    
		
		private var hub:GroopServiceHub = GroopServiceHub.getInstance()
		static private var instance:GroopCalendarService=null;
		static public function getInstance():GroopCalendarService{
			if(instance==null)instance=new GroopCalendarService(new se())
			return instance;
		}
		
		public function GroopCalendarService(se:se)
		{
			//TODO: implement function
			calenderLoader = new URLLoader();
			calenderLoader.addEventListener(Event.COMPLETE,onCalendarLoaded)
			
		}

		public function get connected():Boolean
		{
			//TODO: implement function
			return false;
		}
		
		public function get status():String
		{
			//TODO: implement function
			return null;
		}
		
		public function open():void
		{
			//TODO: implement function
			getAllCalendars()
		}
		
		public function close():void
		{
			//TODO: implement function
		}
		public function getAllCalendars():void{
			var r:URLRequest = new URLRequest(BASE_URL+ALL)
			calenderLoader.addEventListener(Event.COMPLETE,onCalendarLoaded)
			calenderLoader.load(r)
		}
		public function getAllCallendarEvents(str:String):void{
			trace('getAllCallendarEvents: '+str)
			var authVars:URLVariables = new URLVariables()
            
            authVars['accountType']='HOSTED_OR_GOOGLE';
            authVars['Email']     = hub.userName;
            authVars['Passwd']    = hub.passWord;
            authVars['service']   = 'cl';
            authVars['session']   = 1;
            
            var r:URLRequest = new URLRequest(str)
            r.data = authVars;
            r.method = URLRequestMethod.POST;
            
            calenderLoader.addEventListener(Event.COMPLETE,onEventsLoaded)
            calenderLoader.load(r)
        }
		private function onCalendarLoaded(e:Event):void{
		//	trace(URLLoader(e.target).data)
			calenderLoader.removeEventListener(Event.COMPLETE, onCalendarLoaded)
			parseCalendars(URLLoader(e.target).data)
		}
		private function onEventsLoaded(e:Event):void{
			calenderLoader.removeEventListener(Event.COMPLETE, onEventsLoaded)
			parseCalendarEvents(URLLoader(e.target).data)
		}
		public function onChangeCalendar(e:*):void{
		      trace('onChangeCalendar:'+DataGrid(e).selectedItem.title)	
		      getAllCallendarEvents(DataGrid(e).selectedItem.id)
		}
		private function parseCalendarEvents(data:String):void{
            if(!XMLUtil.isValidXML(data))
            {
                trace("Feed does not contain valid XML.");
                return;
            }else{
                trace("XML Validated: "+data);
            }
            events.removeAll()
            var atom:Atom10 = new Atom10()
            atom.parse(data)
            var items:Array = atom.entries;
            for each(var entry:Entry in items)
            {
                //print out the title of each item
               
                trace(entry.id);
                events.addItem(entry)
            }
        }
		private function parseCalendars(data:String):void{
			if(!XMLUtil.isValidXML(data))
		    {
		        trace("Feed does not contain valid XML.");
		        return;
		    }else{
		    	trace("XML Validated.");
		    }
		    dates.removeAll()
		    var atom:Atom10 = new Atom10()
		    atom.parse(data)
		    
		    var items:Array = atom.entries;
		    for each(var entry:Entry in items)
	        {
	            //print out the title of each item
	            trace(entry.title);
	            trace(entry.id);
	            dates.addItem({title:entry.title,description: entry.content.value, date: entry.published, id: entry.content.src })
	        }
		}
		
		
	}
}
class se{}