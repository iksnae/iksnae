package  com.iris.mcgraw.view.mediators
{
	import com.iris.mcgraw.model.McgrawConstants;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class McGrawSiteMediator extends Mediator implements IMediator
	{
		static public const NAME:String = 'McGrawSiteMediator';
		
		public function McGrawSiteMediator(viewComponent:Object=null):void{
			trace(NAME)
			super(NAME,viewComponent)
			
		}
		
		override public function listNotificationInterests():Array{
			return [McgrawConstants.SECTION_CHANGE]
		}
		override public function handleNotification(notification:INotification):void{
			switch(notification.getName()){
				case McgrawConstants.SECTION_CHANGE:
					appView.mainView.currentState = notification.getBody() as String;
				break;
			}
		}
		public function get appView():McGraw{
			return viewComponent as McGraw;
		}
		
	}
}