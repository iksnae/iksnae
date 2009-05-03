package com.builder.view.mediators
{
	import com.builder.control.commands.CreateProjectCommand;
	import com.builder.model.proxies.FileProxy;
	import com.builder.model.types.ProjectConfigObject;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class AppMediator extends Mediator implements IMediator
	{
		static public const NAME:String = 'AppMediator'
		
		
		public function AppMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			setupListeners()
		}
		
		private function setupListeners():void{
			view.addEventListener('on_ready',onReadyEvent)
			view.addEventListener(FileProxy.CREATE_PROJECT,onCreateProject)
            
		
		}
		private function get view():TemplateBuilder{
			return TemplateBuilder(viewComponent)
		}
		private function onReadyEvent(e:Event):void{
		    trace(e.type)
		}
		private function onCreateProject(e:Event):void{
		  if(view.project_name_txt.text.length>1){
    		  view.status_txt.text = 'creating project...'
			  var config:ProjectConfigObject = new ProjectConfigObject()
			  config.projectName = view.project_name_txt.text;
			  config.packageName = removeSpacesAndCaps(config.projectName)
			  config.appName     = removeSpacesOnly(config.projectName)
			  sendNotification(FileProxy.CREATE_PROJECT,config)
			  
		  }else{
		  	view.status_txt.text = 'check project name'
		  }
		}
		private function removeSpacesAndCaps(str:String):String{
			var newStr:String = str.replace(' ','');
			for(var i:int=0;i<str.length;i++){
				newStr = newStr.replace(' ','')
			}
			return str.toLowerCase()
		}
		private function removeSpacesOnly(str:String):String{
            var newStr:String = str.replace(' ','');
            for(var i:int=0;i<str.length;i++){
                newStr = newStr.replace(' ','')
            }
            return str
        }
		public function onProjectCompleted():void{
			view.status_txt.text = 'project created'
		}
		public function onNoPureMvcInstalled():void{
            view.status_txt.text = 'No PureMVC Installed!!!'
        }
        
		public function onProjectAlreadyExists():void{
           
            view.status_txt.text = 'project already exists!!!!'
        }
	}
}