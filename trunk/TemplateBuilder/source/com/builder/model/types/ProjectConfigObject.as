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
	 * - generates base MXML Application file as appName.mxml
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
			return '<?xml version="1.0" encoding="UTF-8"?>' + 
					'<flexProperties ' + 
					'flexServerType="16" ' + 
					'serverContextRoot="" serverRoot="/Library/WebServer/Documents/'+packageName+'" ' + 
					'serverRootURL="http://localhost/'+packageName+'" ' + 
					'toolCompile="true" ' + 
					'useServerFlexSDK="' + 
					'false" version="1"/>'
		}
		public function get actionScriptPropertiesString():String{
			return String( '<?xml version="1.0" encoding="UTF-8"?>' + 
					'<actionScriptProperties mainApplicationPath="'+appName+'.mxml" version="3">' + 
					'<compiler additionalCompilerArguments="-locale en_US" ' + 
					'copyDependentFiles="true" ' + 
					'enableModuleDebug="true" ' + 
					'generateAccessible="true" ' + 
					'htmlExpressInstall="true" ' + 
					'htmlGenerate="true" ' + 
					'htmlHistoryManagement="true" ' + 
					'htmlPlayerVersion="9.0.124" ' + 
					'htmlPlayerVersionCheck="true" ' + 
					'outputFolderLocation="/Library/WebServer/Documents/'+packageName+'"' + 
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
					'<application path="'+appName+'.mxml"/>' + 
					'</applications><modules/><buildCSSFiles/>' + 
					'</actionScriptProperties>')
		}
		
		public function get baseFacadeString():String{
			return String('package '+packagePath+'{\r\r' + 
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
					'\t\tstatic private var instance:'+appName+' = null;\r' + 
					'\t\tstatic public function getInstance(): '+appName+'{\r' + 
					'\t\t\tif(instance==null) instance = new '+appName+'()\r' + 
					'\t\t\treturn instance as '+appName+';\r' + 
					'\t\t}\r' + 
					'\t\tpublic function '+appName+'(){\r' + 
					'\t\t\tsuper()\r' + 
					'\t\t}\r' + 
					'\t\toverride protected function initializeController():void{\r' + 
					'\t\t\tsuper.initializeController();\r' + 
					'\t\t\tregisterCommand(STARTUP,StartupCommand)\r' + 
					'\t\t}\r' + 
					'\t\tpublic function startup(app: '+appName+'):void{\r' + 
					'\t\t\tsendNotification(STARTUP,app)\r' + 
					'\t\t}\r' + 
					'\t}\r' + 
					'}')
		}
		public function get baseMXMLString():String{
			var str:String = '<?xml version="1.0" encoding="utf-8"?>'
            str += '<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml" ' + 
            		'layout="absolute" ' + 
            		'initialize="init()"' + 
            		'historyManagementEnabled="true" >'+
            		'<mx:Script>' + 
            		'<![CDATA[\r' + 
            		'\timport '+ packagePath+'.'+appName+';\r' + 
            		'\timport org.puremvc.as3.patterns.facade.Facade;\r' + 
            		'\tprivate var facade:'+appName+';\r' + 
            		'\tprivate function init():void{\r' + 
            		'\t\tfacade = '+appName+'.getInstance();\r' + 
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