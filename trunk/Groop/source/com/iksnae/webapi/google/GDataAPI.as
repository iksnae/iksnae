package com.iksnae.webapi.google
{
	public class GDataAPI
	{
		public function GDataAPI()
		{
		}
		// feed elements
		static public const FEED_ELEMENT_TITLE:String             = '/feed/title';
		static public const FEED_ELEMENT_ID:String                = '/feed/id';
        static public const FEED_ELEMENT_HTML_LINK:String         = '/feed/link[@rel="alternate"]\[@type="text/html"]/@href';
        static public const FEED_ELEMENT_DESCRIPTION:String       = '/feed/subtitle';
        static public const FEED_ELEMENT_LANUAGE:String           = '/feed/@xml:lang';
        static public const FEED_ELEMENT_COPYRIGHT:String         = '/feed/rights';
        static public const FEED_ELEMENT_AUTHOR:String            = '/feed/author/name';
        static public const FEED_ELEMENT_LASTUPDATE_DATE:String   = '/feed/updated';
        static public const FEED_ELEMENT_CATEGORY:String          = '/feed/category/@term';
        static public const FEED_ELEMENT_CATEGORY_SCHEME:String   = '/feed/category/@scheme';
        static public const FEED_ELEMENT_GENERATOR:String         = '/feed/generator';
        static public const FEED_ELEMENT_GENERATOR_URI:String     = '/feed/generator/@uri';
        static public const FEED_ELEMENT_ICON:String              = '/feed/icon';
        static public const FEED_ELEMENT_LOGO:String              = '/feed/logo';
        
        // feed urls
        static public const FEED_ALL_CALENDARS:String             = 'http://www.google.com/calendar/feeds/default/allcalendars/full';
        static public const FEED_OWNER_CALENDARS:String           = 'http://www.google.com/calendar/feeds/default/owncalendars/full';
        static public const FEED_CALENDARS_BASE:String            = 'http://www.google.com/calendar/feeds/';
        
        
        // service urls
        static public const URL_CLIENT_LOGIN:String                =  'https://www.google.com/accounts/ClientLogin';
        static public const URL_AUTHSUB_REQUEST:String             =  'https://www.google.com/accounts/AuthSubRequest';
        
        // namespaces
        static public const NAMESPACE_GD  :Namespace  = new Namespace("http://schemas.google.com/g/2005")
        static public const NAMESPACE_GCAL:Namespace  = new Namespace("http://schemas.google.com/gCal/2005")
        static public const NAMESPACE_ATOM:Namespace  = new Namespace("http://www.w3.org/2005/Atom")
        
        
        // search related params        
        static public const NUMBER_OF_SEARCH_RESULTS:String          = '/feed/openSearch:totalResults';
        static public const NUMBER_OF_SEARCH_RESULTS_PER_PAGE:String = '/feed/openSearch:itemsPerPage';
        static public const SEARCH_RESULTS_START_INDEX:String        = '/feed/openSearch:startIndex';
        
        // entry elements
        static public const ENTRY_ID:String                  = '/feed/entry/id';
        static public const ENTRY_TITLE:String               = '/feed/entry/title';
        static public const ENTRY_LINK:String                = '/feed/entry/link';
        static public const ENTRY_SUMMARY:String             = '/feed/entry/summary';
        static public const ENTRY_AUTHOR_NAME:String         = '/feed/entry/author/name';
        static public const ENTRY_AUTHOR_EMAIL:String        = '/feed/entry/author/email';
        static public const ENTRY_CONTENT:String             = '/feed/entry/content';
        static public const ENTRY_CATEGORY:String            = '/feed/entry/category/@term';
        static public const EVENT_CATEGORY_SCHEME:String     = '/feed/entry/category/@scheme';
        static public const EVENT_PUB_DATE:String            = '/feed/entry/published';
        static public const EVENT_UPDATE_DATE:String         = '/feed/entry/updated';
      
        static public const ACCOUNTS_BASE_URL:String         = 'https://www.google.com/accounts';
        static public const CLIENT_LOGIN_URL:String          = 'https://www.google.com/accounts/ClientLogin'
        
        
        
        
        

	}
}