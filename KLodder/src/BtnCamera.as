package {
	import caurina.transitions.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.papervision3d.cameras.Camera3D;
	
	public class BtnCamera extends MovieClip
	{
		public var camera:Camera3D;
		
		public function BtnCamera(camName:Camera3D)
		{
			trace("new BtnCamera");
			camera = camName;
			this.x = 25;
			this.y = 25;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, cameraMove);
		}
		
		//RANDOM GENERATOR
		private function randSpot(min:Number, max:Number):Number {
			var newLoc:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return newLoc;
		}
		
		//MOVE CAMERA
		public function cameraMove(e:Event):void {
			//animate to random location
			trace("move camera...");
			Tweener.addTween(camera, {x:randSpot(-100, 100), y:randSpot(3, 50), z:randSpot(-100,100), time:2, transition:"EaseIn"});
		}
	}
}

