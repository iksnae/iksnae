package com.iris.mcgraw.view.mediators
{
	import com.iris.mcgraw.McGrawSite;
	import com.iris.mcgraw.model.McgrawConstants;
	import com.iris.mcgraw.view.components.MainView;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class MainViewMediator extends Mediator implements IMediator
	{
		static public const NAME:String = 'MainViewMediator';
		public function MainViewMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			MainView(viewComponent).addEventListener(McGrawSite.EMAIL_SUBSCRIBE,onMailSubscribe)
		}
		override public function listNotificationInterests():Array{
			return [McgrawConstants.SECTION_CHANGE]
		}
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case McgrawConstants.SECTION_CHANGE:
					mainView.currentState = notification.getBody() as String;
				break;
			}
		}
		public function get mainView():MainView{
			return viewComponent as MainView
		}
		private function onMailSubscribe(e:Event):void{
			sendNotification(McGrawSite.EMAIL_SUBSCRIBE, mainView.mailingListSignupView.registrantObject)
		}
	}
}