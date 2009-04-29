package com.iris.mcgraw.model.proxies
{
	import com.iris.mcgraw.model.vo.MailRegistrantObject;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class MailServiceProxy extends Proxy implements IProxy
	{
		
		static public const NAME:String 	= 'MailServiceProxy';
		static public const SUCCESS:String  = 'mail_subscribe_success';
		static public const FAIL:String 	= 'mail_subscribe_fail';
		
		
		
		
		private const COTY_SUBSCRIBER_URL:String = 'http://survey.email.coty.com/SensorPro/Capture/CaptureResults.aspx';
		 
		private var serviceLoader:URLLoader;
		
		public function MailServiceProxy()
		{
			super(NAME, new MailRegistrantObject())
			serviceLoader = new URLLoader()
			serviceLoader.addEventListener(Event.COMPLETE,onServiceEvent)
			
		}
		/**
		 * sends subscriber POST data to the webservices 
		 * @param vars
		 * 
		 */		
		public function addToMailList(vars:MailRegistrantObject):void{
			
			var r:URLRequest	= new URLRequest(COTY_SUBSCRIBER_URL)
			r.data 				= cotyMailRegistrant(vars)
			r.method 			= URLRequestMethod.POST;
			serviceLoader.load(r)
		}
		/**
		 * converts MailRegistrantObject to compatible URLVariables object
		 * @param reg
		 * @return 
		 * 
		 */		
		private function cotyMailRegistrant(reg:MailRegistrantObject):URLVariables{
			var urlVars:URLVariables = new URLVariables()
			urlVars['_CID']	= '00000000-0000-0000-0000-000000000000'
			urlVars['_PageId'] = ''
			urlVars['_SurveyId']= ''
			urlVars['_InstanceId'] = ''
			urlVars['_LastPageeId'] =''
			urlVars['ext_FirstName'] = reg.firstName;
			urlVars['ext_LastName']	= reg.lastName;
			urlVars['ext_Country']		= reg.country;
			urlVars['ext_Address1']	= reg.address1;
			urlVars['ext_Address2']	= reg.address2
			urlVars['ext_Address3']	= reg.zip
			urlVars['ext_State']		= reg.state;
			urlVars['ext_EMailAddress']= reg.email;
			urlVars['ext_Num1']		
			urlVars['ext_Num2']
			urlVars['ext_Num3']
			urlVars['ext_User2']
			urlVars['ext_User3']
			
			return urlVars;
			
		}
		private function onServiceEvent(e:Event):void{
		
		}

		
		
		
	}
}