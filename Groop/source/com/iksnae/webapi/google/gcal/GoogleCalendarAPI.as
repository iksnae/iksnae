package com.iksnae.webapi.google.gcal
{
	import com.adobe.utils.XMLUtil;
	import com.adobe.xml.syndication.atom.Atom10;
	import com.adobe.xml.syndication.atom.Entry;
	import com.iksnae.webapi.google.GDataAPI;
	import com.iksnae.webapi.google.GoogleService;
	import com.iksnae.webapi.google.gcal.objects.GoogleCalendarDataObject;
	import com.iksnae.webapi.google.gcal.objects.GoogleCalendarEventDataObject;
	import com.kloke.model.interfaces.IObserver;
	import com.kloke.util.debug.Debug;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	
	/**
	 * This class is a refrection of the properties and requests of the Google Calendar API.
	 * It's designed to help in communicating with the Google Calendar Service, by providing local references of the values used by the webservice.
	 * 
	 * @author iksnae
	 * 
	 */	
	[Bindable]
	public class GoogleCalendarAPI
	{
	
		
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
       
        public var resultsObject:Object
        public var calendars:ArrayCollection=new ArrayCollection();
        public var dates:ArrayCollection=new ArrayCollection();
        public var currentCalendar:GoogleCalendarDataObject;
        public var currentCalenderDate:GoogleCalendarDataObject;
        
        
		
		public function GoogleCalendarAPI()
		{
			
		}
		
		
		public function getAllCalendars():void{
			GoogleService.getInstance().method = "GET"
			GoogleService.getInstance().makeApiCall(GDataAPI.FEED_ALL_CALENDARS)
		}
		public function getCalendar(feed:String):void{
			GoogleService.getInstance().method = "GET"
			GoogleService.getInstance().makeApiCall(feed);
		}
		
        
        
        /**
         * this method returns xml formatted calendaer event for submitting new events to google calendar 
         * @param o (GoogleCalendarEventDataObject)
         * @return 
         * 
         */        
        public function generateEventXML(o:GoogleCalendarEventDataObject):XML{
            return o.xmlNode()
        }
        
        public function generateCalendarXML(o:GoogleCalendarDataObject):XML{
            return o.xmlNode()
        }
        
        
        public function generateQuickEventXML(o:GoogleCalendarEventDataObject):XML{
        	var str:String = "<entry xmlns='"+ GDataAPI.NAMESPACE_ATOM.uri+"' xmlns:gCal='"+ GDataAPI.NAMESPACE_GCAL.uri+"'>"+o.contentXML('html')+"<gCal:quickadd value='true'></entry>"
        	return XML(str)
        }
        
        public function generateSingleOccurenceEventXML(o:GoogleCalendarEventDataObject):XML{
        	var str:String = "<entry xmlns='"+GDataAPI.NAMESPACE_ATOM.uri+"' xmlns:gd='"+GDataAPI.NAMESPACE_GD.uri+"'>"
        	str += o.categoryXML()
        	str += o.titleXML()
        	str += o.contentXML()
        	str += o.transparencyXML()
        	str += o.eventStatusXML()
        	str += o.whereXML()
        	str += o.whenXML()     
        	str += "</entry>"
        	return XML(str)
        	
        }
        /**
         * dictionary for storing observers/retreiving listening for events 
         */
        private var observers:Dictionary=new Dictionary()
        
        /**
         * this method is inherited from the ISubject interface.
         * - checks to see if there's an event registered
         * - if the event is registered, the observer is stored
         * - else the event is registered, then the observer is stored
         * @param eventName
         * @param observer
         * @see ISubject
         */     
        public function subscribe(eventName:String,observer:IObserver):void{
            var obs:Array;
            if(observers[eventName]!=null){
                obs = observers[eventName];
                Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName,{eventName:eventName});
            }else{
                Debug.log('No Observers for: '+ eventName +' so a list was created.');
                obs = new Array();
                observers[eventName] = obs;
            }
            Debug.log('Storing '+observer+' for "'+eventName+'" event',{observer:observer,eventName:eventName})
            obs.push(observer);
        }
        
        
        
        /**
         * this method is inherited from the ISubject interface.
         * - checks for observer/eventName pair
         * - if found, item is removed from array ( still needs to be removed from dictionary object )
         * 
         * @param eventName
         * @param observer
         */     
        public function unSubscribe(eventName:String,observer:IObserver):void{
            var obs:Array;
            if(observers[eventName]!=null){
                obs = observers[eventName];
                Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName);
                for(var ob:int = 0; ob < obs.length; ob++){
                    if(obs[ob]==observer){
                        obs.splice(ob,1)
                        break;
                    }
                }
            }else{
                Debug.log('No Observers for: '+ eventName);
            }
        }
        
        
        
        /**
         * this method is inherited from the ISubject interface.
         * - notifies all observers of the specified eventName
         * @param event
         * @param data
         */     
        public function notify(eventName:String, data:*=null):void{
            var list:Array;
            if(observers[eventName]!=null){
                list = observers[eventName];
                Debug.log('('+list.length+') Observers Found')
                for(var ob:int = 0; ob < list.length; ob++){
                //  Debug.log('('+ob+') Found: '+list[ob])
                    list[ob].update(data)
                }
            }else{
                Debug.log('No Observers for: '+ eventName,eventName);
            }
        }
       
        public function onCalendarResult(data:Object=null,type:String=null):void{
        	trace(this+'onCalendarResult: '+ ResultEvent(data).message.body)
        	var xml:XML = XML(ResultEvent(data).message.body)
        	parse(xml)
        }
        
        public function parse(xml:XML):void{
//        	trace("PARSING: "+xml)
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
            trace(items.length)
            for(var i:int=0;i<items.length;i++)
            {
                //print out the title of each item
               
                var newCal:GoogleCalendarDataObject = new GoogleCalendarDataObject()
                newCal.parse(Entry(items[i]))
                calendars.addItem(newCal)
            }
            GoogleService.getInstance().status = 'idle.'
        }
        
        
        
        

	}
}