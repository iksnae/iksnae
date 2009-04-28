package com.iris.mcgraw
{
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class McGrawSite extends Facade implements IFacade
	{
		
		
		static public const STARTUP:String    = 'startup';
		static public const LOGIN:String      = 'login';
        
        
        
        
        static public function getInstance():McGrawSite{
        	if(instance==null) instance = new McGrawSite()
        	return instance as McGrawSite;
	    }
        
		
		
		
		
		override protected function initializeController():void{
		      super.initializeController();
		      	
		}
		
		public function startup(app:McGraw):void{
			sendNotification(STARTUP,app)
		}

		
	}
}