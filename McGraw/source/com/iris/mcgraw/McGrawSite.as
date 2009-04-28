package com.iris.mcgraw
{
	import com.iris.mcgraw.control.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class McGrawSite extends Facade implements IFacade
	{
		
		
		static public const STARTUP:String    = 'startup';
	
        
        
        
        static public function getInstance():McGrawSite{
        	if(instance==null) instance = new McGrawSite()
        	return instance as McGrawSite;
	    }
	    public function McGrawSite(){
	    	trace('McGrawSite')
	    	super()
	    }
	    
        
		
		
		
		
		override protected function initializeController():void{
		      super.initializeController();
		      registerCommand(STARTUP,StartupCommand)
		}
		
		public function startup(app:McGraw):void{
			trace('startup()')
			sendNotification(STARTUP,app)
		}

		
	}
}