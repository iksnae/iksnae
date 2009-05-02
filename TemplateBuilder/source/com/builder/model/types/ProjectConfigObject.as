package com.builder.model.types
{
	
	
	public class ProjectConfigObject
	{
		static public const BUILD_COMMAND:String = 'com.adobe.flexbuilder.project.flexbuilder'
		static public const FLEX_NATURE:String = 'com.adobe.flexbuilder.project.flexnature'
        static public const ACTIONSCRIPT_NATURE:String = 'com.adobe.flexbuilder.project.actionscriptnature'
        
		public var projectName:String;
		public var packageName:String;
		public var appName:String;
		public var arguments:String='';
		public var natures:Array = [FLEX_NATURE,ACTIONSCRIPT_NATURE];
		
        
		public function ProjectConfigObject(){}
		
		public function get projectFileXML():XML{
			var str:String = '<?xml version="1.0" encoding="UTF-8"?><projectDescription>'
                            str+='<name>'+projectName+'</name>'
                            str+='<comment></comment>'
                            str+='<projects></projects><buildSpec><buildCommand>'
                            str+='<name>'+BUILD_COMMAND+'</name>'
                            str+='<arguments>'+arguments+'</arguments>'
                            str+='</buildCommand></buildSpec>'
                            str+= printNatures()
                            str+='<linkedResources><link>'
                            str+='<name>puremvc</name>'
                            str+='<type>2</type>'
                            str+='<locationURI>DOCUMENTS/PureMVC/trunk/src</locationURI></link>'
                            str+='<link>'
                            str+='<name>bin-debug</name>'
                            str+='<type>2</type>'
                            str+='<location>/Library/WebServer/Documents/'+packageName+'/</location>'
                            str+='</link>'
                            str+='</linkedResources></projectDescription>'
              return XML(str)
		}
		public function printNatures():String{
			var str:String= '<natures>';
			for(var i:uint = 0; natures.length; i++){
				str += '<nature>'+natures[i]+'</nature>';
			}
			str += '</natures>'
			return str;
		}
		
	}
}