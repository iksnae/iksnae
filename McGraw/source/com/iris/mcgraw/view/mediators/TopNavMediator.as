package com.iris.mcgraw.view.mediators
{
	import com.iris.mcgraw.model.McgrawConstants;
	import com.iris.mcgraw.view.components.TopNav;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class TopNavMediator extends Mediator implements IMediator
	{
		static public const NAME:String = 'TopNavMediator';
		
		public function TopNavMediator(viewComponent:Object=null):void{
		//	trace(NAME)
			super(NAME,viewComponent)
			TopNav(viewComponent).addEventListener(McgrawConstants.NAV_CLICK, onNavClick)
			
		}
		override public function listNotificationInterests():Array{
			return [McgrawConstants.SECTION_CHANGE]
		}
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case McgrawConstants.SECTION_CHANGE:
					
				break;
			}
		}
		public function get navView():TopNav{
			return viewComponent as TopNav;
		}
		private function onNavClick(e:Event):void{

			sendNotification(McgrawConstants.SECTION_CHANGE,navView.currentValue)
		}
	}
}