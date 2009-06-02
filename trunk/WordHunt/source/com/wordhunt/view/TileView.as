﻿package com.wordhunt.view{	import caurina.transitions.Tweener;		import com.wordhunt.model.GameConfig;		import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.filters.GlowFilter;	import flash.filters.GradientGlowFilter;	import flash.geom.Point;	import flash.text.TextField;	import flash.text.TextFormat;	import flash.text.TextFormatAlign;	public class TileView extends Sprite	{		private var _selected:Boolean;		private var _selectedView:Sprite;		private var _tileSize:Number;		private var _bg:Sprite;		private var _overView:Sprite;		private var _char:TextField;		private var _style:TextFormat=new TextFormat()		private var _center:Point;		private var _filters:Array;		private var _glo:GlowFilter;		private var _grad:GradientGlowFilter;						private var overScale:Number = 1;		private var outScale:Number = .2;        								public var row:int;		public var col:int;		public var populated:Boolean		private var _conf:GameConfig;						public function TileView(conf:GameConfig)		{			super();			_conf = conf;			_tileSize= _conf.tileSize;			_style.size=22;			_style.bold = true			_style.font = "Arial"			_style.align= TextFormatAlign.CENTER			_style.color = _conf.gameCharacterColor;			init()		}				public function init():void{			_selectedView=new Sprite()			_bg			 =new Sprite()			_char		 =new TextField()			_char.defaultTextFormat= _style;			_char.width= _char.height = _tileSize;			_char.y=2;			_char.selectable=false;			_selectedView.graphics.lineStyle(2,0x00ff00)			_selectedView.graphics.beginFill(0xfff,0)			_selectedView.graphics.drawCircle(_tileSize/2,_tileSize/2,(_tileSize/2)*.9)			_selectedView.graphics.endFill()									_glo = new GlowFilter(0xfff,1,25,25,2);			_grad= new GradientGlowFilter()			_filters = [_grad]						_bg = drawBlock(0xffffff,_tileSize,0);						_overView = new Sprite()						_overView.graphics.beginFill(_conf.hilightColor)			_overView.graphics.drawCircle(0,0,_tileSize/2);			_overView.graphics.endFill()			_overView.filters = _filters;			_overView.x = _overView.y = _tileSize/2;						_overView.alpha=0;			addChild(_bg)			addChild(_overView)			addEventListener(MouseEvent.MOUSE_OVER,overHandler)			addEventListener(MouseEvent.MOUSE_OUT, outHandler)			addChild(_selectedView)			addChild(_char)			_overView.mouseEnabled = false;						_selectedView.visible=false			_center = new Point(_bg.width/2,_bg.height/2)		}		private function overHandler(e:MouseEvent):void{			parent.setChildIndex(this,parent.numChildren-1);			Tweener.addTween(_overView,{time:.3,scaleY:overScale,scaleX:overScale,alpha:1});								}		private function outHandler(e:MouseEvent):void{			if(! _selected){			    Tweener.addTween(_overView,{time:2,scaleY: outScale,scaleX:outScale,alpha:0});			}		}						public function set selected(bool:Boolean):void{			_selected=bool;			if(_selected){		        Tweener.addTween(_overView,{time:.5,scaleY: overScale,scaleX:overScale,alpha:1});			}else{				Tweener.addTween(_overView,{time:1,scaleY:outScale,scaleX: outScale,alpha:0});			}			}		public function set char(str:String):void{		       _char.text=str;		       populated=true;		}		public function get char():String{			return _char.text;		}		public function get center():Point{			return new Point(_bg.width/2,_bg.height/2);		}		private function drawBlock(color:uint, size:Number, alpha:Number):Sprite{			var block:Sprite = new Sprite()			block.graphics.beginFill(color,alpha);			block.graphics.drawRect(0,0,size,size)			block.graphics.endFill()			return block;		}			}}