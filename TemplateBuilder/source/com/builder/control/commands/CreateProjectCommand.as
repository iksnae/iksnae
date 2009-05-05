package com.builder.control.commands
{
	import com.builder.model.proxies.FileProxy;
	import com.builder.model.types.ProjectConfigObject;
	import com.builder.view.mediators.AppMediator;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CreateProjectCommand extends SimpleCommand implements ICommand
	{
		
		static public const PROJECT_CREATED:String = 'project_created';
		
        
		// name of defaul flex workspace folder
		private var flexDirName:String = 'Flex Builder 3';
        // project folder
		private var projectDirectory:File;
		// source folder
		private var sourceDirectory:File;
		// libs folder
		private var libsDirectory:File;
		// deploy folder
		private var deployDirectory:File;
		// template folder
		private var templateDirectory:File;
		// puremvc directory
		private var pureMvcDirectory:File;
		// project configuration file
		private var projectConfig:ProjectConfigObject;
		
		private var fileStream:FileStream=new FileStream()
		private var asPropsFile:File;
		private var propsFile:File;
		private var flexPropsFile:File;
		private var mxmlFile:File;
		private var facadeFile:File;
		private var prefsFile:File;
		
		
		
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
		/**
		 * create the project folders 
		 * 
		 */		
		private function createProjectFiles():void{
			// declare location of 
		    projectDirectory = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName)
            sourceDirectory = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+ projectConfig.rootPackageName+'/'+ projectConfig.basePackageName+'/'+projectConfig.packageName)
            libsDirectory = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/libs/')
            
            var model:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+projectConfig.rootPackageName+'/'+projectConfig.basePackageName+'/'+projectConfig.packageName+'/model')
            var view:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+projectConfig.rootPackageName+'/'+projectConfig.basePackageName+'/'+projectConfig.packageName+'/view')
            var control:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+projectConfig.rootPackageName+'/'+projectConfig.basePackageName+'/'+projectConfig.packageName+'/control')
            var settings:File = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.settings/')
            var projectFile:File = File.applicationStorageDirectory.resolvePath('files/project.xml')
            
            trace('does project already exist? '+projectFile.exists)
           
            if(!projectDirectory.exists){
            	trace('create project: '+ projectConfig.projectName)
            	
                projectDirectory.createDirectory()
                model.createDirectory()
                view.createDirectory()
                control.createDirectory()
                settings.createDirectory()
                libsDirectory.createDirectory()
            
                AppMediator(facade.retrieveMediator( AppMediator.NAME)).onProjectCompleted()
                
                trace('===== Initial Façade =====')
                trace(projectConfig.baseFacadeString)
                
                trace('===== Initial MXML File =====')
                trace(projectConfig.baseMXMLString)
                
                trace('===== .project File =====')
                trace(projectConfig.projectFileString)
                
                trace('===== .actionScriptProperties File =====')
                trace(projectConfig.actionScriptPropertiesString)
                var prefStr:String = '#Wed Apr 29 22:57:29 EDT 2009' + 
                		'eclipse.preferences.version=1' + 
                		'encoding/<project>=utf-8';
                		
                		
                prefsFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.settings/org.eclipse.core.resources.prefs')
                fileStream = new FileStream()
                fileStream.openAsync(prefsFile, FileMode.WRITE)
                fileStream.writeUTFBytes(prefStr);
                fileStream.close()
                
                asPropsFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.actionScriptProperties')
                fileStream = new FileStream()
                fileStream.openAsync(asPropsFile, FileMode.WRITE)
                fileStream.writeUTFBytes(projectConfig.actionScriptPropertiesString);
                fileStream.close()
                
                propsFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.project')
                fileStream = new FileStream()
                fileStream.openAsync(propsFile, FileMode.WRITE)
                fileStream.writeUTFBytes(projectConfig.projectFileString);
                fileStream.close()
                
                flexPropsFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/.flexProperties')
                fileStream = new FileStream()
                fileStream.openAsync(flexPropsFile, FileMode.WRITE)
                fileStream.writeUTFBytes(projectConfig.flexPropertiesString);
                fileStream.close()
                
                facadeFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/'+projectConfig.rootPackageName+'/'+projectConfig.basePackageName+'/'+projectConfig.packageName+'/view/facade/'+ projectConfig.appName+'Faceade.as')
                fileStream = new FileStream()
                fileStream.openAsync(facadeFile, FileMode.WRITE)
                fileStream.writeUTFBytes(projectConfig.baseFacadeString);
                fileStream.close()
                
                mxmlFile = File.documentsDirectory.resolvePath(flexDirName+'/'+projectConfig.projectName+'/source/main.mxml')
                fileStream = new FileStream()
                fileStream.openAsync(mxmlFile, FileMode.WRITE)
                fileStream.writeUTFBytes(projectConfig.baseMXMLString);
                fileStream.close()
                
            }else{
                AppMediator(facade.retrieveMediator( AppMediator.NAME)).onProjectAlreadyExists()
            }
		
		}
		
		
	}
}