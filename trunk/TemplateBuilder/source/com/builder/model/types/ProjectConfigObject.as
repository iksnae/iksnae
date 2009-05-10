package com.builder.model.types
{
	/**
	 * this is my local object for passing the project settings across the app.
	 * prolly not the best approach, but i've put getter methods that generate string + xmls
	 * for the project text files (class, mxml, xml, etc.) that need to be created.
	 * 
	 * *******************************
	 * PUBLIC METHODS
	 * *******************************
	 * @see projectFileString():
	 * - generates string for .project file
	 * 
	 * @see printNatures()
	 * - generates xml nodes for the project nature
	 * 
	 * @see actionScriptPropertiesString()
	 * - generates string for .actionScriptProperties file
	 * 
	 * @see baseFacadeString()
	 * - generates actionscript class for initial application Façade as appName.as
	 * 
	 * @see baseMXMLString()
	 * - generates base MXML Application file as main.mxml
	 *  
	 * 
	 * @author iksnae 
	 * 
	 */	
	
	public class ProjectConfigObject
	{
		static public const BUILD_COMMAND:String = 'com.adobe.flexbuilder.project.flexbuilder'
		static public const FLEX_NATURE:String = 'com.adobe.flexbuilder.project.flexnature'
        static public const ACTIONSCRIPT_NATURE:String = 'com.adobe.flexbuilder.project.actionscriptnature'
        
        public var rootPackageName:String;
        public var basePackageName:String;
        public var projectName:String;
		public var packageName:String;
		public var appName:String;
		public var arguments:String='';
		public var natures:Array = [ FLEX_NATURE, ACTIONSCRIPT_NATURE ];
		
        
		public function ProjectConfigObject(){}
		
		public function get projectFileString():String{
			var str:String = '<?xml version="1.0" encoding="UTF-8"?><projectDescription>';
                            str+='<name>'+projectName+'</name>'
                            str+='<comment></comment>'
                            str+='<projects></projects><buildSpec><buildCommand>'
                            str+='<name>'+BUILD_COMMAND+'</name>'
                            str+='<arguments>'+arguments+'</arguments>'
                            str+='</buildCommand></buildSpec>'
                            str+= printNatures()
                            str+='<linkedResources><link>'
                            str+='<name>[source path] source</name>'
                            str+='<type>2</type>'
                            str+='<locationURI>{DOCUMENTS}/PureMVC/trunk/src</locationURI></link>'
                            str+='<link>'
                            str+='<name>bin-debug</name>'
                            str+='<type>2</type>'
                            str+='<location>/Library/WebServer/Documents/'+packageName+'/</location>'
                            str+='</link>'
                            str+='</linkedResources></projectDescription>'
              return str
		}
		public function printNatures():String{
			var str:String= '<natures>';
			for(var i:uint = 0; i<natures.length; i++){
				str += '<nature>'+natures[i]+'</nature>';
			}
			str += '</natures>'
			return str;
		}
		public function get flexPropertiesString():String{
			return '<?xml version="1.0" encoding="UTF-8"?><flexProperties flexServerType="0" toolCompile="true" useServerFlexSDK="false" version="1"/>'
		}
		public function get actionScriptPropertiesString():String{
			return String( '<?xml version="1.0" encoding="UTF-8"?>' + 
					'<actionScriptProperties mainApplicationPath="main.mxml" version="3">' + 
					'<compiler additionalCompilerArguments="-locale en_US" ' + 
					'copyDependentFiles="true" ' + 
					'enableModuleDebug="true" ' + 
					'generateAccessible="false" ' + 
					'htmlExpressInstall="true" ' + 
					'htmlGenerate="true" ' + 
					'htmlHistoryManagement="true" ' + 
					'htmlPlayerVersion="9.0.124" ' + 
					'htmlPlayerVersionCheck="true" ' + 
					'outputFolderLocation="/Library/WebServer/Documents/'+packageName+'" ' + 
					'outputFolderPath="bin-debug" ' + 
					'rootURL="http://localhost/'+packageName+'" ' + 
					'sourceFolderPath="source" ' + 
					'strict="true" useApolloConfig="false" ' + 
					'verifyDigests="true" ' + 
					'warn="true">' + 
					'<compilerSourcePath>' + 
					'<compilerSourcePathEntry kind="1" linkType="1" path="${DOCUMENTS}/PureMVC/trunk/src"/>' + 
					'</compilerSourcePath>' + 
					'<libraryPath defaultLinkType="1">' + 
					'<libraryPathEntry kind="4" path=""/>' + 
					'<libraryPathEntry kind="1" linkType="1" path="libs"/>' + 
					'</libraryPath>' + 
					'<sourceAttachmentPath/>' + 
					'</compiler><applications>' + 
					'<application path="main.mxml"/>' + 
					'</applications><modules/><buildCSSFiles/>' + 
					'</actionScriptProperties>')
		}
		
		public function get baseFacadeString():String{
			return String('package '+packagePath+'.view.facade{\r\r' + 
					'\t/*\r' + 
					'\tThis project was created by TemplateBuilder, it employs the PureMVC framework and provides a starting point to developing a new application\r' + 
					'\t*/\r\r' + 
					'\timport '+packagePath+'.control.commands.StartupCommand;\r' + 
					'\timport org.puremvc.as3.interfaces.IFacade;\r' + 
					'\timport org.puremvc.as3.patterns.facade.Facade;\r' + 
					'\r\r' + 
					'\tpublic class '+appName+'Faceade extends Facade implements IFacade {\r' + 
					'\t\t/*\r' + 
					'\t\tPLACE ADDITIONAL CONSTANTS HERE\r' + 
					'\t\t*/\r' + 
					'\t\tstatic public const STARTUP:String = "startup";\r' + 
					'\t\t/*\r' + 
					'\t\tInstantiation\r' + 
					'\t\t*/\r' + 
					'\t\tstatic private var instance:'+appName+'Faceade = null;\r' + 
					'\t\tstatic public function getInstance(): '+appName+'Faceade{\r' + 
					'\t\t\tif(instance==null) instance = new '+appName+'Faceade()\r' + 
					'\t\t\treturn instance as '+appName+'Faceade;\r' + 
					'\t\t}\r' +
					'\t\tpublic function '+appName+'Faceade(){\r' + 
					'\t\t\tsuper()\r' + 
					'\t\t}\r' + 
					'\t\toverride protected function initializeController():void{\r' + 
					'\t\t\tsuper.initializeController();\r' + 
					'\t\t\tregisterCommand(STARTUP,StartupCommand)\r' + 
					'\t\t}\r' + 
					'\t\tpublic function startup(app:main):void{\r' + 
					'\t\t\tsendNotification(STARTUP,app)\r' + 
					'\t\t}\r' + 
					'\t}\r' + 
					'}')
		}
		
		public function get baseStartupCommandString():String{
			return String('package '+packagePath+'.control.commands{\r\r' + 
					'\t/*\r' + 
					'\tThis Command was created by TemplateBuilder, it employs the PureMVC framework and provides a starting point to developing a new application\r' + 
					'\tIt is a called at at startupEvent\r' + 
					'\tIt registers the ModelPrepCommand and ViewPrepCommand commands by overriding the initializeMacroCommand method.'+
					'\t*/\r\r' + 
					'\timport '+packagePath+'.control.commands.StartupCommand;\r' + 
					'\timport org.puremvc.as3.patterns.command.MacroCommand;\r' + 
					'\timport org.puremvc.as3.interfaces.ICommand;\r' + 
					'\r\r' + 
					'\tpublic class StartupCommand extends MacroCommand implements ICommand {\r' + 
					
					'\t\toverride protected function initializeMacroCommand():void{\r' + 
					'\t\t\taddSubCommand(ModelPrepCommand)\r' + 
					'\t\t\taddSubCommand(ViewPrepCommand)\r' + 
					'\t\t}\r' + 
					 
					'\t}\r' + 
					'}')
		}
		public function get baseModelPrepCommandString():String{
			return String('package '+packagePath+'.control.commands{\r\r' + 
					'\t/*\r' + 
					'\tThis Command was created by TemplateBuilder, it employs the PureMVC framework and provides a starting point to developing a new application\r' + 
					'\t*/\r\r' + 
					'\timport org.puremvc.as3.interfaces.INotification;\r' + 
					'\timport org.puremvc.as3.patterns.command.SimpleCommand;\r' + 
					'\r\r' + 
					'\tpublic class ModelPrepCommand extends SimpleCommand {\r' + 
					
					'\t\toverride public function execute(notification:INotification):void{}\r' + 
					'\t}\r' + 
					'}')
		}
		public function get baseViewPrepCommandString():String{
			return String('package '+packagePath+'.control.commands{\r\r' + 
					'\t/*\r' + 
					'\tThis Command was created by TemplateBuilder, it employs the PureMVC framework and provides a starting point to developing a new application\r' + 
					'\t*/\r\r' + 
					'\timport '+packagePath+'.view.mediators.AppMediator;\r' + 
					'\timport org.puremvc.as3.interfaces.INotification;\r' + 
					'\timport org.puremvc.as3.interfaces.ICommand;\r' + 
					
					'\timport org.puremvc.as3.patterns.command.SimpleCommand;\r' + 
					'\r\r' + 
					'\tpublic class ViewPrepCommand extends SimpleCommand {\r' + 
					
					'\t\toverride public function execute(notification:INotification):void{\r' + 
					'\t\t\tvar app:main = notification.getBody() as main;\r' + 
					'\t\t\tfacade.registerMediator(new AppMediator(app))\r' + 
					'\t\t}\r' + 
					 
					'\t}\r' + 
					'}')
		}
		
		public function get baseAppMediatorString():String{
			return String('package '+packagePath+'.view.mediators{\r\r' + 
					'\t/*\r' + 
					'\tThis Command was created by TemplateBuilder, it employs the PureMVC framework and provides a starting point to developing a new application\r' + 
					'\t*/\r\r' + 
					'\timport '+packagePath+'.view.mediators.AppMediator;\r' + 
					'\timport org.puremvc.as3.interfaces.INotification;\r' + 
					'\timport org.puremvc.as3.interfaces.IMediator;\r' + 
					'\timport org.puremvc.as3.patterns.mediator.Mediator;\r' + 
					
					
					'\timport org.puremvc.as3.patterns.command.SimpleCommand;\r' + 
					'\r\r' + 
					
					'\tpublic class AppMediator extends Mediator implements IMediator {\r' + 
					'\tstatic public const NAME:String = "AppMediator";\r'+
					'\tpublic function AppMediator(viewComponent:Object=null){\r' + 
					'\t\t\tsuper(NAME, viewComponent);\r' + 
					'\t\t\t\r' + 
					'\t\t}\r' + 
					 
					'\t}\r' + 
					'}')
		}
		public function get baseMXMLString():String{
			var str:String = '<?xml version="1.0" encoding="utf-8"?>'
            str += '<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml" ' + 
            		'layout="absolute" ' + 
            		'initialize="init()" ' + 
            		'historyManagementEnabled="true">'+
            		'<mx:Script>' + 
            		'<![CDATA[\r' + 
            		'\timport '+ packagePath+'.view.facade.'+appName+'Faceade;\r' + 
            		'\timport org.puremvc.as3.patterns.facade.Facade;\r' + 
            		'\tprivate var facade:'+appName+'Faceade;\r' + 
            		'\tprivate function init():void{\r' + 
            		'\t\tfacade = '+appName+'Faceade.getInstance();\r' + 
            		'\t\tfacade.startup(this)\r' + 
            		'\t}\r' + 
            		']]>' + 
            		'</mx:Script>' + 
            		'</mx:Application>';
            		return str
			
		}
		private function get packagePath():String{
			return rootPackageName+'.'+ basePackageName+'.'+packageName;
		 }
		
	}
}