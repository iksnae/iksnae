package com.iris.mcgraw
{
	import com.iris.mcgraw.control.commands.MailSubscribeCommand;
	import com.iris.mcgraw.control.commands.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class McGrawSite extends Facade implements IFacade
	{
		
		
		static public const STARTUP:String    		  = 'startup';
		static public const EMAIL_SUBSCRIBE:String    = 'email_subscribe';
	
        
        
        
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
		      registerCommand(EMAIL_SUBSCRIBE,MailSubscribeCommand)
		}
		
		public function startup(app:McGraw):void{
			trace('startup()')
			sendNotification(STARTUP,app)
		}

		
	}
}