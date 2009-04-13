package com.iksnae.webapi.google
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;
	import flash.text.TextField;

	public class GDataAuthenticationHost extends HTMLHost
	{
		public function GDataAuthenticationHost(defaultBehaviors:Boolean=true)
		{
			super(defaultBehaviors);
			
			
		}
		public var statusField:TextField;
		
		override public function createWindow(windowCreateOptions:HTMLWindowCreateOptions):HTMLLoader{
			var initOptions:NativeWindowInitOptions = new NativeWindowInitOptions();
			
			var window:NativeWindow = new NativeWindow(initOptions)
			window.visible = true;
			window.title = 'Authentication'
			var htmlLoader2:HTMLLoader=new HTMLLoader()
			htmlLoader2.width = window.width;
			htmlLoader2.height = window.height;
			window.stage.scaleMode = StageScaleMode.NO_SCALE;
			window.stage.addChild(htmlLoader2)
			
			return htmlLoader2;
            
		}
		
		override public function set windowRect(value:Rectangle):void{
			htmlLoader.stage.nativeWindow.bounds = value;
		}
		override public function updateTitle(title:String):void{
			htmlLoader.stage.nativeWindow.title=title+" Authentication";
		}
		
	}
}