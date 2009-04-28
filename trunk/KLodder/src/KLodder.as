package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.parsers.DAE;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
    
    [SWF(width='800', height='600', backgroundColor='#000000', frameRate='30')]
    
	public class KLodder extends Sprite
	{
		
		private var _scene:Scene3D;
		private var _viewPort:Viewport3D;
		private var _camera:Camera3D;
		private var _engine:BasicRenderEngine;
		private var _collada:Collada;
		private var _dae:DAE;
		private var cameraBtn:BtnCamera;
		
		public function KLodder()
		{
			init()
			
			addEventListener(Event.ENTER_FRAME,onFrame)   
		}
		private function init():void{
		    _scene = new Scene3D()
		    _viewPort = new Viewport3D()
		    _camera   = new Camera3D()
		    _engine = new BasicRenderEngine()
		   _camera.z = -300;
		   _camera.y = 300;
		   trace ("Camera location x: "+ _camera.x+" y: "+ _camera.y );
		    addColl();
		    addChild(_viewPort)
		      //trace ("ViewPort size: "+ _scene.height +" width: "+ _scene.width );
		    
		}
		private function onFrame(e:Event):void{
		      _engine.renderScene(_scene,_camera,_viewPort);
	
				//cooepr s - add some effects.
		     // _collada.yaw(7);
		     // _collada.view;
		     
		     _dae.view;
		     _dae.visible;
		     _dae.yaw(2);
		}
		private function addColl():void{
              //_collada = new Collada("models/floorplan6.dae"); //("models/floorplan6.dae")
              //_scene.addChild(_collada)
              //DAE version
              _dae = new DAE();
				//_dae.load("models/floorplan6.dae");
				_dae.load("models/floorplan5.dae");
              _scene.addChild(_dae)
              
              cameraBtn = new BtnCamera(_camera);
			  addChild(cameraBtn);
			  cameraBtn.x=100;cameraBtn.y=100;
			  cameraBtn.visible = true;
			  

        }
	
	}
}
