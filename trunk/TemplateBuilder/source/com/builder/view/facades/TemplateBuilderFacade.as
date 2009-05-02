package com.builder.view.facades
{
	import com.builder.control.commands.CreateProjectCommand;
	import com.builder.control.commands.StartupCommand;
	import com.builder.model.proxies.FileProxy;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class TemplateBuilderFacade extends Facade implements IFacade
	{
		static public const STARTUP:String              = 'startup';
		
            
        static public var instance:TemplateBuilderFacade=null;
        static public function getInstance():TemplateBuilderFacade{
            if(instance==null) instance = new TemplateBuilderFacade()
            return instance as TemplateBuilderFacade;
        }
        public function TemplateBuilderFacade(){
            trace('TemplateBuilderFacade')
            super()
   
     
        }
        override protected function initializeController():void{
              super.initializeController();
              registerCommand(STARTUP,StartupCommand)
              registerCommand(FileProxy.CREATE_PROJECT,CreateProjectCommand)
              
            
        }
        
        public function startup(app:TemplateBuilder):void{
            trace('startup()')
            sendNotification(STARTUP,app)
            
        }
        
        
        private function get MyView():TemplateBuilder{
        	return TemplateBuilder(view)
		
		}
        
	}
}