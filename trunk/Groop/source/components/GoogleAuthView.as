package components
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageScaleMode;
	
	import mx.controls.HTML;

	public class GoogleAuthView extends NativeWindow
	{
		public var html:HTML;
		
		public function GoogleAuthView(initOptions:NativeWindowInitOptions)
		{
			super(initOptions);
			title = "Google Authentication"
			html = new HTML()
			html.location = encodeURI('https://www.google.com/accounts/AuthSubRequest?next=http://iksnae.com&session=1&scope=http://www.google.com/calendar/feeds')
			html.width = 600;
			html.height = 600;
			
			stage.addChild(html)
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
	}
}