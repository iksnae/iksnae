package com.builder.control.commands
{
	import com.builder.model.proxies.FileProxy;
	import com.builder.model.types.ProjectConfigObject;
	import com.builder.view.mediators.AppMediator;
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CreateProjectCommand extends SimpleCommand implements ICommand
	{
		
		static public const PROJECT_CREATED:String = 'project_created';
		
        
		// name of defaul flex workspace folder
		private var flexDirName:String = 'Flex Builder 3';
		// root package name
		private var rootPackage:String = 'com';
		// base package name
		private var basePackage:String = 'iris';
        // project folder
		private var projectDirectory:File;
		// source folder
		private var sourceDirectory:File;
		// deploy folder
		private var deployDirectory:File;
		// template folder
		private var templateDirectory:File;
		// puremvc directory
		private var pureMvcDirectory:File;
		// project configuration file
		private var projectConfig:ProjectConfigObject;
		
		
		public function CreateProjectCommand()
		{
			super();
		}
		private function get proxy():FileProxy{
		  return FileProxy(facade.removeProxy(FileProxy.NAME))
		}
		override public function execute(notification:INotification):void{
			trace('CreateProjectCommand')
			projectConfig = ProjectConfigObject( notification.getBody())
		    checkForPureMVC()
		}
		public function checkForPureMVC():void{
			pureMvcDirectory = File.documentsDirectory.resolvePath(flexDirName+'/PureMVC/trunk/src/');
			if(pureMvcDirectory.exists){
				createProjectFiles()
			}else{
				AppMediator(facade.retrieveMediator( AppMediator.NAME)).onNoPureMvcInstalled()
			}
			
		}
		private function createProjectFiles():void{
		    projectDirectory = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName)
            sourceDirectory = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+rootPackage+'/'+basePackage+'/'+projectConfig.packageName)
            var model:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+rootPackage+'/'+basePackage+'/'+projectConfig.packageName+'/model')
            var view:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+rootPackage+'/'+basePackage+'/'+projectConfig.packageName+'/view')
            var control:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+rootPackage+'/'+basePackage+'/'+projectConfig.packageName+'/control')
            var settings:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.settings/')
            var projectFile:File = File.applicationStorageDirectory.resolvePath('files/project.xml')
            
            trace('projectFile: '+projectFile.exists)
           
            if(!projectDirectory.exists){
                projectDirectory.createDirectory()
                model.createDirectory()
                view.createDirectory()
                control.createDirectory()
                settings.createDirectory()
                AppMediator(facade.retrieveMediator( AppMediator.NAME)).onProjectCompleted()
                
            }else{
                AppMediator(facade.retrieveMediator( AppMediator.NAME)).onProjectAlreadyExists()
            }
		
		}
		
		
	}
}