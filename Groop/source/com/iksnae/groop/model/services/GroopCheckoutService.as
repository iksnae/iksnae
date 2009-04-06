package com.iksnae.groop.model.services
{
	import com.iksnae.groop.model.GroopServiceHub;
	import com.kloke.model.interfaces.IService;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class GroopCheckoutService extends EventDispatcher implements IService
	{	
		private var buyLoader:URLLoader;
		private var hub:GroopServiceHub = GroopServiceHub.getInstance();
		static private var instance:GroopCheckoutService=null;
		
		
		public function GroopCheckoutService( byMe:Object)
		{
			
			//TODO: implement function
			
			trace("we have CHECKOUT!: " + byMe );
			buyLoader = new URLLoader();
		}
	
		static public function getInstance():GroopCheckoutService {

				if(instance==null)instance=new GroopCheckoutService(new Object())
				return instance;		
		
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
			trace("open up our Checkout page!");
		    openShop();
		}
		
		public function close():void
		{
			//TODO: implement function
		}
		
		private function openShop():void {
			trace("GroopCheckoutService.openShop - lets open the store!");
			var buyImage:URLRequest = new URLRequest("images/buyMe.png");
			buyLoader.load(buyImage);
			buyLoader.addEventListener(Event.COMPLETE, onImageLoaded)
		}
		
		private function onImageLoaded(e:Event):void {
			trace("buyme image loaded: "+ e.target );
			//buyLoader.removeEventListener(
			
		}
	}// end class
}//end package