package com.iris.mcgraw.model.proxies
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.Proxy;
	
	import org.puremvc.as3.interfaces.IProxy;

	public class MailServiceProxy extends Proxy implements IProxy
	{
		private var _cotySubscriberURL:String = '';
		
		public function MailServiceProxy()
		{
			super();
		}
		/**
		 * sends subscriber POST data to the webservices 
		 * @param vars
		 * 
		 */		
		public function addToMailList(vars:URLVariables):void{
			var l:URLLoader=new URLLoader()
			var r:URLRequest=new URLRequest(_cotySubscriberURL)
			r.method = URLRequestMethod.POST;
			l.load(r)
			
		}
		
		
		
	}
}